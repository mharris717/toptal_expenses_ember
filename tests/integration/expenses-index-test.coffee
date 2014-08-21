`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`
`import setupHelpers from 'expenses/tests/helpers/table-helpers'`

App = null
server = null

setupHelpers()

module 'Integration - Expenses Index',
  setup: -> 
    App = startApp()
    server = pretenderServer()

    Ember.run => authenticateSession()
    console.debug "authed"

  teardown: -> 
    Em.run(App,'destroy')
    server.shutdown()

test 'Should welcome me', ->
  visit("/expenses").then ->
    shouldHaveExpenseRowCount 2

test 'New Expense Row', ->
  visit "/expenses"
  andThen =>
    equal find("#expenses-table tr#new-expense").length,1

test 'New Expense Save - Date', ->
  visit "/expenses"
  fillInExpense 'amount',250
  fillInExpense 'expense-date','08/17/2014'
  fillInExpense 'expense-time','9:30'

  # andThen => debugger

  click "button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal expenseVal("amount",3),"$250"
    equal expenseVal("expense-date",3),"8/17/14"
    equal expenseVal("expense-time",3),"9:30"

test 'save multiple new expenses', ->
  visit "/expenses"
  fillInExpense 'amount',300
  andThen =>
    equal find("#new-expense .amount input").val(),"300"

  click "button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal find("#new-expense .amount input").val(),""

  fillInExpense 'amount',50
  click "button"

  shouldHaveExpenseRowCount 4
  andThen =>
    equal expenseVal("amount",3),"$300"
    equal expenseVal("amount",4),"$50"
    equal find("#new-expense .amount input").val(),""


