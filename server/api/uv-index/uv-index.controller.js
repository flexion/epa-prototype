'use strict';

var _ = require('lodash');
var openEPA = require('../../components/services/openEPA');

exports.index = function(req, res) {
  
  var openEPAPath = null;
  if(req.query.zipcode) {
    openEPAPath = openEPA.getZipcodePath(req.query.zipcode);
  } else {
    openEPAPath = openEPA.getAddressPath(req.query.city, req.query.state);
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
