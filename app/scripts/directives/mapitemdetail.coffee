'use strict'

###*
 # @ngdoc directive
 # @name belanddylanApp.directive:mapItemDetail
 # @description
 # # mapItemDetail
###
angular.module('belanddylanApp')
  .directive 'mapItemDetail', ->
    templateUrl: '/views/mapitemdetail.html'
    link: (scope, element, attrs) ->
      element.addClass 'mapItemDetail'
