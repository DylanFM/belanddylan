'use strict'

###*
 # @ngdoc service
 # @name belanddylanApp.auth
 # @description
 # # auth
 # Service in the belanddylanApp.
###
angular.module('belanddylanApp')
  .service 'Auth', ($cookieStore, $location, $window, uuid4) ->
    class Auth
      @ensure: ->
        unless $cookieStore.get('authd') is 'yep'
          $location.path '/'

      @check: (password) ->
        if password is 'test'
          # Track auth'd with cookie
          $cookieStore.put 'authd', 'yep'
          # Also make a uuid and store it in a cookie
          unless $cookieStore.get('id')
            id = uuid4.generate()
            $cookieStore.put 'id', id
            # Alias and identify
            $window.analytics.alias id
            $window.analytics.identify id
          # Trigger event
          $window.analytics.track 'Authenticated'
          # Redirect to guests
          $location.path '/guests'
        else
          $window.analytics.track 'Authentication fail',
            password: password
