`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`

c = Ember.Controller.extend LoginControllerMixin, 
  authenticator: 'simple-auth-authenticator:devise'
  # the default is authenticator: 'authenticator:custom' 

  # CHANGE FOR TESTING init method with hardcoded identification and password

`export default c`