<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="drugfilter.model.User"%>
<%@page import="drugfilter.controller.DrugController"%>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IMPASL Drug | ISD Data Form Basic</title>
    <link
            type="text/css"
            href="vendor/@fortawesome/fontawesome-free/css/all.min.css"
            rel="stylesheet"
    />

    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
    <link href="dist-assets/css/swipe.css" rel="stylesheet">
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css" />
    
    <style>
::-webkit-datetime-edit-year-field:not([aria-valuenow]),
::-webkit-datetime-edit-month-field:not([aria-valuenow]),
::-webkit-datetime-edit-day-field:not([aria-valuenow]) {
    color: transparent;
}
</style>

</head>
<body>
<%
User user = (User)session.getAttribute("name");
String loginName = " ";

if(user == null){
	
	out.println("Please Login");
	loginName = "Nouser";
	response.sendRedirect("index.jsp");
	
}else{


/* System.out.println(user.getName()); */
loginName = user.getName();
}

List<String> manufacturerList = DrugController.getManufactures();
/* System.out.println(manufacturerList.toString()); */

List<String> importersList = DrugController.getImporters();

List<String> imcCodeList = DrugController.getIMCCodes();


 String imc_code = request.getParameter("IMC");
 
/*  System.out.println("mEE"+imc_code); */

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
		<a class="nav-link   {{request() -> is('/IMCForm2.jsp') ? 'active' : null }}"  href="IMCForm2.jsp" role="tab">IMC Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link   active {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDForm2.jsp" role="tab">ISD Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  {{request () -> is('/ATCForm1.jsp') ? 'active' : null }}" href="ATCForm1.jsp" role="tab">ATC Form</a>
	</li>
	
</ul><!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane {{request() ->is('/IMCForm2.jsp') ? 'active' : null }}" id="{{url('/IMCForm2.jsp')}}" role="tabpanel">
		<p>IMC Form</p>
	</div>
	<div class="tab-pane {{request() ->is('/ISDForm2.jsp') ? 'active' : null }}" id="{{url('/ISDForm2.jsp')}}" role="tabpanel">
		<p>ISD Form</p>
	</div>
	<div class="tab-pane {{request() ->is('/ATCForm1.jsp') ? 'active' : null }}" id="{{url('/ATCForm1.jsp')}}" role="tabpanel">
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
                                <h1 class="mb-0 h5">DRUG INFORMATION ENTRY - ISD FORM</h1>
                            </div>
              
                            <form id="unasampor" name="unasampor" action="#">
                            
                                <!-- Form --> <div class="input-group">
                    
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Generic"
                                               id="Generic"
                                               name="Generic"
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
                                               placeholder="Generic2"
                                               id="Generic2"
                                               name="Generic2"
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
                                               placeholder="Generic3"
                                               id="Generic3"
                                               name="Generic3"
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
                                               placeholder="Brand"
                                               id="Brand"
                                               name="Brand"
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
                                               placeholder="Dosage Form"
                                               id="Dosage"
                                               name="Dosage"
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
                                               placeholder="Strength (mg, G etc.)"
                                               id="Strength"
                                               name="Strength"
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
                                       <!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="IMC"
                                               id="IMC"
                                               name="IMC"
                                               required
                                        /> -->
                                           <select class="form-control" id="IMC" name="IMC" onchange="getImporterDetails(this.value);">
                                            <option value="Select IMC Code" disabled selected hidden>Select IMC Code</option>
                                              <%for(String imc : imcCodeList){ %>
                                             <option value="<%=imc%>"><%=imc%></option>
                                                 <%} %>
                                             </select>
                                        
                                    </div>
                                </div>
                                </div>
                                
                                  <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="Importer"
                                               name="Importer"
                                               required
                                               disabled="disabled"
                                        /> 
                                        
                                          <%--  <select class="form-control" id="Importer" name="Importer">
                                            <option value="Select Importer" disabled selected hidden>Select Importer</option>
                                              <%for(String importer : importersList){ %>
                                             <option value="<%=importer%>"><%=importer%></option>
                                                 <%} %>
                                             </select> --%>
                                    </div>
                                </div>
                                </div>
                                
                                       
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
                                               id="Manufacturer"
                                               name="Manufacturer"
                                               required
                                               disabled
                                        />
                                        
                                         <%--   <select class="form-control"  id="manufacturer" name="Manufacturer" >
                                             <option  value="Select Manufacturer" disabled selected hidden>Select Manufacturer</option>
                                              <%for(String manu : manufacturerList){ %>
                                                <option value="<%=manu%>"><%=manu%></option>
                                                 <%} %>
                    
                                             </select> --%>
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
                                               placeholder="Reg Exp Date"
                                               id="RegExpDate"
                                               name="RegExpDate"
                                               onfocus="(this.type='date')" onfocusout="(this.type='text')"
                                               required
                                        /> 
                                       <!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
                                    </div>
                                </div>
                                </div>
                                
                                
                                
                                
                               
        
  
                                   
                                     <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                       <!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="Importer"
                                               name="Importer"
                                               required
                                        /> -->
                                        
                                           <select class="form-control" id="Schedule" name="Schedule">
                                             <option value="Select Schedule" disabled selected hidden>Select Schedule</option>
                                             <option value="NONE">NONE</option>
                                              <option value="I">I</option>
                                              <option value="IIB">IIB</option>
                                              <option value="IIA">IIA</option>
                                              <option value="III">III</option>
                                              <option value="IIIN">IIIN</option>
                                              <option value="IV">IV</option>
                                               <option value="V">V</option>
                                             </select>
                                    </div>
                                </div>
                                </div>
                                 
                             
                                
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
                                               required
                                        />
                                    </div>
                                </div>
                                </div>
                                
                                <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                       <!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Notes"
                                               id="Notes"
                                               name="Notes"
                                               required
                                        /> -->
                                          <textarea class="form-control" placeholder="Notes" id="Notes"   name="Notes" rows="3"  required></textarea>
                                    </div>
                                </div>
                                </div>
                                
                                <br>
                               
                     <center><input type="button" class="btn btn-primary" id="subBtn" value="Next">
              
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
<script src="dist-assets/js/custom/entry_forms_local_values.js"></script>
<script>

    var pass;
    var repass;
    
    var userCap;
    var realCap;
 
  
    var isG1 = false;
    var isG2 = false;
    var isG3 = false;
    var isB = false;
    var isD = false;
    var isS = false;
    var isCode = false;
    var isDate = false;
    var isSheudle = false;
    var isCountry = false;
 
    
  
    
    $('#subBtn').click(function () {


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
                
                if (sx.placeholder == 'Generic') {
   					
               	 console.log("Value"+sx.value);
                   if (sx.value.length == 0) {
                       $(sx).addClass('is-invalid');
                       
                       isG1= false;
                   } else {
                       isG1 = true;
                   }
                 
               }
                
                if (sx.placeholder == 'Generic2') {
   					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isG2= false;
                      } else {
                          isG2 = true;
                      }
                    
                  }
                if (sx.placeholder == 'Generic3') {
   					
                 	 console.log("Value"+sx.value);
                     if (sx.value.length == 0) {
                         $(sx).addClass('is-invalid');
                         
                         isG3= false;
                     } else {
                         isG3 = true;
                     }
                   
                 }
                
                if (sx.placeholder == 'Brand') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isB= false;
                    } else {
                        isB = true;
                    }
                  
                }
              
                if (sx.placeholder == 'Dosage Form') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isD= false;
                    } else {
                        isD = true;
                    }
                  
                }
              
                if (sx.placeholder == 'Strength (mg, G etc.)') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isS= false;
                    } else {
                        isS = true;
                    }
                  
                }
              
                if (sx.placeholder == 'Select IMC Code') {
   					
               	 console.log("Value"+sx.value);
                   if (sx.value == 'Select IMC Code') {
                       $(sx).addClass('is-invalid');
                       
                       isCode= false;
                   } else {
                	   isCode = true;
                   }
                 
               }
             
                if (sx.placeholder == 'Reg Exp Date') {
   					
                  	 console.log("Value"+sx.value);
                      if (sx.value == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isDate= false;
                      } else {
                    	  isDate = true;
                      }
                    
                  }
                
                if (sx.placeholder == 'Country') {
   					
                 	 console.log("Value"+sx.value);
                     if (sx.value.length == 0) {
                         $(sx).addClass('is-invalid');
                         
                         isCountry= false;
                     } else {
                    	 isCountry = true;
                     }
                   
                 }
                 if (sx.name== 'Schedule') {
    					
                 	 console.log("Value1111"+sx.value);
                     if (sx.value == 'Select Schedule') {
                    	
                    	  $(sx).addClass('is-invalid');
                    	  isSheudle= false;
                    	 
                     } else {
                    	 isSheudle = true;
                     }
                   
                 }
                 if (sx.name== 'IMC') {
 					
                 	 console.log("Value1111"+sx.value);
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
 */console.log("hiii");
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=saveIsdtable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#unasampor').serialize(), // added data type
                success: function (data) {

                	console.log(data);
                    check(data);

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
 
    $('#manufacturer').on('keypress', function (event) {
      //  var regex = new RegExp("^[a-z A-Z]+$");
      //  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
   			
      
      console.log("I have clicked");
      
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

            if (data == 'false') {
                $('#subBtn').show();
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
                        window.location.href = 'ATCForm1.jsp';
                        
                         var generic = document.getElementById("Generic").value
                        
                        storeISDGeneric(generic);
                    });
                	 
                   // $('#subBtn').show(); 
                    console.log("okkkk");
                    
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
  		
  		console.log(value);
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=test',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	  console.log("ddd"+data);
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
			
        	  console.log("ddd"+data);
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
			
        	  console.log("ddd"+data);
        	  document.getElementById("Country").value = data;
          	
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
     var Importer = document.getElementById("Importer");
     var Manufacturer = document.getElementById("Manufacturer");
     var RegExpDate = document.getElementById("RegExpDate");
     var Country = document.getElementById("Country");
     var Notes = document.getElementById("Notes");
     
     
     
     Generic.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
           event.preventDefault();
           document.getElementById("subBtn").click();
        }
     });
     Generic2.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     Generic3.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     Dosage.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     Strength.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     Importer.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     Manufacturer.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     RegExpDate.addEventListener("keyup", function(event) {
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
     Notes.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
    
   window.onload = setLocalImcCode(); 
    
</script>
</html>



