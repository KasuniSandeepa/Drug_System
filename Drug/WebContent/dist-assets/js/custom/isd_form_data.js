/**
 * 
 */


    var pass;
    var repass;
    
    var userCap;
    var realCap;
 
  
    var isG1 = false;
    var isG2 = true;
    var isG3 = true;
    var isB = true;
    var isD = true;
    var isS = true;
    var isCode = false;
    var isDate = true;
    var isSheudle = true;
    var isCountry = true;
 
    
  
    
    $('#isd_subBtn').click(function () {


        var x = document.forms["unasampor"];
        // console.log(x);
       $.each(x, function (i, sx) {

            /* if (sx.value.trim() == '') {
                if (sx.placeholder == 'check') {
                    if (!sx.checked) {
                        $(sx).addClass('is-invalid');
                        isT = false;
                    } else {
                        isT = true;
                    }
                } else {
                    $(sx).addClass('is-invalid');
                }


            } */


                if (sx.placeholder == 'email') {
			
                    if (!validateEmail(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isE = false;
                    } else {
                        isE = true;
                    }
                }
                if (sx.placeholder == 'Phone') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isM = false;
                    } else {
                        isM = true;
                    }
                }
                
                if (sx.placeholder == 'Generic') {
   					
               	
                   if (sx.value.length == 0) {
                       $(sx).addClass('is-invalid');
                       
                       isG1= false;
                   } else {
                       isG1 = true;
                   }
                 
               }
                
               
               
             /*   if (sx.placeholder == 'Brand') {
   					
                	
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isB= false;
                    } else {
                        isB = true;
                    }
                  
                }*/
              
               /* if (sx.placeholder == 'Dosage Form') {
   					
                	 
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isD= false;
                    } else {
                        isD = true;
                    }
                  
                }
              */
                /*if (sx.placeholder == 'Strength (mg, G etc.)') {
   					
                
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isS= false;
                    } else {
                        isS = true;
                    }
                  
                }*/
              
                if (sx.placeholder == 'Select IMC Code') {
   					
               	 
                   if (sx.value == 'Select IMC Code') {
                       $(sx).addClass('is-invalid');
                       
                       isCode= false;
                   } else {
                	   isCode = true;
                   }
                 
               }
             
             /*   if (sx.placeholder == 'Reg Exp Date') {
   					
                  	
                      if (sx.value == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isDate= false;
                      } else {
                    	  isDate = true;
                      }
                    
                  }*/
                
          
              /*   if (sx.name== 'Schedule') {
    					
                 
                     if (sx.value == 'Select Schedule') {
                    	
                    	  $(sx).addClass('is-invalid');
                    	  isSheudle= false;
                    	 
                     } else {
                    	 isSheudle = true;
                     }
                   
                 }*/
                 if (sx.name== 'IMC') {
 					
                 	
                     if (sx.value == 'Select IMC Code') {
                    	
                    	  $(sx).addClass('is-invalid');
                    	  isCode= false;
                    	 
                     } else {
                    	 isCode = true;
                     }
                   
                 }
                
                /* if (sx.placeholder == 'Reg Exp Date (Ex:9999-12-31) ') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isM = false;
                    } else {
                        isM = true;
                    }
                }
 */
              /*   if (sx.placeholder == 'NIC') {



                    if (!validateNIC(sx.value)) {
                        $(sx).addClass('is-invalid');
                        isN = false;
                    } else {
                        isN = true;

				}
                    } */
                
               /*  if (sx.placeholder == 'Password') {

                    if (!validatePassword(sx.value)) {
                        $(sx).addClass('is-invalid');
                        isPass = false;
                    } else {
                        isPass = true;
                    }
                } */

                // if (sx.placeholder == 'Password') {
                //     console.log(sx.value.length);
                //     pass = sx.value;
                //     if (!(sx.value.length >= 6)) {
                //         $(sx).addClass('is-invalid');
                //         isPS = false;
                //     } else {
                //         isPS = true;
                //     }
                // }
                // if (sx.placeholder == 'Confirm Password') {
                //     console.log(sx.value.length);
                //     repass = sx.value;
                //     if (!(sx.value.length >= 6)) {
                //         $(sx).addClass('is-invalid');
                //         isP1 = false;
                //     } else {
                //         isP1 = true;
                //     }
                // }
                
/*                 if(sx.placeholder == 'Password'){
                	pass = sx.value;
                }
                
                if(sx.placeholder == 'Confirm Password'){
                	repass = sx.value;
                }
                
                if(sx.placeholder == 'Capture the Code'){
                	userCap = sx.value;
                }
                
                if(sx.placeholder == 'realCap'){
                	realCap = sx.value;
                }
 */                
              
                
               /*  if (((sx.placeholder == 'Password') === (sx.placeholder == 'Confirm Password'))) {
                    $('#repassword').addClass('is-invalid');
                    $('#password').addClass('is-invalid');

                    isP = true;
                } else {
                    isP = false;
                }
               
               
 */
            

       });

        
       
        
      /*   
        if (!(pass === repass)) {
            $('#repassword').addClass('is-invalid');
            $('#password').addClass('is-invalid');

            isP = false;
        } else {
            isP = true;
        }
        
        if (!(userCap === realCap)) {
            $('#userCap').addClass('is-invalid');
            $('#realCap').addClass('is-invalid');

            isCap = false;
        } else {
        	isCap = true;
        }
        
        
      
        console.log(isE)
        console.log(isM)
        console.log(isN)
        console.log(isP)
        console.log(isP1)
        console.log(isPS)
        console.log(isT)
        console.log(isCap)
        
        console.log("rrrr"+realCap);
         */ 
         console.log(isG1)
         console.log(isG2)
         console.log(isG3)
         console.log(isD)
         console.log(isS)
          console.log("isSheudle"+isSheudle);

         if ( isG1 && isG2  && isB && isD && isS  && isDate && isCountry && isS && isSheudle && isCode) {
        	 
        	

   
         /*    $('#loader').removeClass('d-none');
            $('#loader').show();
 */
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=saveIsdtable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#unasampor').serialize(), // added data type
                success: function (data) {

                	
                    checkData(data);

                },
                error: function (e) {

                }
            });
         }
    else{
        	
        	if(!isG1){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Generic',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });

        	}else if(!isG2){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Generic2',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isG3){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Generic3',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isB){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter a Brand',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isDate){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter a Expire Date',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	}else if(!isCountry){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter a Country',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	} else if(!isCode){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Select a IMC Code',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                }); 
        	} else if(!isSheudle){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Select a Shedule',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                }); 
        	}
        } 
    
    });

   /*  $('#manufacturer').on('keypress', function (event) {
        var regex = new RegExp("^[a-z A-Z]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
        	   swal({
                   type: 'warning',
                   title: 'Registration Failed!',
                   text: 'Already Registered User',
                   buttonsStyling: false,
                   confirmButtonClass: 'btn btn-lg btn-success'
               });
            event.preventDefault();
       
            return false;
        }
    }); */
 
    $('#isd_manufacturer').on('keypress', function (event) {
      //  var regex = new RegExp("^[a-z A-Z]+$");
      //  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
   			
      
    
      
        	   swal({
                   type: 'warning',
                   title: 'Registration Failed!',
                   text: 'Already Registered User',
                   buttonsStyling: false,
                   confirmButtonClass: 'btn btn-lg btn-success'
               });
        
       
         
        
    });
 
    /*
    $('#nic').on('keypress', function (event) {
        var regex = new RegExp("^[0-9-vVxX]");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });

    $('#tel').on('keypress', function (event) {
        var regex = new RegExp("^[0-9]");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
            event.preventDefault();
            return false;
        }
    });

     */
 

    function checkData(data) {
      


        if (data == 'EXE') {
            render('#140202', 'User Already Exist');
            // window.location.href = 'sign-in.jsp';
        } else {
            if (data) {
                render('#140202', 'Registration Success');
            } else {
                render('#140202', 'Registration Failed');
                // window.location.href = 'sign-in.jsp';
            }
        }

        setTimeout(function () {
            $('#loader').hide();

            if (data == 'false') {
                $('#isd_subBtn').show();
                swal({
                    type: 'warning',
                    title: 'Data Registration Failed',
                    text: 'Try Again',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            } else {
                if (data) {
                	 
                     swal({
                        type: 'success',
                        title: 'Succesfully Added',
                        text: 'Data Added is Completed',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                        	
                    }).then(function() {
                    var generic = document.getElementById("Generic").value
                        storeISDGeneric(generic);
                    	
                     /*   window.location.href = '#step-3';*/
                          getGenericList();
                      /*  var generic = document.getElementById("Generic").value
                        storeISDGeneric(generic);
                        setLocalGeneric();*/
                    });
                	 
                   // $('#subBtn').show(); 
               
                    
                //	 window.location.href = 'ISDForm1.jsp';
                    
                    
                } else {
                    $('#subBtn').show();
                }
            }
        }, 500);
    }

    function validateEmail(email) {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    function validateNIC(nic) {
        const re = /^(?:19|20)?\d{2}[0-9]{10}|[0-9]{9}[x|X|v|V]$/;
        return re.test(String(nic));
    }

    function validateMobile(msisdn) {
        const re = /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\d)\d{6}$/;
        return re.test(String(msisdn));
    }

    function removeValidation() {
        var x = document.forms["imcForm"];
        $.each(x, function (i, sx) {
            $(sx).removeClass('is-invalid');
        });
    }
    
    
    function validatePassword(msisdn) {
        const re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        return re.test(String(msisdn));
    }
    
    
  	function getImporterDetails(value){
  		
  	
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
  	
  	 var Generic = document.getElementById("Generic");
     var Generic2 = document.getElementById("Generic2");
     var Generic3 = document.getElementById("Generic3");
     var Brand = document.getElementById("Brand");
   
     var Dosage = document.getElementById("Dosage");
     var Strength = document.getElementById("Strength");
     var Importer = document.getElementById("isd_Importer");
     var Manufacturer = document.getElementById("isd_Manufacturer");
     var RegExpDate = document.getElementById("RegExpDate");
     var Country = document.getElementById("isd_Country");
     var Notes = document.getElementById("isd_Notes");
     
     
     
     Generic.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("isd_subBtn").click();
        }
     });
     Generic2.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Generic3.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Dosage.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Strength.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Importer.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Manufacturer.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     RegExpDate.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Country.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
     Notes.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("isd_subBtn").click();
         }
      });
    
   
     
function  getGenericList(){

	  $.ajax({
		                url: 'controller/DrugContrller.jsp?action=getGenericList',
		                type: 'GET',
		                processData: false,
		                contentType: false,
		                cache: false,
		                data: $('#imcForm').serialize(), // added data type
		                success: function (data) {
						
							setGenericListInATC(data);
							setLocalGeneric();
							storeISDDataSummary();
                        window.location.href = '#step-3';
		                },
		                error: function (e) {
		                }
		            });
}
  
  function setGenericListInATC(data){
		  div = document.getElementById("Chemical");
		    div.options.length = 0;
			AddOptionInATCGeneric(div,"Select Chemical","Select Chemical")
			for(let i = 0; i < data.length ; i++){
		        AddOptionInATCGeneric(div,data[i],data[i])
			}
	}
	
	function AddOptionInATCGeneric(selectbox,text,value)
	{
	    if(text == "Select Manufacturer"){
		 let optn = document.createElement("OPTION");
	            optn.text = text;
	            optn.value = value;
	            optn.hidden = true;
	            selectbox.options.add(optn);     
	}else{
	            let optn = document.createElement("OPTION");
	            optn.text = text;
	            optn.value = value;
	            optn.selected = false;
	            selectbox.options.add(optn);        
	}
   } 
   

function isdGenericDropDown() {

console.log("yyyyyyyyyyyyyyy");
  /*document.getElementById("myDropdownISDGenericDropDown").classList.toggle("show");*/
  if(	document.getElementById("myDropdownISDGenericDropDown").style.display == "block"){
		document.getElementById("myDropdownISDGenericDropDown").style.display = "none";
	}else {
		document.getElementById("myDropdownISDGenericDropDown").style.display = "block";
	}
}


function filterISDGenericFunction() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("myInputISDGeneric");
  filter = input.value.toUpperCase();
  div = document.getElementById("myDropdownISDGenericDropDown");
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

function setISDGeneric(value){
    	 var generic = document.getElementById("Generic");
    	 generic.value = value;
          
    }