/**
 * 
 */

 var pass;
    var repass;
    
    var userCap;
    var realCap;
 
  
    var isChemical = false;
    var isPharmo = true;
    var isTherap = false;
    var isClinical = false;
    var isAnatomical = false;
    var isATCCode = false;
    var isCautLbl = true;
    var isAddEff = true;
   
 
    
  
    
    $('#atc_subBtn').click(function () {


        var x = document.forms["atcForm"];
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
           
	            if (sx.id == 'Chemical') {
	                 var chemicalDropDown = document.getElementById("Chemical");
	                 var selectedChemical = chemicalDropDown.options[chemicalDropDown.selectedIndex].value;
	                   if (selectedChemical == "Select Chemical")
	                   {
	                	   isChemical = false;
	                   } else{
	                	   isChemical = true;
	                   }
	             }
	            
               
          if (sx.name == 'PharmoClass') {
   					
                  	
                 	
                      if (sx.value == 'Select Pharmo Class') {
                          $(sx).addClass('is-invalid');
                          
                          isPharmo= false;
                      } else {
                    	  isPharmo = true;
                      } 
               } 
                 
                
                if (sx.name == 'TherapeuticClass') {
   					
                 	
                     if (sx.value == "Select Therapeutic Class") {
                         $(sx).addClass('is-invalid');
                         
                         isTherap= false;
                     } else {
                    	 isTherap = true;
                     } 
                	  
                 }
                
                if (sx.name == 'ClinicalClass') {
   					
                	
                    if (sx.value == "Select Clinical Class") {
                        $(sx).addClass('is-invalid');
                        
                        isClinical= false;
                    } else {
                    	isClinical = true;
                    }
                  
                }
              
                if (sx.name == 'AnatomicalClass') {
   					
                	 
                    if (sx.value == "Select Anatomical Class") {
                        $(sx).addClass('is-invalid');
                        
                        isAnatomical= false;
                    } else {
                    	isAnatomical = true;
                    }
                  
                }
              
                if (sx.placeholder == 'ATC Code') {
   					
                	
                    if (sx.value.length == 0 || sx.value.length > 15) {
                        $(sx).addClass('is-invalid');
                        
                        isATCCode= false;
                    } else {
                    	isATCCode = true;
                    }
                  
                }
              
             /*   if (sx.placeholder == 'Cautionary Label') {
   					
               	
                   if (sx.value == 'Select IMC Code') {
                       $(sx).addClass('is-invalid');
                       
                       isCautLbl= false;
                   } else {
                	   isCautLbl = true;
                   }
                 
               }*/
             
              /*  if (sx.placeholder == 'Adverse Effects') {
   					
                 
                      if (sx.value == 0) {
                          $(sx).addClass('is-invalid');
                          isAddEff= false;
                      } else {
                    	  isAddEff = true;
                      }
                    
                  }
                */
               
              
                
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
         
       
         if ( isChemical && isPharmo  && isTherap && isClinical && isAnatomical  && isATCCode && isCautLbl ) {
        	 
        	

   
         /*    $('#loader').removeClass('d-none');
            $('#loader').show();
 */console.log("hiii");
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=saveAtctable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#atcForm').serialize(), // added data type
                success: function (data) {

                /*	console.log(data);*/
                    checkATCData(data);

                },
                error: function (e) {

                }
            });
         }
    else{
        	
        	if(!isChemical){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Chemical',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });

        	}else if(!isPharmo){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Pharmo Class',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isTherap){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Therapeutic Class',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isClinical){
        		  swal({
                      type: 'error',
                      title: 'Data Entry Failed!',
                      text: 'Please Enter valid Clinical Class',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
        	}else if(!isAnatomical){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter valid Anatomical Class',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	}else if(!isATCCode){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter a Code with characters betweeen only 1 and 15',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	} else if(!isCautLbl){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter a Cautionary Label',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                }); 
        	} else if(!isAddEff){
        		swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter Adverse Effects',
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
 
    /*$('#manufacturer').on('keypress', function (event) {
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
 */
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
 

    function checkATCData(data) {
        console.log('res ' + data);


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
                $('#atc_subBtn').show();
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
                        title: 'Successfully Added',
                        text: 'Data Added is Completed',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                        	
                    }).then(function() {
              
                 
                 	storeATCDataSummary();
                    setInSummaryIMC();
                    setInSummaryISD();
                    setInSummaryATC();
                    window.location.href = '#step-4';
                     
                    });
                	 
                   // $('#subBtn').show(); 
                   
                    
                //	 window.location.href = 'ISDForm1.jsp';
                    
                    
                } else {
                    $('#atc_subBtn').show();
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
  		
  		console.log(value);
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=test',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	/*  console.log("ddd"+data);*/
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
			
        	/*  console.log("ddd"+data);*/
        	  document.getElementById("Country").value = data;
          	
          },
          error: function (e) {

          }
      });
  	}
  	
	 var PharmoClass = document.getElementById("PharmoClass");
     var TherapeuticClass = document.getElementById("TherapeuticClass");
     var ClinicalClass = document.getElementById("ClinicalClass");
     var AnatomicalClass = document.getElementById("AnatomicalClass");
   
     var ATCCode = document.getElementById("ATCCode");
     var CautionaryLabel = document.getElementById("CautionaryLabel");
     var AdverseEffects = document.getElementById("AdverseEffects");
     var ATC_Notes = document.getElementById("ATC_Notes");
 
     
     
     PharmoClass.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("atc_subBtn").click();
        }
     });
     TherapeuticClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     ClinicalClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     AnatomicalClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     ATCCode.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     CautionaryLabel.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     AdverseEffects.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     ATC_Notes.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("atc_subBtn").click();
         }
      });
     
     