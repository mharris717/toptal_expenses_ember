`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

r = Ember.Route.extend ApplicationRouteMixin,
  model: ->
    @store.find('expense')

`export default r`
