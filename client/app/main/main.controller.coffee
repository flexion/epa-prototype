'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, $filter, EpaService, usSpinnerService) ->

  $scope.uvData = [[ '1', '2', '3' ]]
  $scope.uvLabels = [[ 'One', 'Two', 'Three' ]]
  
  $scope.getUvData = () ->
    console.log('city: ' + $scope.city + ' state: ' + $scope.state + 'zipcode: ' + $scope.zipcode)
  
    EpaService.getUvByZipcode('53590').then( (response)->
    	
    	angular.forEach(response.data, (value, key)->
    	  date = $filter('date')(new Date(value.DATE_TIME), 'hh')
    	  console.log("value: " + value.UV_VALUE + " date: " + date)
    	  $scope.uvData1.push(value.UV_VALUE)
    	  $scope.uvLabels1.push(value.DATE_TIME)
    	)
    )
    