`import Expense from 'expenses/models/expense'`

expenses = _.filter Expense.FIXTURES, (e) -> e.user_id == 1

makeServer = ->
  server = new Pretender ->
    @get "/expenses", (request) ->
      # debugger
      [200, {"Content-Type": "application/json"}, JSON.stringify(expenses: expenses)]

    @get "/expenses/:id", (request) ->
      expense = expenses.find (e) -> e.id == parseInt(request.params.id)
      [200, {"Content-Type": "application/json"}, JSON.stringify({expense: expense})]

`export default makeServer`