'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:RsvpCtrl
 # @description
 # # RsvpCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'RsvpCtrl', ($scope, $window, $cookieStore, Auth) ->
    Auth.ensure()

    $scope.setStep = (step) ->
      $scope.step = step

      # Track event as step changes
      $window.analytics.track "RSVP #{step}"

      # When we have info we will want to identify
      details = {}
      # If it isn't the 1st step, we'll have their name
      if step isnt 'start'
        details.name = $scope.name
      # If they've said yes or it's at the last step
      if step is 'yay' or step is 'done'
        details.attending = 'yes'
      # If they've said no
      if step is 'nay'
        details.attending = 'no'
      # If it's at the last step
      if step is 'done'
        # We have email, phone and extra details
        details.email = $scope.email
        details.phone = $scope.phone
        details.extra = $scope.extra
      # And do it...
      # NOTE we're just resetting the traits over and over
      #      This is a symptom of my lack of understanding
      #      And of the weird missing identifies in testing
      $window.analytics.identify $cookieStore.get('id'), details

    # Focus on the 1st input / button in the current step
    $scope.$watch 'step', (step, oldStep) ->
      el = $ "#step-#{step}"
      ctrl = el.find('input, button').first()
      ctrl.focus() if ctrl.length

    $scope.setStep 'start'
