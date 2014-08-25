`import Ember from 'ember'`

myFilter = (list,f) ->
  res = []
  list.forEach (obj) ->
    res.push(obj) if f(obj)
  res

isPresent = (obj) ->
  obj && obj != ''

f = Ember.Object.extend
  dateLow: ''
  dateHigh: ''
  
  parseDate: (str) -> 
    if isPresent(str)
      str
    else
      null

  parseNum: (str) ->
    if isPresent(str)
      parseFloat(str)
    else
      null

  filtered: (->
    amountLow = @parseNum(@get('amountLow'))
    amountHigh = @parseNum(@get('amountHigh'))
    dateLow = @parseDate(@get('dateLow'))
    dateHigh = @parseDate(@get('dateHigh'))

    res = myFilter @get('all'), -> true

    if amountLow
      res = myFilter res, (e) -> e.get('amount') >= amountLow

    if amountHigh
      res = myFilter res, (e) -> e.get('amount') <= amountHigh

    if dateLow
      res = myFilter res, (e) -> e.get('expenseDt') >= dateLow

    if dateHigh
      res = myFilter res, (e) -> e.get('expenseDt') <= dateHigh

    _.sortBy res, (e) -> e.get('expenseDt')).property('all.@each.amount','amountLow','amountHigh','dateLow','dateHigh')

`export default f`