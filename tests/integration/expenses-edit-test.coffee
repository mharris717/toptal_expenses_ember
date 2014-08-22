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

expensesTest 'Click edit link', ->
  click("#edit-mode a")

  equal findWithAssert("#expenses-table tr:eq(1) input").length,5