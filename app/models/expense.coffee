`import DS from 'ember-data'`

m = DS.Model.extend
  expenseDt: DS.attr('date')
  description: DS.attr('string')
  userId: DS.attr('number')
  amount: DS.attr('number')
  comment: DS.attr('string')

m.reopenClass
  FIXTURES: [
    {id: 1, amount: 100, description: "Dinner for team", expenseDt: Date.now()}
    {id: 2, amount: 75.42, description: "Lunch for team", expenseDt: Date.now()-1}
  ]

`export default m`

