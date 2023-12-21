<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<link href="dist-assets/css/plugins/metisMenu.min.css" rel="stylesheet" />
<link rel="stylesheet"
	href="dist-assets/css/plugins/smart.wizard/smart_wizard.min.css" />
<link rel="stylesheet"
	href="dist-assets/css/plugins/smart.wizard/smart_wizard_theme_arrows.min.css" />
<link rel="stylesheet"
	href="dist-assets/css/plugins/smart.wizard/smart_wizard_theme_circles.min.css" />
<link rel="stylesheet"
	href="dist-assets/css/plugins/smart.wizard/smart_wizard_theme_dots.min.css" />
<link rel="stylesheet" href="dist-assets/custom/imc_dropdowns.css" />
<style>
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
 
/* @media only screen and (max-width: 720px) {
  /* For desktop: */
  .x {
margin-left: 400px; margin-right:385px;}
 .y {
 margin-left: 130px;}

 
}

 */





</style>


</head>
<body>
	<%
	StringBuffer sb = new StringBuffer();
	for (int i = 1; i <= 5; i++) {
		sb.append((char) (int) (Math.random() * 79 + 23 + 7));
	}
	String cap = new String(sb);
	%>

	<%
	User user = (User) session.getAttribute("name");
	String loginName = " ";

	if (user == null) {

		out.println("Please Login");
		loginName = "Nouser";
		response.sendRedirect("index.jsp");

	} else if (user.getRole().equals("user")) {

		out.println("Please Login");
		loginName = "Nouser";

		response.sendRedirect("index.jsp");
	%>
	<script type="text/javascript">
		alert("You do not have permission");
	</script>
	<%
	} else {

	/* System.out.println(user.getName()); */
	loginName = user.getName();
	//final List<String> importersList = DrugController.getImporters();
	List<String> manufacturerList = DrugController.getManufactures();
	/* System.out.println(manufacturerList.toString()); */
	List<String> importersList = DrugController.getImporters();
	/* System.out.println(manufacturerList.toString()); */
	List<String> imcCodeList = DrugController.getIMCCodes();
	String imc_code = request.getParameter("IMC");

	}
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
		</div>
	</div>
	</div>
	<div class="auth-layout-wrap" id="mainFrame" >
		<div class="col-md-12 mb-4">
			<div class="card text-left">
				<div class="card-body">
					<div class="row mb-3">
						<div class="col-12 col-lg-6 col-sm-12">
							<div class="input-group mb-3" style="display: none">
								<div class="input-group-prepend">
									<!--      <label class="input-group-text" for="theme_selector">Themes</label> -->
									<select class="custom-select col-lg-6 col-sm-12"
										id="theme_selector">
										<!--     <option value="default">default</option>
                                    <option value="arrows">arrows</option>-->
										<!--<option value="circles">circles</option>-->
										<option value="dots">dots</option>
									</select>
								</div>
							</div>
						</div>
						<!--   <div class="col-12 col-lg-6 col-sm-12 d-flex flex-column flex-sm-row align-items-center"><span class="m-auto"></span>
                        <label>External Buttons:</label>
                        <div class="btn-group col-lg-6 col-sm-12 pl-sm-3" role="group">
                            <button class="btn btn-secondary" id="prev-btn" type="button">Go Previous</button>
                            <button class="btn btn-secondary" id="next-btn" type="button">Go Next</button>
                            <button class="btn btn-danger" id="reset-btn" type="button">Reset Wizard</button>
                        </div>
                    </div> -->
					</div>
					<div class="row" id="rowMainFrame">
						<div class="col-md-12">
							<!--  SmartWizard html -->
							<div id="smartwizard"   ">


								<ul class="x" style="margin-left: 300px; margin-right: 300px; zoom:1;">


									<li  class="y" style="margin-left: 130px;"><a href="#step-1">IMC
											Data<br /> <small></small>
									</a></li>
									<li><a href="#step-2">ISD Data<br /> <small></small></a></li>
									<li><a href="#step-3">ATC Data<br /> <small></small></a></li>
									<li><a href="#step-4">Summary<br /> <small></small></a></li>
									
									

								</ul>


								<div>
									<div id="step-1">

										<!-- IMC Form Start -->
										<div class="auth-content " style="z-index: 50" id="imcFormMainFrame">
											<div class="card o-hidden">
												<div class="col-md-12 ml-auto mr-auto">
													<div
														class="row gx-0 align-items-center justify-content-between">

														<div class="col-12">
															<div class="text-center text-md-center mb-4 mt-md-0">
																<img class="pt-1"
																	src="dist-assets/images/dlf.pt-plus-sign-png-110969.png"
																	style="width: 10%" id="logo-sprig" alt="" /> <br>
																<br>
																<h1 class="mb-0 h5">DRUG INFORMATION ENTRY - IMC
																	FORM</h1>
															</div>

															<form id="imcForm" name="imcForm" action="#">

																<!-- Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12" >
																		<div class="input-group">
																			<span class="input-group-text  col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Importer</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Importer"
																				id="importer" name="Importer" autocomplete="off" 	onkeyup="generateImcCode();" />


																			<div class="dropdown" >
																				<button onclick="myFunction()" class="dropbtn"
																					style="width: 1 px;">Select</button>
																				<%-- <div id="myDropdown" class="dropdown-content">
																					<input type="text" placeholder="Search.."
																						id="myInput" onkeyup="filterFunction()">
																					<!--  <select>
    <option value="">Select the Importer</option> -->
																					<%
																					List<IMC> IMCList;
																					IMCList = DrugController.GetAllFromIMC();
																					List<String> importerList = new ArrayList();

																					for (IMC importer : IMCList) {
																						if (importerList.contains(importer.getIMPORTER())) {
																							//do nothing
																						} else {
																							importerList.add(importer.getIMPORTER());
																						}
																					}
																					for (String importer : importerList) {
																					%>

																					  <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a>
																					<option value="<%=importer%>"
																						onclick="setImporter(this.value);hideDropDown();"><%=importer%></option>
																					<%
																					}
																					%>
																					<!--  </select> -->

																				</div> --%>

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

																			for (IMC importer : IMCList) {
																				if (importerList.contains(importer.getIMPORTER())) {
																					//do nothing
																				} else {
																					if(importer.getSTATUS().equals("1")){
																					importerList.add(importer.getIMPORTER());
																					}
																				}
																			}
																			for (String importer : importerList) {
																			%>

																			<%--   <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a> --%>
																			<option value="<%=importer%>"
																				onclick="setImporter(this.value);hideDropDown();"><%=importer%></option>
																			<%
																			}
																			%>
																			<!--  </select> -->

																		</div>

																	</div>
																</div>
																<input type="hidden" id="mauList" name="mauList" />
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Manufacturer</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Manufacturer"
																				id="manufacturer" name="Manufacturer" 	onkeyup="generateImcCode();"
																				autocomplete="off" required />
																			<div class="dropdown">
																				<button onclick="myFunction_m()" class="dropbtn">Select</button>
																				<!-- <div id="myDropdown_m" class="dropdown-content">
																					<input type="text" placeholder="Search.." id="myInput_m" onkeyup="filterFunction_m()">
																					<select id="myInput_m" placeholder="Search.."
																						onchange="setManufacturer(this.value)"
																						onkeyup="filterFunction_m()">
																					</select>
																					
																				</div> -->
																			</div>

																		</div>
																		<div id="myDropdown_m" class="dropdown-content">
																			<input type="text" placeholder="Search.."
																				id="myInput_m" onkeyup="filterFunction_m()"> 
																			<!--  <select id="myInput_m" placeholder="Search.."
																						onchange="setManufacturer(this.value)"
																						onkeyup="filterFunction_m()">
																					</select>  -->

																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Country</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Country"
																				id="Country" name="Country"
																				onkeyup="this.value = this.value.toUpperCase(); generateImcCode();"
																				required />
																			<div class="dropdown">
																				<button onclick="myFunction_c()" class="dropbtn">Select</button>
																				<!-- <div id="myDropdown_c" class="dropdown-content">
																					 <input type="text" placeholder="Search.." id="myInput_m" onkeyup="filterFunction_m()">
																					<select id="myInput_c" placeholder="Search.."
																						onchange="setCountry(this.value)">
																					</select>
																				</div> -->
																			</div>
																		</div>
																		<div id="myDropdown_c" class="dropdown-content-country">
																			<!--  <input type="text" placeholder="Search.." id="myInput_m" onkeyup="filterFunction_m()"> -->
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
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>IMC Code</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="IMCcode"
																				id="IMCcode" name="IMCcode" readonly="readonly" />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Address</span>
																			<textarea class="form-control" placeholder="Address"
																				id="Address" name="Address" rows="3" required></textarea>
																		</div>
																	</div>
																</div>
																<!-- End of Form -->

																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Phone</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Phone" id="Phone"
																				name="Phone" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Fax</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Fax" id="Fax"
																				name="Fax" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Email</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="email" id="email"
																				name="email" required />
																		</div>
																	</div>
																</div>

																<br>
																<div></div>
																<br>

																<center>
																	<input type="button" class="btn btn-primary"
																		id="imc_subBtn" value="Next"> <input
																		type="button" class="btn btn-primary" value="Clear"
																		onclick="window.location.reload();">
																</center>
																<%--                               ss?--%>
																<div style="padding-bottom: 25px !important;"
																	id="loader" class='d-none contain'>
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
										<!-- IMC Form End -->
									</div>


									<div id="step-2">
										<!-- ISD FORM Start -->
										<div class="auth-content">

											<div class="card o-hidden">

												<div class="col-md-12 ml-auto mr-auto">

													<div
														class="row gx-0 align-items-center justify-content-between">
														<div class="col-12">
															<div class="text-center text-md-center mb-4 mt-md-0">
																<img class="pt-1"
																	src="dist-assets/images/dlf.pt-plus-sign-png-110969.png"
																	style="width: 10%" id="logo-sprig" alt="" /> <br>
																<br>
																<h1 class="mb-0 h5">DRUG INFORMATION ENTRY - ISD
																	FORM</h1>
															</div>

															<form id="unasampor" name="unasampor" action="#">

																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3"  STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Generic</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Generic"
																				id="Generic" name="Generic" required />

																			<%-- 	<select class="form-control" id="Generic"
																				name="Generic">
																				<option value="Select Anatomical Class" disabled
																					selected hidden>Select Generic</option>
																				<%
																				List<String> genericList = DrugController.getAllGenerics();
																				for (String generic : genericList) {
																				%>
																				<option value="<%=generic%>"><%=generic%></option>
																				<%
																				}
																				%>
																			</select>
																				 --%>
																			<div class="dropdown">
																				<button onclick="isdGenericDropDown()"
																					class="dropbtn">Select</button>
																				<%-- <div id="myDropdownISDGenericDropDown"
																					class="dropdown-content">
																					<input type="text" placeholder="Search.."
																						id="myInputISDGeneric"
																						onkeyup="filterISDGenericFunction()">
																					<%
																					List<String> genericList = DrugController.getAllGenerics();
																					for (String generic : genericList) {
																					%>
																					<option onclick="setISDGeneric(this.value)"
																						value="<%=generic%>"><%=generic%></option>
																					<%
																					}
																					%>
																				</div> --%>
																			</div>

																		</div>
																		<div id="myDropdownISDGenericDropDown"
																					class="dropdown-content">
																					<input type="text" placeholder="Search.."
																						id="myInputISDGeneric"
																						onkeyup="filterISDGenericFunction()">
																					<%
																					List<String> genericList = DrugController.getAllGenerics();
																					for (String generic : genericList) {
																					%>
																					<option onclick="setISDGeneric(this.value); hideGenericDropDown();"
																						value="<%=generic%>"><%=generic%></option>
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
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Generic2</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Generic2"
																				id="Generic2" name="Generic2" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Generic3</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Generic3"
																				id="Generic3" name="Generic3" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group ">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Brand</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Brand" id="Brand"
																				name="Brand" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Dosage</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Dosage Form"
																				id="Dosage" name="Dosage" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->

																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Strength</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control"
																				placeholder="Strength (mg, G etc.)" id="Strength"
																				name="Strength" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>IMC Code</span> <%-- <select
																				class="form-control" id="isd_IMC" name="IMC"
																				onchange="getImporterDetails(this.value);">
																				<option value="Select IMC Code" disabled selected
																					hidden>Select IMC Code</option>
																				  <%
                                              List<String> imcCodeList = DrugController.getIMCCodes();
                                              for(String imc : imcCodeList){ %>
																				   <option value="<%=imc%>"><%=imc%></option>
																				  <%} %>
																			</select> --%>
																			 <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="IMC Code"
																				id="isd_IMC" name="IMC" required
																				disabled="disabled" />
																		</div>
																	</div>
																</div>

																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Importer</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Importer"
																				id="isd_Importer" name="Importer" required
																				disabled="disabled" />

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
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Manufacturer</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Manufacturer"
																				id="isd_Manufacturer" name="Manufacturer" required
																				disabled />

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
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>RegExpDate</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Reg Exp Date"
																				id="RegExpDate" name="RegExpDate"
																				onfocus="(this.type='date')"
																				onfocusout="(this.type='text')" required />
																			<!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
																		</div>
																	</div>
																</div>

																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
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
																				<option value="Select Schedule" disabled selected
																					hidden>Select Schedule</option>
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
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Country</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Country"
																				id="isd_Country" name="Country" required />
																		</div>
																	</div>
																</div>

																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-3" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Notes</span>
																			<textarea class="form-control" placeholder="Notes"
																				id="isd_Notes" name="Notes" rows="3" required></textarea>
																		</div>
																	</div>
																</div>

																<br>

																<center>
																	<input type="button" class="btn btn-primary"
																		id="isd_subBtn" value="Next"> <input
																		type="button" class="btn btn-primary" value="Clear"
																		onclick="window.location.reload();">
																</center>
																<%--                               ss?--%>
																<div style="padding-bottom: 25px !important;"
																	id="loader" class='d-none contain'>
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
										<!-- ISD Form End -->
									</div>

									<div id="step-3">
										<!-- ATC Form Start -->
										<div class="auth-content">
											<div class="card o-hidden">
												<div class="col-md-12 ml-auto mr-auto">
													<div
														class="row gx-0 align-items-center justify-content-between">
														<div class="col-12">
															<div class="text-center text-md-center mb-4 mt-md-0">
																<img class="pt-1"
																	src="dist-assets/images/dlf.pt-plus-sign-png-110969.png"
																	style="width: 10%" id="logo-sprig" alt="" /> <br>
																<br>
																<h1 class="mb-0 h5">DRUG INFORMATION ENTRY - ATC
																	FORM</h1>
															</div>

															<form id="atcForm" name="atcForm" action="#">
																<!-- Form -->
																<!--  <div class="input-group">
                    
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
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Chemical</span>
																			<!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="IMC"
                                               id="IMC"
                                               name="IMC"
                                               required
                                        /> -->
																			<select class="form-control" id="Chemical"
																				name="Chemical">
																				<option value="Select Chemical" disabled selected
																					hidden>Select Chemical</option>
																				<%--  <%
                                              
                                              List<String> genericList = DrugController.getAllGenerics();
                                              for(String generic : genericList){ %> --%>
																				<%--    <option value="<%=generic%>"><%=generic%></option> --%>
																				<%--    <%} %> --%>
																			</select>

																		</div>
																	</div>
																</div>
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Pharmo Class</span>
																			<!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Pharmo Class"
                                               id="PharmoClass"
                                               name="PharmoClass"
                                               required
                                        /> -->
																			<select class="form-control" id="PharmoClass"
																				name="PharmoClass">
																				<option value="Select Pharmo Class" disabled
																					selected hidden>Select Pharmo Class</option>
																				<%
																				List<ATC_Model> atcList = DrugController.GetAllFromATC();
																				for (ATC_Model atc : atcList) {
																				%>
																				<option value="<%=atc.getPHARMO_CLASS()%>"><%=atc.getPHARMO_CLASS()%></option>
																				<%
																				}
																				%>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Therapeutic Class</span>
																			<!-- <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Therapeutic Class"
                                               id="TherapeuticClass"
                                               name="TherapeuticClass"
                                               required
                                        />
                                         -->
																			<select class="form-control" id="TherapeuticClass"
																				name="TherapeuticClass">
																				<option value="Select Therapeutic Class" disabled
																					selected hidden>Select Therapeutic Class</option>
																				<%
																				for (ATC_Model atc : atcList) {
																				%>
																				<option value="<%=atc.getTHERAPEUTIC_CLASS()%>"><%=atc.getTHERAPEUTIC_CLASS()%></option>
																				<%
																				}
																				%>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Clinical Class</span>
																			<!--   <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Clinical Class"
                                               id="ClinicalClass"
                                               name="ClinicalClass"
                                               required
                                        />  -->
																			<select class="form-control" id="ClinicalClass"
																				name="ClinicalClass">
																				<option value="Select Clinical Class" disabled
																					selected hidden>Select Clinical Class</option>
																				<%
																				for (ATC_Model atc : atcList) {
																				%>
																				<option value="<%=atc.getCLINICAL_CLASS()%>"><%=atc.getCLINICAL_CLASS()%></option>
																				<%
																				}
																				%>
																			</select>
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Anatomical Class</span>
																			<!--    <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Anatomical Class"
                                               id="AnatomicalClass"
                                               name="AnatomicalClass"
                                               required
                                        /> -->
																			<select class="form-control" id="AnatomicalClass"
																				name="AnatomicalClass">
																				<option value="Select Anatomical Class" disabled
																					selected hidden>Select Anatomical Class</option>
																				<%
																				for (ATC_Model atc : atcList) {
																				%>
																				<option value="<%=atc.getANATOMICAL_CLASS()%>"><%=atc.getANATOMICAL_CLASS()%></option>
																				<%
																				}
																				%>
																			</select>

																		</div>
																	</div>
																</div>
																<!-- End of Form -->

																<!-- Form -->
																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>ATC Code</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="ATC Code"
																				id="ATCCode" name="ATCCode" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<!-- Form -->

																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Cautionary Label</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Cautionary Label"
																				id="CautionaryLabel" name="CautionaryLabel" required />
																		</div>
																	</div>
																</div>
																<!-- End of Form -->
																<div class="input-group">

																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
																				class="fas fa-user"></span>Adverse Effects</span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Adverse Effects"
																				id="AdverseEffects" name="AdverseEffects" required />
																			<!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
																		</div>
																	</div>
																</div>

																<div class="input-group">
																	<div class="form-group mb-2 col-md-12">
																		<div class="input-group">
																			<span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"><span
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
																				id="ATC_Notes" name="AtcNotes" rows="3" required></textarea>
																		</div>
																	</div>
																</div>


																<br>

																<center>
																	<input type="button" class="btn btn-primary"
																		id="atc_subBtn" value="Submit"> <input
																		type="button" class="btn btn-primary" value="Clear"
																		onclick="window.location.reload();">
																</center>
																<%--                               ss?--%>
																<div style="padding-bottom: 25px !important;"
																	id="loader" class='d-none contain'>
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
										<!-- Atc Form End -->
									</div>

									<div id="step-4">
										<div class="auth-content">
											<div class="card o-hidden">
												<div class="col-md-9 ml-auto mr-auto">
													<div
														class="row gx-0 align-items-center justify-content-between">
														<div class="col-12">
															<div class="text-center text-md-center mb-4 mt-md-0">
																<img class="pt-1"
																	src="dist-assets/images/dlf.pt-plus-sign-png-110969.png"
																	style="width: 10%" id="logo-sprig" alt="" /> <br>
																<br>
																<h1 class="mb-0 h5">DRUG INFORMATION ENTRY -
																	SUMMARY</h1>
															</div>





															<div class="card o-hidden">
																<div class="card-header">IMC Details</div>
																<div class="card-block p-0">
																	<table class="table">
																		<tbody>
																			<tr>
																				<th>Importer:</th>
																				<td id="importer_summary"></td>
																			</tr>
																			<tr>
																				<th>Manufacturer:</th>
																				<td id="manufacturer_summary"></td>
																			</tr>

																			<tr>
																				<th>Country:</th>
																				<td id="country_summary"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>

															<br>

															<div class="card o-hidden">
																<div class="card-header">ISD Details</div>
																<div class="card-block p-0">
																	<table class="table">
																		<tbody>
																			<tr>
																				<th>Generic/Chemical:</th>
																				<td id="generic_summary"></td>
																			</tr>
																			<tr>
																				<th>Brand:</th>
																				<td id="brand_summary"></td>
																			</tr>

																			<tr>
																				<th>Dosage:</th>
																				<td id="dosage_summary"></td>
																			</tr>

																			<tr>
																				<th>Expire Date:</th>
																				<td id="expiredate_summary"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>


															<br>

															<div class="card o-hidden">
																<div class="card-header">ATC Details</div>
																<div class="card-block p-0">
																	<table class="table">
																		<tbody>
																			<tr>
																				<th>Pharmo Class:</th>
																				<td id="Pharmo_summary"></td>
																			</tr>
																			<tr>
																				<th>Therapeutic Class:</th>
																				<td id="Therapeutic_summary"></td>
																			</tr>

																			<tr>
																				<th>Clinical Class:</th>
																				<td id="Clinical_summary"></td>
																			</tr>

																			<tr>
																				<th>Anatomical Class:</th>
																				<td id="Anatomical_summary"></td>
																			</tr>

																			<tr>
																				<th>ATC Code:</th>
																				<td id="AtcCode_summary"></td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>


															<br>

															<center>
																<a href="EntryForms.jsp"><input type="button"
																	class="btn btn-primary" value="Finish"></a>
															</center>















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
									<!-- Step 4 ends -->



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
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
<script src="dist-assets/js/custom/imc_dropdowns.js"></script>
<script src="dist-assets/js/custom/imc_form_data.js"></script>
<script src="dist-assets/js/custom/isd_form_data.js"></script>
<script src="dist-assets/js/custom/atc_form_data.js"></script>
<script src="dist-assets/js/custom/forms_local_values.js"></script>
<script src="dist-assets/js/plugins/jquery-3.3.1.min.js"></script>
<script src="dist-assets/js/scripts/script_2.min.js"></script>
<script src="dist-assets/js/plugins/feather.min.js"></script>
<script src="dist-assets/js/plugins/metisMenu.min.js"></script>
<script src="dist-assets/js/scripts/layout-sidebar-vertical.min.js"></script>
<script src="dist-assets/js/plugins/jquery.smartWizard.min.js"></script>
<script src="dist-assets/js/scripts/smart.wizard.script.min.js"></script>
<script src="dist-assets/js/custom/summary_data.js"></script>


<script>
	
</script>

<%-- <div class="modal fade" id="verifyModalContent" tabindex="-1" role="dialog" aria-labelledby="verifyModalContent" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="verifyModalContent_title">Select Importer</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                  		<div class="input-group">
																			<span class="input-group-text" id="basic-addon3"><span
																				class="fas fa-user"></span></span> <input
																				onkeydown="removeValidation()" type="text"
																				class="form-control" placeholder="Importer"
																				id="importer" name="Importer" autocomplete="off"
																				required />

																			<div class="dropdown" style="width: 15 px;">
																				<button onclick="myFunction()" class="dropbtn"
																					style="width: 1 px;" >Select</button>
																				<div id="myDropdown" class="dropdown-content ">
																					<input type="text" placeholder="Search.."
																						id="myInput" onkeyup="filterFunction()">
																					<!--  <select>
    <option value="">Select the Importer</option> -->
																					<%
																					List<IMC> IMCList1;
																					IMCList1 = DrugController.GetAllFromIMC();
																					List<String> importerList1 = new ArrayList();

																					for (IMC importer : IMCList1) {
																						if (importerList1.contains(importer.getIMPORTER())) {
																							//do nothing
																						} else {
																							importerList1.add(importer.getIMPORTER());
																						}
																					}
																					for (String importer : importerList1) {
																					%>

																					  <a href="#"   onclick="x()"><%=importer.getIMPORTER() %></a>
																					<option value="<%=importer%>"
																						onclick="setImporter(this.value); hideDropDown();"><%=importer%></option>
																					<%
																					}
																					%>
																					<!--  </select> -->

																				</div>

																			</div>
																		</div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                                <button class="btn btn-primary" type="button">OK</button>
                            </div>
                        </div>
                    </div>
                </div> --%>
</html>



