Instance: USCoreAllergydynamicreadvalidatejson
InstanceOf: TestScript
Title: "HL7 FHIR R4 TestScript Dynamic Read Validate US Core AllergyIntolerance JSON"
Usage: #definition
* insert Profile-dynamic-read-validate-test(AllergyIntolerance, Allergydynamicreadvalidatejson, http://hl7.org/fhir/us/core-tg, 2023-08-25, #json, USCoreAllergyProfile, "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance", USCoreAllergyIntolerance)

Instance: USCoreAllergydynamicreadvalidatexml
InstanceOf: TestScript
Title: "HL7 FHIR R4 TestScript Dynamic Read Validate US Core AllergyIntolerance XML"
Usage: #definition
* insert Profile-dynamic-read-validate-test(AllergyIntolerance, Allergydynamicreadvalidatexml, http://hl7.org/fhir/us/core-tg, 2023-08-25, #xml, USCoreAllergyProfile, "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance", USCoreAllergyIntolerance)

Instance: USCoreAllergyreadvalidatejson
InstanceOf: TestScript
Title: "HL7 FHIR R4 TestScript Read Validate US Core AllergyIntolerance JSON"
Usage: #definition
* insert Profile-read-validate-test(AllergyIntolerance, example, Allergyreadvalidatejson, http://hl7.org/fhir/us/core-tg, 2023-08-25, #json, USCoreAllergyProfile, "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance", USCoreAllergyIntolerance)

Instance: USCoreAllergyreadvalidatexml
InstanceOf: TestScript
Title: "HL7 FHIR R4 TestScript Read Validate US Core AllergyIntolerance XML"
Usage: #definition
* insert Profile-read-validate-test(AllergyIntolerance, example, Allergyreadvalidatexml, http://hl7.org/fhir/us/core-tg, 2023-08-25, #xml, USCoreAllergyProfile, "http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance", USCoreAllergyIntolerance)

Instance: USCoreCapabilityStatementjson
InstanceOf: TestScript
Title: "Tests for CapabilityStatement using the FHIR CapabilityStatement Resource JSON"
Usage: #definition
* insert TSMetadata(USCoreCapabilityStatementjson, http://hl7.org/fhir/us/core-tg, 2023-08-25, "Tests for CapabilityStatement using the FHIR CapabilityStatement Resource using JSON format.")
* meta.profile[+] = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"

* extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule"
* extension[=].extension[+].url = "ruleId"
* extension[=].extension[=].valueId = "rule-verifyTLS"
* extension[=].extension[+].url = "path"
* extension[=].extension[=].valueString = "./VerifyTLS.groovy"

* insert TSOrigin(1)
* insert TSDestination(1)

* insert TSProfile(CapabilityProfile, "http://hl7.org/fhir/StructureDefinition/CapabilityStatement")

* insert TSTest(01-FHIRServerConformance, "FHIR Server Supports the Conformance Interactions")
* insert TSTestOperationGlobal(#capabilities, #json, 1, 1, "GET on Metadata")
* test[=].action[=].operation.params = "/metadata"
* test[=].action[=].operation.requestHeader[+].field = "Authorization"
* test[=].action[=].operation.requestHeader[=].value = "none"

* insert TSTestAssertWithProp("Confirm that the returned response code is 200 OK or 201 Created.", false, #response, responseCode, "200\,201")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.operator = #in

* insert TSTestAssertWithProp("Confirm that the returned response payload is a CapabilityStatement resource.", false, #response, resource, #CapabilityStatement)
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false

* insert TSTestAssertWithProp("Verify the base Url uses https", false, #response, requestURL, "https")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.operator = #contains

* insert TSTestAssert([["OAuth 2.0 authorize endpoint secured by transport layer security. Apps MUST assure that sensitive information (authentication secrets, authorization codes, tokens) is transmitted ONLY to authenticated servers, over TLS-secured channels."]], false, #response)
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-rule"
* test[=].action[=].assert.extension[=].extension[+].url = "ruleId"
* test[=].action[=].assert.extension[=].extension[=].valueId = "rule-verifyTLS"
* test[=].action[=].assert.extension[=].extension[+].url = "param"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "name"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "endpointName"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "value"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "Metadata Endpoint"
* test[=].action[=].assert.extension[=].extension[+].url = "param"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "name"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "endpointURL"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "value"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "${dest1SystemConfig.baseUrl}/metadata"

* insert TSTestAssertWithProp("Expect fhirVersion is 4.0.1", false, #response, value, "4.0.1")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.expression = "CapabilityStatement.fhirVersion"

* insert TSTestAssertWithProp("Validate for json support against the Capability profile", false, #response, value, [["json,application/json,application/fhir+json"]])
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.expression = "CapabilityStatement.format"

* insert TSTestAssertWithProp("Verify that at lease one non-patient US Core profile is supported", false, #response, expression, [["CapabilityStatement.rest.resource.where(supportedProfile.startsWith('http://hl7.org/fhir/us/core/StructureDefinition/') and supportedProfile!='http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient').count()>0"]])
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false

Instance: USCoreCapabilityStatementxml
InstanceOf: TestScript
Title: "Tests for CapabilityStatement using the FHIR CapabilityStatement Resource XML"
Usage: #definition
* insert TSMetadata(USCoreCapabilityStatementxml, http://hl7.org/fhir/us/core-tg, 2023-08-25, "Tests for CapabilityStatement using the FHIR CapabilityStatement Resource using XML format.")
* meta.profile[+] = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript"

* extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-rule"
* extension[=].extension[+].url = "ruleId"
* extension[=].extension[=].valueId = "rule-verifyTLS"
* extension[=].extension[+].url = "path"
* extension[=].extension[=].valueString = "./VerifyTLS.groovy"

* insert TSOrigin(1)
* insert TSDestination(1)

* insert TSProfile(CapabilityProfile, "http://hl7.org/fhir/StructureDefinition/CapabilityStatement")

* insert TSTest(01-FHIRServerConformance, "FHIR Server Supports the Conformance Interactions")
* insert TSTestOperationGlobal(#capabilities, #xml, 1, 1, "GET on Metadata")
* test[=].action[=].operation.params = "/metadata"
* test[=].action[=].operation.requestHeader[+].field = "Authorization"
* test[=].action[=].operation.requestHeader[=].value = "none"

* insert TSTestAssertWithProp("Confirm that the returned response code is 200 OK or 201 Created.", false, #response, responseCode, "200\,201")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.operator = #in

* insert TSTestAssertWithProp("Confirm that the returned response payload is a CapabilityStatement resource.", false, #response, resource, #CapabilityStatement)
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false

* insert TSTestAssertWithProp("Verify the base Url uses https", false, #response, requestURL, "https")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.operator = #contains

* insert TSTestAssert([["OAuth 2.0 authorize endpoint secured by transport layer security. Apps MUST assure that sensitive information (authentication secrets, authorization codes, tokens) is transmitted ONLY to authenticated servers, over TLS-secured channels."]], false, #response)
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-rule"
* test[=].action[=].assert.extension[=].extension[+].url = "ruleId"
* test[=].action[=].assert.extension[=].extension[=].valueId = "rule-verifyTLS"
* test[=].action[=].assert.extension[=].extension[+].url = "param"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "name"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "endpointName"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "value"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "Metadata Endpoint"
* test[=].action[=].assert.extension[=].extension[+].url = "param"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "name"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "endpointURL"
* test[=].action[=].assert.extension[=].extension[=].extension[+].url = "value"
* test[=].action[=].assert.extension[=].extension[=].extension[=].valueString = "${dest1SystemConfig.baseUrl}/metadata"

* insert TSTestAssertWithProp("Expect fhirVersion is 4.0.1", false, #response, value, "4.0.1")
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.expression = "CapabilityStatement.fhirVersion"

* insert TSTestAssertWithProp("Validate for json support against the Capability profile", false, #response, value, [["json,application/json,application/fhir+json"]])
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
* test[=].action[=].assert.expression = "CapabilityStatement.format"

* insert TSTestAssertWithProp("Verify that at lease one non-patient US Core profile is supported", false, #response, expression, [["CapabilityStatement.rest.resource.where(supportedProfile.startsWith('http://hl7.org/fhir/us/core/StructureDefinition/') and supportedProfile!='http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient').count()>0"]])
* test[=].action[=].assert.extension[+].url = "http://touchstone.aegis.net/touchstone/fhir/testing/StructureDefinition/testscript-assert-stopTestOnFail"
* test[=].action[=].assert.extension[=].valueBoolean = false
