# This little directive means we can submit with return
# From: http://codepen.io/y__b__y/pen/afFec
angular.module('belanddylanApp')
  .directive 'enterSubmit', ->
      restrict: 'A',
      link: (scope, elem, attrs) ->
        elem.bind 'keydown', (event) ->
          code = event.keyCode or event.which
          if code is 13
            event.preventDefault()
            scope.$apply attrs.enterSubmit
