h = Ember.Handlebars.makeBoundHelper (amt) ->
  res = ""
  if amt
    amt = parseFloat(Math.round(amt*100))/100.0
    res = "$#{amt}"
  new Ember.Handlebars.SafeString(res)

`export default h`