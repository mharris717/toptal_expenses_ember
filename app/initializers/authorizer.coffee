a = 
  name: 'setup authorizer'
  initialize: ->
    window.ENV = window.ENV || {};
    window.ENV['simple-auth'] = 
      authorizer: 'simple-auth-authorizer:devise'

`export default a`