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

    $scope.checkAuth = -> Auth.check($scope.password)
