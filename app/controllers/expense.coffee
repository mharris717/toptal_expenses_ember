`import Ember from 'ember'`
`import TimeUtil from 'expenses/models/time_util'`

c = Ember.ObjectController.extend
  getFullDate: ->
    date = @get('expenseDate')
    timeStr = @get('expenseTime')
    TimeUtil.combineDateAndTime(date,timeStr)

  actions: 
    save: ->
      @set "model.expenseDt",@getFullDate()
      @get('model').save()
      @set 'editMode', false 

    toggleEditMode: ->
      console.debug "toggling edit mode"
      val = @get('editMode')
      @set 'editMode',!val

`export default c`