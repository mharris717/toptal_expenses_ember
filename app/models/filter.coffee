`import Ember from 'ember'`

myFilter = (list,f) ->
  res = []
  list.forEach (obj) ->
    res.push(obj) if f(obj)
  res

isPresent = (obj) ->
  obj && obj != ''

f = Ember.Object.extend
  parseDate: (str) -> 
    res = if isPresent(str) && _.filter(str.split("/"), (s) -> isPresent(s)).length == 3
      moment(str,"MM/DD/YY")._d
    else
      null
    console.debug "parsed #{str} into #{res}"
    res

  parseNum: (str) ->
    if isPresent(str)
      parseInt(str)
    else
      null

  filtered: (->
    amountLow = @parseNum(@get('amountLow'))
    amountHigh = @parseNum(@get('amountHigh'))
    dateLow = @parseDate(@get('dateLow'))
    dateHigh = @parseDate(@get('dateHigh'))

    res = @get('all')

    if amountLow
      res = myFilter res, (e) -> e.get('amount') >= amountLow

    if amountHigh
      res = myFilter res, (e) -> e.get('amount') <= amountHigh

    if dateLow
      res = myFilter res, (e) -> e.get('expenseDt') >= dateLow

    if dateHigh
      res = myFilter res, (e) -> e.get('expenseDt') <= dateHigh

    res).property('all.@each.amount','amountLow','amountHigh','dateLow','dateHigh')

`export default f`