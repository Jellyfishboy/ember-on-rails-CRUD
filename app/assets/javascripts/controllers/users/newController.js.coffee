Sngtrkr.UsersNewController = Ember.ObjectController.extend

  save: ->
    @content.save().then =>
      @transitionToRoute('users.show', @content)

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('users.index')

  headerTitle: 'Create'
  buttonTitle: 'Create'