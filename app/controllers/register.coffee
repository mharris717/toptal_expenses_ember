`import Ember from 'ember'`
`import ErrorUtil from 'expenses/models/error_util'`

c = Ember.Controller.extend
  email: ''
  password: ''

  actions: 
    save: ->
      attrs = {email: @get('email'), password: @get('password'), passwordConfirmation: @get('password')}
      r = @store.createRecord('user',attrs)
      r.save()

      ErrorUtil.setFlash "Successfully Registered"
      @transitionTo 'expenses'

`export default c`