'use strict'

###*
 # @ngdoc directive
 # @name belanddylanApp.directive:makiIcon
 # @description
 # # makiIcon
###
angular.module('belanddylanApp')
  .directive 'makiIcon', ->
    template: '<span class="icon"><img src="/images/maki/{{type}}-24.svg" /><span ng-transclude /></span>'
    restrict: 'E'
    transclude: true
    scope:
      type: '@type'
