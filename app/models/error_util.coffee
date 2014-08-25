`import Ember from 'ember'`

m = Ember.Object.extend()

m.reopenClass
  setError: (error) ->
    jQuery("#flash").text(error)

  clearError: ->
    jQuery("#flash").text("")

`export default m`