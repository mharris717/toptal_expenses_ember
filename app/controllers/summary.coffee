`import Ember from 'ember'`

Week = Ember.Object.extend
  startDate: -> 
    dt = @get('expenses.firstObject.expenseDt')
    moment(dt).startOf('week')

  endDate: -> 
    dt = @get('expenses.firstObject.expenseDt')
    moment(dt).endOf('week')

  name: (->
    s = moment(@startDate()).format("M/D/YY")
    e = moment(@endDate()).format("M/D/YY")
    "#{s} to #{e}").property("expenses.@each.expenseDt")

  amounts: Ember.computed.map "expenses", (e) -> e.get('amount')
  uniqueDateCount: (-> 
    res = _.map @get('expenses'), (e) -> moment(e.get('expenseDt')).startOf('day').format("M/D/YY")
    _.uniq(res).length).property("expenses.@each.expenseDt")

    #).map((e) -> e.get('expenseDt')).uniq).property('expenses.#each.expenseDt')
  totalAmount: Ember.computed.sum('amounts')
  averageDailyAmount: (-> parseFloat(@get('totalAmount')) / parseFloat(@get('uniqueDateCount')) ).property("totalAmount","dates")
  # totalAmountOld: (-> _.reduce @get('expenses'), ((s,e) -> s + e.get('amount')), 0).property('expenses.@each.amount')

Week.reopenClass
  startDate: (dt) ->
    moment(dt).startOf('week')._d

c = Ember.ArrayController.extend
  totalAmount: (->
    res = 0
    @forEach (expense) ->
      res += expense.get('amount')
    res).property('this.@each.amount')

  weeks: (->
    res = {}
    @forEach (expense) ->
      startDate = Week.startDate(expense.get('expenseDt'))
      res[startDate] = res[startDate] || []
      res[startDate].push(expense)

    vals = _.values(res)
    unsortedWeeks = _.map vals, (es) -> Week.create(expenses: es)
    _.sortBy unsortedWeeks, (w) -> w.startDate()).property("this.@each.amount","this.@each.expenseDt")


`export default c`