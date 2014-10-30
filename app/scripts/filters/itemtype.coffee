'use strict'

###*
 # @ngdoc filter
 # @name belanddylanApp.filter:itemType
 # @function
 # @description
 # # itemType
 # Filter in the belanddylanApp.
###
angular.module('belanddylanApp')
  .filter 'itemType', ->
    (input) ->
      {
        'accom': 'Accommodation'
        'trans': 'Transport'
        'venue': 'Venue'
      }[input]
