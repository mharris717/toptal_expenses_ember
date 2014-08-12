`import Ember from 'ember'`
# `import moment from 'moment'`

c = Ember.ArrayController.extend
  newExpense: (-> Ember.Object.create()).property()

  actions: 
    save: ->
      date = @get('newExpense.expenseDate') + " " + @get('newExpense.expenseTime')
      date = moment(date,"MM/DD/YY H:mm")._d

      # validate stuff
      
      @store.createRecord 'expense', 
        amount: parseInt(@get('newExpense.amount'))
        expenseDt: date
      @set 'newExpense',Ember.Object.create()

`export default c`