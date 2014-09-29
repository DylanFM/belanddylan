'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:GuestsCtrl
 # @description
 # # GuestsCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'GuestsCtrl', ($scope, $cookieStore, $location) ->

    unless $cookieStore.get('authd') is 'yep'
      $location.path '/'
