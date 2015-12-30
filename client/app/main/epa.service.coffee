'use strict'

(->
  EpaService = ($http)->

    return {

      getUvByZipcode: (zipcode)->
        $http.get('/api/uv-index/?zipcode=' + zipcode)
        
          .success (responseData) ->
            return responseData

          .error (data, status, header, config) ->
            if data.error
              return data.error.message
            else
              return "Sorry! We didn't find any data with that query. Please revise your search and try again."
        

      getUvByAddress: (city, state)->
        $http.get('/api/uv-index/?city=' + city + '&state=' + state)
        
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