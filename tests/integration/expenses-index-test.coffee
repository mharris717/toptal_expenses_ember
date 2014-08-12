`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Expenses Index',
  setup: -> App = startApp()
  teardown: -> Em.run(App,'destroy')

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

    shouldHaveExpenseRowCount 1

test 'New Expense Row', ->
  visit "/expenses"
  andThen =>
    equal find("#expenses-table tr#new-expense").length,1

test 'New Expense Save - Basic', ->
  visit "/expenses"
  fillIn "input",200
  click "button"

  shouldHaveExpenseRowCount 2
  andThen =>
    equal expenseVal('amount',2),"$200"

test 'New Expense Save - Date', ->
  visit "/expenses"
  fillInExpense 'amount',250
  fillInExpense 'expense-date','7/17/82'
  fillInExpense 'expense-time','9:30'
  click "button"

  shouldHaveExpenseRowCount 2
  andThen =>
    equal expenseVal("amount",2),"$250"
    equal expenseVal("expense-date",2),"7/17/82"
    equal expenseVal("expense-time",2),"9:30"

test 'save multiple new expenses', ->
  visit "/expenses"
  fillInExpense 'amount',300
  andThen =>
    equal find("#new-expense .amount input").val(),"300"

  click "button"

  shouldHaveExpenseRowCount 2
  andThen =>
    equal find("#new-expense .amount input").val(),""

  fillInExpense 'amount',50
  click "button"

  shouldHaveExpenseRowCount 3
  andThen =>
    equal expenseVal("amount",2),"$300"
    equal expenseVal("amount",3),"$50"
    equal find("#new-expense .amount input").val(),""


