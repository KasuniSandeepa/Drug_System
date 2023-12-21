/**
 * 
 */

function myFunction() {
	
/*	document.getElementById("myDropdown").classList.toggle("show");*/
/*	if(	document.getElementById("myDropdown").style.display = "block"){
		document.getElementById("myDropdown").style.display = "none";
	}else if(document.getElementById("myDropdown").style.display = "none"){
		document.getElementById("myDropdown").style.display = "block";
	}*/
	if(	document.getElementById("myDropdown").style.display == "block"){
		document.getElementById("myDropdown").style.display = "none";
	}else {
		document.getElementById("myDropdown").style.display = "block";
	}
	
	if(	document.getElementById("myDropdown_c").style.display == "block"){
		document.getElementById("myDropdown_c").style.display = "none";
	}
	
	if(	document.getElementById("myDropdown_m").style.display == "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}
}
function hideDropDown() {
/*	document.getElementById("myDropdown").classList.toggle("show");*/
	if(	document.getElementById("myDropdown").style.display = "block"){
		document.getElementById("myDropdown").style.display = "none";
	}
}

function hideManufacturerDropDown() {
	/*document.getElementById("myDropdown_m").classList.toggle("show");*/
	/*if(	document.getElementById("myDropdown_m").style.display = "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}else if(document.getElementById("myDropdown_m").style.display = "none"){
		document.getElementById("myDropdown_m").style.display = "block";
	}*/
	
	if(	document.getElementById("myDropdown_m").style.display == "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}
}

function hideGenericDropDown() {
	/*document.getElementById("myDropdownISDGenericDropDown").classList.toggle("show");*/
	if(	document.getElementById("myDropdownISDGenericDropDown").style.display = "block"){
		document.getElementById("myDropdownISDGenericDropDown").style.display = "none";
	}
}

function hideCountryDropDown() {

	if(	document.getElementById("myDropdown_c").style.display = "block"){
		document.getElementById("myDropdown_c").style.display = "none";
	}
}
function close() {}

function filterFunction() {
	var input, filter, ul, li, a, i;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	div = document.getElementById("myDropdown");
	a = div.getElementsByTagName("option");
	for (i = 0; i < a.length; i++) {
		txtValue = a[i].textContent || a[i].innerText;
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			a[i].style.display = "";
		} else {
			a[i].style.display = "none";
		}
	}
}

function setImporter(value) {
	var importer = document.getElementById("importer");
	importer.value = value;
	$.ajax({
		url: 'controller/DrugContrller.jsp?action=manufacturerList',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {
			setManufacturerList(data);
			document.getElementById("mauList").value = data;
		},
		error: function(e) {
		}
	});
}


function myFunction_m() {
	/*document.getElementById("myDropdown_m").classList.toggle("show");*/
	
	if(	document.getElementById("myDropdown_m").style.display == "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}else {
		document.getElementById("myDropdown_m").style.display = "block";
	}
	
	if(	document.getElementById("myDropdown").style.display == "block"){
		document.getElementById("myDropdown").style.display = "none";
	}
	
	if(	document.getElementById("myDropdown_c").style.display == "block"){
		document.getElementById("myDropdown_c").style.display = "none";
	}
}

function filterFunction_m() {
	var input, filter, ul, li, a, i;
	input = document.getElementById("myInput_m");
	filter = input.value.toUpperCase();
	div = document.getElementById("myDropdown_m");
	a = div.getElementsByTagName("option");
	for (i = 0; i < a.length; i++) {
		txtValue = a[i].textContent || a[i].innerText;
		if (txtValue.toUpperCase().indexOf(filter) > -1) {
			a[i].style.display = "";
		} else {
			a[i].style.display = "none";
		}
	}
}


function setManufacturerList(data) {
	div = document.getElementById("myDropdown_m");
	/*while (div.firstChild) {
		console.log(div.firstChild)
		div.removeChild(div.firstChild);
	}*/
	
	$("#myDropdown_m").children(":not(#myInput_m)").remove();

	for (let i = 0; i < data.length; i++) {
		AddOptionInUpdateIMC(div, data[i], data[i])
	}
}


function AddOptionInUpdateIMC(selectbox, text, value) {
	if (text == "Select Manufacturer") {
		let optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		optn.hidden = true;
		selectbox.options.add(optn);
	} else {
		let optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		optn.selected = false;
		optn.name = "x";
		selectbox.appendChild(optn);
	}
}


document.addEventListener('click', function(e) {
	if (e.target && e.target.name == 'x') {
		//do something
		setManufacturer(e.target.value);
		hideManufacturerDropDown();
	}

	if (e.target && e.target.name == 'country') {
		//do something
		setCountry(e.target.value);
		hideCountryDropDown();

	}
	
	if (e.target && e.target.id == 'step-1') {
	
		hideCountryDropDown();
		hideManufacturerDropDown();
		 hideDropDown();
		 hideGenericDropDown();

	}
	
	if (e.target && e.target.id == 'step-2') {
	
		hideCountryDropDown();
		hideManufacturerDropDown();
		 hideDropDown();
		 hideGenericDropDown();

	}
	
	if (e.target && e.target.id == 'mainFrame') {
	
		hideCountryDropDown();

	}
	
	if (e.target && e.target.name == 'imcFormMainFrame') {
	
		hideCountryDropDown();

	}
});


function setManufacturer(value) {

	var manufacturer = document.getElementById("manufacturer");
	manufacturer.value = value;
	var importer = document.getElementById("importer").value;

	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getCountry',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {
			
			
			if(data == '' || data == ','){
		
		
			$.ajax({
    		url: 'controller/DrugContrller.jsp?action=checkAvalabilityImcCode',
    		type: 'GET',
    		processData: false,
    		contentType: false,
    		data: $('#imcForm').serialize(), // added data type
    		cache: false,
    	
    		success: function(data) {
    
				if(data=="false"){
				
				notifyNewImc();
				setAddress();
			setPhone();
			setFax();
			setEmail();
				}else{
				setIMCCode();
				}
    			
    		},
    		error: function(e) {
    			
    		}
    	});
			
		
			}else{
			setCountryList(data);
			}
		},
		error: function(e) {
		}
	});
}


function myFunction_c() {

	
	//document.getElementById("myDropdown_c").classList.toggle("show");
	//document.getElementById("myDropdown_c").style.display = "block";
	
	if(	document.getElementById("myDropdown_c").style.display == "block"){
		document.getElementById("myDropdown_c").style.display = "none";
	}else {
		document.getElementById("myDropdown_c").style.display = "block";
	}
	
	if(	document.getElementById("myDropdown").style.display == "block"){
		document.getElementById("myDropdown").style.display = "none";
	}
	
	if(	document.getElementById("myDropdown_m").style.display == "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}
}


function setCountryList(data) {
	div = document.getElementById("myDropdown_c");
while (div.firstChild) {
		div.removeChild(div.firstChild);
	}
	
	for (let i = 0; i < data.length; i++) {
		AddOptionInUpdateIMCCountry(div, data[i], data[i])
	}
}

function AddOptionInUpdateIMCCountry(selectbox, text, value) {
	if (text == "Select Manufacturer") {
		let optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		optn.hidden = true;
		selectbox.options.add(optn);
	} else {
		let optn = document.createElement("OPTION");
		optn.text = text;
		optn.value = value;
		optn.selected = false;
		optn.name = "country";
		selectbox.appendChild(optn);
	}
}


function setCountry(value) {
	var country = document.getElementById("Country");
	country.value = value;
	setIMCCode();
}

function setIMCCode() {
	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getimccode',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {
			var IMCcode = document.getElementById("IMCcode");
			if(data == ''){
	
			/*generateImcCode();
			saveNewCode();*/
			notifyNewImc();
			}
			else{
			IMCcode.value = data;
			}
			setAddress();
			setPhone();
			setFax(); 
			setEmail();
		},
		error: function(e) {
		}
	});
}

function generateImcCode() {

	var importer = document.getElementById("importer").value;
	var manufactrer = document.getElementById("manufacturer").value;
	var country = document.getElementById("Country").value;

	importer = importer.split(" ").join("");
    manufactrer = manufactrer.split(" ").join("");
    country = country.split(" ").join("");
    
    
	/*if (importer.length == 0 && manufactrer.length == 0) {
		swal({
			type: 'warning',
			title: 'Incomplete Data',
			text: 'Please Enter or Select a Importer and Manufacturer before proceeding',
			buttonsStyling: false,
			confirmButtonClass: 'btn btn-lg btn-success'
		}).then(function() {

		});
	}
*/
 

	let i_code = importer.substring(0, 5);
	let m_code = manufactrer.substring(0, 4);
	let c_code = country.substring(0, 2);
	
	var imc_code = i_code.toLowerCase() + "_" + m_code.toLowerCase() + "_"+ c_code.toLowerCase();
	
	

	var IMCcode = document.getElementById("IMCcode");
		
		 newStr = imc_code.split(" ").join("");

	IMCcode.value = imc_code;
	
	
	
}

function setAddress() {

	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getAddress',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {

			var address = document.getElementById("Address");
			address.value = data;
		},
		error: function(e) {
		}
	});
}

function setPhone() {
	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getPhone',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {

			var Phone = document.getElementById("Phone");
			Phone.value = data;
		},
		error: function(e) {
		}
	});
}

function setFax() {
	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getFax',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {

			var Fax = document.getElementById("Fax");
			Fax.value = data;
		},
		error: function(e) {
		}
	});
}

function setEmail() {
	$.ajax({
		url: 'controller/DrugContrller.jsp?action=getEmail',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {

			var email = document.getElementById("email");
			email.value = data;
		},
		error: function(e) {
		}
	});
}

function saveNewCode(){
 $.ajax({
		url: 'controller/DrugContrller.jsp?action=saveNewImcCode',
		type: 'GET',
		processData: false,
		contentType: false,
		cache: false,
		data: $('#imcForm').serialize(), // added data type
		success: function(data) {

			
		},
		error: function(e) {
		}
	});

}

function notifyNewImc(){
		swal({
		  title: 'No IMC Code!',
		  text: "No IMC Code for Selected Importer and Manufacturer , Click on Generate for generate a new IMC Code",
		
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Generate IMC Code!'
		}).then((result) => {
	
		  if (result == true) {
		  	generateImcCode();
			var IMCcode = document.getElementById("IMCcode").value;
			  swal({
	            		      title: "IMC Code : "+IMCcode,
	            	            text: "Saved",
	            	            type: "success"
	        		  }).then(function() {
	        			   saveNewCode();
	        			   
	        		  });
		  }
		})
}

function test(){

}