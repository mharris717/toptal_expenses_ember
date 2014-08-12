`import Ember from 'ember'`

r = Ember.Route.extend
  model: ->
    @store.find('expense')

`export default r`
