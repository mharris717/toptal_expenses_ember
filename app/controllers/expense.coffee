`import Ember from 'ember'`
`import TimeUtil from 'expenses/models/time_util'`
`import ErrorUtil from 'expenses/models/error_util'`

isBlank = (val) -> !val

c = Ember.ObjectController.extend
  getFullDate: ->
    date = @get('expenseDate')
    timeStr = @get('expenseTime')
    TimeUtil.combineDateAndTime(date,timeStr,ErrorUtil.setError)

  actions: 
    save: ->
      date = @getFullDate()
      parsedAmount = parseFloat(@get('model.amount'))

      if isBlank(@get('model.amount'))
        ErrorUtil.setError('Missing Amount')
        null
      else if !parsedAmount || parsedAmount <= 0
        ErrorUtil.setError('Missing Amount')
        null
      else if isBlank(@get('model.description'))
        ErrorUtil.setError('Missing Description')
        null
      else if !date
        ErrorUtil.setError('Invalid Date or Time')
        null
      else
        @set "model.expenseDt",date
        @get('model').save()
        @set 'editMode', false 


    toggleEditMode: ->
      val = @get('editMode')
      @set 'editMode',!val

`export default c`