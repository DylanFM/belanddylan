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
        # Hash the password
        sha    = new jsSHA password, 'TEXT'
        hashed = sha.getHash 'SHA-512', 'HEX'
        # Does the hash match our pre-hashed password?
        if hashed is '59f9f6f106be0814dbbfd2996dd95331d769c1b1dbe7fad7c0cd4d6506e113b43c8a2339eebfac5aa77d623ea3441e78e7d7bdf3f6ee300bee7103e87df71a49'
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
          $window.analytics.track 'Authentication fail', password: password
          false
