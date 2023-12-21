<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="drugfilter.controller.DrugController"%>
<%@ page import="drugfilter.model.*"%>
<%@ page import="drugfilter.model.User"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IMPASL Drug | IMC Data Form</title>
    <link
            type="text/css"
            href="vendor/@fortawesome/fontawesome-free/css/all.min.css"
            rel="stylesheet"
    />

    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
    <link href="dist-assets/css/swipe.css" rel="stylesheet">
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css" />
    
    

</head>
<body>
<%
StringBuffer sb=new StringBuffer();  
for(int i=1;i<=5;i++)  
{  
    sb.append((char)(int)(Math.random()*79+23+7));  
}  
String cap=new String(sb);

%>

<%
User user = (User)session.getAttribute("name");
String loginName = " ";

if(user == null){
	
	out.println("Please Login");
	loginName = "Nouser";
	response.sendRedirect("index.jsp");
	
}else if(user.getRole().equals("user")){
	
	out.println("Please Login");
	loginName = "Nouser";
	
	
	response.sendRedirect("index.jsp");
	%>
	<script type="text/javascript">
	
	alert("You do not have permission");
	
	</script>
	<% 
	
}else{


/* System.out.println(user.getName()); */
loginName = user.getName();
}




%>
<div class="app-admin-wrap layout-sidebar-large">

    
<div class="mt-3 sidenav-open d-flex flex-column">

 <div>
    <center><h1>Drug Index</h1></center>
    
    <div class="mt-3 text-right" style="margin-top: -45px !important; padding:20px"><a  class="text-muted" href="controller/LoginController.jsp?action=logout">
       <u>Log Out</u></a></div>
    </div>
</div>
    
<div class="auth-layout-wrap" >

  <div class="col-md-12 mb-4">
                    <div class="card text-left">
                        <div class="card-body">
                        
    <div class="container">
    <ul class="nav nav-tabs" role="tablist">
	<li class="nav-item">
		<a class="nav-link   active {{request() -> is('/IMCForm1.jsp') ? 'active' : null }}"  href="IMCForm1.jsp" role="tab">IMC Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDForm2.jsp" role="tab">ISD Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  {{request () -> is('/ATCForm.jsp') ? 'active' : null }}" href="ATCForm.jsp" role="tab">ATC Form</a>
	</li>
	
</ul><!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane {{request() ->is('/IMCForm1.jsp') ? 'active' : null }}" id="{{url('/IMCForm1.jsp')}}" role="tabpanel">
		<p>IMC Form</p>
	</div>
	<div class="tab-pane {{request() ->is('/ISDForm2.jsp') ? 'active' : null }}" id="{{url('/ISDForm2.jsp')}}" role="tabpanel">
		<p>ISD Form</p>
	</div>
	<div class="tab-pane {{request() ->is('/ATCForm.jsp') ? 'active' : null }}" id="{{url('/ATCForm.jsp')}}" role="tabpanel">
		<p>ATC Form</p>
	</div>
	
</div>
</div>


    <div class="auth-content">

        <div class="card o-hidden">

            <div class="col-md-9 ml-auto mr-auto">

                    <div class="row gx-0 align-items-center justify-content-between">
                        <div class="col-12">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <img class="pt-1" src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" style="width: 10%"
                                     id="logo-sprig" alt=""/>
                                  <br>	<br>	  
                                <h1 class="mb-0 h5">DRUG INFORMATION ENTRY - IMC FORM</h1>
                            </div>
              
                            <form id="imcForm" name="imcForm" action="#">
                            
                                <!-- Form --> <div class="input-group">
                    
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="importer"
                                               name="Importer"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                           <div class="input-group">
                           
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Manufacturer"
                                               id="manufacturer"
                                               name="Manufacturer"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                          <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Country"
                                               id="Country"
                                               name="Country"
                                             onkeyup="this.value = this.value.toUpperCase();"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                        <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="IMCcode"
                                               id="IMCcode"
                                               name="IMCcode"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                            <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                      <!--   <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Address"
                                               id="Address"
                                               name="Address"
                                               required
                                        /> -->
                                         <textarea class="form-control" placeholder="Address" id="Address"   name="Address" rows="3"  required></textarea>
                                    </div>
                                </div>
                                </div>
                                <!-- End of Form -->
                               
                                    <!-- Form -->
                                  <div class="input-group">
                        
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Phone"
                                               id="Phone"
                                               name="Phone"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                    <!-- End of Form -->
                                    <!-- Form -->
                                      <div class="input-group">
                     
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Fax"
                                               id="Fax"
                                               name="Fax"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                    <!-- End of Form -->
                                     <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="email"
                                               id="email"
                                               name="email"
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                   
                                    <br>
                                    <div>
                                    
									
                                </div>
                                <br>
                               
                     <center><input type="button" class="btn btn-primary" id="subBtn" value="Submit">
              
  						<input type="button" class="btn btn-primary" value="Clear" onclick="window.location.reload();"></center>
                                <%--                               ss?--%>
                                <div style="padding-bottom: 25px !important;" id="loader" class='d-none contain'>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                    <svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20' fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
                                </div>

                                <%--                               ss?--%>
                            </form>
                            
                            <div
                                    class="d-flex justify-content-center align-items-center mt-4"
                            >
<%--                      <span class="font-weight-normal">--%>
<%--                        Already have an account?--%>
<%--                        <a--%>
<%--                                href="sign-in.jsp"--%>
<%--                                class="font-weight-bold"--%>
<%--                        >Sign-in here</a--%>
<%--                        >--%>
<%--                      </span>--%>
                            </div>
                        </div>
                    </div>


            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>

<script>

    var pass;
    var repass;
    
    var userCap;
    var realCap;
 
    var isCode = false;
    var isA = false;
    var isC = false;
    var isMan = false;
    var isI = false;
    var isM = false;
    var isE = false;
    var isN = false;
    var isP = false;
    var isPS = false;
    var isP1 = false;
    var isT = false;
    var isPass = false;
    var isCap = false;
    var isF = false;
    
  
    
    $('#subBtn').click(function () {


        var x = document.forms["imcForm"];
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
				console.log("email "+ sx.value);
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
                
                if (sx.placeholder == 'Fax') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isF = false;
                    } else {
                    	isF = true;
                    }
                }
                
                 if (sx.placeholder == 'Importer') {
					
                	 console.log("Value Importer"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isI = false;
                    } else {
                        isI = true;
                    }
                  
                }
                 
                 if (sx.placeholder == 'Manufacturer') {
 					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isMan = false;
                    } else {
                        isMan = true;
                    }
                  
                }
                 
                 if (sx.placeholder == 'Country') {
  					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isC = false;
                    } else {
                        isC = true;
                    }
                  
                }
                 
                 if (sx.placeholder == 'IMCcode') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0 || sx.value.length > 15) {
                        $(sx).addClass('is-invalid');
                        
                        isCode = false;
                    } else {
                        isCode = true;
                    }
                  
                }
                 
                 if (sx.placeholder == 'Address') {
    					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isA = false;
                    } else {
                        isA= true;
                    }
                  
                }
 
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
       

         if ( isE && isM && isF && isI && isCode && isC && isMan && isA) {

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
 */console.log("hiii");
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=saveImctable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#imcForm').serialize(), // added data type
                success: function (data) {

                	console.log(data);
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
    	}/*else if(!isPass){
        		swal({
                    type: 'error',
                    title: 'Registration Failed! Weak Password',
                    text: 'Password Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	}else if(!isT){
        		swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please accept the terms and conditions',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	}else if(!isCap){
        		swal({
                    type: 'error',
                    title: 'Registration Failed!',
                    text: 'Please enter the captcha code correctly',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                }); 
        	}*/
        } 

    });

/*     $('#manufacturer').on('keypress', function (event) {
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
    });
 
 */    /*
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
 

    function check(data) {
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

            if (data == 'EXE') {
                $('#subBtn').show();
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
                        window.location = 'IMCForm1.jsp';
                    });
                    $('#subBtn').show(); 
                    console.log("okkkk");
                    
                    
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
          document.getElementById("subBtn").click();
       }
    });
    manufacturer.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    Country.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    IMCcode.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    Phone.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    Fax.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    email.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
    Address.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });


  
    
</script>
</html>



