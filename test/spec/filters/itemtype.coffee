'use strict'

describe 'Filter: itemType', ->

  # load the filter's module
  beforeEach module 'belanddylanApp'

  # initialize a new instance of the filter before each test
  itemType = {}
  beforeEach inject ($filter) ->
    itemType = $filter 'itemType'

  it 'should return the input prefixed with "itemType filter:"', ->
    text = 'angularjs'
    expect(itemType text).toBe ('itemType filter: ' + text)
