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
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
    <style>
    
    .dropbtn {
 background-color: #9c27b0; 
  color: white; 
  padding: 8px;
  /* font-size: 16px;
  border: none;*/
  cursor: pointer  
}

.dropbtn:hover, .dropbtn:focus {
  background-color: #663399;
}

#myInput {
  box-sizing: border-box;
  background-image: url('searchicon.png');
  background-position: 14px 12px;
  background-repeat: no-repeat;
  font-size: 16px;
  padding: 14px 20px 12px 45px;
  border: none;
  border-bottom: 1px solid #ddd;
}

#myInput:focus {outline: 3px solid #ddd;}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f6f6f6;
  min-width: 230px;
  overflow: auto;
  border: 1px solid #ddd;
  z-index: 1;
  
}

.dropdown-content option {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown option:hover {background-color: #ddd;  cursor:pointer;}

.show {display: block;}




    </style>
    

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
final List<String> importersList = DrugController.getImporters();




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
		<a class="nav-link   active {{request() -> is('/IMCForm2.jsp') ? 'active' : null }}"  href="IMCForm2.jsp" role="tab">IMC Form</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDForm2.jsp" role="tab">ISD Form</a>
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


    <div class="auth-content"  >

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
                                              autocomplete="off"
                                               required
                                        />
                                        
                                        <div class="dropdown"  style="width:15 px;">
  <button onclick="myFunction()" class="dropbtn" style="width:1 px;">Select</button>
  <div id="myDropdown" class="dropdown-content">
    <input type="text" placeholder="Search.." id="myInput" onkeyup="filterFunction()">
  <!--  <select>
    <option value="">Select the Importer</option> -->
   <%
   List<IMC>  IMCList ;
   IMCList = DrugController.GetAllFromIMC();
   List<String> importerList = new ArrayList();
   
   for(IMC importer : IMCList){
	   if(importerList.contains(importer.getIMPORTER())){
		   //do nothing
	   }else{
	   importerList.add(importer.getIMPORTER());
	   }
   }
   for(String importer : importerList){ %>
  
  <%--   <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a> --%>
    <option value="<%=importer %>" onclick="setImporter(this.value)"><%=importer %></option>
    <%} %>
 <!--  </select> -->
  
  </div>
 
</div>
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
                                               autocomplete="off"
                                               required
                                        />
                                                                              <div class="dropdown">
  <button onclick="myFunction_m()" class="dropbtn">Select</button>
  <div id="myDropdown_m" class="dropdown-content">
   <!--  <input type="text" placeholder="Search.." id="myInput_m" onkeyup="filterFunction_m()"> -->
   
   
  
<select id="myInput_m" placeholder="Search.." onchange="setManufacturer(this.value)" onkeyup="filterFunction_m()">
   
    
  </select>
  
  </div>
</div>
       
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
                                             onkeyup="this.value = this.value.toUpperCase(); generateImcCode();"
                                               required
                                        />
                                                                                                                      <div class="dropdown">
  <button onclick="myFunction_c()" class="dropbtn">Select</button>
  <div id="myDropdown_c" class="dropdown-content">
   <!--  <input type="text" placeholder="Search.." id="myInput_m" onkeyup="filterFunction_m()"> -->
   
   
  
<select id="myInput_c" placeholder="Search.." onchange="setCountry(this.value)">
   
    
  </select>
  
  </div>
</div>
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
                                            readonly="readonly"
                                            
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
                               
                     <center><input type="button" class="btn btn-primary" id="subBtn" value="Next">
              
  						<input type="button" class="btn btn-primary" value="Clear" onclick="test();"></center>
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
<script src="dist-assets/js/custom/imc_dropdowns.js"></script>
<script src="dist-assets/js/custom/entry_forms_local_values.js"></script>


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
    	storeIMCCODE( document.getElementById("IMCcode").value)
    	  
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
					window.location.href = 'ISDForm2.jsp';
					
				}
				
			
			console.log("Result : "+data);
             },
             error: function (e) {
             }
         }).then(function() {
		  console.log("nnnnnnnnnnnn"+exe)
    	if(exe == false){
        var x = document.forms["imcForm"];
        console.log("kkkkkkkkkkkkkkkkkkkkkkkkk");
       $.each(x, function (i, sx) {


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
                        
       });

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
    	}
        } 
    	}
    	
    	//the end
         });
    });
    


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
                        window.location = 'ISDForm2.jsp';
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



