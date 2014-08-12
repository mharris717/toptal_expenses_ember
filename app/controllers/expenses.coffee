`import Ember from 'ember'`

c = Ember.ArrayController.extend
  newExpense: (-> Ember.Object.create()).property()

  actions: 
    save: ->
      console.debug "save call"
      @store.createRecord 'expense', 
        amount: @get('newExpense.amount')
      @set 'newExpense',Ember.Object.create()

`export default c`