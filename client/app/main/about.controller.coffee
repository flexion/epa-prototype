'use strict'

angular.module('epaPrototypeApp').controller 'AboutCtrl', ($scope, $http, usSpinnerService) ->
  $scope.text = "DEFAULT"
  
  $scope.testText = ->
  	(text) ->
  		$scope.text = text;
