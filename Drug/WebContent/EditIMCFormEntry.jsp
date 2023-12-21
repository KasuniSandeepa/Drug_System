<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="drugfilter.model.*"%>
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
    <title>IMPASL Drug | Edit IMC Data Form</title>
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

#deletebtn{
 background-color: #ea1c0d !important; 


}

 .dropbtn {
	background-color: #9c27b0;
	color: white;
	height:43px;
	
	/* font-size: 16px;
  border: none;*/
	cursor: pointer;
border-top-right-radius: 6px;
border-bottom-right-radius: 6px;
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
	width: 382px;
}

#myInput:focus {
	outline: 3px solid #ddd;
}

#myInput_c {
	box-sizing: border-box;
	background-image: url('searchicon.png');
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
	border-bottom: 1px solid #ddd;
	width: 382px;
}

#myInput_c:focus {
	outline: 3px solid #ddd;
}

#myInputISDGeneric {
	box-sizing: border-box;
	background-image: url('searchicon.png');
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
	border-bottom: 1px solid #ddd;
	width: 382px;
}

#myInputISDGeneric:focus {
	outline: 3px solid #ddd;
}

#myInput_m {
	box-sizing: border-box;
	background-image: url('searchicon.png');
	background-position: 14px 12px;
	background-repeat: no-repeat;
	font-size: 16px;
	padding: 14px 20px 12px 45px;
	border: none;
	border-bottom: 1px solid #ddd;
	width: 382px;
}

#myInput_m:focus {
	outline: 3px solid #ddd;
}


.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f6f6f6;
	/*background-color: #f6f6f6;
	//min-width: 23px;
	overflow: auto;
	border: 2px solid #ddd;
	z-index: 2; */
	width: 382px;
	height:450px;
	border: 2px solid #ddd;
	overflow: auto;
	z-index: 70;
	margin-left: 149px;
}

.dropdown-content option {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content option:hover {
	background-color: #ddd;
	cursor: pointer;
}

.show {
	display: block;
}

.dropdown-content-country {
	display: none;
	position: absolute;
	background-color: #f6f6f6;
	/*background-color: #f6f6f6;
	//min-width: 23px;
	overflow: auto;
	border: 2px solid #ddd;
	z-index: 2; */
	width: 382px;
	height:400px;
	border: 2px solid #ddd;
	overflow: auto;
	z-index: 70;
	margin-left: 149px;
}

.dropdown-content-country option {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content-country option:hover {
	background-color: #ddd;
	cursor: pointer;
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
		
	
		String seno = request.getParameter("seno");
		String importer = request.getParameter("importer");
		String manufacturer = request.getParameter("manufacturer");
		String country = request.getParameter("country");
		String imcnew = request.getParameter("imcnew");
		String imccode = request.getParameter("imccode");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String fax = request.getParameter("fax");
		String email = request.getParameter("email");
		String registred_date = request.getParameter("registred_date");
		String registred_user = request.getParameter("registred_user");
		String status = request.getParameter("status");
%>
<div class="app-admin-wrap layout-sidebar-large">
<div class="mt-3 sidenav-open d-flex flex-column">
 <div>
    <center><h1>Drug Index</h1></center>
    
    <div class="mt-3 text-right" style="margin-top: -45px !important; padding:20px"><a  class="text-muted" href="controller/LoginController.jsp?action=logout">
                        <u>Log Out</u></a></div>
                        
                        
                    </div>
<div class="auth-layout-wrap" >

  <div class="col-md-12 mb-4">
  
                    <div class="card text-left">
                        <div class="card-body"  id="mainBody">


                <div  class="container" style="align:left" >
                <div>
    <ul class="nav nav-tabs" role="tablist">
	<li class="nav-item">
		<a class="nav-link    active  {{request() -> is('/IMCForm1.jsp') ? 'active' : null }}"  href="IMCRecords.jsp" role="tab">IMC Data Entry</a>
	</li>
	<li class="nav-item">
		<a class="nav-link   {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDRecords.jsp" role="tab">ISD Data Entry</a>
	</li>
	<li class="nav-item">
		<a class="nav-link {{request () -> is('/ATCForm.jsp') ? 'active' : null }}" href="ATCRecords.jsp" role="tab">ATC Data Entry</a>
	</li>
	
</ul><!-- Tab panes -->
<div class="tab-content">
	<div class="tab-pane {{request() ->is('/IMCForm1.jsp') ? 'active' : null }}" id="{{url('/IMCForm1.jsp')}}" role="tabpanel">
		<p>IMC Approval</p>
	</div>
	<div class="tab-pane {{request() ->is('/ISDForm2.jsp') ? 'active' : null }}" id="{{url('/ISDForm2.jsp')}}" role="tabpanel">
		<p>ISD Approval</p>
	</div>
	<div class="tab-pane {{request() ->is('/ATCForm.jsp') ? 'active' : null }}" id="{{url('/ATCForm.jsp')}}" role="tabpanel">
		<p>ATC Approval</p>
	</div>
	
</div>
</div>
</div>
    <div class="auth-content">
        <div class="card o-hidden">

            <div class="col-md-12 ml-auto mr-auto">

                    <div class="row gx-0 align-items-center justify-content-between">
                        <div class="col-12">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <img class="pt-1" src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" style="width: 10%"
                                     id="logo-sprig" alt=""/>
                                  <br>	<br>	  
                                <h1 class="mb-0 h5">DRUG INFORMATION UPDATE - IMC FORM</h1>
                            </div>
              
                              <form id="imcform" name="imcform" action="#">
                            
                                <!-- Form --> <div class="input-group">
                    
                                <div class="form-group mb-2 col-md-12">
                                
                                <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                                    placeholder="seno"
                                               id="seno"
                                               name="seno"
                                                  value="<%=seno%>"
                                                  hidden
                                               required
                                        />
                                
                               
                                    </div>
                            
                                <!-- End of Form -->
                        
                                <!-- Form -->
                          <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Importer</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="importer"
                                               name="Importer"
                                                value="<%=importer%>"
                                                	onchange="generateImcCode();"
                                               required
                                        />
                                        <div class="dropdown" >
																				<input type="button" class="dropbtn" onclick="myFunction()"
																					style="width: 1 px;" value="Select"/>
																			
																			</div>
                                    </div>
                                    	<div id="myDropdown" class="dropdown-content" >
																			<input type="text" placeholder="Search.."
																				id="myInput" onkeyup="filterFunction()" onkeydown="removeValidation()"
																				>
																			<!--  <select>
    <option value="">Select the Importer</option> -->
																			<%
																			List<IMC> IMCList;
																			IMCList = DrugController.GetAllFromIMC();
																			List<String> importerList = new ArrayList();

																			for (IMC imc : IMCList) {
																				if (importerList.contains(imc.getIMPORTER())) {
																					//do nothing
																				} else {
																					if(imc.getSTATUS().equals("1")){
																					importerList.add(imc.getIMPORTER());
																					}
																				}
																			}
																			for (String i : importerList) {
																			%>

																			<%--   <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a> --%>
																			<option value="<%=i%>"
																				onclick="setImporter(this.value);hideDropDown();generateImcCode();"><%=i%></option>
																			<%
																			}
																			%>
																			<!--  </select> -->

																		</div>
                                    
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                        <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span 
                          >Manufacturer</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Manufacturer"
                                               id="manufacturer"
                                               name="Manufacturer"
                                               value="<%=manufacturer%>"
                                               	onchange="generateImcCode();"
                                               required
                                        />
                                        <div class="dropdown">
																				<input type="button" onclick="myFunction_m()" class="dropbtn" value="Select"/>
																			
																			</div>
                                    </div>
                                    <div id="myDropdown_m" class="dropdown-content">
																			<input type="text" placeholder="Search.."
																				id="myInput_m" onkeyup="filterFunction_m()"> 
																			<!--  <select id="myInput_m" placeholder="Search.."
																						onchange="setManufacturer(this.value)"
																						onkeyup="filterFunction_m()">
																					</select>  -->
																					
																					<%
																			List<IMC> IMCListAll;
																			IMCListAll = DrugController.GetAllFromIMC();
																			List<String> manufacturerList = new ArrayList();

																			for (IMC manufact : IMCListAll) {
																				if (manufacturerList.contains(manufact.getMANUFACTURER())) {
																					//do nothing
																				} else {
																					if(manufact.getSTATUS().equals("1")){
																						manufacturerList.add(manufact.getMANUFACTURER());
																					}
																				}
																			}
																			for (String man : manufacturerList) {
																			%>

																			<%--   <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a> --%>
																			<option value="<%=man%>"
																				onclick="setManufacturer(this.value);hideManufacturerDropDown();generateImcCode();"><%=man%></option>
																			<%
																			}
																			%>
																

																		</div>
                                </div>
                                </div>
                                <!-- End of Form -->
                                <!-- Form -->
                            <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span 
                          >Country</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Country"
                                               id="Country"
                                               name="Country"
                                               onchange="generateImcCode();"
                                               onkeyup="this.value = this.value.toUpperCase();"
                                                value="<%=country%>"
                                               required
                                        /> 
                                        <div class="dropdown">
																				<input type="button" onclick="myFunction_c()" class="dropbtn" value="Select">
																				
																			</div>
                                        
                                    </div>
                                    	<div id="myDropdown_c" class="dropdown-content-country">
																		<input type="text" placeholder="Search.." id="myInput_c" onkeyup="filterFunction_c()"> 
																
																			<!-- <select id="myInput_c" placeholder="Search.."
																						onchange="setCountry(this.value)">
																					</select> -->
																		</div>
                                </div>
                                </div>
                                <!-- End of Form -->
                               
                                    <!-- Form -->
                                  <div class="input-group">
                        
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >IMC Code</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="IMCcode"
                                               id="IMCcode"
                                               name="IMCcode"
                                               value="<%=imccode%>"
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
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Address</span>
                                         <textarea class="form-control" placeholder="Address" id="Address"   name="Address" rows="3"  value="<%=address%>" required><%=address%></textarea>
                                        
                                         
                                    </div>
                                </div>
                                </div>
                                
                                       
                               <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Phone</span>
                                         <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Phone"
                                               id="Phone"
                                               name="Phone"
                                               value="<%=phone%>"
                                               required
                                              
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
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Fax</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Fax"
                                               id="Fax"
                                               name="Fax"
                                              
                                               value="<%=fax%>"
                                               required
                                        /> 
                                       <!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
                                    </div>
                                </div>
                                </div>
                                
                                
                                
                                
                               
        
  
                                   
                                    
                             
                           
                                
                                <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Email</span>
                                       <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="email"
                                               id="email"
                                               name="email"
                                               value="<%=email%>"
                                               required
                                        />
                                         
                                    </div>
                                </div>
                                </div>
                                
                                <br>
                                  <input name="c_page" value="imc_update" hidden>
                                  
                               
						                     <center><input type="button" class="btn btn-primary" id="subBtn" value="Update">
						               
						  				
						  				     </center>
  						       				
			                            	<div class="mt-3 text-right col-md-10" style="margin-top: -45px !important;   margin-left: 100px ">
                   
			                            	    <input type="button" class="btn btn-primary " id="deletebtn" value="Delete" onclick="deleteIMC()";>
			                            	
			                            	<!--   <input type="button"  class="btn btn-primary " id="approveBtn1"  onclick="disapproveDrug()" value="Approved" style="visibility:hidden"> -->
                    </div>
			                            	
  						
  					      
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
<script src="dist-assets/js/custom/imc_form_signal.js"></script>


<script>

    var pass;
    var repass;
    
    var userCap;
    var realCap;
 
    var isCode = true;
    var isA = true;
    var isC = true;
    var isMan = true;
    var isI = true;
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
   
 
    
  
    
    $('#subBtn').click(function () {


        var x = document.forms["imcform"];
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


    	   /*    if (sx.placeholder == 'email') {
  				console.log("email "+ sx.value);
                      if (!validateEmail(sx.value)) {
                          $(sx).addClass('is-invalid');
                          
                          isE = false;
                      } else {
                          isE = true;
                      }
                  } */
                 /*   if (sx.placeholder == 'Phone') {

                      if (!validateMobile(sx.value)) {
                          $(sx).addClass('is-invalid');
                          
                          isM = false;
                      } else {
                          isM = true;
                      }
                  }  */
               /*    
                  if (sx.placeholder == 'Fax') {

                      if (!validateMobile(sx.value)) {
                          $(sx).addClass('is-invalid');
                          
                          isF = false;
                      } else {
                      	isF = true;
                      }
                  } 
                   */
                   /* if (sx.placeholder == 'Importer') {
  					
                  	 console.log("Value Importer"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isI = false;
                      } else {
                          isI = true;
                      }
                    
                  } */
                   
                /*    if (sx.placeholder == 'Manufacturer') {
   					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isMan = false;
                      } else {
                          isMan = true;
                      }
                    
                  }
                    */
                  /*  if (sx.placeholder == 'Country') {
    					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isC = false;
                      } else {
                          isC = true;
                      }
                    
                  }
                    */
                   /* if (sx.placeholder == 'IMCcode') {
     					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0 || sx.value.length > 15) {
                          $(sx).addClass('is-invalid');
                          
                          isCode = false;
                      } else {
                          isCode = true;
                      }
                    
                  } */
                   
                  /*  if (sx.placeholder == 'Address') {
      					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isA = false;
                      } else {
                          isA= true;
                      }
                    
                  } */
   

       });

        

       console.log(isE)
       console.log(isM)
       console.log(isF)
       console.log(isI)
       console.log(isCode)
        console.log("isSheudle"+isC);
       console.log("isMan"+isMan);
       console.log("isA"+isA);
    
   
        
         if (  isE && isM && isF && isI && isCode && isC && isMan && isA) {

   
 console.log("hiii12345");
           $.ajax({
                url: 'controller/DrugContrller.jsp?action=updateImctable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#imcform').serialize(), // added data type
                success: function (data) {

                	console.log(data);
                    check(data);

                },
                error: function (e) {

                }
            });  
         }
    else{
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
 
   /*  $('#manufacturer').on('keypress', function (event) {
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
        
       
         
        
    }); */
 
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

            if (data == 'EXE') {
                $('#subBtn').show();
                swal({
                    type: 'warning',
                    title: 'Not Updated Something is went wrong',
                    text: 'Data Update is Not Succesfull',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            } else {
                if (data) {
                    
                	swal({
                        type: 'success',
                        title: 'Succesfully Updated',
                        text: '',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function() {
        			    window.location = "IMCRecords.jsp";
	        		  });
                    $('#subBtn').show(); 
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
  	
  	
  	
  	
function approveIMC(){
  		
	
	
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=imc_approved',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#imcform').serialize(), // added data type
          success: function (data) {
			
        	  console.log("ddd"+data);
        	
        	  setTimeout(function () {
        		  swal({
                      type: 'success',
                      title: 'Approved',
                      text: 'You have Approved the Importer',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  }).then(function() {
      			    window.location = "IMCApproval.jsp";
        		  });
        		  
        	  }, 500);
        	  
        
        	
        	  
          	
          },
          error: function (e) {
        	  

          }
      });
  	  
  
  	}
  	
  	
  	
function approveConfirm(data) {
    console.log('res ' + data);
    console.log("kkkkkkkkkkkkkk");
    setTimeout(function () {
        $('#loader').hide();
        console.log("oooooooooooo");
        if (data == 'EXE') {
            $('#approveBtn').show();
            swal({
                type: 'warning',
                title: 'Registration Failed!',
                text: 'Already Registered User',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success'
            });
        } else {
            if (data) {
                console.log("jjjjjjjjjjjjjj");
                 swal({
                    type: 'success',
                    title: 'Approved',
                    text: 'You have approved the drug',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
                $('#approveBtn').show(); 
                console.log("okkkk");
                
            //	 window.location.href = 'ISDForm1.jsp';
                
                
            } else {
                $('#approveBtn').show();
            }
        }
    }, 500);
}
    
    function disapproveIMC(){
  		
    	
    	  $.ajax({
            url: 'controller/DrugContrller.jsp?action=imc_disapprove',
            type: 'GET',
            processData: false,
            contentType: false,
            cache: false,
            data: $('#imcform').serialize(), // added data type
            success: function (data) {
  			
          	  console.log("ddd"+data);
          	  approveConfirm(data);
          	  setTimeout(function () {
          		  swal({
                        type: 'success',
                        title: 'Refused',
                        text: 'You have Refused The Drug',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function() {
        			    window.location = "IMCApproval.jsp";
	        		  });
          		  
          	  }, 500);
          	  
             	
            	
            },
            error: function (e) {
          	  

            }
        });
    	  
  	
    	}
    

    function deleteIMC(){
    	
    	swal({
    		  title: 'Are you sure?',
    		  text: "You won't be able to revert this!",
    		
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: 'Yes, delete it!'
    		}).then((result) => {
    	
    		  if (result == true) {
    		  
    		    $.ajax({
    		          url: 'controller/DrugContrller.jsp?action=deleteIMC',
    		          type: 'GET',
    		          processData: false,
    		          contentType: false,
    		          cache: false,
    		          data: $('#imcform').serialize(), // added data type
    		          success: function (data) {
    					
    		        	  console.log("ddd"+data);
    		        	  approveConfirm(data);
    		        	  setTimeout(function () {
    		        		  swal({
		            		      title: "'Deleted!",
		            	            text: "IMC Record has been deleted.",
		            	            type: "success"
		        		  }).then(function() {
		        			    window.location = "IMCRecords.jsp";
		        		  });
    		        		  
    		        	  }, 500);
    		        	  
    		           	
    		          	
    		          },
    		          error: function (e) {
    		        	  

    		          }
    		      });
    		  }
    		})
  	 
	
  	}
    
    function  deleteDrug1(){
  		
    	
      	const result = function (){swal({
        		  title: 'Are you sure?',
          		  text: "You won't be able to revert this!",
          		  icon: 'warning',
          		  showCancelButton: true,
          		  confirmButtonColor: '#3085d6',
          		  cancelButtonColor: '#d33',
          		  confirmButtonText: 'Yes, delete it!'
          		})
      	}
      	
      	result();
      	
    	
    	if(result.isConfirmed){
    		 $.ajax({
    	          url: 'controller/DrugContrller.jsp?action=deleteDrug',
    	          type: 'GET',
    	          processData: false,
    	          contentType: false,
    	          cache: false,
    	          data: $('#unasampor').serialize(), // added data type
    	          success: function (data) {
    				
    	        	  console.log("ddd"+data);
    	        	  approveConfirm(data);
    	        	  setTimeout(function () {
    	        		  swal({
    	                      type: 'warning',
    	                      title: 'Deleted',
    	                      text: 'You have Rejected The Drug',
    	                      buttonsStyling: false,
    	                      confirmButtonClass: 'btn btn-lg btn-success'
    	                  });
    	        		  
    	        	  }, 500);
    	        	  
    	           	
    	          	
    	          },
    	          error: function (e) {
    	        	  

    	          }
    	      });
    		
    	}
      		
      		
      
  	
    	}
    
    function deleteDrug2(){
    	swal({
    		  title: "Are you sure?",
    		  text: "Your will not be able to recover this imaginary file!",
    		  type: "error",
    		  showCancelButton: true,
    		  confirmButtonClass: "btn-danger",
    		  confirmButtonText: "Yes, delete it!",
    		  closeOnConfirm: false
    		},
    		function(){
    		  swal("Deleted!", "Your imaginary file has been deleted.", "success");
    		});
    }
</script>
</html>



