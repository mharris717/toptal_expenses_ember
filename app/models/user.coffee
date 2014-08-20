`import DS from 'ember-data'`

m = DS.Model.extend
  email: DS.attr("string")
  password: DS.attr("string")
  passwordConfirmation: DS.attr("string")

`export default m`