'use strict'

###*
 # @ngdoc service
 # @name belanddylanApp.auth
 # @description
 # # auth
 # Service in the belanddylanApp.
###
angular.module('belanddylanApp')
  .service 'Auth', ($cookieStore, $location) ->
    class Auth
      @ensure: ->
        unless $cookieStore.get('authd') is 'yep'
          $location.path '/'

      @check: (password) ->
        if password is 'test'
          $cookieStore.put 'authd', 'yep'
          $location.path '/guests'
