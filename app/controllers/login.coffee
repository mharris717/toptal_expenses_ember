`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`

c = Ember.Controller.extend LoginControllerMixin, 
  authenticator: 'simple-auth-authenticator:devise'
  # the default is authenticator: 'authenticator:custom' 

`export default c`