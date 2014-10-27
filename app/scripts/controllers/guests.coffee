'use strict'

###*
 # @ngdoc function
 # @name belanddylanApp.controller:GuestsCtrl
 # @description
 # # GuestsCtrl
 # Controller of the belanddylanApp
###
angular.module('belanddylanApp')
  .controller 'GuestsCtrl', ($scope, $compile, Auth, $routeParams, $http, leafletData, $window, Analytics) ->
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
            riseOnHover: yes
            icon: $window.L.MakiMarkers.icon
              'size': 'm'
              'icon': item.properties['marker-symbol']
              'color': item.properties['marker-color']

          # Bind to clicks
          marker.on 'click', ->
            $scope.selected = @
          , item # To be executed with the context of item

          pu = '<div map-item-detail/>'
          marker.bindPopup pu,
            item: item
            minWidth: 320
            closeButton: false
            className: 'incidentPopup'

          # Keep track
          item.marker = marker
          item.zIndex = marker._zIndex
          $scope.items.push item

    # When a popup opens
    $scope.$on 'leafletDirectiveMap.popupopen', (event, leafletEvent) ->
      item = leafletEvent.leafletEvent.popup.options.item

      newScope = $scope.$new()
      newScope.item = item

      $compile(leafletEvent.leafletEvent.popup._contentNode)(newScope)

    # Watch for marker changes
    $scope.$watchCollection 'items', (items) ->

      return unless items.length

      leafletData.getMap().then (map) ->

        group = L.featureGroup items.map((i) -> i.marker)
        group.addTo map
        map.fitBounds group.getBounds()

        # Pre-select the venue
        unless $scope.selected
          $scope.selected = items.filter((i) -> i.properties.type is 'venue')[0]

    # Watch for selected changes
    $scope.$watch 'selected', (newSelection, oldSelection) ->
      # Reset currently selected marker
      if oldSelection
        oldSelection.marker.setIcon $window.L.MakiMarkers.icon
            'size': 'm'
            'icon': oldSelection.properties['marker-symbol']
            'color': oldSelection.properties['marker-color']
        # Reset zIndex
        oldSelection.marker.setZIndexOffset oldSelection.zIndex

      return unless newSelection
      # Marker size large
      newSelection.marker.setIcon $window.L.MakiMarkers.icon
        'size': 'l'
        'icon': newSelection.properties['marker-symbol']
        'color': newSelection.properties['marker-color']
      # On top
      newSelection.marker.setZIndexOffset 1000
