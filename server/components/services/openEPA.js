'use strict';

var http = require("http");
var https = require("https");

/**
 * getJSON:  REST get request returning JSON object(s)
 * @param options: http options object
 * @param callback: callback to pass the results JSON object(s) back
 */
exports.getJSON = function(options, onResult)
{
  var prot = options.port === 443 ? https : http;
  var req = prot.request(options, function(res)
  {
    var output = '';
    res.setEncoding('utf8');

    res.on('data', function (chunk) {
      output += chunk;
    });

    res.on('end', function() {
      var obj = {};
      try {
        obj = JSON.parse(output);
      } catch (e) {
        console.error('error parsing JSON: ' + e);
        console.error('bad JSON: ' + output);
      }

      onResult(res.statusCode, obj);
    });
  });

  req.on('error', function(err) {
    console.error('error: ' + err.message);
  });

  req.end();
};

exports.getHourlyZipcodePath = function(zipcode)
{
  return '/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/' + zipcode + '/JSON';
};

exports.getHourlyAddressPath = function(city, state)
{
  return '/enviro/efservice/getEnvirofactsUVHOURLY/CITY/' + city + '/STATE/' + state + '/JSON';
};

exports.getDailyZipcodePath = function(zipcode)
{
  return '/enviro/efservice/getEnvirofactsUVDAILY/ZIP/' + zipcode + '/JSON';
};

exports.getDailyAddressPath = function(city, state)
{
  return '/enviro/efservice/getEnvirofactsUVDAILY/CITY/' + city + '/STATE/' + state + '/JSON';
};
