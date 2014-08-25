`import Ember from 'ember'`
`import ErrorUtil from 'expenses/models/error_util'`

c = Ember.ObjectController.extend
  actions: 
    save: ->
      if @get('model').save(ErrorUtil.setError)
        @get('model').reset()
        ErrorUtil.clearError()

`export default c`