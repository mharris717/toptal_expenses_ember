`import DS from 'ember-data'`

m = DS.Model.extend
  expenseDt: DS.attr('date')
  description: DS.attr('string')
  userId: DS.attr('number')
  amount: DS.attr('number')
  comment: DS.attr('string')

  expenseDate: (-> @get('expenseDt')).property('expenseDt')
  expenseTime: (-> moment(@get('expenseDt')).format("H:mm")).property("expenseDt")

m.reopenClass
  FIXTURES: [
    {id: 1, amount: 100, description: "Dinner for team", expense_dt: (new Date(2014,7,2)), user_id: 1}
    {id: 2, amount: 75.42, description: "Lunch for team", expense_dt: (new Date(2014,7,1)), user_id: 1}
    {id: 3, amount: 50, description: "TONER!!!!!", expense_dt: (new Date(2014,7,1)), user_id: 2}
  ]

`export default m`

