'use strict'

angular.module('epaPrototypeApp').controller 'MainCtrl', ($scope, $http, $filter, EpaService, usSpinnerService, DatesFactory) ->

  $scope.uvData = [[0]]
  $scope.uvLabels = [ "No Data" ]
  $scope.uvSeries = ['UV Index']

  $scope.getUvData = () ->

    if $scope.zipcode
      EpaService.getUvByZipcodeHourly($scope.zipcode).then( (response)->
        $scope.uvData[0] = []

        $scope.uvLabels = []

        angular.forEach(response.data, (value, key)->
          date = moment(value.DATE_TIME, 'MMM/DD/YYYY HH A')
          $scope.uvData[0].push(value.UV_VALUE)
          $scope.uvLabels.push date.format('H A')

        )
      )

    else if $scope.city and $scope.state
      EpaService.getUvByAddressHourly($scope.city, $scope.state).then( (response)->

        $scope.uvData = [[]]
        $scope.uvLabels = []

        angular.forEach(response.data, (value, key)->
          date = moment(value.DATE_TIME, 'MMM/DD/YYYY HH A')
          $scope.uvData[0].push(value.UV_VALUE)
          $scope.uvLabels.push date.format('H A')
        )
    )

    EpaService.getUvByZipcodeDaily($scope.zipcode).then( (response)->
      console.log('response.data', response.data)
      $scope.dailyUV = response.data[0].UV_INDEX
      datesData = DatesFactory.getDates(moment())
      $scope.dayNum = datesData.today.dayNum
      $scope.dayName = datesData.today.dayName
      $scope.monthName = datesData.today.monthName
    )
