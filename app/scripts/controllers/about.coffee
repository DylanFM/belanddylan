'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
