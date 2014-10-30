'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:RsvpCtrl
 # @description
 # # RsvpCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'RsvpCtrl', ($scope, $window, $cookieStore, Auth, Analytics) ->
    Auth.ensure()

    $scope.setStep = (step) ->
      $scope.step = step

      # Track event as step changes
      $window.analytics.track "RSVP #{step}"

      # When we have info we will want to identify
      $scope.details = {}
      # If it isn't the 1st step, we'll have their name
      if step isnt 'start'
        $scope.details.name = $scope.name
      # If they've said yes or it's at the last step
      if step is 'yay' or step is 'done'
        $scope.details.attending = 'yes'
      # If they've said no
      if step is 'nay'
        $scope.details.attending = 'no'
      # If it's at the last step
      if step is 'done'
        # We have email, phone and extra details
        $scope.details.email = $scope.email
        $scope.details.phone = $scope.phone
        $scope.details.extra = $scope.extra
      # And do it...
      # NOTE we're just resetting the traits over and over
      #      This is a symptom of my lack of understanding
      #      And of the weird missing identifies in testing
      $window.analytics.identify $cookieStore.get('id'), $scope.details

    # Focus on the 1st input / button in the current step
    $scope.$watch 'step', (step, oldStep) ->
      el = $ "#step-#{step}"
      ctrl = el.find('input, button').first()
      ctrl.focus() if ctrl.length

    $scope.setStep 'start'
