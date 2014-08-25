`import DS from 'ember-data'`

# CHANGE FOR TESTING remove host
a = DS.ActiveModelAdapter.extend
  host: 'http://mharris717expenses.herokuapp.com'

`export default a`