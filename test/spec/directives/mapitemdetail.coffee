'use strict'

describe 'Directive: mapItemDetail', ->

  # load the directive's module
  beforeEach module 'belanddylanApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<map-item-detail></map-item-detail>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the mapItemDetail directive'
