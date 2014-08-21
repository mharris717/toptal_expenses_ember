`import Ember from 'ember'`

r = Ember.Route.extend
  beforeModel: ->
    @transitionTo("expenses")

`export default r`
