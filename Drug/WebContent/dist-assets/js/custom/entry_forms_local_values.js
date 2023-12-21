/**
 * 
 */

function storeIMCCODE(imc_code){
        localStorage.setItem('IMC_CODE', imc_code)

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
	
	const imc = getLocalIMCCODE();
	
	var x = document.getElementById("IMC");
for (var i = 0; i < x.length; i++)
{
		
	if(x.options[i].text == imc){
	
		x.options[i].selected = true;
		getImporterDetailsOnload(imc);
		break;
	}
}


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
			
        	 
        	  document.getElementById("Importer").value = data;
          	
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
			
        	 /* console.log("ddd"+data);*/
        	 document.getElementById("Manufacturer").value = data;
          	
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
			
        	  /*console.log("ddd"+data);*/
        	  document.getElementById("Country").value = data;
          	
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
	const selectedChemical = document.getElementById("Chemical");
	/*console.log("Selected Chemical"+selectedChemical);*/
}

function removeLocalIMC(){
	        localStorage.setItem('IMC_CODE', "");
}

  	