'use strict'

angular.module 'epaPrototypeApp'
.controller 'FooterCtrl', ($scope, $location) ->
  $scope.menu = [{
    title: 'Terms and Privacy'
    link: '/terms-and-privacy/'
    }
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()

