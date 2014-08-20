`import startApp from 'expenses/tests/helpers/start-app'`

App = null

module 'Integration - Landing Page',
  setup: -> 
    App = startApp()
    Ember.run => authenticateSession()
    
  teardown: -> Em.run(App,'destroy')

if false
  test 'Should welcome me', ->
    visit("/").then ->
      equal find('h2#title').text(), 'Welcome to Expenses'