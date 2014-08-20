f = ->
  Ember.Test.registerAsyncHelper 'shouldHaveExpenseRowCount', 
    (app,n,context) ->
      equal findWithAssert("#expenses-table tr",context).length - 2,n

  Ember.Test.registerAsyncHelper 'fillInExpense', 
    (app,field,val,context) ->
      fillIn "#new-expense .#{field} input",val

  Ember.Test.registerAsyncHelper 'expenseVal', 
    (app,field,rowNum,context) ->
      find("#expenses-table tr:eq(#{rowNum}) td.#{field}").text()

`export default f`