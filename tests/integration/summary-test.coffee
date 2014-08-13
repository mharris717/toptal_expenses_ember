`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Expenses Summary',
  setup: -> App = startApp()
  teardown: -> Em.run(App,'destroy')

test "summary - basic", ->
  visit "/expenses"
  andThen =>
    equal find("#summary td.amount:eq(0)").text(), "$175.42"

test "summary - updates after add to same week", ->
  visit "/expenses"
  fillInExpense 'amount',50
  fillInExpense 'expense-date','8/12/14'
  fillInExpense 'expense-time','9:30'
  click "button"

  andThen =>
    equal find("#summary td.amount:eq(0)").text(), "$225.42"


test "summary - updates after add to different week", ->
  visit "/expenses"
  fillInExpense 'amount',50
  fillInExpense 'expense-date','8/05/14'
  fillInExpense 'expense-time','9:30'
  click "button"

  andThen =>
    equal find("#summary tr").length,3

    # earlier week should be first
    equal find("#summary td.amount:eq(0)").text(), "$50"
    equal find("#summary td.amount:eq(1)").text(), "$175.42"

test "summary - visit own page", ->
  visit "/summary"
  andThen =>
    equal find("#summary tr").length,2
    equal find("#summary td.amount:eq(0)").text(), "$175.42"