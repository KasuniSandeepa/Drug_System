/**
 * 
 */

  var pass;
    var repass;
    
    var userCap;
    var realCap;
 
    var isCode = true;
    var isA = true;
    var isC = true;
    var isMan = true;
    var isI = false;
    var isM = true;
    var isE = true;
    var isN = false;
    var isP = false;
    var isPS = false;
    var isP1 = false;
    var isT = false;
    var isPass = false;
    var isCap = false;
    var isF = true;
	
    
    $('#imc_subBtn').click(function () {

    	storeIMCCODE( document.getElementById("IMCcode").value);
    	storeIMPORTER( document.getElementById("importer").value);
    	storeMANUFACTURER( document.getElementById("manufacturer").value);
    	storeCOUNTRY( document.getElementById("Country").value);
    	
    	  
		var exe = true;
		
		 $.ajax({
             url: 'controller/DrugContrller.jsp?action=checkAvaibility',
             type: 'GET',
             processData: false,
             contentType: false,
             cache: false,
             data: $('#imcForm').serialize(), // added data type
             success: function (data) {
             
             
				if(data == false){
					exe = false;
				}
				if(data == true){
					 getIMCCodeList();
					setLocalImcCode();
					window.location.href = '#step-2';
					
					
				}
				
			
			
             },
             error: function (e) {
             }
         }).then(function() {
		
    	if(exe == false){
        var x = document.forms["imcForm"];
      
       $.each(x, function (i, sx) {


               /* if (sx.placeholder == 'email') {
				
                    if (!validateEmail(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isE = false;
                    } else {
                        isE = true;
                    }
                }*/
              /*  if (sx.placeholder == 'Phone') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isM = false;
                    } else {
                        isM = true;
                    }
                }*/
                
               /* if (sx.placeholder == 'Fax') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isF = false;
                    } else {
                    	isF = true;
                    }
                }*/
                
               if (sx.placeholder == 'Importer') {
					
                	 
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isI = false;
                    } else {
                        isI = true;
                    }
                  
                }
                 
             /*    if (sx.placeholder == 'Manufacturer') {
 					
                	
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isMan = false;
                    } else {
                        isMan = true;
                    }
                  
                }
                 */
                /* if (sx.placeholder == 'Country') {
  					
                	
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isC = false;
                    } else {
                        isC = true;
                    }
                  
                }*/
                 
                /* if (sx.placeholder == 'IMCcode') {
   					
                	 
                    if (sx.value.length == 0 || sx.value.length > 15) {
                        $(sx).addClass('is-invalid');
                        
                        isCode = false;
                    } else {
                        isCode = true;
                    }
                  
                }*/
                 
                /* if (sx.placeholder == 'Address') {
    					
                	
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isA = false;
                    } else {
                        isA= true;
                    }
                  
                }*/
                        
       });
		console.log("Is IIII"+isI);
		console.log("isCode"+isCode);
         if ( isE && isM && isF && isI  && isC && isMan && isA) {

        	 let timerInterval
        	 swal({
        	   title: 'Please Wait, Data is Processing!',
        	   html: 'I will close in <b></b> milliseconds.',
        	   timer: 6000,
        	   timerProgressBar: true,
        	   didOpen: () => {
        	     Swal.showLoading()
        	     timerInterval = setInterval(() => {
        	       const content = Swal.getHtmlContainer()
        	       if (content) {
        	         const b = content.querySelector('b')
        	         if (b) {
        	           b.textContent = Swal.getTimerLeft()
        	         }
        	       }
        	     }, 100)
        	   },
        	   willClose: () => {
        	     clearInterval(timerInterval)
        	   }
        	 }).then((result) => {
        	   /* Read more about handling dismissals below */
        	   if (result.dismiss === Swal.DismissReason.timer) {
        	     console.log('I was closed by the timer')
        	   }
        	 })
   
         /*    $('#loader').removeClass('d-none');
            $('#loader').show();
 */
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=saveImctable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#imcForm').serialize(), // added data type
                success: function (data) {

                    check(data);

                },
                error: function (e) {

                }
            });
        
      }else{
    		if(!isI){
      		  swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please Enter an Importer',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
      	}else if(!isMan){
      		  swal({
                    type: 'error',
                    title: 'Data Entry Failed!',
                    text: 'Please enter an Manufacturer',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });

      	}else if(!isC){
    		  swal({
                type: 'error',
                title: 'Data Entry Failed!',
                text: 'Please enter a Country',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success'
            });

  	}else if(!isCode){
    		  swal({
                type: 'error',
                title: 'Data Entry Failed!',
                text: 'Please Enter a Code with characters betweeen only 1 and 15',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success'
            });

  	}else if(!isA){
    		  swal({
                type: 'error',
                title: 'Data Entry Failed!',
                text: 'Please enter an Address',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success'
            });

  	}else if(!isM){
    		  swal({
                  type: 'error',
                  title: 'Data Entry Failed!',
                  text: 'Please enter 10 digit valid contact number',
                  buttonsStyling: false,
                  confirmButtonClass: 'btn btn-lg btn-success'
              });

    	}else if(!isF){
    		  swal({
                  type: 'error',
                  title: 'Data Entry Failed!',
                  text: 'Please enter 10 digit valid fax number',
                  buttonsStyling: false,
                  confirmButtonClass: 'btn btn-lg btn-success'
              });
    	}else if(!isE){
    		  swal({
                  type: 'error',
                  title: 'Data Entry Failed!',
                  text: 'Please enter a valid email address',
                  buttonsStyling: false,
                  confirmButtonClass: 'btn btn-lg btn-success'
              });
    	}
        } 
    	}
    	
    	//the end
         });
    });
    


    function check(data) {
       


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

            if (data == 'EXE') {
                $('#imc_subBtn').show();
                swal({
                    type: 'warning',
                    title: 'Registration Failed!',
                    text: 'Already Registered User',
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
	                     getIMCCodeList();
	 					/* setLocalImcCode();
                        window.location.href = '#step-2';*/
                    });
                    $('#imc_subBtn').show(); 
               
                    
                    
                } else {
                    $('#imc_subBtn').show();
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
    
    var importer = document.getElementById("importer");
    var manufacturer = document.getElementById("manufacturer");
    var Country = document.getElementById("Country");
    var IMCcode = document.getElementById("IMCcode");
    var Phone = document.getElementById("Phone");
    var Fax = document.getElementById("Fax");
    var email = document.getElementById("email");
    var Address = document.getElementById("Address");
    
    
    
    
    importer.addEventListener("keyup", function(event) {
       if (event.keyCode === 13) {
          event.preventDefault();
          document.getElementById("imc_subBtn").click();
       }
    });
    manufacturer.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    Country.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    IMCcode.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    Phone.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    Fax.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    email.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });
    Address.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("imc_subBtn").click();
        }
     });

function  getIMCCodeList(){
	
	 $.ajax({
		                url: 'controller/DrugContrller.jsp?action=getIMCCodes',
		                type: 'GET',
		                processData: false,
		                contentType: false,
		                cache: false,
		                data: $('#imcForm').serialize(), // added data type
		                success: function (data) {
							
							//setIMCCodeListInISD(data);
							setLocalImcCode();
							storeIMCDataSummary();
                        window.location.href = '#step-2';
		                },
		                error: function (e) {
		                }
		            });
}


 
	function setIMCCodeListInISD(data){
		  div = document.getElementById("isd_IMC");
		    div.options.length = 0;
			AddOptionInUpdate(div,"Select IMC Code","Select IMC Code")
			for(let i = 0; i < data.length ; i++){
		        AddOptionInUpdate(div,data[i],data[i])
			}
	}
	
	function AddOptionInUpdate(selectbox,text,value)
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
  
  