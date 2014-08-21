`import Ember from 'ember'`
`import Filter from 'expenses/models/filter'`

defaultOps = {expenseDate: "8/12/14", expenseTime: "20:30", description: "stuff", amount: 10}

NewExpense = Ember.Object.extend
  expenseTime: '12:00'
  
  getFullDate: ->
    date = @get('expenseDate')
    return date unless date
    timeStr = @get('expenseTime')
    time = moment(timeStr,"H:mm")._d
    date.setHours(time.getHours())
    date.setMinutes(time.getMinutes())
    date

c = Ember.ArrayController.extend
  newExpense: (-> NewExpense.create()).property()

  filterObj: (->
    Filter.create(all: @get('model'))).property("this.@each.amount")

  actions: 
    save: ->
      date = @get('newExpense').getFullDate()

      # validate stuff
      
      obj = @store.createRecord 'expense', 
        amount: parseInt(@get('newExpense.amount'))
        expenseDt: date
        description: @get("newExpense.description")
        comment: @get('newExpense.comment')
      obj.save()
      @set 'newExpense',NewExpense.create()

`export default c`