Alias: $exp = http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation

RuleSet: CapabilityCommon
* status              = #active
* date                = "2023-08-25"
* publisher           = "AEGIS.net, Inc."
// * contact[0].telecom[0].system = #url
// * contact[0].telecom[0].value  = "https://hl7.org/Special/committees/fiwg/index.cfm"
* kind                = #requirements
* format[0]           = #xml
* format[1]           = #json

RuleSet: SupportResourceNoExp (resource)
* rest.resource[+].type = #{resource}

RuleSet: SupportResource (resource, expectation)
* rest.resource[+].type = #{resource}
* rest.resource[=].extension[0].url = $exp
* rest.resource[=].extension[0].valueCode = {expectation}

RuleSet: SupportProfileNoExp (profile)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].supportedProfile[+] = "{profile}"

RuleSet: SupportProfile (profile, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].supportedProfile[+] = "{profile}"
* rest.resource[=].supportedProfile[=].extension[0].url = $exp
* rest.resource[=].supportedProfile[=].extension[0].valueCode = {expectation}

RuleSet: SupportInteractionNoExp (interaction)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].interaction[+].code = {interaction}

RuleSet: SupportInteraction (interaction, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].interaction[+].code = {interaction}
* rest.resource[=].interaction[=].extension[0].url = $exp
* rest.resource[=].interaction[=].extension[0].valueCode = {expectation}

RuleSet: SupportSearchParamNoExp (name, canonical, type)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{canonical}"
* rest.resource[=].searchParam[=].type = {type}

RuleSet: SupportSearchParam (name, canonical, type, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].searchParam[+].name = "{name}"
* rest.resource[=].searchParam[=].definition = "{canonical}"
* rest.resource[=].searchParam[=].type = {type}
* rest.resource[=].searchParam[=].extension[0].url = $exp
* rest.resource[=].searchParam[=].extension[0].valueCode = {expectation}

RuleSet: SupportOperationNoExp (name, canonical)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].operation[+].name = "{name}"
* rest.resource[=].operation[=].definition = "{canonical}"

RuleSet: SupportOperation (name, canonical, expectation)
// This rule set must follow a SupportResource rule set, and applies to that resource.
* rest.resource[=].operation[+].name = "{name}"
* rest.resource[=].operation[=].definition = "{canonical}"
* rest.resource[=].operation[=].extension[0].url = $exp
* rest.resource[=].operation[=].extension[0].valueCode = {expectation}

RuleSet: GlobalOperationNoExp (name, canonical)
// This rule set defines a global operation.
* rest.operation[+].name = "{name}"
* rest.operation[=].definition = "{canonical}"

Instance:      CapabilityUSCoreTGServerR4
InstanceOf:    CapabilityStatement
Usage:         #definition
Title:         "R4 US Core TG Server Capability Statement"
Description:   "CapabilityStatement describing the minimal required capabilities of a FHIR Server supporting the US Core 4.0.0 Testing Guide."
* insert ResourceCommonR4
* id            = "us-core-tg-server-r4"
* name          = "CapabilityUSCoreTGServerR4"
* url           = "http://hl7.org/fhir/us/core-tg/CapabilityStatement/us-core-tg-server-r4"
* description   = "CapabilityStatement describing the required and optional capabilities of a FHIR Server supporting the US Core 4.0.0 Testing Guide."
* insert CapabilityCommon

* implementationGuide = "http://hl7.org/fhir/us/core-tg/ImplementationGuide/hl7.fhir.us.core-tg"

* rest[+].mode  = #server
* rest[=].mode.extension[http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation].valueCode = #SHALL

* insert SupportResource(AllergyIntolerance, #SHALL)
* insert SupportProfile(http://hl7.org/fhir/us/core/StructureDefinition/us-core-allergyintolerance, #SHALL)
* insert SupportInteraction(#read, #SHALL)
* insert SupportInteraction(#search-type, #SHALL)
* insert SupportInteraction(#vread, #SHOULD)
* insert SupportInteraction(#history-instance, #SHOULD)
* insert SupportInteraction(#create, #MAY)
* insert SupportInteraction(#update, #MAY)
* insert SupportInteraction(#patch, #MAY)
* insert SupportInteraction(#delete, #MAY)
* insert SupportInteraction(#history-type, #MAY)
