'use strict';

var util = require('util');

module.exports = {
  createInsurance: createInsurance,
  getInsurances: getInsurances,
};

var insurances = [];

function createInsurance(req, res) {

  var insurance = {
      insuranceType: req.swagger.params.insurance.value.insuranceType,
      provider: req.swagger.params.insurance.value.provider
  };

  insurances.push(insurance);

  res.json(insurance);
}

function getInsurances(req, res) {
  res.json(insurances);
}
