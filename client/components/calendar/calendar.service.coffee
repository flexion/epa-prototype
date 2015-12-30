'use strict'

angular.module 'epaPrototypeApp'
.factory 'DatesFactory', ($rootScope) ->
	getDayOfWeek = (theday) ->
		day = moment(theday).day()

	getDayNum = (theday) ->
		num = moment(theday).date()

	days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']

	return ->
		getDates: (currentDay) ->
			today.dayNum = getDayNum(moment(currentDay))
			today.dayName = days[getDayOfWeek(moment())]
			today.uvValue = 2

			morrow = moment(currentDay).add(1, 'days')
			tomorrow.dayNum = getDayNum(morrow)
			tomorrow.dayName = days[getDayName(morrow)]
			tomorrow.uvValue = 2

			morrow2 = moment(currentDay).add(2, 'days')
			tomorrow2.dayNum = getDayNum(morrow)
			tomorrow2.dayName = days[getDayName(morrow)]
			tomorrow2.uvValue = 2

			return { today: today, tomorrow2: tomorrow2, tomorrow: tomorrow }