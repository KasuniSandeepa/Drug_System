/**
 * 
 */

function storeImcCodeSummary(imc_code) {
	localStorage.setItem('IMC_CODE_SUMMARY', imc_code)
}

function storeImporterSummary(importer) {
	localStorage.setItem('IMPORTER_SUMMARY', importer)
}

function storeIMCDataSummary() {

	var importer = document.getElementById("importer").value;
	var manufacturer = document.getElementById("manufacturer").value;
	var Country = document.getElementById("Country").value;
	var IMCcode = document.getElementById("IMCcode").value;
	var Phone = document.getElementById("Phone").value;
	var Fax = document.getElementById("Fax").value;
	var email = document.getElementById("email").value;
	var Address = document.getElementById("Address").value;

	localStorage.setItem('importer_SUMMARY', importer);
	localStorage.setItem('manufacturer_SUMMARY', manufacturer)
	localStorage.setItem('Country_SUMMARY', Country);
	localStorage.setItem('IMCcode_SUMMARY', IMCcode)
	localStorage.setItem('Phone_SUMMARY', Phone)
	localStorage.setItem('Fax_SUMMARY', Fax)
	localStorage.setItem('email_SUMMARY', email)
	localStorage.setItem('Address_SUMMARY', Address)
}

function setInSummaryIMC(){
	document.getElementById("importer_summary").innerHTML = localStorage.getItem("importer_SUMMARY");
	document.getElementById("manufacturer_summary").innerHTML = localStorage.getItem("manufacturer_SUMMARY");
	document.getElementById("country_summary").innerHTML = localStorage.getItem("Country_SUMMARY");
}

function storeISDDataSummary() {
 
	 var Generic = document.getElementById("Generic").value;
     var Generic2 = document.getElementById("Generic2").value;
     var Generic3 = document.getElementById("Generic3").value;
     var Brand = document.getElementById("Brand").value;
     var Dosage = document.getElementById("Dosage").value;
     var Strength = document.getElementById("Strength").value;
     var Importer = document.getElementById("isd_Importer").value;
     var Manufacturer = document.getElementById("isd_Importer").value;
     var RegExpDate = document.getElementById("RegExpDate").value;
     var Country = document.getElementById("isd_Country").value;
     var Notes = document.getElementById("isd_Notes").value;
 
	localStorage.setItem('Generic_SUMMARY', Generic);
	localStorage.setItem('Generic2_SUMMARY', Generic2)
	localStorage.setItem('Generic3_SUMMARY', Generic3)
	localStorage.setItem('Brand_SUMMARY', Brand)
	localStorage.setItem('Dosage_SUMMARY', Dosage)
	localStorage.setItem('isd_Importer_SUMMARY', isd_Importer)
	localStorage.setItem('isd_Importer_SUMMARY', isd_Importer)
	localStorage.setItem('RegExpDate_SUMMARY', RegExpDate)
	localStorage.setItem('isd_Country_SUMMARY', isd_Country)
	localStorage.setItem('isd_Notes_SUMMARY', isd_Notes)
}

function setInSummaryISD(){
	
	
	document.getElementById("generic_summary").innerHTML = localStorage.getItem("Generic_SUMMARY");
	document.getElementById("brand_summary").innerHTML = localStorage.getItem("Brand_SUMMARY");
	document.getElementById("dosage_summary").innerHTML = localStorage.getItem("Dosage_SUMMARY");
	document.getElementById("expiredate_summary").innerHTML = localStorage.getItem("RegExpDate_SUMMARY");
	
}

function storeATCDataSummary() {
 
		
	 var PharmoClass = document.getElementById("PharmoClass").value;
     var TherapeuticClass = document.getElementById("TherapeuticClass").value;
 	 var ClinicalClass = document.getElementById("ClinicalClass").value;
     var AnatomicalClass = document.getElementById("AnatomicalClass").value;
     var ATCCode = document.getElementById("ATCCode").value;
     var CautionaryLabel = document.getElementById("CautionaryLabel").value;
     var AdverseEffects = document.getElementById("AdverseEffects").value;
     var ATC_Notes = document.getElementById("ATC_Notes").value;
 
	
 
	localStorage.setItem('PharmoClass_SUMMARY', PharmoClass);
	localStorage.setItem('TherapeuticClass_SUMMARY', TherapeuticClass)
	localStorage.setItem('ClinicalClass_SUMMARY', ClinicalClass)
	localStorage.setItem('AnatomicalClass_SUMMARY', AnatomicalClass)
	localStorage.setItem('ATCCode_SUMMARY', ATCCode)
	localStorage.setItem('CautionaryLabel_SUMMARY', CautionaryLabel)
	localStorage.setItem('AdverseEffects_SUMMARY', AdverseEffects)
	localStorage.setItem('ATC_Notes_SUMMARY', ATC_Notes)
	
}

function setInSummaryATC(){
	

	document.getElementById("Pharmo_summary").innerHTML = localStorage.getItem("PharmoClass_SUMMARY");
	document.getElementById("Therapeutic_summary").innerHTML = localStorage.getItem("TherapeuticClass_SUMMARY");
	document.getElementById("Clinical_summary").innerHTML = localStorage.getItem("ClinicalClass_SUMMARY");
	document.getElementById("Anatomical_summary").innerHTML = localStorage.getItem("AnatomicalClass_SUMMARY");
	document.getElementById("AtcCode_summary").innerHTML = localStorage.getItem("ATCCode_SUMMARY");
	
}