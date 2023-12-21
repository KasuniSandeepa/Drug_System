/**
 * 
 */

function storeIMCCODE(imc_code){
        localStorage.setItem('IMC_CODE', imc_code)

}

function storeIMPORTER(importer){
        localStorage.setItem('IMPORTER', importer)

}

function storeMANUFACTURER(manufacturer){
        localStorage.setItem('MANUFACTURER', manufacturer)

}

function storeCOUNTRY(country){
        localStorage.setItem('COUNTRY', country)

}

function storeISDGeneric(generic){
        localStorage.setItem('GENERIC', generic)
}


function getLocalISDGeneric(){
       return  localStorage.getItem('GENERIC');
}



function getLocalIMCCODE(){
       return  localStorage.getItem('IMC_CODE');
}

function setLocalImcCode(){
	
/*	const imc = getLocalIMCCODE();
	
	var x = document.getElementById("isd_IMC");
for (var i = 0; i < x.length; i++)
{
		
	if(x.options[i].text == imc){
	
		x.options[i].selected = true;
		getImporterDetailsOnload(imc);
		break;
	}
}*/
	document.getElementById("isd_IMC").value =  localStorage.getItem('IMC_CODE');
	 document.getElementById("isd_Importer").value =  localStorage.getItem('IMPORTER');
	 document.getElementById("isd_Manufacturer").value =  localStorage.getItem('MANUFACTURER');
	  document.getElementById("isd_Country").value =  localStorage.getItem('COUNTRY');
}


  	function getImporterDetailsOnload(value){
  		
  	
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=test',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	
        	  document.getElementById("isd_Importer").value = data;
          	
          },
          error: function (e) {

          }
      });
  	  
	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=test1',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        
        	 document.getElementById("isd_Manufacturer").value = data;
          	
          },
          error: function (e) {

          }
      });
	  
	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=test2',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	 
        	  document.getElementById("isd_Country").value = data;
          	
          },
          error: function (e) {

          }
      });
  	}

function setLocalGeneric(){
	
	const chemical = getLocalISDGeneric();
	
	var x = document.getElementById("Chemical");
for (var i = 0; i < x.length; i++)
{
	if(x.options[i].text == chemical){
		x.options[i].selected = true;
		break;
	}
}
	const selectedChemical =x.options[x.selectedIndex].value;
	
	
	setATCFormData(selectedChemical);

}

function removeLocalIMC(){
	        localStorage.setItem('IMC_CODE', "");
}

function setATCFormData(data){
 $.ajax({
          url: 'controller/DrugContrller.jsp?action=setISDFormData',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#atcForm').serialize(), // added data type
          success: function (data) {
			
        	
        	  setPharmoClassATC(data[0]);
        	  setTheraputicClassATC(data[1]);
        	  setClinicalClassATC(data[2]);
        	  setAnatomicalClassATC(data[3]);
        	
          	
          },
          error: function (e) {

          }
      });
}

function setPharmoClassATC(pharmoClass){

	var x = document.getElementById("PharmoClass");
   for (var i = 0; i < x.length; i++)
 {
	if(x.options[i].text == pharmoClass){
		x.options[i].selected = true;
		break;
	}
}
}

function setTheraputicClassATC(theraputicClass){
	
	var x = document.getElementById("TherapeuticClass");
   for (var i = 0; i < x.length; i++)
 {
	if(x.options[i].text == theraputicClass){
		x.options[i].selected = true;
		break;
	}
}
}
  	
function setClinicalClassATC(clinicalClass){
	
	var x = document.getElementById("ClinicalClass");
   for (var i = 0; i < x.length; i++)
 {
	if(x.options[i].text == clinicalClass){
		x.options[i].selected = true;
		break;
	}
}
}

function setAnatomicalClassATC(anatomicalClass){
	
	var x = document.getElementById("AnatomicalClass");
   for (var i = 0; i < x.length; i++)
 {
	if(x.options[i].text == anatomicalClass){
		x.options[i].selected = true;
		break;
	}
}
}
  
  	