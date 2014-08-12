h = Ember.Handlebars.makeBoundHelper (amt) ->
  res = ""
  if amt
    res = "$#{amt}"
  new Ember.Handlebars.SafeString(res)

`export default h`