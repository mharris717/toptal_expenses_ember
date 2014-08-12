`import DS from 'ember-data'`

m = DS.Model.extend
  expense_dt: DS.attr('date')
  userId: DS.attr('number')
  amount: DS.attr('number')
  comment: DS.attr('comment')

m.reopenClass
  FIXTURES: [{id: 1, amount: 100}]

`export default m`

