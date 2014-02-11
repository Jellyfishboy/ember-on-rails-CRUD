# Ember router to use history API instead of the default 'hash' URLs for routes
# RouteURL either uses the App.IndexController object, if defined, or just render out the index template
Sngtrkr.Router.reopen
    location: 'history'
    rootURL: '/'

# Add user resource
Sngtrkr.Router.map ->
    @resource 'users', ->
        @route 'new'
        @route 'edit',
            path: '/:user_id/edit'
        @route 'show',
            path: '/:user_id'


Sngtrkr.IndexRoute = Ember.Route.extend
    # called on each visit to the route. pases an instance of the controller and model
    setupController: (controller, model) ->
        @controllerFor('application').set('currentRoute', 'home')

# USERS        

Sngtrkr.UsersRoute = Ember.Route.extend
    # User.find makes remote call, fetches collection, and instantiates the models. This collection is passed
    # to setupController through the model attribute
    model: ->
        Sngtrkr.User.find()
    setupController: (controller, model) ->
        @controllerFor('application').set('currentRoute', 'users')

Sngtrkr.UsersNewRoute = Ember.Route.extend
    model: ->
        Sngtrkr.User.createRecord()
    setupController: (controller, model) ->
        controller.set('content', model)

Sngtrkr.UserRoute = Ember.Route.extend
    model: (params) ->
        Sngtrkr.User.find(params.user_id)
    setupController: (controller, model) ->
        controller.set('content', model)
        @controllerFor('application').set('currentRoute', 'users')

Sngtrkr.UsersShowRoute = Sngtrkr.UserRoute.extend()
Sngtrkr.UsersEditRoute = Sngtrkr.UserRoute.extend()
