'use strict'

angular.module 'epaPrototypeApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'app/main/main.html'
    controller: 'MainCtrl'
  .state 'about',
    url: '/about/'
    templateUrl: 'app/main/about.html'
  .state 'terms',
    url: '/terms-and-privacy/'
    templateUrl: 'app/main/terms-and-privacy.html'
