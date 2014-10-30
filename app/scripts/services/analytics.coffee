'use strict'

###*
 # @ngdoc service
 # @name belanddylanApp.analytics
 # @description
 # # analytics
 # Service in the belanddylanApp.
###
angular.module('belanddylanApp')
  .service 'Analytics', ($rootScope, $window, $location) ->
    $rootScope.$on '$viewContentLoaded', ->
      $window.analytics.page $location.path(), url: $location.path()
