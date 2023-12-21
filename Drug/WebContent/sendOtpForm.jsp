
<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>IMPASL Drug | OTP Send</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="{{ URL::asset('css/business-casual.min.css') }}"
	rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" href="images/logo.png">
<link href="/css/app.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/js/app.js"></script>


<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-body {
	padding: 2rem;
}

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not (:placeholder-shown ) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not (:placeholder-shown )~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}

/* Fallback for Edge
-------------------------------------------------- */
@
supports (-ms-ime-align: auto ) { .form-label-group >label { display:none;
	
}

.form-label-group input::-ms-input-placeholder {
	color: #777;
}

}

/* Fallback for IE
-------------------------------------------------- */
@media all and (-ms-high-contrast: none) , ( -ms-high-contrast : active)
	{
	.form-label-group>label {
		display: none;
	}
	.form-label-group input:-ms-input-placeholder {
		color: #777;
	}
}

.btn-google {
	color: white;
	background-color: #ea4335;
}

.btn-facebook {
	color: white;
	background-color: #3b5998;
}
</style>
</head>
<body>

	<img src="images/logo.png" alt="logo" width="110" height="100"
		style="float: left; margin-top: -2.2%; padding-left: 0.5%">

		<br>



	<div class="row">
		<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-4">
				<div class="card-body">
					<h5 class="card-title text-center">OTP has sent to your mobile number..</h5>

					<form class="form-signin" action="controller/LoginController.jsp" method="post">

						<div class="container">
							<div class="col-md-10 offset-3 mt-4"></div>
						</div>

						<div class="card">
							<div class="card-body">

								<div class="form-label-group">
						<label for="inputEmail">Check your inbox</label>&nbsp;<br>
								
                
									
								</div>

								<div class="form-label-group">
								  <label for="inputPassword">Enter 4 digit code </label>&nbsp;<br><br>
									<input type="text" id="otp" class="form-control"
										name="otp1"  required autofocus> 
										
								</div>

								
								<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Confirm</button>
									
									
								<hr class="my-4">
							
							   <input hidden name="action" value="otp">	
							
					</form>
				</div>

			</div>
			
		</div>
		
		
		
		

	</div>
	
	</div>
	<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
			<div class="card card-signin my-4">
				<div class="card-body">
					<h5 class="card-title text-center">Click here to resend the otp..</h5>

					<form class="form-signin" action="controller/LoginController.jsp" method="post">

						<div class="container">
							<div class="col-md-10 offset-3 mt-4"></div>
						</div>

						<div class="card">
							<div class="card-body">

								

								

								
								<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Resend</button>
									
									
								<hr class="my-4">
							
							   <input hidden name="action" value="resend_otp">	
							
					</form>
				</div>

			</div>
		</div>
	</div>
	</div>

	<br>
	<br>


</body>

</html>