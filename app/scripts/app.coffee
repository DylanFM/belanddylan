'use strict'

###*
 # @ngdoc overview
 # @name belanddylanApp
 # @description
 # # belanddylanApp
 #
 # Main module of the application.
###
angular
  .module('belanddylanApp', [
    'ngAnimate',
    'ngCookies',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/guests',
        templateUrl: 'views/guests.html'
        controller: 'GuestsCtrl'
      .otherwise
        redirectTo: '/'
    $locationProvider.html5Mode(true)
