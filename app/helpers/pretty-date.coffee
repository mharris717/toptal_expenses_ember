h = Ember.Handlebars.makeBoundHelper (dt) ->
  res = ""
  if dt
    dt = (new Date()) unless dt.getMinutes
    m = "#{dt.getMinutes()}"
    m = "0#{m}" if m.length == 1
    y = "#{dt.getFullYear()}"[2..3]
    #res = "#{dt.getMonth()+1}/#{dt.getDate()}/#{y} #{dt.getHours()}:#{m}"
    res = "#{dt.getMonth()+1}/#{dt.getDate()}/#{y}"
  new Ember.Handlebars.SafeString(res)

h = Ember.Handlebars.makeBoundHelper (dt) ->
  res = ""
  if dt
    res = moment(dt).format("M/D/YY")
  new Ember.Handlebars.SafeString(res)

`export default h`