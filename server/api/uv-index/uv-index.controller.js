'use strict';

var _ = require('lodash');
var openEPA = require('../../components/services/openEPA');

exports.index = function(req, res) {
  
  var openEPAPath = null;
  if(req.query.type === 'hourly' && req.query.zipcode) {
    openEPAPath = openEPA.getHourlyZipcodePath(req.query.zipcode);
  } else if(req.query.type === 'hourly' && req.query.city && req.query.state) {
    openEPAPath = openEPA.getHourlyAddressPath(req.query.city, req.query.state);
  } else if(req.query.type === 'daily' && req.query.zipcode) {
    openEPAPath = openEPA.getDailyZipcodePath(req.query.zipcode);
  } else if(req.query.type === 'daily' && req.query.city && req.query.state) {
    openEPAPath = openEPA.getDailyAddressPath(req.query.city, req.query.state);
  }


  var options = {
    host: 'iaspub.epa.gov',
    port: 443,
    path: openEPAPath,
    method: 'GET',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  openEPA.getJSON(options,
    function(statusCode, result)
    {
      res.statusCode = statusCode;
      res.json(result);
    });
};
