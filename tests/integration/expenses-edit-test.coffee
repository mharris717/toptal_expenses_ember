`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`
`import setupHelpers from 'expenses/tests/helpers/table-helpers'`

App = null
server = null

setupHelpers()

module 'Integration - Expenses Edit',
  setup: -> 
    App = startApp()
    server = pretenderServer()

    Ember.run => authenticateSession()

  teardown: -> 
    Em.run(App,'destroy')
    server.shutdown()

expensesTest = (name,f) ->
  test name, ->
    visit("/expenses").then(f)

expensesTest 'Shows editable fields', ->
  click ".edit-mode:eq(0) button"

  ensureCount = (selector,num) ->
    equal findWithAssert("#expenses-table tr:eq(1) #{selector}").length,num

  ensureCount "input",4
  ensureCount "textarea",1
  ensureCount "button",1
  ensureCount ".save",1

expensesTest 'Save', ->
  shouldHaveExpenseRowCount 2

  click ".edit-mode:eq(0) button"
  fillInExpenseEdit "expense-date","9/1/14",1
  fillInExpenseEdit "description","Lunch",1
  fillInExpenseEdit "amount","32",1
  click ".save:eq(0) button"

  andThen =>
    shouldHaveExpenseRowCount 2
    equal expenseVal("expense-date",1),"9/1/14"
    equal expenseVal("amount",1),"$32"
  

