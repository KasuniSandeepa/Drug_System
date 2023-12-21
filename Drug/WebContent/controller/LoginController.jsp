<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="javax.script.Invocable"%>
<%@page import="java.nio.file.Files"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@ page import="drugfilter.controller.UserController"%>
<%@ page import="drugfilter.model.User"%>
<%@page import="com.mobios.util.LogUtil"%>
<%@page import="java.util.UUID"%>
<%@page import="java.util.Date"%>
<%@page import=" drugfilter.util.CommonUtill"%>
<%@ page import="drugfilter.util.MobileNoValidator"%>
<%@ page import="com.google.gson.Gson"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.sql.SQLException"%><%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 9:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
String now = new Date().toString();
String softVersion = "V1.0";
String platformID = "EVI-ETI";
String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
String logData = CommonUtill.EMPTY_STRING + softVersion + "," + platformID + "," + uuid;

String username = request.getParameter("email");
String password = request.getParameter("password");
String action = "" + request.getParameter("action");
String action_resend = "" + request.getParameter("action_resend");

String name = "" + request.getParameter("name");
String nic = "" + request.getParameter("nic");
String address = "" + request.getParameter("address");
String contactno = "" + request.getParameter("contactno");
String email = "" + request.getParameter("email");
String otp1 = ""+request.getParameter("otp1");

String page1 = "";

boolean validUser = false;
String lan = (String) session.getAttribute("lan");
if(lan==null){
    lan = "en";
}

if (action.equals("login")) {

/* 	for (User user : _Users) {

		if ((user.getEmail().equals(username)) && (user.getPassword().equals(password))) {

		validUser = true;
		HttpSession session1 = request.getSession();
		session1.setAttribute("uid", user.getId());
		session1.setAttribute("name", user.getName());
		break;
	    } else {

			validUser = false;
			}

	}

	if (validUser == true) {
		response.sendRedirect("../search.jsp");
	} else {

		response.sendRedirect("../index.jsp");
	} */

	/*   if(username.equals("admin")&& password.equals("admin@321")){
	      response.sendRedirect("../search.jsp");
	
	  }else {
	
	      response.sendRedirect("../index1.jsp");
	
	  } */
	
	try {
            final String msisdn = UserController.login(email, password);
            session.setAttribute("msisdn",msisdn);
            String b= " ";
            if(!msisdn.equals("false")){
//                application.setAttribute("verify" ,"done");
//                UserController.sendOtp(msisdn,lan);
				b = "true";
				User user = UserController.getUser(msisdn);
				if(user.getRole().equals("Entry")){
					 session.setAttribute("name",user);
					 response.sendRedirect("../"+"IMCForm1.jsp");
				}else if((user.getRole().equals("Approver"))){
					 session.setAttribute("name",user);
					 response.sendRedirect("../"+"Approve.jsp");
				}else{
					 session.setAttribute("name",user);
		             response.sendRedirect("../"+"search.jsp");
				}
				  response.setContentType("application/json");
	        	out.print(new Gson().toJson(true));

            }else{
            	b= "EXE";
                application.setAttribute("error","error");
                response.sendRedirect("../"+"index.jsp");
                response.setContentType("application/json");
        		out.print(new Gson().toJson(b));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
}

if (action.equals("reg")) {
	try {
		Random random = new Random();
		String _Otp = String.valueOf(random.nextInt(100000));
		String b = UserController.registerUser(name, address, contactno, nic, email, password, "en" , _Otp);
		if (b.equals("true")) {
			application.setAttribute("verify", "done");
			User user = UserController.getUserEmail(email);
			//session.setAttribute("msisdn", MobileNoValidator.getValidNumber(contactno));
			session.setAttribute("msisdn", user.getId());
		 	UserController.sendOtp(MobileNoValidator.getValidNumber(contactno),lan , _Otp );
			response.setContentType("application/json");
			out.print(new Gson().toJson(true));
		} else {
			response.setContentType("application/json");
			out.print(new Gson().toJson(b));
		}

	}catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
	
}else if(action.equals("otp")){
  String id = (String)session.getAttribute("msisdn");
   //String msisdn = "94752917442";
    if(id==null) {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("application/json");
        out.print("exp");
        return;
    }else {
    //	msisdn = msisdn.substring(0, 11);
        boolean b = UserController.checkOtp(id,otp1.trim());
        if(b){
          // session.setAttribute("name",UserController.getUser(msisdn));
          session.setAttribute("name",UserController.getUserById(id));
        	response.setContentType("application/json");
    		out.print(new Gson().toJson(true));
        //   response.sendRedirect("../"+"sucessRegister.jsp");
        }
        else{
        	response.setContentType("application/json");
        	// response.sendRedirect("../"+"sendOtp1.jsp");
        	out.print(new Gson().toJson(b));
        }
       /*  request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        response.setContentType("application/json");
        out.print(b);
        return; */
    }
}else if(action.equals("otpPasswordReset")){
	  User user = (User)session.getAttribute("user");
	   //String msisdn = "94752917442";
	    if(user==null) {
	        request.setCharacterEncoding("utf8");
	        response.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        out.print("exp");
	        return;
	    }else {
	    	String msisdn = user.getMobileNo();
	    	String id = user.getId();
	        boolean b = UserController.checkOtp(id,otp1.trim());
	        if(b){
	            session.setAttribute("user",user);
	        	response.setContentType("application/json");
	    		out.print(new Gson().toJson(true));
	           //response.sendRedirect("../"+"resetPassword.jsp");
	        }
	        else{
	        	response.setContentType("application/json");
	        	// response.sendRedirect("../"+"resetPasswordOtp.jsp");
	        	out.print(new Gson().toJson(b));
	        }
	     /*    request.setCharacterEncoding("utf8");
	        response.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        out.print(b);
	        return; */
	    }
	}

else if(action.equals("mail")){
	String email1 = "chamilabiyanvila@gmail.com";
//	UserController.sendEmail(email1);

}else if(action.equals("resend_otp")){
	    String msisdn = (String)session.getAttribute("msisdn");
	   //String msisdn = "94752917442";
	    if(msisdn==null) {
	        request.setCharacterEncoding("utf8");
	        response.setCharacterEncoding("utf8");
	        response.setContentType("application/json");
	        out.print("exp");
	        return;
	    }else {
	    	//System.out.println(otp1);
	    	   Random random = new Random();
		       String _Otp = String.valueOf(random.nextInt(100000));
		       String forgetPass = "no";
		       int result = UserController.updateOtpByMobileNumber(msisdn, _Otp , forgetPass);
		       if(result>0){
		    	   User user = UserController.getUserById(msisdn);
		    	   UserController.sendOtp(user.getMobileNo(),lan , _Otp );
			  	   //session.setAttribute("name",UserController.getUserById(msisdn));
			  	   session.setAttribute("name",user);
			      response.sendRedirect("../"+"sendOtp1.jsp");
		       }else{
					response.setContentType("application/json");
		        	// response.sendRedirect("../"+"resetPasswordOtp.jsp");
		        	out.print(new Gson().toJson(false));
				   }
	}
}else if(action.equals("resend_otp1")){
  String  msisdn="94716525135";
    	//System.out.println(otp1);
    	   Random random = new Random();
	       String _Otp = String.valueOf(random.nextInt(100000));
	       String forgetPass = "no";
	       int result = UserController.updateOtpByMobileNumber(msisdn, _Otp , forgetPass);
		 //	UserController.sendOtp(msisdn,lan , _Otp );
		   //  session.setAttribute("name",UserController.getUser(msisdn));
		   if(result>0){
		     response.sendRedirect("../"+"test.jsp");
		   }else{
		/* 	int input =    JOptionPane.showOptionDialog(null,"Onlt two times are allowed to resend OTP", "Failed Attempt" , JOptionPane.OK_CANCEL_OPTION , JOptionPane.INFORMATION_MESSAGE, null , null , null);
	        	
			if(input == JOptionPane.OK_OPTION){
				  UserController.removeUser(msisdn);
				  response.sendRedirect("../"+"register.jsp");
				
			}else if(input == JOptionPane.CANCEL_OPTION){
				  response.sendRedirect("../"+"test.jsp");
			}
 */			
		/* 	response.setContentType("application/json");
	        	  response.sendRedirect("../"+"test.jsp");
	        	out.print(new Gson().toJson(result)); */
		   }
}if (action.equals("searchAccount")) {
	try {
		String b = UserController.getUserByEmail(email);
		if (b.equals("true")) {
			User user = UserController.getUserEmail(email);
			application.setAttribute("verify", "done");
			session.setAttribute("user", user);
			response.setContentType("application/json");
			out.print(new Gson().toJson(true));
		} else if(b.equals("false")){
			response.setContentType("application/json");
			out.print(new Gson().toJson(b));
		}
	} catch (Exception e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
}if (action.equals("sendEmailOtp")) {
		User user = (User)session.getAttribute("user");
		String otp = UserController.generateOtp();
		UserController.sendEmailOtp(user, otp);
		String forgetPass = "yes";
		UserController.updateOtpByMobileNumber(user.getId(), otp , forgetPass);
		/* System.out.println(user.getMobileNo()); */
	    response.sendRedirect("../"+"resetPasswordOtp.jsp");
		
}if (action.equals("resetSMSOtp")) {
	User user = (User)session.getAttribute("user");
	String otp = UserController.generateOtp();
	UserController.sendOtp(user.getMobileNo(), lan, otp);
	String forgetPass = "yes";
	UserController.updateOtpByMobileNumber(user.getId(), otp , forgetPass);
    response.sendRedirect("../"+"resetPasswordOtp.jsp");

}if (action.equals("resetPassword")) {
	User user = (User)session.getAttribute("user");
	/* System.out.println(user.getName()); */
	/* System.out.println(password); */
    try {
		String b = " ";
		int rows = UserController.resetPassword(user.getId(), password);
		if(rows>0){
			b = "true";
		}else{
			b = "false";
		}
		if (b.equals("true")) {
			application.setAttribute("verify", "done");
			//session.setAttribute("user", user);
			response.setContentType("application/json");
			out.print(new Gson().toJson(true));
		} else if(b.equals("false")){
			response.setContentType("application/json");
			out.print(new Gson().toJson(b));
		}
    } catch (Exception e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
}
	

}else if(action.equals("logout")){
	session.invalidate();
    /* 	System.out.println("Session detroy"); */
	response.sendRedirect("../"+"index.jsp");
}

if (action.equals("login1")) {
	try {
		//RETURN THE ID
		 final String userId = UserController.login(email, password);
         session.setAttribute("msisdn",userId);
		 if (!userId.equals("false")) {
			User user = UserController.getUserById(userId);
			   LogUtil.getLog("Event").debug(logData + ",LoginController.login,user_id="+userId+",email="+email+",logged");
               LogUtil.getLog("Console").debug(logData + ",LoginController.login,user_id="+userId+",email="+email+",logged");
			if(user.getRole().equals("Entry")){
				 session.setAttribute("name",user);
				//response.sendRedirect("../"+"IMCForm1.jsp");
			}else if((user.getRole().equals("Approver"))){
				 session.setAttribute("name",user);
				//	response.sendRedirect("../"+"Approve.jsp");
			}else{
				 session.setAttribute("name",user);
	            //  response.sendRedirect("../"+"search.jsp");
			}
		 /* 	System.out.println("i am b"+msisdn); */
			response.setContentType("application/json");
			out.print(new Gson().toJson(user.getRole()));
		} else {
			response.setContentType("application/json");
			out.print(new Gson().toJson(userId));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
}

%>
