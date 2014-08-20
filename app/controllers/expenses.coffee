`import Ember from 'ember'`
`import Filter from 'expenses/models/filter'`

defaultOps = {expenseDate: "8/12/14", expenseTime: "20:30", description: "stuff", amount: 10}

c = Ember.ArrayController.extend
  newExpense: (-> Ember.Object.create()).property()

  filterObj: (->
    Filter.create(all: @get('model'))).property("this.@each.amount")

  actions: 
    save: ->
      date = @get('newExpense.expenseDate') + " " + @get('newExpense.expenseTime')
      date = moment(date,"MM/DD/YY H:mm")._d

      # validate stuff
      
      obj = @store.createRecord 'expense', 
        amount: parseInt(@get('newExpense.amount'))
        expenseDt: date
        description: @get("newExpense.description")
        comment: @get('newExpense.comment')
      obj.save()
      @set 'newExpense',Ember.Object.create()

`export default c`