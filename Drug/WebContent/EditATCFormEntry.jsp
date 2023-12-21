<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="drugfilter.model.ATC_Model"%>
<%@page import="drugfilter.model.ISD"%>
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
    <title>IMPASL Drug | Edit ATC Data Form</title>
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
		String chemical = request.getParameter("chemical");
		String chemical_code = request.getParameter("chemical_code");
		String pharmoClass = request.getParameter("pharmoClass");
		String therapClass = request.getParameter("therapClass");
		String clinicClass = request.getParameter("clinicClass");
		String anatClass = request.getParameter("anatClass");
		String atccode = request.getParameter("atccode");
		String cautLbl = request.getParameter("cautLbl");
		String advEffect = request.getParameter("advEffect");
		String registered_date = request.getParameter("registered_date");
		String registered_user = request.getParameter("registered_user");
		String notes = request.getParameter("notes");
		String status = request.getParameter("status");
		
		
	
		ISD isd = DrugController.getISDbyId(seno);
		
		List<String> genericList = DrugController.getAllGenerics();
		
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
                        <div class="card-body">

<div class="auth-layout-wrap" >
                <div  class="container" style="align:left" >
                <div>
    <ul class="nav nav-tabs" role="tablist">
	<li class="nav-item">
		<a class="nav-link   {{request() -> is('/IMCForm1.jsp') ? 'active' : null }}"  href="IMCRecords.jsp" role="tab">IMC Data Entry</a>
	</li>
	<li class="nav-item">
		<a class="nav-link   {{request () -> is('/ISDForm2.jsp') ? 'active' : null }}" href="ISDRecords.jsp" role="tab">ISD Data Entry</a>
	</li>
	<li class="nav-item">
		<a class="nav-link  active {{request () -> is('/ATCForm.jsp') ? 'active' : null }}" href="ATCRecords.jsp" role="tab">ATC Data Entry</a>
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
                                <h1 class="mb-0 h5">DRUG INFORMATION UPDATE - ATC FORM</h1>
                            </div>
              
                              <form id="atcform" name="atcform" action="#">
                            
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
                                
                                    <div class="input-group">
                                      
                          <span class="input-group-text col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Chemical</span>
                                        <select class="form-control" id="Chemical" name="Chemical">
                                            <option value="<%=chemical%>" ><%=chemical%></option>
                                              <%for(String generic : genericList){ %>
                                             <option value="<%=generic%>"><%=generic%></option>
                                                 <%} %>
                                             </select>
                                        </div>
                                    </div>
                            
                                <!-- End of Form -->
                        
                                <!-- Form -->
                          <div class="input-group">
                         
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Pharmo Class</span>
                                      <%--   <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Pharmo Class"
                                               id="PharmoClass"
                                               name="PharmoClass"
                                                value="<%=pharmoClass%>"
                                               required
                                        /> --%>
                                        <select class="form-control" id="PharmoClass"
																				name="PharmoClass">
																				<option value="<%=pharmoClass%>" 
																					s ><%=pharmoClass%></option>
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span 
                          >Therapeutic Class</span>
                                       <%--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Therapeutic Class"
                                               id="TherapeuticClass"
                                               name="TherapeuticClass"
                                               value="<%=therapClass%>"
                                               required
                                        /> --%>
                                        <select class="form-control" id="TherapeuticClass"
																				name="TherapeuticClass">
																				<option value="<%=therapClass%>"
																					><%=therapClass%></option>
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span 
                          >Clinical Class</span>
                                        <%-- <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Clinical Class"
                                               id="ClinicalClass"
                                               name="ClinicalClass"
                                                value="<%=clinicClass%>"
                                               required
                                        />  --%>
                                        <select class="form-control" id="ClinicalClass"
																				name="ClinicalClass">
																				<option value="<%=clinicClass%>"
																					 ><%=clinicClass%></option>
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Anatomical Class</span>
                                        <%-- <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Anatomical Class"
                                               id="AnatomicalClass"
                                               name="AnatomicalClass"
                                               value="<%=anatClass%>"
                                               required
                                        /> --%>
                                        <select class="form-control" id="AnatomicalClass"
																				name="AnatomicalClass">
																				<option value="<%=anatClass%>" 
																					><%=anatClass%></option>
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >ATC Code</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="ATC Code"
                                               id="ATCCode"
                                               name="ATCCode"
                                               value="<%=atccode%>"
                                               required
                                            
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Cautionary Label</span>
                                         <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Cautionary Label"
                                               id="CautionaryLabel"
                                               name="CautionaryLabel"
                                               value="<%=cautLbl%>"
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
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Adverse Effects</span>
                                        <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Adverse Effects"
                                               id="AdverseEffects"
                                               name="AdverseEffects"
                                              
                                               value="<%=advEffect%>"
                                               required
                                        /> 
                                       <!--  <input name="date" type="text" onfocus="(this.type='date')" onfocusout="(this.type='text')"> -->
                                    </div>
                                </div>
                                </div>
                                
                                
                                
                                
                               
        
  
                                   
                                    
                             
                           
                                
                                <div class="input-group">
          
                                <div class="form-group mb-2 col-md-12">
                                    <div class="input-group">
                          <span class="input-group-text  col-md-4" id="basic-addon3" STYLE="font-weight:bold"
                          ><span class="fas fa-user"></span
                          >Notes</span>
                                       <!--  <input onkeydown="removeValidation()"
                                               type="text"
                                               class="form-control"
                                               placeholder="Notes"
                                               id="Notes"
                                               name="Notes"
                                               required
                                        /> -->
                                          <textarea class="form-control" placeholder="Notes" id="Notes"   name="Notes" rows="3"   value="<%=notes%>" ><%=notes%></textarea>
                                    </div>
                                </div>
                                </div>
                                
                                <br>
                                  <input name="c_page" value="atc_drug_update" hidden>
                                  
                               
						                     <center><input type="button" class="btn btn-primary" id="subBtn" value="Update">
						                  
						  				
						  				     </center>
  						       				
			                            	<div class="mt-3 text-right col-md-10" style="margin-top: -45px !important;   margin-left: 100px ">
                   
			                            	    <input type="button" class="btn btn-primary " id="deletebtn" value="Delete" onclick="deleteATCDrug()";>
			                            	
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
    
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
 
    var isChemical = true;
    var isPharmo = true;
    var isTherap = true;
    var isClinical = true;
    var isAnatomical = true;
    var isATCCode = true;
    var isCautLbl = true;
    var isAddEff = true;
   
 
    
  
    
    $('#subBtn').click(function () {


        var x = document.forms["atcform"];
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


    	  /*  if (sx.id == 'Chemical') {
               var chemicalDropDown = document.getElementById("Chemical");
               var selectedChemical = chemicalDropDown.options[chemicalDropDown.selectedIndex].value;
                 if (selectedChemical == "Select Chemical")
                 {
              	   isChemical = false;
                 } else{
              	   isChemical = true;
                 }
           } */
          
         
      /*     if (sx.placeholder == 'Pharmo Class') {
					
            	 console.log("Pharmo Class"+sx.value);
                if (sx.value.length == 0) {
                    $(sx).addClass('is-invalid');
                    
                    isPharmo= false;
                } else {
              	  isPharmo = true;
                }
              
            } */
        /*   if (sx.placeholder == 'Therapeutic Class') {
					
           	 console.log("Therapeutic Class"+sx.value);
               if (sx.value.length == 0) {
                   $(sx).addClass('is-invalid');
                   
                   isTherap= false;
               } else {
              	 isTherap = true;
               }
             
           }
           */
         /*  if (sx.placeholder == 'Clinical Class') {
					
          	 console.log("Clinical Class"+sx.value);
              if (sx.value.length == 0) {
                  $(sx).addClass('is-invalid');
                  
                  isClinical= false;
              } else {
              	isClinical = true;
              }
            
          } */
        
         /*  if (sx.placeholder == 'Anatomical Class') {
					
          	 console.log("Value"+sx.value);
              if (sx.value.length == 0) {
                  $(sx).addClass('is-invalid');
                  
                  isAnatomical= false;
              } else {
              	isAnatomical = true;
              }
            
          }
         */
        /*   if (sx.placeholder == 'ATC Code') {
					
          	 console.log("Value"+sx.value);
              if (sx.value.length == 0 || sx.value.length > 15) {
                  $(sx).addClass('is-invalid');
                  
                  isATCCode= false;
              } else {
              	isATCCode = true;
              }
            
          } */
        
        /*   if (sx.placeholder == 'Cautionary Label') {
					
         	 console.log("Value"+sx.value);
             if (sx.value.length == 0) {
                 $(sx).addClass('is-invalid');
                 
                 isCautLbl= false;
             } else {
          	   isCautLbl = true;
             }
           
         } */
       
      /*     if (sx.placeholder == 'Adverse Effects') {
					
            	 console.log("Adverse Effects"+sx.value);
                if (sx.value.length == 0) {
                    $(sx).addClass('is-invalid');
                    isAddEff= false;
                } else {
              	  isAddEff = true;
                }
              
            }
           */
             
            

       });

        
       
       console.log("iii"+isCautLbl);
   
        
         if (  isChemical && isPharmo  && isTherap && isClinical && isAnatomical  && isATCCode && isCautLbl && isAddEff) {

   
 console.log("hiii");
             $.ajax({
                url: 'controller/DrugContrller.jsp?action=updateAtctable',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#atcform').serialize(), // added data type
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
              text: 'Please Enter a ATC Code with characters betweeen only 1 and 15',
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
                        text: 'Data Updating is Compeleted',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    }).then(function() {
        			    window.location = "ATCRecords.jsp";
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
  	
  	
  	
  	
function approveATCDrug(){
  		
	
	
  	  $.ajax({
          url: 'controller/DrugContrller.jsp?action=atc_approved',
          type: 'GET',
          processData: false,
          contentType: false,
          cache: false,
          data: $('#atcform').serialize(), // added data type
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
      			    window.location = "ATCRecords.jsp";
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
    
    function disapproveATCDrug(){
  		
    	
    	  $.ajax({
            url: 'controller/DrugContrller.jsp?action=atc_disapprove',
            type: 'GET',
            processData: false,
            contentType: false,
            cache: false,
            data: $('#atcform').serialize(), // added data type
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
        			    window.location = "ATCRecords.jsp";
	        		  });
          		  
          	  }, 500);
          	  
             	
            	
            },
            error: function (e) {
          	  

            }
        });
    	  
  	
    	}
    

    function deleteATCDrug(){
    	
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
    		          url: 'controller/DrugContrller.jsp?action=deleteATCDrug',
    		          type: 'GET',
    		          processData: false,
    		          contentType: false,
    		          cache: false,
    		          data: $('#atcform').serialize(), // added data type
    		          success: function (data) {
    					
    		        	  console.log("ddd"+data);
    		        	  approveConfirm(data);
    		        	  setTimeout(function () {
    		        		  swal({
    		            		      title: "'Deleted!",
    		            	            text: "ATC Record has been deleted.",
    		            	            type: "success"
    		        		  }).then(function() {
    		        			    window.location = "ATCRecords.jsp";
    		        		  });
    		            			
    		        	  }, 
    		        	  
    		        	  
    		        	  500);
    		        	  
    		        
    		          	
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



