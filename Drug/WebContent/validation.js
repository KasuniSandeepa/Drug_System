/**
 * 
 */

//Call for validate the Mobile number and NIC
function CheckValidations(inputNic, inputMobile) {

	var _ValidNic = CheckNic(inputNic);
	var _ValidOtp =  checkOtp();

	if (_ValidNic == true && _ValidOtp  == true) {
		document.getElementById("submit").disabled = false;
		
	}

}

var otp;

function generateOtp(){
	  

	  otp = Math.floor(1000 + Math.random() * 9000);
	  console.log(otp);
	  
	 
}

function  checkOtp(){
	  
	  
	var inputOtp = document.getElementById("otp").value;
	
	 console.log(inputOtp);
	  if(otp == inputOtp){
		  
		 // document.getElementById("submit").disabled = false;
		  return true;
	  }else{
		  
		  alert("Invalid Otp try again");
		  return false;
	  }
	  
}


//Validate NIC number
function CheckNic(inputNic) {

	var _NicLength = inputNic.length;

	if (_NicLength == 10) {

		var _DigitsCorrect = CheckDigits(inputNic);
		var _NumericNumbers = CheckFirst9Characters(inputNic);
		var _LastCharacter = CheckLastCharacter(inputNic);
		//var _BirthYear = CheckOldNic(inputNic, dob);

		if (_DigitsCorrect == true && _NumericNumbers == true
				&& _LastCharacter == true) {
			// document.getElementById("btnSubmit").disabled=false;
			return true;
		} else {

			if (_DigitsCorrect == false) {
				document.getElementById("submit").disabled = true;
				alert("Invalid NIC number : NIC number must contain 10 characters");
			} else if (_NumericNumbers == false) {
				document.getElementById("submit").disabled = true;
				alert("Invalid NIC number : First 9 characters must be numeric numbers");
			} else {
				document.getElementById("submit").disabled = true;
				alert("Invalid NIC number : Invalid Last Character");
			}

			return false;
		}
	} else if (_NicLength == 12) {

		var _AllNumeric = CheckAllDigits(inputNic);
		//var _BirthYear = CheckNewNic(inputNic, dob);
		
		if (_AllNumeric == true) {
			return true;
		} else {
			document.getElementById("submit").disabled = true;
			alert("Invalid NIC number");
		}

	} else {
		document.getElementById("submit").disabled = true;
		alert("Invalid NIC number");
	}
}


//Validate the numbers of characters in the NIC number.This function executes when it is a old nic number
function CheckDigits(inputNic) {
	var _NicLength = inputNic.length;
	if (_NicLength == 10) {
		return true;
	} else {
		return false;
	}

}

//Validate the first 9 characters of the nic number.This function executes when it is a old nic number
function CheckFirst9Characters(inputNic) {
	var _Numbers = /^[0-9]+$/;
	var _NumbersInNic = inputNic.slice(0, 9);

	if (_NumbersInNic.match(_Numbers)) {
		return true;
	} else {
		return false;
	}
}

//Validate the last character of the nic number.This function executes when it is a old nic number
function CheckLastCharacter(inputNic) {
	var _Nic = inputNic.toString();
	const LAST_LETTER = _Nic[9];

	if ( LAST_LETTER == "V" ||  LAST_LETTER == "v" ||  LAST_LETTER=="x" ||  LAST_LETTER=="X") {

		return true;
	} else {
		return false;
	}
}

//Validate the all characters of the NIC number.They must be numberic.This function executes when it is a new NIC number
function CheckAllDigits(inputNic) {

	var _Numbers = /^[0-9]+$/;
	var _NumbersInNic = inputNic.value.slice(0, 11);

	if (_NumbersInNic.match(_Numbers)) {
		return true;
	} else {
		return false;
	}

}

//Validate the NIC number with the user input birth year.This function executes when it is a old NIC number
function CheckOldNic(inputNic) {

	//var _BirthYear = dob.value.slice(2, 4);
	var _NicYear = inputNic.value.slice(0, 2);

	if (_BirthYear == _NicYear) {
		return true;
	} else {
		return false;
	}
}


//Validate the NIC number with the user input birth year.This function executes when it is a new NIC number
function CheckNewNic(inputNic, dob) {

	var _BirthYear = dob.value.slice(0, 4);
	var _NicYear = inputNic.value.slice(0, 4);

	if (_BirthYear == _NicYear) {
		return true;
	} else {
		return false;
	}
}


function CheckNicforSearch(inputNic) {

	// window.alert(InsertNic.value);

	// var NicLength = InsertNic.value.length;
	var _NicLength = inputNic.value.length;

	if (_NicLength == 10) {

		var _CheckFirstCharacters = CheckFirst9Characters(inputNic);
		var _CheckLastCharacter = CheckLastCharacter(inputNic);

		if (_CheckFirstCharacters == true && _CheckLastCharacter == true) {
			document.getElementById("btnNicSearch").disabled = true;
			return true;
		} else {
			return false;
			alert("Invalid NIC");
		}
	}

}

function ShowSuccessMsg(){
	
	alert("Employee Registration is Successfull");
}

function ShowUpdateSuccessMsg(){
	alert("Employee Update is Successfull");
}