/*
 rule.summary=Verify that the ${param.endpointName} is secured by transport layer security
 rule.description=This rule verifies that the ${param.endpointName} is secured by transport layer security
 rule.param.endpointName.required=true
 rule.param.endpointURL.required=true
*/

assert !param.endpointName.is(null): "The parameter 'endpointName' was not supplied"
assert !param.endpointURL.is(null): "The parameter 'endpointURL' was not supplied"


// Call built-in function that verifies
verifyTLS(param.endpointName, param.endpointURL)