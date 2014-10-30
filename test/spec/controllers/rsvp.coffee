'use strict'

describe 'Controller: RsvpCtrl', ->

  # load the controller's module
  beforeEach module 'belanddylanApp'

  RsvpCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    RsvpCtrl = $controller 'RsvpCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
