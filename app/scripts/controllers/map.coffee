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

    $scope.markers = []

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

          # Keep track
          $scope.markers.push marker

    # Watch for marker changes
    $scope.$watchCollection 'markers', (markers) ->

      return unless markers.length

      leafletData.getMap().then (map) ->

        group = L.featureGroup markers
        map.fitBounds group.getBounds(), padding: [100, 100]
        group.addTo map
