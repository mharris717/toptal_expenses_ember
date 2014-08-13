`import Expense from 'expenses/models/expense'`

#expenses = [{id: 1, amount: 100, description: "Dinner for team", expenseDt: Date.now()}
#            {id: 2, amount: 75.42, description: "Lunch for team", expenseDt: Date.now()-1}]

expenses = Expense.FIXTURES

makeServer = ->
  server = new Pretender ->
    @get "/expenses", (request) ->
      [200, {"Content-Type": "application/json"}, JSON.stringify(expenses: expenses)]

    @get "/expenses/:id", (request) ->
      expense = expenses.find (e) -> e.id == parseInt(request.params.id)
      [200, {"Content-Type": "application/json"}, JSON.stringify({expense: expense})]

`export default makeServer`