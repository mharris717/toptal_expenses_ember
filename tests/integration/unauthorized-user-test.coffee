`import startApp from 'expenses/tests/helpers/start-app'`

if true
  App = null

  module 'Integration - Unauthorized User',
    setup: -> 
      App = startApp()
      Ember.run => invalidateSession()

    teardown: -> 
      Em.run(App,'destroy')

  test 'Should Show login link', ->
    visit("/expenses").then ->
      equal find("#auth-status #login-link").length,1

  test 'Shows no expenses', ->
    visit("/expenses").then ->
      equal find("#expenses-table").length,0