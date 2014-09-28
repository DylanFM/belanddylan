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
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
      .otherwise
        redirectTo: '/'

