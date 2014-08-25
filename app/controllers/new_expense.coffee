`import Ember from 'ember'`

c = Ember.ObjectController.extend
  actions: 
    save: ->
      errorFunc = (error) ->
        jQuery("#flash").text(error)

      if @get('model').save(errorFunc)
        @get('model').reset()
        jQuery("#flash").text("")

        

`export default c`