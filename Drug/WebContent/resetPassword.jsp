<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/15/2021
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="drugfilter.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>IMPASL Drug | Reset Password</title>
    <link
            type="text/css"
            href="vendor/@fortawesome/fontawesome-free/css/all.min.css"
            rel="stylesheet"
    />

    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet">
    <link href="dist-assets/css/themes/lite-purple.min.css" rel="stylesheet">
    <link href="dist-assets/css/swipe.css" rel="stylesheet">
    <link rel="stylesheet" href="dist-assets/css/plugins/sweetalert2.min.css" />

</head>
<body>
<%
StringBuffer sb=new StringBuffer();  
for(int i=1;i<=5;i++)  
{  
    sb.append((char)(int)(Math.random()*79+23+7));  
}  
String cap=new String(sb);

User user = (User)session.getAttribute("user");
String fullName = user.getName();
%>
<div class="auth-layout-wrap" >
    <div class="auth-content">
        <div class="card o-hidden">

            <div class="col-md-8 ml-auto mr-auto">

                    <div class="row gx-0 align-items-center justify-content-between">
                        <div class="col-12 ">
                            <div class="text-center text-md-center mb-4 mt-md-0">
                                <img class="pt-2" src="dist-assets/images/dlf.pt-plus-sign-png-110969.png" style="width: 15%"
                                     id="logo-sprig" alt=""/>
                                <h1 class="mb-0 h3">Reset Password</h1>
                            </div>
              
                            <form id="form_resetPassword" name="resetPasswordFrom" action="#">
                                <!-- Form -->
                               
                                
                                           <h4 class="mb-0 h4"><%=fullName %></h4>
                                    
                             
                                <!-- End of Form -->
                               
                               
                               <br>
                              
                                <div class="form-group">
                                    <!-- Form -->
                                    <div class="form-group mb-2">
                                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon4"
                            ><span class="fas fa-lock"></span
                            ></span>
                                            <input 
                                                   type="password"
                                                   placeholder="Enter new Password"
                                                   class="form-control"
                                                   id="password"
                                                   name="password"
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
                                                   title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
                                                   required
                                            />
                                        </div>
                                    </div>
                                    <!-- End of Form -->
                                    <!-- Form -->
                                    <div class="form-group mb-2">
                                        <div class="input-group">
                            <span class="input-group-text" id="basic-addon5"
                            ><span class="fas fa-lock"></span
                            ></span>
                                            <input onkeydown="removeValidation()"
                                                   type="password"
                                                   placeholder="Confirm Password"
                                                   class="form-control"
                                                   id="repassword"
                                                   name="repassword"
                                                   required
                                            />
                                        </div>
                                    </div>
                                    <!-- End of Form -->
                                   
                                    
                                <button id="subBtn" type="button" class="btn btn-block btn-primary">
                                    Confirm
                                </button>
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
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="dist-assets/js/swipe.js"></script>
<script src="dist-assets/js/plugins/bootstrap.bundle.min.js"></script>
<script src="dist-assets/js/plugins/perfect-scrollbar.min.js"></script>
<script src="dist-assets/js/scripts/script.min.js"></script>
<script src="dist-assets/js/scripts/sidebar.large.script.min.js"></script>
<script src="dist-assets/js/plugins/sweetalert2.min.js"></script>
<script src="dist-assets/js/scripts/sweetalert.script.min.js"></script>

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
    
    $('#subBtn').click(function () {


        var x = document.forms["resetPasswordFrom"];
        // console.log(x);
        $.each(x, function (i, sx) {

           


               
              

              
                
                if (sx.placeholder == 'Enter new Password') {

                    if (!validatePassword(sx.value)) {
                        $(sx).addClass('is-invalid');
                        isPass = false;
                    } else {
                        isPass = true;
                    }
                }

                
                
                if(sx.placeholder == 'Enter new Password'){
                	pass = sx.value;
                }
                
                if(sx.placeholder == 'Confirm Password'){
                	repass = sx.value;
                }
                
                
               

            

        });

        
       
        
        
        if (!(pass === repass)) {
            $('#repassword').addClass('is-invalid');
            $('#password').addClass('is-invalid');

            isP = false;
        } else {
            isP = true;
        }
      
        
        
      
        console.log(isE)
        console.log(isM)
        console.log(isN)
        console.log("is matched"+isP)
        console.log(isP1)
        console.log(isPS)
        console.log(isT)

        if (  isP && isPass) {

            $('#subBtn').hide();
            $('#loader').removeClass('d-none');
            $('#loader').show();

            $.ajax({
                url: 'controller/LoginController.jsp?action=resetPassword',
                type: 'GET',
                processData: false,
                contentType: false,
                cache: false,
                data: $('#form_resetPassword').serialize(), // added data type
                success: function (data) {

                    check(data);

                },
                error: function (e) {

                }
            });
        }else{
        if(!isPass){
        		swal({
                    type: 'error',
                    title: 'Reset Password Failed! Weak Password',
                    text: 'Password Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters',
                    buttonsStyling: false,
                    confirmButtonClass: 'btn btn-lg btn-success'
                });
        	}else if(!isP){
      		  swal({
                  type: 'error',
                  title: 'Reset Password  Failed!',
                  text: 'Password and Confirm passwords are mismatched',
                  buttonsStyling: false,
                  confirmButtonClass: 'btn btn-lg btn-success'
              });
    	}
        }

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
                        title: 'Success!',
                        text: 'Redirect to Login Page',
                        buttonsStyling: false,
                        confirmButtonClass: 'btn btn-lg btn-success'
                    });
                    $('#subBtn').show(); 
                    
                	 window.location.href = 'index.jsp';
                    
                    
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




