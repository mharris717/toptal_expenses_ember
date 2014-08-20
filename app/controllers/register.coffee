`import Ember from 'ember'`

c = Ember.Controller.extend
  email: ''
  password: ''

  actions: 
    save: ->
      console.debug "register save call"

      attrs = {email: @get('email'), password: @get('password'), passwordConfirmation: @get('password')}
      r = @store.createRecord('user',attrs)
      r.save()

      @transitionTo 'expenses'

`export default c`