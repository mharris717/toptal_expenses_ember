`import Ember from 'ember'`

Router = Ember.Router.extend
  location: ExpensesENV.locationType

Router.map ->
  @resource('expenses')
  @route('summary')
  @route "login"
  @route "register"

`export default Router`
