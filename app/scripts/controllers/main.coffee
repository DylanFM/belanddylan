'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
