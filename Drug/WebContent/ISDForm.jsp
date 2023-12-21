<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="drugfilter.model.User"%>
<%@page import="drugfilter.controller.DrugController"%>
<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>IMPASL Drug | ISD Data Form Basic</title>
    <!--    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet" media='all'/>-->
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/google.css" rel="stylesheet" media='all'/>
    <link href="dist-assets/css/plugins/perfect-scrollbar.min.css" rel="stylesheet" media='all'/>
    <link href="html/src/print.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="dist-assets/css/plugins/dropzone.min.css"/>
    <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    <!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>-->
    <!--    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <!--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
    <link rel="stylesheet" href="dist-assets/css/plugins/datatables.min.css"/>
      <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.all.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>
    <style>
        .ui-autocomplete {
            max-height: 200px;
            overflow-y: auto;
            /* prevent horizontal scrollbar */
            overflow-x: hidden;
            /* add padding to account for vertical scrollbar */
            padding-right: 20px;
        }

        .mincontent {
            max-width: max-content !important;
        }

        .form-controls {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 1;
            margin-top: 5px;
        }

        .form-controlt {
            background: transparent;
            border: none;
            border-bottom: 1px solid #000000;
            -webkit-box-shadow: none;
            box-shadow: none;
            border-radius: 0;
            margin-top: 5px;
        }

        h6{
        cursor: pointer;
        }
        .form-control{
  -webkit-border-radius: 2;
     -moz-border-radius: 2;
          border-radius: 0;
}

    </style>

</head>

<%

User user = (User)session.getAttribute("name");
String loginName = " ";

if(user == null){
	
	out.println("Please Login");
	loginName = "Nouser";
	response.sendRedirect("index.jsp");
	
}else{

/* 
System.out.println(user.getName()); */
loginName = user.getName();
}

List<String> manufacturerList = DrugController.getManufactures();
/* System.out.println(manufacturerList.toString()); */

List<String> importersList = DrugController.getImporters();


%>

<input id="loginName" value=<%=loginName%> hidden></input>

<script>

var x = document.getElementById('loginName').value;
console.log(x);


if(x=='Nouser'){
	
	alert("Please Signin");
}
	
	</script>


<body class="text-left">

    <!--    <div class="main-header">-->
    <!--        <div class="logo">-->
    <!--            <img src="dist-assets/images/logo.png" alt="">-->
    <!--        </div>-->
    <!--        <div class="menu-toggle">-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--            <div></div>-->
    <!--        </div>-->

    <!--        <div>-->
    <!--            <h2>Search</h2>-->
    <!--            &lt;!&ndash;                <i class="search-icon text-muted i-Magnifi-Glass1"></i>&ndash;&gt;-->
    <!--        </div>-->
    <!--        &lt;!&ndash;        </div>&ndash;&gt;-->
    <!--        <div style="margin: auto"></div>-->
    <!--        <div class="header-part-right">-->
    <!--            &lt;!&ndash; Full screen toggle &ndash;&gt;-->
    <!--            <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen></i>-->
    <!--            &lt;!&ndash; Grid menu Dropdown &ndash;&gt;-->


    <!--        </div>-->
    <!--    </div>-->

    <!-- =============== Left side End ================-->
    <div class="mt-3 sidenav-open d-flex flex-column">
        <!-- ============ Body content start ============= -->
        <div class="main-content">

        
            <div class="row">


                <!--                <div class="pl-5 pr-5 w-auto">-->
               

                <!--                </div>-->

                <div class="col-md-6 mb-4">
                    <div class="card text-left">
                        <div class="card-body">
                           <div class="auth-logo text-center mb-3"><img src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" alt=""></div>
                            <center><h4 class="card-title mb-3">DRUG INFORMATION ENTRY - ISD FORM</h4></center>
                           <!--  <span class=" mb-3">TOTAL NO OF RECORDS RETRIEVED : <span id="count">0</span></span> -->

                         <form id="unasampor" action="#">
                         
                 

				   <div class="form-group">
				   	 <div class="input-group">
   					  <span class="input-group-addon">Generic</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Generic" id="uName" value=""  />
                       </div>
                        </div>
                    
					<div class="form-group">	
						 <div class="input-group">
                     <span class="input-group-addon">Generic2</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Generic2" id="uName2" value=""  />
                       </div>
                        </div>
                    
                    
				   <div class="form-group">
				   	 <div class="input-group">
                   <span class="input-group-addon">Generic3</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Generic3" id="uName3" value=""  />
                       </div>
                        </div>

					   <div class="form-group">
					   	 <div class="input-group">
                     <span class="input-group-addon">Brand</span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Brand" id="uPwd" value=""  />
                       </div>
                        </div>
                    
						   <div class="form-group">
						   	 <div class="input-group">
                    <span class="input-group-addon">Dosage Form </span>&nbsp;&nbsp; &nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Dosage" id="firstName" value=""  placeholder="(tablets, injections etc. ) "/>
                       </div>
                        </div>
                  

   				<div class="form-group">
   					 <div class="input-group">
                     <span class="input-group-addon">Strength   </span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Strength" id="lastName" value=""  placeholder="(mg, G etc.)"/>
                       </div>
                        </div>
				
				       <div class="form-group">
				       	 <div class="input-group">
                    <span class="input-group-addon">IMC code :</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <input class="form-control form-control-rounded" type="text" name="IMC" id="ekaka" value=""  />
                       </div>
                        </div>
					
					   <div class="form-group">
					   	 <div class="input-group">
                  <span class="input-group-addon">Registration Exp Date </span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="RegExpDate" id="enemar" value=""  placeholder=" eg . 9999-12-31"/>
                       </div>
                        </div>
                        
                        
					   <div class="form-group">
					   	 <div class="input-group">
                  <span class="input-group-addon">Schedule </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2h" value="none" checked="checked">&nbsp;&nbsp;
          <span class="input-group-addon">NONE</span>
&nbsp;&nbsp; &nbsp;
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2a" value="I">&nbsp;&nbsp;
        <span class="input-group-addon">I</span>
        &nbsp;&nbsp; &nbsp;
        
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2b" value="IIB">&nbsp;&nbsp;
       <span class="input-group-addon">IIB</span>
        &nbsp;&nbsp; &nbsp;
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2c" value="IIA">&nbsp;&nbsp;
       <span class="input-group-addon">IIA</span>
        &nbsp;&nbsp; &nbsp;

	<input type="radio" name="radio-choice-v-2" id="radio-choice-v-2d" value="III">&nbsp;&nbsp;
    <span class="input-group-addon">III</span>
        &nbsp;&nbsp; &nbsp;
        
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2e" value="IIIN">&nbsp;&nbsp;
       <span class="input-group-addon">IIIN</span>
        &nbsp;&nbsp; &nbsp;
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2f" value="IV">&nbsp;&nbsp;
     <span class="input-group-addon">IV</span>
        &nbsp;&nbsp; &nbsp;
        
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2g" value="V">&nbsp;&nbsp;
      <span class="input-group-addon">V</span>
        &nbsp;&nbsp; &nbsp;
                       </div>
                        </div>
                        
                        
                    
   
   				<div class="form-group">
   					 <div class="input-group">
                <span class="input-group-addon">Importer</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                   <!--  <input type="text" name="aanaya" id="aanaya" value=""  />  -->
                    <select name="Importer" class="form-control">
                     <%for(String importer : importersList){ %>
                    <option value="<%=importer%>"><%=importer%></option>
                        
                      <%} %>
                    </select>
                       </div>
                        </div>
                    
	<div class="form-group">
	 <div class="input-group">
                  <span class="input-group-addon">Manufacturer</span>&nbsp;&nbsp; &nbsp; 
                   <!--  <input type="text" name="nish" id="nish" value=""  /> -->
                    <select name="Manufacturer" class="form-control" >
                    <%for(String manu : manufacturerList){ %>
                    
                    <option value="<%=manu%>"><%=manu%></option>
                     <%} %>
                    
                    </select>
       </div>
       </div>
					   <div class="form-group">
					   	 <div class="input-group">
                  <span class="input-group-addon">Country</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input class="form-control form-control-rounded" type="text" name="rata" id="Country" value=""  />
                       </div>
 </div>

   <div class="form-group">
   	 <div class="input-group">
                   <span class="input-group-addon">Notes</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  &nbsp; 
                    <input class="form-control form-control-rounded" type="text" name="Notes" id="satahan" value="" />
                     </div>
                     </div>
                    
                    <center><input type="submit" class="btn btn-primary" id="subBtn" value="Submit">
              
  						<input type="clear" class="btn btn-primary" value="Clear" onclick="window.location.reload();"></center>
  						 </form>

                        </div>
                </div>





           
                        </div>
                    </div>
                </div>

            </div><!-- end of main-content -->


      

      


<!-- ============ Search UI End ============= -->



</body>

<script>




$('#subBtn').click(function () {
	
    $.ajax({
        url: 'controller/DrugContrller.jsp?action=saveIsdtable',
        type: 'GET',
        processData: false,
        contentType: false,
        cache: false,
        data: $('#unasampor').serialize(), // added data type
        success: function (data) {
       
        	   console.log('res ' + data);
        	
                   swal({
                      type: 'success',
                      title: 'Registration Success!',
                      text: 'We will Contact you soon',
                      buttonsStyling: false,
                      confirmButtonClass: 'btn btn-lg btn-success'
                  });
              
                  
              
                  
                  
              
        	   
        },
        error: function (e) {
        
        }
    });
})


    function check(data) {
        console.log('res ' + data);

  
        

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
                if (data == 'true') {
                	 console.log('I AM HERE');
                     swal({
                        type: 'success',
                        title: 'Registration Success!',
                        text: 'We will Contact you soon',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    });
                    $('#subBtn').show(); 
                    
                
                    
                    
                } else {
                    $('#subBtn').show();
                }
            }
    
    }


       
</script>

</html>
