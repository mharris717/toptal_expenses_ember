`import Expense from 'expenses/models/expense'`

# assumes always logged in as user 1
expenses = _.filter Expense.FIXTURES, (e) -> e.user_id == 1

makeServer = ->
  server = new Pretender ->
    @get "/expenses", (request) ->
      [200, {"Content-Type": "application/json"}, JSON.stringify(expenses: expenses)]

    @get "/expenses/:id", (request) ->
      expense = expenses.find (e) -> e.id == parseInt(request.params.id)
      [200, {"Content-Type": "application/json"}, JSON.stringify({expense: expense})]

    @post "/users/sign_in", (request) ->
      if !request.requestBody.match("wrong")
        body = {id: 1, email: "jsmith@fake.com"}
        [200, {"Content-Type": "application/json"}, JSON.stringify(body)]
      else
        [402, {"Content-Type": "application/json"}, {}]
        

      

`export default makeServer`

# user%5Bemail%5D=jsmith%40fake.com&user%5Bpassword%5D=password