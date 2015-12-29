'use strict';

var _ = require('lodash');
var openEPA = require('../../components/services/openEPA');

exports.index = function(req, res) {
  var openEPAPath = openEPA.getPath(req.query.zipcode);

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
