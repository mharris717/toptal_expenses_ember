a = 
  name: 'setup authorizer'
  initialize: ->
    window.ENV = window.ENV || {};

    creds = 
      authorizer: 'simple-auth-authorizer:devise'
      crossOriginWhitelist: ['http://mharris717expenses.herokuapp.com','http://localhost:3000']
      serverTokenEndpoint: 'http://mharris717expenses.herokuapp.com/users/sign_in'

    window.ENV['simple-auth'] = creds
    window.ENV['simple-auth-devise'] = creds

`export default a`