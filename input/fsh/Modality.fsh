Alias: DEViCETYPE =  http://hl7.org/fhir/device-nametype
Alias: DCMIdType = http://hl7.org/fhir/fhir-radiation-dose-summary-ig/CodeSystem/dicom-identifier-type
Alias: HL7IdType = http://terminology.hl7.org/CodeSystem/v2-0203

Profile:        ModalityDevice
Parent:         Device
Id:             modality-device
Title:          "Modality Device"
Description:    "Modality profiling as a Device resource"
* insert RDSStructureDefinitionContent

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier ^slicing.description = "Identifiers for the radiation dose"

* identifier contains deviceSerialNumber 0..1 and aeTitle 1..1 and deviceUID 0..1 and deviceID 0..1
* identifier[deviceSerialNumber].type = HL7IdType#SNO "Serial Number"
* identifier[deviceSerialNumber].value 1..1
* identifier[deviceSerialNumber] ^short = "Describe the Device Serial Number, related to tag(0018,1000) Device Serial Number" 
* identifier[aeTitle].type = DCMIdType#application-entity "Application Entity"
* identifier[aeTitle].value 1..1
* identifier[aeTitle] ^short = "Describe the AETitle of the modality irradiating the patient"
* identifier[deviceUID].type = DCMIdType#device-uid "Device UID"
* identifier[deviceUID].system = "urn:dicom:uid"
* identifier[deviceUID].value 1..1
* identifier[deviceUID] ^short = "Describe the Device UID, related to tag(0018,1002) Device UID"
* identifier[deviceID].type = DCMIdType#device-id "Device ID"
* identifier[deviceID].value 1..1
* identifier[deviceID] ^short = "Describe the Device ID, related to tag((0018,1003) Device ID"
* manufacturer ^short = "The manufacturer of the modality, related to tag(0008,0070) manufacturer"
* serialNumber ^short = "The serial number of the modality, which is the Device Serial Number"
* type 1..1
* type from http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_33.html (required)
* type ^short = "Describe the main modality type (CT, MG, etc.)"
* version ^short = "Describe the Software Versions of the device, related to tag(0018,1020) Software Versions"

* deviceName ^slicing.discriminator.type = #value 
* deviceName ^slicing.discriminator.path = "type"
* deviceName ^slicing.rules = #open
* deviceName ^slicing.description = "name of the device"

* deviceName contains manufacturer 0..1 and manufacturerModelName 0..1
* deviceName[manufacturer].type = DEViCETYPE#manufacturer-name "Manufacturer name"
* deviceName[manufacturer] ^short = "The manufacturer of the modality"
* deviceName[manufacturerModelName].type = DEViCETYPE#model-name "Model name"
* deviceName[manufacturerModelName] ^short = "The model name of the modality"


Mapping: equipement-module-for-ModalityDevice
Id: dicom-sr
Title: "DICOM Equipement Module"
Source: ModalityDevice
Target: "http://dicom.nema.org/medical/Dicom/2016b/output/chtml/part03/sect_C.7.5.html"
* -> "General Equipment Module"
* identifier[deviceSerialNumber] -> "tag(0018,1000) Device Serial Number"
* identifier[deviceUID] -> "tag(0018,1002) Device UID"
* manufacturer -> "tag(0008,0070) manufacturer"
* serialNumber -> "tag(0018,1000) Device Serial Number"
* deviceName[manufacturer] -> "tag(0008,0070) manufacturer"
* deviceName[manufacturerModelName] -> "tag(0008,1090) Manufacturer's Model Name"
