'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:MapCtrl
 # @description
 # # MapCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'MapCtrl', ($scope, Auth, $http, leafletData, $window) ->
    Auth.ensure()

    angular.extend $scope,
      defaults:
        tileLayer: 'https://{s}.tiles.mapbox.com/v3/fires.jlh1kf2i/{z}/{x}/{y}.png'
        attributionControl: false

    $scope.items = []

    # Fetch GeoJSON
    $http.get('/scripts/data/combined.geojson')
      .success (data) ->
        angular.extend $scope, geojson: data
      .error ->
        console.log 'error fetching json', arguments

    # When geojson changes
    $scope.$watch 'geojson', (geojson) ->

      return unless geojson?.features

      # Work with layers manually rather than through directive
      leafletData.getMap().then (map) ->

        for item in geojson.features
          point = item.geometry.coordinates
          latLng = $window.L.latLng point[1], point[0]
          # Add a marker, and we'll attach a popup
          marker = $window.L.marker latLng,
            title: item.properties.name
            alt: item.properties.name
            icon: $window.L.MakiMarkers.icon
              'size': item.properties['marker-size']
              'icon': item.properties['marker-symbol']
              'color': item.properties['marker-color']

          # Bind to clicks
          marker.on 'click', ->
            # Reset currently selected marker
            if $scope.selected
              $scope.selected.marker.setIcon $window.L.MakiMarkers.icon
                  'size': $scope.selected.properties['marker-symbol']
                  'icon': $scope.selected.properties['marker-symbol']
                  'color': $scope.selected.properties['marker-color']
            # Marker size large
            marker.setIcon $window.L.MakiMarkers.icon
              'size': 'large'
              'icon': @properties['marker-symbol']
              'color': @properties['marker-color']
            # Set as selected
            $scope.selected = @
          , item # To be executed with the context of item

          # Keep track
          item.marker = marker
          $scope.items.push item

    # Watch for marker changes
    $scope.$watchCollection 'items', (items) ->

      return unless items.length

      leafletData.getMap().then (map) ->

        group = L.featureGroup items.map((i) -> i.marker)
        map.fitBounds group.getBounds(), padding: [100, 100]
        group.addTo map
