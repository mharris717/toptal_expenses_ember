`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`

App = null
server = null

module 'Integration - Expenses Index',
  setup: -> 
    App = startApp()

    expenses = [{id: 1, amount: 100, description: "Dinner for team", expenseDt: Date.now()}
                {id: 2, amount: 75.42, description: "Lunch for team", expenseDt: Date.now()-1}]

    server = pretenderServer()

  teardown: -> 
    Em.run(App,'destroy')
    server.shutdown()

Ember.Test.registerAsyncHelper 'shouldHaveExpenseRowCount', 
  (app,n,context) ->
    equal findWithAssert("#expenses-table tr",context).length - 2,n

Ember.Test.registerAsyncHelper 'fillInExpense', 
  (app,field,val,context) ->
    fillIn "#new-expense .#{field} input",val

Ember.Test.registerAsyncHelper 'expenseVal', 
  (app,field,rowNum,context) ->
    find("#expenses-table tr:eq(#{rowNum}) td.#{field}").text()

test 'Should welcome me', ->
  visit("/expenses").then ->
    equal find('#expenses-header').text(), 'Expenses Table'

    shouldHaveExpenseRowCount 2

test 'New Expense Row', ->
  visit "/expenses"
  andThen =>
    equal find("#expenses-table tr#new-expense").length,1

test 'New Expense Save - Basic', ->
  visit "/expenses"
  fillIn "input",200
  click "button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal expenseVal('amount',3),"$200"

test 'New Expense Save - Date', ->
  visit "/expenses"
  fillInExpense 'amount',250
  fillInExpense 'expense-date','7/17/82'
  fillInExpense 'expense-time','9:30'
  click "button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal expenseVal("amount",3),"$250"
    equal expenseVal("expense-date",3),"7/17/82"
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


