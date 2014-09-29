'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:RsvpCtrl
 # @description
 # # RsvpCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'RsvpCtrl', ($scope, Auth) ->
    Auth.ensure()
