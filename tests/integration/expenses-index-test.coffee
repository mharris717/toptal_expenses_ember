`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Expenses Index',
  setup: -> App = startApp()
  teardown: -> Em.run(App,'destroy')

test 'Should welcome me', ->
  visit("/expenses").then ->
    equal find('#expenses-header').text(), 'Expenses Table'

    equal find("#expenses-table tr").length,3

# test 'New Expense Row', ->
