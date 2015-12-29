'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, EpaService, usSpinnerService) ->
  $scope.text = "DEFAULT"
  
  $scope.testText = (text) ->
    EpaService.getUvByZipcode('53590').then( (response)->
    	$scope.text = response
    )
