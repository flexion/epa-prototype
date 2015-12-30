'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, $filter, EpaService, usSpinnerService, DatesFactory) ->

  $scope.uvData = [[1, 2, 3]]
  $scope.uvLabels = [ "One", "Two", "Three" ]
  $scope.uvSeries = ['Series']

  $scope.getUvData = () ->
    if $scope.zipcode
      EpaService.getUvByZipcodeHourly($scope.zipcode).then( (response)->

        $scope.uvData = [[]]
        $scope.uvLabels = []

        angular.forEach(response.data, (value, key)->
          date = $filter('date')(new Date(value.DATE_TIME), 'MM/dd/yyyy')
          $scope.uvData[0].push(value.UV_VALUE)
          $scope.uvLabels.push(value.DATE_TIME)
          console.log("value: " + value.UV_VALUE + " date: " + date)
        )
      )

    else if $scope.city and $scope.state
      EpaService.getUvByAddressHourly($scope.city, $scope.state).then( (response)->

        $scope.uvData = [[]]
        $scope.uvLabels = []

        angular.forEach(response.data, (value, key)->
          date = $filter('date')(new Date(value.DATE_TIME), 'hhaa')
          console.log("value: " + value.UV_VALUE + " date: " + date)
          $scope.uvData[0].push(value.UV_VALUE)
          $scope.uvLabels.push(value.DATE_TIME)
        )
        $scope.dataSynced = true
    )

    EpaService.getUvByZipcodeDaily($scope.zipcode).then( (response)->
      console.log('response.data', response.data)
      $scope.dailyUV = response.data[0].UV_INDEX
      datesData = DatesFactory.getDates(moment())
      $scope.dayNum = datesData.today.dayNum
      $scope.dayName = datesData.today.dayName
      $scope.monthName = datesData.today.monthName
    )
