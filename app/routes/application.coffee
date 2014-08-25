`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`
`import ErrorUtil from 'expenses/models/error_util'`

c = Ember.Route.extend ApplicationRouteMixin, 
  actions:
    sessionAuthenticationFailed: (error) ->
      message = null
      message = error.error if error
      ErrorUtil.setError "Login Failed: #{message}"

    sessionAuthenticationSucceeded: ->
      ErrorUtil.clearError()
      this._super()

`export default c`