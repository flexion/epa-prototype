'use strict'

angular.module 'epaPrototypeApp'
.controller 'CalendarCtrl', ($scope, DatesFactory) ->
	$scope.calData = DatesFactory.getDates()