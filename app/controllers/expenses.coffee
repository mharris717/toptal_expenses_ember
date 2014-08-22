`import Ember from 'ember'`
`import Filter from 'expenses/models/filter'`
`import NewExpense from 'expenses/models/new_expense'`

c = Ember.ArrayController.extend
  newExpense: (-> NewExpense.create(store: @store)).property()

  filterObj: (->
    Filter.create(all: @get('model'), parent: this)).property("this.@each.amount")

  actions: 
    save: ->
      @get('newExpense').save()
      @set 'newExpense',NewExpense.create(store: @store)


`export default c`