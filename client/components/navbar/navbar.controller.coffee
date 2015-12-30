'use strict'

angular.module 'epaPrototypeApp'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.menu = [{
    title: 'Home'
    link: '/'},
    {
      title: 'About'
      link: '/about/'
    },
    {
      title: 'Link'
      link: '/link/'
    }
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()
