`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

r = Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    @store.find('expense')

`export default r`
