`import Ember from 'ember'`
`import TimeUtil from 'expenses/models/time_util'`

isBlank = (val) -> !val

m = Ember.Object.extend
  expenseTime: '12:00'
  
  getFullDate: (errorFunc) ->
    date = @get('expenseDate')
    timeStr = @get('expenseTime')
    TimeUtil.combineDateAndTime(date,timeStr,errorFunc)

  createRecord: (errorFunc) ->
    # TODO: validate stuff

    date = @getFullDate(errorFunc)
    parsedAmount = parseFloat(@get('amount'))

    if isBlank(@get('amount'))
      errorFunc('Missing Amount')
      null
    else if !parsedAmount || parsedAmount <= 0
      errorFunc("Missing Amount")
      null
    else if isBlank(@get('description'))
      errorFunc('Missing Description')
      null
    else if !date
      errorFunc('Invalid Date or Time')
      null
    else
      @get('store').createRecord 'expense', 
        amount: parseFloat(@get('amount'))
        expenseDt: date
        description: @get("description")
        comment: @get('comment')

  reset: ->
    @set "amount",null
    @set "expenseDt",null
    @set "description",null
    @set "comment",null
    @set "expenseTime","12:00"

  save: (errorFunc) ->
    record = @createRecord(errorFunc)
    if record
      record.save()
    else
      null

`export default m`