'use strict'

describe 'Directive: makiIcon', ->

  # load the directive's module
  beforeEach module 'belanddylanApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<maki-icon></maki-icon>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the makiIcon directive'
