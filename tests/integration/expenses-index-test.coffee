`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Expenses Index',
  setup: -> App = startApp()
  teardown: -> Em.run(App,'destroy')

Ember.Test.registerAsyncHelper 'shouldHaveExpenseRowCount', 
  (app,n,context) ->
    equal findWithAssert("#expenses-table tr",context).length - 2,n

test 'Should welcome me', ->
  visit("/expenses").then ->
    equal find('#expenses-header').text(), 'Expenses Table'

    shouldHaveExpenseRowCount 1

test 'New Expense Row', ->
  visit "/expenses"
  andThen =>
    equal find("#expenses-table tr#new-expense").length,1

test 'New Expense Save', ->
  visit "/expenses"
  fillIn "input",200
  click "button"

  shouldHaveExpenseRowCount 2

