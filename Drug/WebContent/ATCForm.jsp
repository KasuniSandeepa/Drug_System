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
<%@ page import="drugfilter.model.ATC_Model"%>
<%@ page import="drugfilter.model.User"%>
<%@page import="drugfilter.controller.DrugController"%>

<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IMPASL Drug | ATC Data Form</title>
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
List<String> genericList = DrugController.getAllGenerics();

List<String> importersList = DrugController.getImporters();

List<String> imcCodeList = DrugController.getIMCCodes();

List<ATC_Model> atcList = DrugController.GetAllFromATC();


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
		<a class="nav-link   {{request() -> is('/IMCForm1.jsp') ? 'active' : null }}"  href="IMCForm1.jsp" role="tab">IMC Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link    {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDForm2.jsp" role="tab">ISD Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  active {{request () -> is('/ATCForm.jsp') ? 'active' : null }}" href="ATCForm.jsp" role="tab">ATC Form</a>
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
                                <h1 class="mb-0 h5">DRUG INFORMATION ENTRY - ATC FORM</h1>
                            </div>
              
                            <form id="atcForm" name="atcForm" action="#">
                            
                                <!-- Form --><!--  <div class="input-group">
                    
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text" id="basic-addon3"
                          ><span class="fas fa-user"></span
                          ></span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Chemical"
                                               id="Chemical"
                                               name="Chemical"
                                               required
                                        />
                                    </div>
                                </div>
                                </div> -->
                                <!-- End of Form -->
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
                                           <select class="form-control" id="Chemical" name="Chemical">
                                            <option value="Select Chemical" disabled selected hidden>Select Chemical</option>
                                              <%for(String generic : genericList){ %>
                                             <option value="<%=generic%>"><%=generic%></option>
                                                 <%} %>
                                             </select>
                                        
                                    </div>
                                </div>
                                </div>
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
                                               placeholder="Pharmo Class"
                                               id="PharmoClass"
                                               name="PharmoClass"
                                               required
                                        /> -->
                                        <select class="form-control" id="PharmoClass" name="PharmoClass">
                                            <option value="Select Pharmo Class" disabled selected hidden>Select Pharmo Class</option>
                                              <%for(ATC_Model atc : atcList){ %>
                                             <option value="<%=atc.getPHARMO_CLASS()%>"><%=atc.getPHARMO_CLASS()%></option>
                                                 <%} %>
                                             </select>
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
                                               placeholder="Therapeutic Class"
                                               id="TherapeuticClass"
                                               name="TherapeuticClass"
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
                                               placeholder="Clinical Class"
                                               id="ClinicalClass"
                                               name="ClinicalClass"
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
                                               placeholder="Anatomical Class"
                                               id="AnatomicalClass"
                                               name="AnatomicalClass"
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
                                               placeholder="ATC Code"
                                               id="ATCCode"
                                               name="ATCCode"
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
                                               placeholder="Cautionary Label"
                                               id="CautionaryLabel"
                                               name="CautionaryLabel"
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
                                               placeholder="Adverse Effects"
                                               id="AdverseEffects"
                                               name="AdverseEffects"
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
                                               placeholder="Notes"
                                               id="Notes"
                                               name="Notes"
                                               required
                                        /> -->
                                          <textarea class="form-control" placeholder="Notes" id="ATC_Notes"   name="AtcNotes" rows="3"  required></textarea>
                                    </div>
                                </div>
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
 
  
    var isChemical = false;
    var isPharmo = true;
    var isTherap = false;
    var isClinical = false;
    var isAnatomical = false;
    var isATCCode = false;
    var isCautLbl = false;
    var isAddEff = false;
   
 
    
  
    
    $('#subBtn').click(function () {


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
	            
               
            /*   /*   if (sx.value == 'Select Pharmo Class') {
   					
                  	/*  console.log("Pharmo Class"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isPharmo= false;
                      } else {
                    	  isPharmo = true;
                      } */
                      
                 	/*  console.log("Value111"+sx.value);
                      if (sx.value == 'Select Pharmo Class') {
                          $(sx).addClass('is-invalid');
                          
                          isPharmo= false;
                      } else {
                    	  isPharmo = true;
                      } */
                	// isPharmo= false;
                //  } 
                 
                
                if (sx.placeholder == 'Therapeutic Class') {
   					
                 	 console.log("Therapeutic Class"+sx.value);
                     if (sx.value.length == 0) {
                         $(sx).addClass('is-invalid');
                         
                         isTherap= false;
                     } else {
                    	 isTherap = true;
                     }
                   
                 }
                
                if (sx.placeholder == 'Clinical Class') {
   					
                	 console.log("Clinical Class"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isClinical= false;
                    } else {
                    	isClinical = true;
                    }
                  
                }
              
                if (sx.placeholder == 'Anatomical Class') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isAnatomical= false;
                    } else {
                    	isAnatomical = true;
                    }
                  
                }
              
                if (sx.placeholder == 'ATC Code') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0 || sx.value.length > 15) {
                        $(sx).addClass('is-invalid');
                        
                        isATCCode= false;
                    } else {
                    	isATCCode = true;
                    }
                  
                }
              
                if (sx.placeholder == 'Cautionary Label') {
   					
               	 console.log("Value"+sx.value);
                   if (sx.value == 'Select IMC Code') {
                       $(sx).addClass('is-invalid');
                       
                       isCautLbl= false;
                   } else {
                	   isCautLbl = true;
                   }
                 
               }
             
                if (sx.placeholder == 'Adverse Effects') {
   					
                  	 console.log("Adverse Effects"+sx.value);
                      if (sx.value == 0) {
                          $(sx).addClass('is-invalid');
                          isAddEff= false;
                      } else {
                    	  isAddEff = true;
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
         
         console.log("isChemical: "+isChemical)
         if ( isChemical && isPharmo  && isTherap && isClinical && isAnatomical  && isATCCode && isCautLbl && isAddEff) {
        	 
        	

   
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

                	console.log(data);
                    check(data);

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
                      window.location = 'ATCForm.jsp';
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
           document.getElementById("subBtn").click();
        }
     });
     TherapeuticClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     ClinicalClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     AnatomicalClass.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     ATCCode.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     CautionaryLabel.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     AdverseEffects.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     ATC_Notes.addEventListener("keyup", function(event) {
         if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("subBtn").click();
         }
      });
     
     window.onload = setLocalGeneric();
    
    
</script>
</html>



