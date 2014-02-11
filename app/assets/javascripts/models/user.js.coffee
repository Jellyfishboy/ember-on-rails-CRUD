Sngtrkr.User = DS.Model.extend(
  name:         DS.attr('string', defaultValue: '')
  lastName:     DS.attr('string', defaultValue: '')
  quote:        DS.attr('string')
  fullName: (->
    "#{@get('name')} #{@get('lastName')}"
  ).property('name', 'lastName')
)