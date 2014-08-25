`import ErrorUtil from 'expenses/models/error_util'`

a = 
  name: 'setup auth fail'
  after: 'simple-auth'

  initialize: (container) ->
    session = container.lookup('simple-auth-session:main')
    session.on 'sessionAuthenticationSucceeded', ->
      console.debug "auth success"
      ErrorUtil.clearError()
      true

    session.on 'sessionAuthenticationFailed', ->
      console.debug "auth fail"
      ErrorUtil.setError "Login Failed"
      true
   

`export default a`