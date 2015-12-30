'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, $filter, EpaService, usSpinnerService) ->

  $scope.uvData = [[ 1, 2, 3 ]]
  $scope.uvLabels = [ "One", "Two", "Three" ]
  $scope.uvSeries = ['Series']
  
  $scope.getUvData = () ->
  
    if $scope.zipcode
      EpaService.getUvByZipcode($scope.zipcode).then( (response)->
      
        $scope.uvData = [[]]
        $scope.uvLabels = []
    	
        angular.forEach(response.data, (value, key)->
          date = $filter('date')(new Date(value.DATE_TIME), 'MM/dd/yyyy')
          console.log("value: " + value.UV_VALUE + " date: " + date)
        )
      )
    	  
    if $scope.city and $scope.state
     EpaService.getUvByAddress($scope.city, $scope.state).then( (response)->
     
        $scope.uvData = [[]]
        $scope.uvLabels = [[]]
          
        angular.forEach(response.data, (value, key)->
          date = $filter('date')(new Date(value.DATE_TIME), 'hhaa')
          console.log("value: " + value.UV_VALUE + " date: " + date)
          $scope.uvData[0].push(value.UV_VALUE)
          $scope.uvLabels[0].push(value.DATE_TIME)
        )
        $scope.dataSynced = true
    )