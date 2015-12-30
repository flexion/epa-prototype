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
      title: 'Contact'
      link: '/Contact/'
    }
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()
