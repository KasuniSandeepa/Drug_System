<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="drugfilter.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IMPASL Drug | ResetPassword OTP</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
     <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css" />
     
     <style type="text/css">
     
     

td {

  height: 40px;

}
     </style>

</head>


<%


User user = (User)session.getAttribute("user");

String mobile = user.getMobileNo();
String m = "+*******"+mobile.substring(mobile.length()-2);

%>

	
<div class="auth-layout-wrap" >
    <div class="auth-content">
        <div class="card o-hidden">

            <div class="col-md-12 ml-auto mr-auto">
                <div class="p-4">
                    <div class="auth-logo text-center mb-4"><img src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" alt=""></div>
                    <h1 class="mb-3 text-20"><b>Reset Your Password<b></b></h1>
                    
                       <h3 class="mb-3 text-15"><b><%=user.getName() %> - Drug System User</b></h3>
                    <form action="#"  id="resetPotp_form" name="resetPotpForm">
                    
                   <table style="">
                  <tr>
                  
                        <div class="form-group">
                           
                            
			                <div class="input-group"" >
			                <td ">
			                <span class="input-group-addon" ><i class="glyphicon glyphicon-user"></i></span>
			            Send code via email <%=user.getEmail()%>  
			            </td>
			            <td style="width:250px; text-align: right">
			         
			              <a  class="text-muted" href="controller/LoginController.jsp?action=sendEmailOtp"><button type="button" class="btn btn-primary btn-sm" style="background-color:#f9e6ff;  color:black;"> Send code via email  </button></a>
			             
			               </td>
			                </div>
                            
                        </div>
                 
                        </tr>
                        <tr style="">
                       
                        <div class="form-group">
                           
                            
			                <div class="input-group">
			                <td style="">
			                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			          Send code via SMS <%=m%>
			          </td >
			          <td style="width:250px; text-align: right">
			              <a  class="text-muted" href="controller/LoginController.jsp?action=resetSMSOtp"><button type="button" class="btn btn-primary btn-sm" style="background-color:#f9e6ff;  color:black;">    Send code via SMS </button></a>
			               </td>
			                </div>
                            
                        </div>
                       
                       </tr>
                    </table>
                        
                        
                         <div class="form-group">
                            <label for="email">Enter 4 digit code</label>
                            <input class="form-control form-control-rounded" id="otp" name="otp1" type="text">
                        </div>
                       
                      <!--   <button type="submit" class="btn btn-rounded btn-primary btn-block mt-2">Confirm</button> -->
                       <button id="subBtn" type="button"  class="btn btn-rounded btn-primary btn-block mt-2">
                                    Confirm
                                </button>
                      <!--    <input hidden name="action" value="otpPasswordReset"> -->
                            <input hidden name="forget" value="yes">
                    	
                    </form>
                    <div >
                   <!--  <div class="mt-3 text-left"><a class="text-muted" href="#">
                        <u>Forgot Password?</u></a></div> -->
                   
                </div>
            </div>


        </div>
    </div>
</div>

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

var isM = false;
var isE = false;
var isN = false;
var isP = false;
var isPS = false;
var isP1 = false;
var isT = false;
var isPass = false;
var isCap = false;
var isOK = true;



$('#subBtn').click(function () {


    var x = document.forms["resetPotpForm"];
    // console.log(x);
    $.each(x, function (i, sx) {

            if (sx.placeholder == 'Email') {
			console.log("EMAIL "+ sx.value);
                if (!validateEmail(sx.value)) {
                    $(sx).addClass('is-invalid');
                    
                    isE = false;
                } else {
                    isE = true;
                }
            }
       
            if (sx.placeholder == 'Password') {

                if (!validatePassword(sx.value)) {
                    $(sx).addClass('is-invalid');
                    isPass = false;
                } else {
                    isPass = true;
                }
            }

            
            if(sx.placeholder == 'Password'){
            	pass = sx.value;
            }
            
       

    });
  
    console.log(isE)
    console.log(isM)
    console.log(isN)
    console.log(isP)
    console.log(isP1)
    console.log(isPS)
    console.log(isT)
    console.log(isCap)
    
   
    if (isOK) {

        $('#subBtn').hide();
     

        $.ajax({
            url: 'controller/LoginController.jsp?action=otpPasswordReset',
            type: 'GET',
            processData: false,
            contentType:false,
            cache: false,
            data: $('#resetPotp_form').serialize(), // added data type
           
            success: function (data) {
            	
            	  console.log(data);
                check(data);
              
            },
            error: function (xhr) {
            	
            	  console.log('Request Status: ' + xhr.status + ' Status Text: ' + xhr.statusText + ' ' + xhr.responseText);

            }
        });
    }else{
    	
    	//if u want something here
    }

});




function check(data) {
    console.log('res ' + data);



    setTimeout(function () {
    	
   
   
        if (data == false) {
            $('#subBtn').show();
            swal({
                type: 'warning',
                title: 'Invalid OTP',
                text: 'Please Try Again',
                buttonsStyling: false,
                confirmButtonClass: 'btn btn-lg btn-success',
            });
        } else {
            if (data) {
            		window.location.href = 'resetPassword.jsp';
             
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
    var x = document.forms["regFrom"];
    $.each(x, function (i, sx) {
        $(sx).removeClass('is-invalid');
    });
}


function validatePassword(msisdn) {
    const re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
    return re.test(String(msisdn));
}











</script>
