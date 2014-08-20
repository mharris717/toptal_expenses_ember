`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`
`import setupHelpers from 'expenses/tests/helpers/table-helpers'`

App = null
server = null

setupHelpers()

module 'Integration - Expenses Filter',
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

Ember.Test.registerAsyncHelper 'fillFilter', 
  (app,field,val,context) ->
    fillIn "#expenses-filter ##{field} input", val

expensesTest 'Should show filter', ->
  equal find("#expenses-filter").length,1
  shouldHaveExpenseRowCount 2

expensesTest "amount low", ->
  fillFilter "amount-low",999
  shouldHaveExpenseRowCount 0 

  fillFilter "amount-low",1
  shouldHaveExpenseRowCount 2

  fillFilter "amount-low",80
  shouldHaveExpenseRowCount 1

expensesTest "amount high", ->
  fillFilter "amount-high",1
  shouldHaveExpenseRowCount 0 

  fillFilter "amount-high",999
  shouldHaveExpenseRowCount 2

  fillFilter "amount-high",80
  shouldHaveExpenseRowCount 1

expensesTest "amount both", ->
  fillFilter "amount-low",1
  fillFilter "amount-high",999
  shouldHaveExpenseRowCount 2

  fillFilter "amount-low",80
  fillFilter "amount-high",999
  shouldHaveExpenseRowCount 1

  fillFilter "amount-low",80
  fillFilter "amount-high",85
  shouldHaveExpenseRowCount 0

expensesTest "dates", ->
  fillFilter "date-low","7/1/14"
  shouldHaveExpenseRowCount 2

  fillFilter "date-low","9/1/14"
  shouldHaveExpenseRowCount 0

  fillFilter "date-low","7/1/14"
  shouldHaveExpenseRowCount 2

  fillFilter "date-low","7/1/14"
  fillFilter "date-high","9/1/14"
  shouldHaveExpenseRowCount 2

  fillFilter "date-high","7/2/14"
  shouldHaveExpenseRowCount 0

  fillFilter "date-high","junk"
  shouldHaveExpenseRowCount 2
