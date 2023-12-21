<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="drugfilter.model.User"%>
<!DOCTYPE html>
<html lang="en" dir="">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>IMPASL Drug | IMC Data Form</title>
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
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
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


/* System.out.println(user.getName()); */
loginName = user.getName();
}

%>

<input id="loginName" value=<%=loginName%> hidden></input>

<script>

var x = document.getElementById('loginName').value;
console.log(x);


if(x=='Nouser'){
	
	alert("Please Signin");
}
	
	</script>


<body >

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


                

            </div>
         
            <div class="row">


                <!--                <div class="pl-5 pr-5 w-auto">-->
               

                <!--                </div>-->

				
                <div class="col-md-6 mb-4 ml-auto mr-auto">
                    <div class="card text-left">
                        <div class="card-body">
                           <div class="auth-logo text-center mb-3"><img src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" alt=""></div>
                            <center><h4 class="card-title mb-3">DRUG INFORMATION ENTRY - IMC FORM</h4></center>
                           <!--  <span class=" mb-3">TOTAL NO OF RECORDS RETRIEVED : <span id="count">0</span></span> -->

                         <form id="imcForm" action="#">

   					<div class="form-group">
   					 <div class="input-group">
                     <span class="input-group-addon">Importer</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded"  type="text" name="Importer" id="SearchStr1" value="" required="required" /> 
                    
                    </div>
                      </div>
                    
                    
                        
 					<div class="form-group">
 					<div class="input-group">
               <span class="input-group-addon">Manufacturer</span> &nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Manufacturer" id="SearchStr2" value=""  required="required"/>
                     </div>
    				 </div>
    				 
    				 <div class="form-group">
    				 <div class="input-group">
                     <span class="input-group-addon">Country</span>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Country" id="SearchStr3" value=""  required="required"/>
                     </div>
                    </div>

					<div class="form-group">
					<div class="input-group">
                    <span class="input-group-addon">IMCcode</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="IMCcode" id="SearchStr4" value="" required="required" />
                     </div>
                    </div>


					<div class="form-group">
					<div class="input-group">
                   <span class="input-group-addon">Address</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Address" id="SearchStr5" value="" required="required" />
                     </div>
                    </div>
 
 
 					<div class="form-group">
 					<div class="input-group">
                  <span class="input-group-addon">Phone</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Phone" id="SearchStr6" value=""  required="required"/>
                     </div>
                    </div>

					<div class="form-group">
					<div class="input-group">
                     <span class="input-group-addon">Fax</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="Fax" id="SearchStr7" value=""  required="required"/>
                     </div>
                    </div>

					<div class="form-group">
					<div class="input-group">
                   <span class="input-group-addon">email</span>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input class="form-control form-control-rounded" type="text" name="email" id="SearchStr8" value=""  required="required"/>
                     </div>
                    </div>
                    
           
                    
                
                     <center><input type="submit" class="btn btn-primary" id="subBtn" value="Submit">
              
  						<input type="button" class="btn btn-primary" value="Clear" onclick="window.location.reload();"></center>

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




            </form>
                        </div>
                    </div>
                </div>
                

            </div><!-- end of main-content -->


            <div class="flex-grow-1"></div>

        </div>

    </div>



<!-- ============ Search UI End ============= -->

<script>




$('#subBtn').click(function () {
    var isE = false;
    var isM = false;
	
	 var x = document.forms["imcForm"];
     // console.log(x);
     $.each(x, function (i, sx) {

        

             if (sx.name== 'email') {
				console.log("EMAIL "+ sx.value);
				 if (!validateEmail(sx.value)) {
                     $(sx).addClass('is-invalid');
                     
                     isE = false;
                 } else {
                     isE = true;
                 }
                
             }
             
             if (sx.name == 'Phone') {

                 if (!validateMobile(sx.value)) {
                     $(sx).addClass('is-invalid');
                     
                     isM = false;
                 } else {
                     isM = true;
                 }
             }
     });
	
	
	
	 $('#subBtn').hide();
     $('#loader').removeClass('d-none');
     $('#loader').show();

	
    $.ajax({
        url: 'controller/DrugContrller.jsp?action=saveImctable',
        type: 'GET',
        processData: false,
        contentType: false,
        cache: false,
        data: $('#imcForm').serialize(), // added data type
        success: function (data) {
        	check(data) ;
           

        },
        error: function (e) {

        }
    });
})

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
                    //
                  /*   swal({
                        type: 'success',
                        title: 'Registration Success!',
                        text: 'We will Contact you soon',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    });
                    $('#subBtn').show(); */
                    
                	 window.location.href = 'sendOtp1.jsp';
                    
                    
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


function validateMobile(msisdn) {
    const re = /^(?:0|94|\+94)?(?:(11|21|23|24|25|26|27|31|32|33|34|35|36|37|38|41|45|47|51|52|54|55|57|63|65|66|67|81|912)(0|2|3|4|5|7|9)|7(0|1|2|5|6|7|8)\d)\d{6}$/;
    return re.test(String(msisdn));
}
       
</script>
</body>

</html>
