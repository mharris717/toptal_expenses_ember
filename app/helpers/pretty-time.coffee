`import Ember from 'ember'`

h = Ember.Handlebars.makeBoundHelper (dt) ->
  res = ""
  if dt
    res = moment(dt).format("H:mm")
  new Ember.Handlebars.SafeString(res)

`export default h`