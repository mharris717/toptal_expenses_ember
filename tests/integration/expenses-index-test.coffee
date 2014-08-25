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
  fillInExpense 'description','filler'
  fillInExpense 'amount',250
  fillInExpense 'expense-date','08/17/2014'
  fillInExpense 'expense-time','9:30'

  # andThen => debugger

  click "#new-expense button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal expenseVal("amount",3),"$250"
    equal expenseVal("expense-date",3),"8/17/14"
    equal expenseVal("expense-time",3),"9:30"

test 'save multiple new expenses', ->
  visit "/expenses"
  fillInExpense 'amount',300
  fillInExpense 'description','filler'
  andThen =>
    equal find("#new-expense .amount input").val(),"300"

  click "#new-expense button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal find("#new-expense .amount input").val(),""

  fillInExpense 'amount',50
  fillInExpense 'expense-date','9/1/14'
  fillInExpense 'description','filler'

  click "#new-expense button"

  shouldHaveExpenseRowCount 4
  andThen =>
    equal expenseVal("amount",3),"$300"
    equal expenseVal("amount",4),"$50"
    equal expenseVal('expense-date',4),"9/1/14"
    equal find("#new-expense .amount input").val(),""

test "save invalid - missing amount", ->
  visit "/expenses"
  fillInExpense 'description','hello'
  click "#new-expense button"

  andThen =>
    equal find("#flash").length,1
    equal find("#flash").text(),"Missing Amount"
    shouldHaveExpenseRowCount 2

test "save invalid - missing description", ->
  visit "/expenses"
  fillInExpense 'amount','25'
  click "#new-expense button"

  andThen =>
    equal find("#flash").length,1
    equal find("#flash").text(),"Missing Description"
    shouldHaveExpenseRowCount 2

test "save invalid - invalid time", ->
  visit "/expenses"
  fillInExpense 'description','filler'
  fillInExpense 'amount','25'
  fillInExpense "expense-time","99:99"
  click "#new-expense button"

  andThen =>
    equal find("#flash").length,1
    equal find("#flash").text(),"Invalid Date or Time"
    shouldHaveExpenseRowCount 2


test "save invalid - invalid amount", ->
  visit "/expenses"
  fillInExpense 'description','filler'
  fillInExpense 'amount','abc'

  click "#new-expense button"


  andThen =>
    equal find("#flash").length,1
    equal find("#flash").text(),"Missing Amount"
    shouldHaveExpenseRowCount 2