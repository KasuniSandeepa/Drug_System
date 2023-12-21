/**
 * 
 */
const countryList = [
	"Afghanistan",
	"Åland Islands",
	"Albania",
	"Algeria",
	"American Samoa",
	"Andorra",
	"Angola",
	"Anguilla",
	"Antarctica",
	"Antigua and Barbuda",
	"Argentina",
	"Armenia",
	"Aruba",
	"Australia",
	"Austria",
	"Azerbaijan",
	"Bahamas (the)",
	"Bahrain",
	"Bangladesh",
	"Barbados",
	"Belarus",
	"Belgium",
	"Belize",
	"Benin",
	"Bermuda",
	"Bhutan",
	"Bolivia (Plurinational State of)",
	"Bonaire, Sint Eustatius and Saba",
	"Bosnia and Herzegovina",
	"Botswana",
	"Bouvet Island",
	"Brazil",
	"British Indian Ocean Territory (the)",
	"Brunei Darussalam",
	"Bulgaria",
	"Burkina Faso",
	"Burundi",
	"Cabo Verde",
	"Cambodia",
	"Cameroon",
	"Canada",
	"Cayman Islands (the)",
	"Central African Republic (the)",
	"Chad",
	"Chile",
	"China",
	"Christmas Island",
	"Cocos (Keeling) Islands (the)",
	"Colombia",
	"Comoros (the)",
	"Congo (the Democratic Republic of the)",
	"Congo (the)",
	"Cook Islands (the)",
	"Costa Rica",
	"Croatia",
	"Cuba",
	"Curaçao",
	"Cyprus",
	"Czechia",
	"Côte d'Ivoire",
	"Denmark",
	"Djibouti",
	"Dominica",
	"Dominican Republic (the)",
	"Ecuador",
	"Egypt",
	"El Salvador",
	"Equatorial Guinea",
	"Eritrea",
	"Estonia",
	"Eswatini",
	"Ethiopia",
	"Falkland Islands (the) [Malvinas]",
	"Faroe Islands (the)",
	"Fiji",
	"Finland",
	"France",
	"French Guiana",
	"French Polynesia",
	"French Southern Territories (the)",
	"Gabon",
	"Gambia (the)",
	"Georgia",
	"Germany",
	"Ghana",
	"Gibraltar",
	"Greece",
	"Greenland",
	"Grenada",
	"Guadeloupe",
	"Guam",
	"Guatemala",
	"Guernsey",
	"Guinea",
	"Guinea-Bissau",
	"Guyana",
	"Haiti",
	"Heard Island and McDonald Islands",
	"Holy See (the)",
	"Honduras",
	"Hong Kong",
	"Hungary",
	"Iceland",
	"India",
	"Indonesia",
	"Iran (Islamic Republic of)",
	"Iraq",
	"Ireland",
	"Isle of Man",
	"Israel",
	"Italy",
	"Jamaica",
	"Japan",
	"Jersey",
	"Jordan",
	"Kazakhstan",
	"Kenya",
	"Kiribati",
	"Korea (the Democratic People's Republic of)",
	"Korea (the Republic of)",
	"Kuwait",
	"Kyrgyzstan",
	"Lao People's Democratic Republic (the)",
	"Latvia",
	"Lebanon",
	"Lesotho",
	"Liberia",
	"Libya",
	"Liechtenstein",
	"Lithuania",
	"Luxembourg",
	"Macao",
	"Madagascar",
	"Malawi",
	"Malaysia",
	"Maldives",
	"Mali",
	"Malta",
	"Marshall Islands (the)",
	"Martinique",
	"Mauritania",
	"Mauritius",
	"Mayotte",
	"Mexico",
	"Micronesia (Federated States of)",
	"Moldova (the Republic of)",
	"Monaco",
	"Mongolia",
	"Montenegro",
	"Montserrat",
	"Morocco",
	"Mozambique",
	"Myanmar",
	"Namibia",
	"Nauru",
	"Nepal",
	"Netherlands (the)",
	"New Caledonia",
	"New Zealand",
	"Nicaragua",
	"Niger (the)",
	"Nigeria",
	"Niue",
	"Norfolk Island",
	"Northern Mariana Islands (the)",
	"Norway",
	"Oman",
	"Pakistan",
	"Palau",
	"Palestine, State of",
	"Panama",
	"Papua New Guinea",
	"Paraguay",
	"Peru",
	"Philippines (the)",
	"Pitcairn",
	"Poland",
	"Portugal",
	"Puerto Rico",
	"Qatar",
	"Republic of North Macedonia",
	"Romania",
	"Russian Federation (the)",
	"Rwanda",
	"Réunion",
	"Saint Barthélemy",
	"Saint Helena, Ascension and Tristan da Cunha",
	"Saint Kitts and Nevis",
	"Saint Lucia",
	"Saint Martin (French part)",
	"Saint Pierre and Miquelon",
	"Saint Vincent and the Grenadines",
	"Samoa",
	"San Marino",
	"Sao Tome and Principe",
	"Saudi Arabia",
	"Senegal",
	"Serbia",
	"Seychelles",
	"Sierra Leone",
	"Singapore",
	"Sint Maarten (Dutch part)",
	"Slovakia",
	"Slovenia",
	"Solomon Islands",
	"Somalia",
	"South Africa",
	"South Georgia and the South Sandwich Islands",
	"South Sudan",
	"Spain",
	"Sri Lanka",
	"Sudan (the)",
	"Suriname",
	"Svalbard and Jan Mayen",
	"Sweden",
	"Switzerland",
	"Syrian Arab Republic",
	"Taiwan (Province of China)",
	"Tajikistan",
	"Tanzania, United Republic of",
	"Thailand",
	"Timor-Leste",
	"Togo",
	"Tokelau",
	"Tonga",
	"Trinidad and Tobago",
	"Tunisia",
	"Turkey",
	"Turkmenistan",
	"Turks and Caicos Islands (the)",
	"Tuvalu",
	"Uganda",
	"Ukraine",
	"United Arab Emirates (the)",
	"United Kingdom of Great Britain and Northern Ireland (the)",
	"United States Minor Outlying Islands (the)",
	"United States of America (the)",
	"Uruguay",
	"Uzbekistan",
	"Vanuatu",
	"Venezuela (Bolivarian Republic of)",
	"Viet Nam",
	"Virgin Islands (British)",
	"Virgin Islands (U.S.)",
	"Wallis and Futuna",
	"Western Sahara",
	"Yemen",
	"Zambia",
	"Zimbabwe"
];


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
		optn.name = "COUNTRY";
		selectbox.appendChild(optn);
	}
}

function setCountryList() {
	div = document.getElementById("myDropdown_c");
	

	for (let i = 0; i < countryList.length; i++) {
		AddOptionInUpdateIMCCountry(div, countryList[i], countryList[i])
	}
}

function myFunction() {

	var importer = document.getElementById("importer").value;


	/*	document.getElementById("myDropdown").classList.toggle("show");*/
	/*	if(	document.getElementById("myDropdown").style.display = "block"){
			document.getElementById("myDropdown").style.display = "none";
		}else if(document.getElementById("myDropdown").style.display = "none"){
			document.getElementById("myDropdown").style.display = "block";
		}*/
	if (document.getElementById("myDropdown").style.display == "block") {
		document.getElementById("myDropdown").style.display = "none";
	} else {
		document.getElementById("myDropdown").style.display = "block";
	}
	
	if (document.getElementById("myDropdown_c").style.display == "block") {
		document.getElementById("myDropdown_c").style.display = "none";
	} 
	
	if (document.getElementById("myDropdown_m").style.display == "block") {
		document.getElementById("myDropdown_m").style.display = "none";
	} 
}


function hideDropDown() {
	/*	document.getElementById("myDropdown").classList.toggle("show");*/
	if (document.getElementById("myDropdown").style.display = "block") {
		document.getElementById("myDropdown").style.display = "none";
	}
}


function setImporter(value) {
	var importer = document.getElementById("importer");
	importer.value = value;
}

function myFunction_m() {
	/*document.getElementById("myDropdown_m").classList.toggle("show");*/

	if (document.getElementById("myDropdown_m").style.display == "block") {
		document.getElementById("myDropdown_m").style.display = "none";
	} else {
		document.getElementById("myDropdown_m").style.display = "block";
	}
	
	if (document.getElementById("myDropdown").style.display == "block") {
		document.getElementById("myDropdown").style.display = "none";
	}
	
	if (document.getElementById("myDropdown_c").style.display == "block") {
		document.getElementById("myDropdown_c").style.display = "none";
	}
}

document.addEventListener('click', function(e) {
	

	if (e.target && e.target.name == 'COUNTRY') {
		//do something
		setCountry(e.target.value);
		hideCountryDropDown();
		generateImcCode();

	}




	if (e.target && e.target.id == 'mainBody') {
	
		hideCountryDropDown();
		hideDropDown();
		hideManufacturerDropDown();
		

	} 

	
});

function setManufacturer(value) {

	var manufacturer = document.getElementById("manufacturer");
	manufacturer.value = value;
	var importer = document.getElementById("importer").value;

}

function hideManufacturerDropDown() {
	/*document.getElementById("myDropdown_m").classList.toggle("show");*/
	/*if(	document.getElementById("myDropdown_m").style.display = "block"){
		document.getElementById("myDropdown_m").style.display = "none";
	}else if(document.getElementById("myDropdown_m").style.display = "none"){
		document.getElementById("myDropdown_m").style.display = "block";
	}*/

	if (document.getElementById("myDropdown_m").style.display == "block") {
		document.getElementById("myDropdown_m").style.display = "none";
	}
}

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

function filterFunction_c() {
	var input, filter, ul, li, a, i;
	input = document.getElementById("myInput_c");
	filter = input.value.toUpperCase();
	div = document.getElementById("myDropdown_c");
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

window.onload = setCountryList();

function myFunction_c() {

	if (document.getElementById("myDropdown_c").style.display == "block") {
		document.getElementById("myDropdown_c").style.display = "none";
	} else {
		document.getElementById("myDropdown_c").style.display = "block";
	}
	
		if (document.getElementById("myDropdown").style.display == "block") {
		document.getElementById("myDropdown").style.display = "none";
	}
	
		if (document.getElementById("myDropdown_m").style.display == "block") {
		document.getElementById("myDropdown_m").style.display = "none";
	}
}

function setCountry(value) {
	var country = document.getElementById("Country");
	country.value = value;
	
}

function hideCountryDropDown() {

	if(	document.getElementById("myDropdown_c").style.display = "block"){
		document.getElementById("myDropdown_c").style.display = "none";
	}
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
	var imc_code = i_code.toLowerCase() + "_" + m_code.toLowerCase()+ "_"+ c_code.toLowerCase();
	
	

	var IMCcode = document.getElementById("IMCcode");
		
		 newStr = imc_code.split(" ").join("");

	IMCcode.value = imc_code;
	
	
	
}
