`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Landing Page',
  setup: -> App = startApp()
  teardown: -> Em.run(App,'destroy')

test 'Should welcome me', ->
  visit("/").then ->
    equal find('h2#title').text(), 'Welcome to Expenses'