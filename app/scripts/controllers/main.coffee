'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'MainCtrl', ($scope, $location) ->

    $scope.checkAuth = ->
      if $scope.password is 'test'
        $location.path '/guests'
