`import Ember from 'ember'`

r = Ember.Route.extend
  redirect: -> @transitionTo('expenses')

`export default r`
