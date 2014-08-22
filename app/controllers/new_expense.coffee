`import Ember from 'ember'`

c = Ember.ObjectController.extend
  actions: 
    save: ->
      if @get('model').save()
        @get('model').reset()
      else
        jQuery("#flash").text('Missing Amount')

`export default c`