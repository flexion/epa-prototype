'use strict'

angular.module 'epaPrototypeApp'
.factory 'DatesFactory', ['$rootScope', ($rootScope) ->
	getDayOfWeek = (theday) ->
		# gets 0 based day of week
		day = moment(theday).day()

	getDayNum = (theday) ->
		num = moment(theday).date()

	getMonthName = (theday) ->
		name = moment(theday).format('MMM')

	days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']

	return getDates: (currentDay) ->
			today = {}
			tomorrow = {}
			tomorrow2 = {}

			today.dayNum = getDayNum(moment(currentDay))
			today.dayName = days[getDayOfWeek(moment(currentDay))]
			today.monthName = getMonthName(currentDay)
			today.uvValue = 2

			morrow = moment(currentDay).add(1, 'days')
			tomorrow.dayNum = getDayNum(morrow)
			tomorrow.dayName = days[getDayOfWeek(morrow)]
			tomorrow.monthName = getMonthName(morrow)
			tomorrow.uvValue = 2

			morrow2 = moment(currentDay).add(2, 'days')
			tomorrow2.dayNum = getDayNum(morrow2)
			tomorrow2.dayName = days[getDayOfWeek(morrow2)]
			tomorrow2.monthName = getMonthName(morrow2)
			tomorrow2.uvValue = 2

			return { today: today, tomorrow2: tomorrow2, tomorrow: tomorrow }
]
