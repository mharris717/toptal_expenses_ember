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

  totalAmount: (-> _.reduce @get('expenses'), ((s,e) -> s + e.get('amount')), 0).property('expenses.@each.amount')

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