`import Ember from 'ember'`

m = Ember.Object.extend()

m.reopenClass
  combineDateAndTime: (date,timeStr) ->
    return date unless date
    time = moment(timeStr,"H:mm")._d
    date.setHours(time.getHours())
    date.setMinutes(time.getMinutes())
    date

`export default m`