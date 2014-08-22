`import Ember from 'ember'`
`import TimeUtil from 'expenses/models/time_util'`

m = Ember.Object.extend
  expenseTime: '12:00'
  
  getFullDate: ->
    date = @get('expenseDate')
    timeStr = @get('expenseTime')
    TimeUtil.combineDateAndTime(date,timeStr)

  createRecord: ->
    # TODO: validate stuff

    if @get('amount')
      @get('store').createRecord 'expense', 
        amount: parseInt(@get('amount'))
        expenseDt: @getFullDate()
        description: @get("description")
        comment: @get('comment')
    else
      null

  reset: ->
    @set "amount",null
    @set "expenseDt",null
    @set "description",null
    @set "comment",null
    @set "expenseTime","12:00"

  save: ->
    record = @createRecord()
    if record
      record.save()
      true
    else
      false

`export default m`