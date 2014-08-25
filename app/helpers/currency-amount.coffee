`import Ember from 'ember'`

h = Ember.Handlebars.makeBoundHelper (amt) ->
  res = ""
  if amt
    amt = parseFloat(Math.round(amt*100))/100.0
    res = "$#{amt}"
    res += "0" if res.split(".").length == 2 && res.split(".")[1].length == 1
    
  new Ember.Handlebars.SafeString(res)

`export default h`