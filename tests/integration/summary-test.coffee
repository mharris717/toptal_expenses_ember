`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`

App = null
server = null

module 'Integration - Expenses Summary',
  setup: -> 
    App = startApp()
    server = pretenderServer()
    Ember.run => authenticateSession()
    
  teardown: -> 
    Em.run(App,'destroy')
    server.shutdown()

test "summary - basic", ->
  visit "/expenses"
  andThen =>
    equal find("#summary td.amount:eq(0)").text(), "$175.42"

test "summary - updates after add to same week", ->
  visit "/expenses"
  fillInExpense 'amount',50
  fillInExpense 'description','filler'
  fillInExpense 'expense-date','8/01/14'
  fillInExpense 'expense-time','9:30'
  click ".save button"

  andThen =>
    equal find("#summary td.amount:eq(0)").text(), "$225.42"


test "summary - updates after add to different week", ->
  visit "/expenses"
  fillInExpense 'amount',50
  fillInExpense 'description','filler'
  fillInExpense 'expense-date','7/01/14'
  fillInExpense 'expense-time','9:30'
  click ".save button"

  andThen =>
    equal find("#summary tr").length,4

    # earlier week should be first
    equal find("#summary td.amount:eq(0)").text(), "$50"
    equal find("#summary td.amount:eq(1)").text(), "$175.42"
    equal find("#summary td.amount:eq(2)").text(), "$225.42"

test "summary - total row", ->
  visit "/expenses"

  andThen =>
    equal find("#summary td.amount:eq(1)").text(), "$175.42"

test "summary - visit own page", ->
  visit "/summary"
  andThen =>
    equal find("#summary tr").length,3
    equal find("#summary td.amount:eq(0)").text(), "$175.42"