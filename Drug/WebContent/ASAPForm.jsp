<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="drugfilter.controller.DrugController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page import="drugfilter.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMPASL Drug | ASAP</title>
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.2.1/jquery.mobile-1.2.1.min.css" />
	<script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.2.1/jquery.mobile-1.2.1.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>


<Style>
select{
color : blue;avasanpit
background-color : FFDAB9;
font-size : 0.9em;
border:thick groove #8B0000;
}

option{
padding : 4px;
}
</Style>
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



%>
</head>
<body>
<div data-role="page" id="home" data-theme="e" data-content-theme="e">
        <div data-role="header">
<a href="search1.jsp" data-theme="b">Home</a>
            <h1>DRUG DATA COLLECTION FORM</h1>
	<a href="IMC.jsp" data-theme="b">IMC Form</a>
	<a href="#atcpit" data-theme="b">ATC Form</a>
	<a href="#avasanpit" data-theme="b">Search</a>
	<a href="#derules" data-theme="b">DATA ENTRY HELP</a>

        </div>
        <div data-role="content">
<p></p>
<p> </p>

            <form id="unasampor">
                <div data-role="fieldcontain">
                
                    <label for="firstName">Generic</label>
                    <input type="text" name="Generic" id="uName" value=""  />
						<br><br>
                    <label for="firstName">Generic2</label>
                    <input type="text" name="Generic2" id="uName2" value=""  />
						<br><br>
                    <label for="firstName">Generic3</label>
                    <input type="text" name="Generic3" id="uName3" value=""  />

						<br><br>
                    <label for="lastName">Brand</label>
                    <input type="text" name="Brand" id="uPwd" value=""  />
							<br><br>
                    <label for="firstName">Dosage Form (tablets, injections etc. ) :</label>
                    <input type="text" name="Dosage" id="firstName" value=""  />
                    <br><br>
                    <label for="lastName">Strength  (mg, G etc.) </label>
                    <input type="text" name="Strength" id="lastName" value=""  />
					<br><br>
                    <label for="ekaka">IMC code :</label>
                    <input type="text" name="IMC" id="ekaka" value=""  />
					<br><br>
                    <label for="enemar">Registration Exp Date eg . 9999-12-31 </label>
                    <input type="text" name="RegExpDate" id="enemar" value=""  />

        <fieldset data-role="controlgroup">
        <legend>Schedule :</legend>

        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2h" value="none" checked="checked">
        <label for="radio-choice-v-2h">NONE</label>

        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2a" value="I">
        <label for="radio-choice-v-2a">I</label>
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2b" value="IIB">
        <label for="radio-choice-v-2b">IIB</label>
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2c" value="IIA">
        <label for="radio-choice-v-2c">IIA</label>

	<input type="radio" name="radio-choice-v-2" id="radio-choice-v-2d" value="III">
        <label for="radio-choice-v-2d">III</label>
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2e" value="IIIN">
        <label for="radio-choice-v-2e">IIIN</label>
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2f" value="IV">
        <label for="radio-choice-v-2f">IV</label>
        <input type="radio" name="radio-choice-v-2" id="radio-choice-v-2g" value="V">
        <label for="radio-choice-v-2g">V</label>

    	</fieldset>
<br><br>
                  <label for="aanaya">Importer</label> 
                   <!--  <input type="text" name="aanaya" id="aanaya" value=""  />  -->
                    <select name="Importer">
                     <%for(String importer : importersList){ %>
                    <option value="<%=importer%>"><%=importer%></option>
                        
                      <%} %>
                    </select>
                    <br><br>
                   <label for="nish">Manufacturer</label>
                   <!--  <input type="text" name="nish" id="nish" value=""  /> -->
                    <select name="Manufacturer">
                    <%for(String manu : manufacturerList){ %>
                    
                    <option value="<%=manu%>"><%=manu%></option>
                     <%} %>
                    
                    </select>
                   <br><br>
                   <label for="rata">Country</label>
                    <input type="text" name="rata" id="Country" value=""  />

<br><br>
                   <label for="lastName">Notes</label>
                    <input type="text" name="Notes" id="satahan" value="DATA CANNOT BE SAVED IN THIS VERSION"  />
                     <button  value="submit" id="subBtn"></button>
                </div>
                   </form>
        </div>
</body>
<script type="text/javascript">

$('#subBtn').click(function () {
	
    $.ajax({
        url: 'controller/DrugContrller.jsp?action=saveIsdtable',
        type: 'GET',
        processData: false,
        contentType: false,
        cache: false,
        data: $('#unasampor').serialize(), // added data type
        success: function (data) {
        	  check(data);
        },
        error: function (e) {

        }
    });
})


    function check(data) {
        console.log('res ' + data);

        setTimeout(function () {
        

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
                        title: 'Registration Success!',
                        text: 'We will Contact you soon',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    });
                    $('#subBtn').show(); 
                    
                	 window.location.href = 'ASAPForm.jsp';
                    
                    
                } else {
                    $('#subBtn').show();
                }
            }
        }, 500);
    }
</script>
</html>