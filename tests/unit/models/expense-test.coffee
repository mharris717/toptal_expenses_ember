`import { test, moduleForModel } from 'ember-qunit'`
`import Expense from 'expenses/models/expense'`

moduleForModel 'expense', 'Expense',
  needs: []

test 'it exists', ->
  model = @subject()
  # var store = this.store();
  ok(model)

test 'fixture count', ->
  Em.run =>
    @store().find('expense').then (expenses) ->
      equal expenses.get('content').length,2

  # model.find()
