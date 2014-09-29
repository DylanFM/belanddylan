'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'MainCtrl', ($scope, $cookieStore, $location) ->

    $scope.checkAuth = ->
      if $scope.password is 'test'
        $cookieStore.put 'authd', 'yep'
        $location.path '/guests'
