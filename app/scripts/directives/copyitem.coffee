'use strict'

###*
 # @ngdoc directive
 # @name belanddylanApp.directive:copyItem
 # @description
 # # copyItem
###
angular.module('belanddylanApp')
  .directive 'copyItem', ->
    templateUrl: (element, attrs) -> "/views/partials/copy_items/_#{attrs.copyItem}.html"
    link: (scope, element, attrs) ->
      element.addClass "copyItem-#{attrs.copyItem} copyItem"

