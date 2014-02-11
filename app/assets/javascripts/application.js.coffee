#= require modernizr/modernizr
#= require jquery/jquery
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap/docs/assets/js/bootstrap
#= require_self
#= require store
#= require routes
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views

window.Sngtrkr = Ember.Application.create()

$ ->
  token = $('meta[name="csrf-token"]').attr('content')
  $.ajaxPrefilter (options, originalOptions, xhr) ->
    xhr.setRequestHeader('X-CSRF-Token', token)