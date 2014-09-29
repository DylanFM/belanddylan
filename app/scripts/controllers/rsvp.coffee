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

    $scope.setStep = (step) ->
      $scope.step = step

    # Focus on the 1st input / button in the current step
    $scope.$watch 'step', (step, oldStep) ->
      el = $ "#step-#{step}"
      ctrl = el.find('input, button').first()
      ctrl.focus() if ctrl.length

    $scope.setStep 'start'
