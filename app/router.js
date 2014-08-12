import Ember from 'ember';

var Router = Ember.Router.extend({
  location: ExpensesENV.locationType
});

Router.map(function() {
});

export default Router;
