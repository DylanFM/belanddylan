'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'MainCtrl', ($scope, Auth, Analytics) ->

    $scope.error = false

    $scope.clearError = ->
      $scope.error = false

    $scope.checkAuth = ->
      unless Auth.check $scope.password
        $scope.error = true
