'use strict'

angular.module 'epaPrototypeApp', [
  'siyfion.sfTypeahead',
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ui.router',
  'ui.bootstrap',
  'nvd3ChartDirectives',
  'angularSpinner',
  'ngAria',
  'chart.js'
]
.config ($stateProvider, $urlRouterProvider, $locationProvider) ->
  $urlRouterProvider
  .otherwise '/'

  $locationProvider.html5Mode true
