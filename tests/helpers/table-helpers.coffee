f = ->
  Ember.Test.registerAsyncHelper 'shouldHaveExpenseRowCount', 
    (app,n,context) ->
      equal findWithAssert("#expenses-table tr",context).length - 2,n

  Ember.Test.registerAsyncHelper 'fillInExpense', 
    (app,field,val,context) ->
      fillIn "#new-expense .#{field} input",val

  Ember.Test.registerAsyncHelper 'expenseVal', 
    (app,field,rowNum,context) ->
      findWithAssert("#expenses-table tr:eq(#{rowNum}) td.#{field}").text()

  Ember.Test.registerAsyncHelper 'fillInExpenseEdit', 
    (app,field,val,rowNum,context) ->
      fillIn "#expenses-table tr:eq(#{rowNum}) .#{field} input",val
      
`export default f`