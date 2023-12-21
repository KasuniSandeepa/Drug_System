<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="drugfilter.model.ISD"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="drugfilter.model.User"%>
<%@page import="drugfilter.controller.DrugController"%>

<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>IMPASL Drug | Edit ISD Data Form</title>
<link type="text/css"
	href="vendor/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />

<link
	href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900"
	rel="stylesheet">
<link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
<link href="dist-assets/css/swipe.css" rel="stylesheet">
<link rel="stylesheet"
	href="dist-assets/css/plugins/sweetalert2.min.css" />

<style>
::-webkit-datetime-edit-year-field:not([aria-valuenow]), ::-webkit-datetime-edit-month-field:not([aria-valuenow]),
	::-webkit-datetime-edit-day-field:not([aria-valuenow]) {
	color: transparent;
}

#deletebtn {
	background-color: #ea1c0d !important;
}

.dropbtn {
	background-color: #9c27b0;
	color: white;
	height: 43px;
	/* font-size: 16px;
  border: none;*/
	cursor: pointer;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
}

.dropbtn:hover, .dropbtn:focus {
	background-color: #663399;
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
	height: 450px;
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
</style>

</head>
<body>
	<%
	User user = (User) session.getAttribute("name");
	String loginName = " ";

	if (user == null) {

		out.println("Please Login");
		loginName = "Nouser";
		response.sendRedirect("index.jsp");

	} else {

		/* System.out.println(user.getName()); */
		loginName = user.getName();
	}

	List<String> manufacturerList = DrugController.getManufactures();
	/* System.out.println(manufacturerList.toString()); */

	List<String> importersList = DrugController.getImporters();

	List<String> imcCodeList = DrugController.getIMCCodes();

	String imc_code = request.getParameter("IMC");

	String seno = request.getParameter("id");
	String generic = request.getParameter("generic");
	String generic2 = request.getParameter("generic2");
	String generic3 = request.getParameter("generic3");
	String brand = request.getParameter("brand");
	String dosage = request.getParameter("dosage");
	String strength = request.getParameter("strength");
	String imccode = request.getParameter("imc_code");
	String importer = request.getParameter("importer");
	String manufacturer = request.getParameter("manufacturer");
	String expireDate = request.getParameter("expireDate");
	String shedule = request.getParameter("shedule");
	String country = request.getParameter("country");
	String notes = request.getParameter("notes");
	String status = request.getParameter("status");

	ISD isd = DrugController.getISDbyId(seno);
	%>
	<div class="app-admin-wrap layout-sidebar-large">
		<div class="mt-3 sidenav-open d-flex flex-column">
			<div>
				<center>
					<h1>Drug Index</h1>
				</center>

				<div class="mt-3 text-right"
					style="margin-top: -45px !important; padding: 20px">
					<a class="text-muted"
						href="controller/LoginController.jsp?action=logout"> <u>Log
							Out</u></a>
				</div>


			</div>
			<div class="auth-layout-wrap">

				<div class="col-md-12 mb-4">

					<div class="card text-left">
						<div class="card-body" id="main">


							<div class="container" style="align: left">
								<div>
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a
											class="nav-link   {{request() -> is('/IMCForm1.jsp') ? 'active' : null }}"
											href="IMCRecords.jsp" role="tab">IMC Data Entry</a></li>
										<li class="nav-item"><a
											class="nav-link  active {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}"
											href="ISDRecords.jsp" role="tab">ISD Data Entry</a></li>
										<li class="nav-item"><a
											class="nav-link   {{request () -> is('/ATCForm.jsp') ? 'active' : null }}"
											href="ATCRecords.jsp" role="tab">ATC Data Entry</a></li>

									</ul>
									<!-- Tab panes -->
									<div class="tab-content">
										<div
											class="tab-pane {{request() ->is('/IMCForm1.jsp') ? 'active' : null }}"
											id="{{url('/IMCForm1.jsp')}}" role="tabpanel">
											<p>IMC Approval</p>
										</div>
										<div
											class="tab-pane {{request() ->is('/ISDForm2.jsp') ? 'active' : null }}"
											id="{{url('/ISDForm2.jsp')}}" role="tabpanel">
											<p>ISD Approval</p>
										</div>
										<div
											class="tab-pane {{request() ->is('/ATCForm.jsp') ? 'active' : null }}"
											id="{{url('/ATCForm.jsp')}}" role="tabpanel">
											<p>ATC Approval</p>
										</div>

									</div>
								</div>
							</div>
							<div class="auth-content" id="main">
								<div class="card o-hidden">

									<div class="col-md-12 ml-auto mr-auto">

										<div
											class="row gx-0 align-items-center justify-content-between">
											<div class="col-12">
												<div class="text-center text-md-center mb-4 mt-md-0">
													<img class="pt-1"
														src="dist-assets/images/dlf.pt-plus-sign-png-110969.png"
														style="width: 10%" id="logo-sprig" alt="" /> <br> <br>
													<h1 class="mb-0 h5">DRUG INFORMATION UPDATE - ISD FORM</h1>
												</div>

												<form id="unasampor" name="unasampor" action="#">

													<!-- Form -->
													<div class="input-group">

														<div class="form-group mb-2 col-md-12">

															<input onkeydown="removeValidation()" type="text"
																class="form-control" placeholder="seno" id="seno"
																name="seno" value="<%=seno%>" hidden required />

															<div class="input-group">

																<span class="input-group-text col-md-3"
																	id="basic-addon3" STYLE="font-weight: bold"><span
																	class="fas fa-user"></span>Generic</span> <input
																	onkeydown="removeValidation()" type="text"
																	class="form-control" placeholder="Generic" id="Generic"
																	name="Generic" value="<%=generic%>" required />
																<div class="dropdown">
																	<input type="button" onclick="isdGenericDropDown()"
																		class="dropbtn" value="Select" />

																</div>
															</div>
															<div id="myDropdownISDGenericDropDown"
																class="dropdown-content">
																<input type="text" placeholder="Search.."
																	id="myInputISDGeneric"
																	onkeyup="filterISDGenericFunction()">
																<%
																List<String> genericList = DrugController.getAllGenerics();
																for (String gene : genericList) {
																%>
																<option
																	onclick="setISDGeneric(this.value); hideGenericDropDown();"
																	value="<%=gene%>"><%=gene%></option>
																<%
																}
																%>
															</div>
														</div>


														<!-- End of Form -->
														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Generic2</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control" placeholder="Generic2"
																		id="Generic2" name="Generic2" value="<%=generic2%>"
																		required />
																</div>
															</div>
														</div>
														<!-- End of Form -->
														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Generic3</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control" placeholder="Generic3"
																		id="Generic3" name="Generic3" value="<%=generic3%>"
																		required />
																</div>
															</div>
														</div>
														<!-- End of Form -->
														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Brand</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control" placeholder="Brand" id="Brand"
																		name="Brand" value="<%=brand%>" required />
																</div>
															</div>
														</div>
														<!-- End of Form -->
														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Dosage</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control" placeholder="Dosage" id="Dosage"
																		name="Dosage" value="<%=dosage%>" required />

																</div>
															</div>
														</div>
														<!-- End of Form -->

														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Strength</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control"
																		placeholder="Strength (mg, G etc.)" id="Strength"
																		name="Strength" value="<%=strength%>" required />
																</div>
															</div>
														</div>
														<!-- End of Form -->
														<!-- Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>IMC Code</span>
																	<!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="IMC"
                                               id="IMC"
                                               name="IMC"
                                               required
                                        /> -->
																	<select class="form-control" id="IMC" name="IMC"
																		onchange="getImporterDetails(this.value);">
																		<option value="<%=imccode%>"><%=imccode%></option>
																		<%
																		for (String imc : imcCodeList) {
																		%>
																		<option value="<%=imc%>"><%=imc%></option>
																		<%
																		}
																		%>
																	</select>

																</div>
															</div>
														</div>

														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Importer</span>
																	<%--     <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="Importer"
                                               name="Importer"
                                               value="<%=importer%>"
                                               required
                                               disabled="disabled"
                                        />  --%>
																	<select class="form-control" id="isd_Importer"
																		name="Importer">
																		<option value="Select Importer" disabled selected
																			hidden>Select Importer</option>
																		<%--  <%for(String importer : importersList){ %>
                                             <option value="<%=importer%>"><%=importer%></option>
                                                 <%} %> --%>
																		<option value="<%=importer%>" selected><%=importer%></option>
																	</select>

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
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Manufacturer</span>
																	<%--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Manufacturer"
                                               id="Manufacturer"
                                               name="Manufacturer"
                                               value="<%=manufacturer%>"
                                               required
                                               disabled
                                        />
                                         --%>
																	<%--   <select class="form-control"  id="manufacturer" name="Manufacturer" >
                                             <option  value="Select Manufacturer" disabled selected hidden>Select Manufacturer</option>
                                              <%for(String manu : manufacturerList){ %>
                                                <option value="<%=manu%>"><%=manu%></option>
                                                 <%} %>
                    
                                             </select> --%>

																	<select class="form-control" id="isd_Manufacturer"
																		name="Manufacturer">
																		<option value="Select Manufacturer" disabled selected
																			hidden>Select Manufacturer</option>
																		<%--  <%for(String manu : manufacturerList){ %>
                                                <option value="<%=manu%>"><%=manu%></option>
                                                 <%} %> --%>
																		<option value="<%=manufacturer%>" selected><%=manufacturer%></option>

																	</select>
																</div>
															</div>
														</div>
														<!-- End of Form -->
														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>RegExpDate</span> <input
																		onkeydown="removeValidation()" type="text"
																		class="form-control" placeholder="Reg Exp Date"
																		id="RegExpDate" name="RegExpDate"
																		onfocus="(this.type='date')"
																		onfocusout="(this.type='text')"
																		value="<%=expireDate%>" required />
																	<!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
																</div>
															</div>
														</div>








														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Schedule</span>
																	<!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Importer"
                                               id="Importer"
                                               name="Importer"
                                               required
                                        /> -->

																	<select class="form-control" id="Schedule"
																		name="Schedule">
																		<option value="<%=shedule%>"><%=shedule%></option>
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
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Country</span>
																	<%--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Country"
                                               id="Country"
                                               name="Country"
                                               value="<%=country%>"
                                               
                                               required
                                        /> --%>

																	<select class="form-control" id="isd_Country"
																		name="Country">
																		<option value="<%=country%>" disabled selected hidden><%=country%></option>
																		<%--  <%for(String manu : manufacturerList){ %>
                                                <option value="<%=manu%>"><%=manu%></option>
                                                 <%} %> --%>

																	</select>
																</div>
															</div>
														</div>

														<div class="input-group">

															<div class="form-group mb-2 col-md-12">
																<div class="input-group">
																	<span class="input-group-text  col-md-3"
																		id="basic-addon3" STYLE="font-weight: bold"><span
																		class="fas fa-user"></span>Notes</span>
																	<!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Notes"
                                               id="Notes"
                                               name="Notes"
                                               required
                                        /> -->
																	<textarea class="form-control" placeholder="Notes"
																		id="Notes" name="Notes" rows="3" value="<%=notes%>"><%=notes%></textarea>
																</div>
															</div>
														</div>

														<br> <input name="c_page" value="drug_update" hidden>


														<center>
															<input type="button" class="btn btn-primary" id="subBtn"
																value="Update">


														</center>

														<div class="mt-3 text-right col-md-10"
															style="margin-top: -45px !important; margin-left: 100px">

															<input type="button" class="btn btn-primary "
																id="deletebtn" value="Delete" onclick="deleteDrug()";>

															<!--   <input type="button"  class="btn btn-primary " id="approveBtn1"  onclick="disapproveDrug()" value="Approved" style="visibility:hidden"> -->
														</div>



														<%--                               ss?--%>
														<div style="padding-bottom: 25px !important;" id="loader"
															class='d-none contain'>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
															<svg height='80' viewBox='-30 0 255 80' width='255'>
                                        <ellipse cx='25' cy='20'
																	fill='none' rx='10' ry='10'></ellipse>
                                    </svg>
														</div>

														<%--                               ss?--%>
												</form>



												<div
													class="d-flex justify-content-center align-items-center mt-4">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>


<script>

    var pass;
    var repass;
    
    var userCap;
    var realCap;
 
  
    var isG1 = true;
    var isG2 = true;
    var isG3 = true;
    var isB = true;
    var isD = true;
    var isS = true;
    var isCode = true;
    var isDate = true;
    var isSheudle = true;
    var isCountry = true;
 
    
  
    
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


               /*  if (sx.placeholder == 'email') {
				console.log("email "+ sx.value);
                    if (!validateEmail(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isE = false;
                    } else {
                        isE = true;
                    }
                } */
               /*  if (sx.placeholder == 'Phone') {

                    if (!validateMobile(sx.value)) {
                        $(sx).addClass('is-invalid');
                        
                        isM = false;
                    } else {
                        isM = true;
                    }
                } */
                
              /*   if (sx.placeholder == 'Generic') {
   					
               	 console.log("Value"+sx.value);
                   if (sx.value.length == 0) {
                       $(sx).addClass('is-invalid');
                       
                       isG1= false;
                   } else {
                       isG1 = true;
                   }
                 
               } */
                
               /*  if (sx.placeholder == 'Generic2') {
   					
                  	 console.log("Value"+sx.value);
                      if (sx.value.length == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isG2= false;
                      } else {
                          isG2 = true;
                      }
                    
                  } */
               /*  if (sx.placeholder == 'Generic3') {
   					
                 	 console.log("Value"+sx.value);
                     if (sx.value.length == 0) {
                         $(sx).addClass('is-invalid');
                         
                         isG3= false;
                     } else {
                         isG3 = true;
                     }
                   
                 } */
                
               /*  if (sx.placeholder == 'Brand') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isB= false;
                    } else {
                        isB = true;
                    }
                  
                }
               */
               /*  if (sx.placeholder == 'Dosage') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isD= false;
                    } else {
                        isD = true;
                    }
                  
                }
               */
              /*   if (sx.placeholder == 'Strength (mg, G etc.)') {
   					
                	 console.log("Value"+sx.value);
                    if (sx.value.length == 0) {
                        $(sx).addClass('is-invalid');
                        
                        isS= false;
                    } else {
                        isS = true;
                    }
                  
                } */
              
            /*     if (sx.placeholder == 'Select IMC Code') {
   					
               	 console.log("Value"+sx.value);
                   if (sx.value == 'Select IMC Code') {
                       $(sx).addClass('is-invalid');
                       
                       isCode= false;
                   } else {
                	   isCode = true;
                   }
                 
               } */
             
                /* if (sx.placeholder == 'Reg Exp Date') {
   					
                  	 console.log("Value"+sx.value);
                      if (sx.value == 0) {
                          $(sx).addClass('is-invalid');
                          
                          isDate= false;
                      } else {
                    	  isDate = true;
                      }
                    
                  }
                 */
               /*  if (sx.placeholder == 'Country') {
   					
                 	 console.log("Value"+sx.value);
                     if (sx.value.length == 0) {
                         $(sx).addClass('is-invalid');
                         
                         isCountry= false;
                     } else {
                    	 isCountry = true;
                     }
                   
                 } */
                /*  if (sx.name== 'Schedule') {
    					
                 	 console.log("Value1111"+sx.value);
                     if (sx.value == 'Select Schedule') {
                    	
                    	  $(sx).addClass('is-invalid');
                    	  isSheudle= false;
                    	 
                     } else {
                    	 isSheudle = true;
                     }
                   
                 } */
               /*   if (sx.name== 'IMC') {
 					
                 	 console.log("Value1111"+sx.value);
                     if (sx.value == 'Select IMC Code') {
                    	
                    	  $(sx).addClass('is-invalid');
                    	  isCode= false;
                    	 
                     } else {
                    	 isCode = true;
                     }
                   
                 } */
                
             
            

       });

        
       
        
   
         console.log(isG1)
         console.log(isG2)
         console.log(isG3)
         console.log(isD)
         console.log(isS)
          console.log("isSheudle"+isSheudle);

         if ( isB && isD && isS  && isDate && isCountry && isS && isSheudle && isCode) {

   
 console.log("hiii");
            $.ajax({
                url: 'controller/DrugContrller.jsp?action=updateIsdtable',
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
 /* 
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
                    title: 'Registration Failed!',
                    text: 'Already Registered User',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
            } else {
                if (data) {
                    
                	swal({
                        type: 'success',
                        title: 'Succesfully Updated',
                        text: 'Data Updating is Compeleted',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function() {
        			    window.location = "ISDRecords.jsp";
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
  		//test
  		console.log(value);
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=getImporterIsd',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	  console.log("ddd"+data);
        	  var importer = document.getElementById("isd_Importer");
        	  for(let i= 0 ; i <data.length; i++){
        		  AddOptionInIsdImporter(importer, data[i], data[i]);
        	  }
        	  
        	  
          	
          },
          error: function (e) {

          }
      });
  	  
	$.ajax({
		//test1
          url: 'controller/DrugContrller.jsp?action=getManufacturerIsd',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	  console.log("ddd"+data);
        	 //document.getElementById("Manufacturer").value = data;
        	 var manufacturer = document.getElementById("isd_Manufacturer");
       	  for(let i= 0 ; i <data.length; i++){
       		  AddOptionInIsdImporter(manufacturer, data[i], data[i]);
       	  }
          	
          },
          error: function (e) {

          }
      }); 
	 
	  $.ajax({
		  //test2
          url: 'controller/DrugContrller.jsp?action=getCountryIsd',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	 /*  console.log("ddd"+data);
        	  document.getElementById("Country").value = data; */
        	  var country = document.getElementById("isd_Country");
           	  for(let i= 0 ; i <data.length; i++){
           		  AddOptionInIsdImporter(country, data[i], data[i]);
           	  }
              	
          	
          },
          error: function (e) {

          }
      }); 
  	}

  	
  	
  	
  	
function approveDrug(){
  		
	
	
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=approved',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#unasampor').serialize(), // added data type
          success: function (data) {
			
        	  console.log("ddd"+data);
        	
        	  setTimeout(function () {
        		  swal({
                      type: 'success',
                      title: 'Approved',
                      text: 'You have Approved the Drug',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  }).then(function() {
      			    window.location = "Approve.jsp";
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
    
    function disapproveDrug(){
  		
    	
    	  $.ajax({
            url: 'controller/DrugContrller.jsp?action=disapprove',
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
                        type: 'success',
                        title: 'Refused',
                        text: 'You have Refused The Drug',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function() {
        			    window.location = "Approve.jsp";
	        		  });
          		  
          	  }, 500);
          	  
             	
            	
            },
            error: function (e) {
          	  

            }
        });
    	  
  	
    	}
    

    function deleteDrug(){
  		
    	
  
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
	            		      title: "'Deleted!",
	            	            text: "Drug Record has been deleted.",
	            	            type: "success"
	        		  }).then(function() {
	        			    window.location = "ISDRecords.jsp";
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
    
    
    function isdGenericDropDown() {

 	   console.log("yyyyyyyyyyyyyyy");
 	     /*document.getElementById("myDropdownISDGenericDropDown").classList.toggle("show");*/
 	     if(	document.getElementById("myDropdownISDGenericDropDown").style.display == "block"){
 	   		document.getElementById("myDropdownISDGenericDropDown").style.display = "none";
 	   	}else {
 	   		document.getElementById("myDropdownISDGenericDropDown").style.display = "block";
 	   	}
 	   }
    
    function setISDGeneric(value){
   	 var generic = document.getElementById("Generic");
   	 generic.value = value;
         
   }
    
    function hideGenericDropDown() {
 		/*document.getElementById("myDropdownISDGenericDropDown").classList.toggle("show");*/
 		if(	document.getElementById("myDropdownISDGenericDropDown").style.display = "block"){
 			document.getElementById("myDropdownISDGenericDropDown").style.display = "none";
 		}
 	}
    
    document.addEventListener('click', function(e) {
 	

 		
 		if (e.target && e.target.id == 'main') {
 		
 			
 			 hideGenericDropDown();

 		}
 		
 	
 	
 	});
    
    function AddOptionInIsdImporter(selectbox, text, value) {
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
 			optn.name = value;
 			selectbox.appendChild(optn);
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
</script>
</html>



