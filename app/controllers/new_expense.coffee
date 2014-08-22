`import Ember from 'ember'`

c = Ember.ObjectController.extend
  actions: 
    save: ->
      if @get('model').save()
        @get('model').reset()
      else
        $("#flash").text('Missing Amount')

`export default c`