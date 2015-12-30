'use strict'

(->
  EpaService = ($http)->

    return {

      getUvByZipcodeHourly: (zipcode)->
        $http.get('/api/uv-index/?type=hourly&zipcode=' + zipcode)
        
          .success (responseData) ->
            return responseData

          .error (data, status, header, config) ->
            if data.error
              return data.error.message
            else
              return "Sorry! We didn't find any data with that query. Please revise your search and try again."
        

      getUvByAddressHourly: (city, state)->
        $http.get('/api/uv-index/?type=hourly&city=' + city + '&state=' + state)
        
          .success (responseData) ->
            return responseData

          .error (data, status, header, config) ->
            if data.error
              return data.error.message
            else
              return "Sorry! We didn't find any data with that query. Please revise your search and try again."
    
      getUvByZipcodeDaily: (zipcode)->
        $http.get('/api/uv-index/?type=daily&zipcode=' + zipcode)
        
          .success (responseData) ->
            return responseData

          .error (data, status, header, config) ->
            if data.error
              return data.error.message
            else
              return "Sorry! We didn't find any data with that query. Please revise your search and try again."
        

      getUvByAddressDaily: (city, state)->
        $http.get('/api/uv-index/?type=daily&city=' + city + '&state=' + state)
        
          .success (responseData) ->
            return responseData

          .error (data, status, header, config) ->
            if data.error
              return data.error.message
            else
              return "Sorry! We didn't find any data with that query. Please revise your search and try again."
    }
    
  angular.module('epaPrototypeApp').factory('EpaService', EpaService)
)()