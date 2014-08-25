`import startApp from 'expenses/tests/helpers/start-app'`
`import pretenderServer from 'expenses/tests/helpers/pretender-server'`
`import setupHelpers from 'expenses/tests/helpers/table-helpers'`

if true
  App = null
  server = null

  setupHelpers()

  module 'Integration - Login',
    setup: -> 
      App = startApp()
      server = pretenderServer()

      Ember.run => invalidateSession()

    teardown: -> 
      Em.run(App,'destroy')
      server.shutdown()

  test 'Should Show login link', ->
    visit("/expenses").then ->
      equal find("#auth-status #login-link").length,1
      click("#auth-status #login-link")

      click("#login-form button")

      andThen =>
        equal find("#login-form").length,0

  test 'Should fail with bad password', ->
    visit("/expenses").then ->
      click("#auth-status #login-link")

      fillIn("#password","wrongthing")

      click("#login-form button")

      andThen =>
        equal find("#login-form").length,1