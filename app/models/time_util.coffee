`import Ember from 'ember'`

m = Ember.Object.extend()

m.reopenClass
  combineDateAndTime: (date,timeStr,errorFunc) ->
    return date unless date
    m = moment(timeStr,"H:mm")
    time = m._d

    if m.isValid()
      date.setHours(time.getHours())
      date.setMinutes(time.getMinutes())
      date
    else
      errorFunc('Invalid Date or Time') if errorFunc
      null

`export default m`