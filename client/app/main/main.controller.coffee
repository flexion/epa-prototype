'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, $filter, EpaService, usSpinnerService) ->

  $scope.uvData = [[ '1', '2', '3' ]]
  $scope.uvLabels = [[ 'One', 'Two', 'Three' ]]
  
  $scope.getUvData = () ->
  
    if $scope.zipcode
      EpaService.getUvByZipcode('53590').then( (response)->
    	
    	  angular.forEach(response.data, (value, key)->
    	    date = $filter('date')(new Date(value.DATE_TIME), 'hhaa')
    	    console.log("value: " + value.UV_VALUE + " date: " + date)
    	    $scope.uvData.push(value.UV_VALUE)
    	    $scope.uvLabels.push(value.DATE_TIME)
    	  )
    	  $scope.dataSynced = true
      )
    	  
    if $scope.city and $scope.state
     EpaService.getUvByAddress($scope.city, $scope.state).then( (response)->
          angular.forEach(response.data, (value, key)->
            date = $filter('date')(new Date(value.DATE_TIME), 'hhaa')
            console.log("value: " + value.UV_VALUE + " date: " + date)
            $scope.uvData.push(value.UV_VALUE)
            $scope.uvLabels.push(value.DATE_TIME)
          )
          $scope.dataSynced = true
    )