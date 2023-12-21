package drugfilter.controller;

import java.net.URL;
import java.util.UUID;
import java.util.Random;
import javax.mail.Session;
import java.sql.ResultSet;
import javax.mail.Message;
import java.net.URLEncoder;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Transport;
import drugfilter.model.User;
import java.sql.SQLException;

import drugfilter.util.CommonUtill;
import drugfilter.util.Config;
import java.io.BufferedReader;
import java.net.URLConnection;
import com.mobios.util.LogUtil;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.InputStreamReader;
import java.sql.PreparedStatement;
import drugfilter.db.DBConnection;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import javax.mail.MessagingException;
import java.net.MalformedURLException;
import javax.mail.internet.MimeMessage;
import drugfilter.util.TestLog4jServlet;
import drugfilter.util.MobileNoValidator;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.InternetAddress;
import java.io.UnsupportedEncodingException;


public class UserController {
	
	public static final Logger logger = Logger.getLogger(UserController.class.getName());
	//static String now = new Date().toString();
	static String softVersion = "V1.0";
	static String platformID = "EVI-ETI";
	static String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
	static String logData = CommonUtill.EMPTY_STRING + "," + softVersion + "," + platformID + "," + uuid;
	
    public static String registerUser(String name, String address, String contactno, String nic, String email, String password, String lan , String  _Otp) throws SQLException {

        String re = "";
        boolean emails = false;
        boolean mobile = false;

        ResultSet query1 = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "'");
        ResultSet query2 = DBConnection.getInstance().query("SELECT * FROM users WHERE contact_no='" + MobileNoValidator.getValidNumber(contactno) + "'");

        mobile = query2.next();
        emails= query1.next();

        if(emails){
            re = "EXE";
            LogUtil.getLog("Event").debug(logData + ",UserController.registerUser,user="+name+",email="+email+", Already Registered User");
        }else {
        	String language ="en";
        	String status = "ACTIVE";
        	
         //   int query = DBConnection.getInstance().insert("INSERT INTO users (name,address,mobileNo,nic,email,nic,password) VALUES('" + email
                //    + "','" + password
                //    + "','ACTIVE','" + name + "','" + address + "','" + nic + "','" + MobileNoValidator.getValidNumber(contactno) + "','" + lan + "',NOW())");
            int query = DBConnection.getInstance().insert("insert into users(user_auto_id,name,address,contact_no,nic,email,password ,otp , lan , status) values (0,'" + name
					+ "','" + address + "','" + MobileNoValidator.getValidNumber(contactno) + "','" + nic + "','" + email + "','" + password + "','"+ _Otp +   "','" + language +  "', '"+ status+"'   )");
            if(query>0){
                re ="true";
                LogUtil.getLog("Event").debug(logData + ",UserController.registerUser,new user="+name+",email="+email+",registered");
                LogUtil.getLog("Console").debug(logData + ",UserController.registerUser,new user="+name+",email="+email+",registered");
               
            }
        }

        return re;
    }
    
    public static String login(String email, String password) throws SQLException {

        final ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");
     
        String verified = "Verified";
        while (query.next()) {
            if (email.equals(query.getString("email")) && password.equals(query.getString("password")) && verified.equals(query.getString("verified"))) {
                return query.getString("user_auto_id");
            }
            return "false";
        }
        logger.log(Level.SEVERE, "Invalid Login");
        return "false";
    }
    
   
    public static User getUser(String msisdn) {
        User user = new User();
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE contact_no='" + msisdn + "'");

            if (query.next()) {
                user.setId(query.getString("user_auto_id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("contact_no"));
                user.setOtpUpdateCount(query.getInt("otp_update_count"));
                user.setRole(query.getString("role"));
               // user.setLan(query.getString("lan"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }
    
    public static User getUserById(String id) {
        User user = new User();
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE user_auto_id='" + id + "'");

            if (query.next()) {
                user.setId(query.getString("user_auto_id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("contact_no"));
                user.setOtpUpdateCount(query.getInt("otp_update_count"));
                user.setRole(query.getString("role"));
               // user.setLan(query.getString("lan"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }
    
    public static User getUserEmail(String email) {
        User user = new User();
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" +email + "'");
            if (query.next()) {
                user.setId(query.getString("user_auto_id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("contact_no"));
                user.setOtpUpdateCount(query.getInt("otp_update_count"));
               // user.setLan(query.getString("lan"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;

    }
    
    public static String getUserByEmail(String email) {
        User user = new User();
        String result = " ";
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT * FROM users WHERE email='" + email + "'");
			/* System.out.println("qqqqqqqqq"+query); */
            if (query.next()) {
                user.setId(query.getString("user_auto_id"));
                user.setName(query.getString("name"));
                user.setEmail(query.getString("email"));
                user.setAddress(query.getString("address"));
                user.setNic(query.getString("nic"));
                user.setMobileNo(query.getString("contact_no"));
                user.setOtpUpdateCount(query.getInt("otp_update_count"));
               // user.setLan(query.getString("lan"));
                result = "true";
            }else {
            	 result = "false";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return result;
    }
    
    public static boolean checkOtp(String msisdn, String otp) {
        try {
            ResultSet query = DBConnection.getInstance().query("SELECT otp FROM users WHERE user_auto_id='" + msisdn + "'");
            String otp1 = "";
            if (query.next()) {
                otp1 = query.getString("otp");
            }

            if (otp.equals(otp1)) {
            	verifyUser(msisdn,otp);
            	//User user = getUser(msisdn);
            	User user = getUserById(msisdn);
            	sendEmail(user.getEmail() , user);
                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }
    
    public static void sendOtp(String msisdn, String lan , String otpKey) throws SQLException {
        String msg = null;
        String characters = "0123456789";
      

        if (lan.equals("en")) {
            msg = "Your OTP Code is " + otpKey;
        } else if (lan.equals("si")) {
            msg = "ඔබගේ OTP රහස් අංකය " + otpKey;
        } else if (lan.equals("ta")) {
            msg = "Your OTP Code is " + otpKey;
        }
        //updateOtpByMobileNumber(msisdn, otpKey);
    	LogUtil.getLog("Event").debug(logData + ",UserController.sendOtp,cli="+msisdn+",msg="+msg+",message_encoded,");
    	LogUtil.getLog("Console").debug(logData + ",UserController.sendOtp,cli="+msisdn+",msg="+msg+",message_encoded,");
        sendSMS(msisdn,msg);
    }

    public static String sendSMS(String msisdn, String msg) {

        String encode = null;
        String converted_response = "";
        
       //   final String SMS_USERNAME = "mobios_alert";
       //   final String SMS_SRC = "MobiOsOTP";
       // final String SMS_PASSWORD = "Mo321Ar1";
       //  final String SMS_ACTION = "bulk_put";
       ////  final String SMS_CAMP = "bulk";
          
		
		  final String SMS_URL = Config.Read("SMS_URL"); 
		  final String SMS_USERNAME =Config.Read("SMS_USERNAME");
		  final String SMS_SRC = Config.Read("SMS_SRC");;
		 final String SMS_PASSWORD = Config.Read("SMS_PASSWORD"); 
		  final String SMS_ACTION = Config.Read("SMS_ACTION"); 
		  final String SMS_CAMP =Config.Read("SMS_CAMP");
		 
        try {
            encode = URLEncoder.encode(msg, "UTF-8");
			/* System.out.print("encode"+encode); */

         //  String url = "http://220.247.201.241:5000/sms/send_sms.php?username=mobios_alert&password=Mo321Ar&src=MobiOsOTP&dst=" + msisdn + "&msg=" + encode + "&dr=1&lan=u";
			
			  String url = SMS_URL + "?" + "username=" + SMS_USERNAME + "&password=" +
			SMS_PASSWORD + "&src=" + SMS_SRC + "&dst=" + msisdn + "&msg=" + encode +
			 "&dr=1" + "&lan=u";
			
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            StringBuffer response = null;


            // optional default is GET
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }

            in.close();

            converted_response = response.toString();
            
            System.out.println("response :"+converted_response);
        	LogUtil.getLog("Event").debug(logData + ",sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
    		LogUtil.getLog("SMSlog").debug(logData + ",sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
    		LogUtil.getLog("Console").debug(logData + ",sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
    		

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        
        } catch (ProtocolException e) {
            e.printStackTrace();
           
        } catch (MalformedURLException e) {
            e.printStackTrace();
          
        } catch (IOException e) {
            e.printStackTrace();
         
        }catch(Exception e) {
        
			System.out.println("Exception thrown by getOutputStream()");
			LogUtil.getLog("ERROR").debug(logData + ",ERROR,UserController.sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
			LogUtil.getLog("SMSlog").debug(logData + ",ERROR,UserController.sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
			LogUtil.getLog("Console").debug(logData + ",ERROR,UserController.sendSMS,cli="+msisdn+",message_encoded,sms_api_called_response="+converted_response+",");
        }
        // print result

        return converted_response;

    }
    
    public static int verifyUser(String id, String otp) throws SQLException {

        PreparedStatement statement = null;

        int row = 0;

        String SQL = "UPDATE users SET verified = ? where user_auto_id = ?";
        try {
            statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
            statement.setString(1, "Verified");
            statement.setString(2, id);
            row = statement.executeUpdate();
            
            LogUtil.getLog("Event").debug(logData + ",UserController.verifyUser,user_id="+id+",status="+"Verified"+",");
            LogUtil.getLog("Console").debug(logData + ",UserController.verifyUser,user_id="+id+",status="+"Verified"+",");
        } catch (Exception e) {
            e.printStackTrace();
            LogUtil.getLog("Event").debug(logData + ",ERROR,UserController.verifyUser,user_id="+id+",status="+"Verified"+",exception="+e);
            LogUtil.getLog("Error").debug(logData + ",ERROR,UserController.verifyUser,user_id="+id+",status="+"Verified"+",exception="+e);
            LogUtil.getLog("Console").debug(logData + ",ERROR,UserController.verifyUser,user_id="+id+",status="+"Verified"+",exception="+e);
        }
        return row;
    }
    
    
public static String sendEmail(String email , User user) {
    	
	 
	// Sender's email ID needs to be mentioned
    	String from = "ksandeepa.kuruppu@gmail.com";
      
     // Recipient's email ID needs to be mentioned.
        String to = email;
    	//String to = "chamilabiyanvila@gmail.com";
        
        //User's full name
        String fullName = user.getName();


        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.auth.plain.disable", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("ksandeepa.kuruppu@gmail.com", "ksandeepa123");

            }
            
        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Welcome to Drug Application , " + fullName);

            // Now set the actual message
         /*   message.setText("We’re here to help you manage drug items  faster by making it easier to find and connect  Click this link for login "
            		+ "http://drug.impasl.com/DrugIndex/index.jsp");*/
            message.setText(
            		"Dear user,\r\n" + 
            		"Thank you for the registration. The purpose of the DIMPA is to help you towards excellence in pharmaceutical practice for\r\n" + 
            		"the patients. To this end we hope you will give us constructive feed back on the work IMPA has done. Please consider this as\r\n" + 
            		"a work in progress and we feel there is much more to be done for a higher quality pharmaceutical practice in Sri Lanka.\r\n" + 
            		"\r\n" + 
            		"Thanking You,\r\n" + 
            		"\r\n" + 
            		"Yours Sincerely\r\n" + 
            		"\r\n" + 
            		"Dr Ananda Perera\r\n" + 
            		"IMPA President\r\n "+
            		"Use this link for login : "
            		+ "http://drug.impasl.com/DrugIndex/index.jsp");

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            LogUtil.getLog("Emaillog").debug(logData + ",HTTPClient.sendEmail,sent_email to "+email+",user_id"+user.getId());
            LogUtil.getLog("Console").debug(logData + ",HTTPClient.sendEmail,sent_email to "+email+",user_id"+user.getId());

        } catch (MessagingException mex) {
            mex.printStackTrace();
            LogUtil.getLog("Emaillog").debug(logData + ",ERROR,HTTPClient.sendEmail,"+mex.toString()+",user_id"+user.getId());
			LogUtil.getLog("Error").debug(logData + ",ERROR,HTTPClient.sendEmail,"+mex.toString()+",user_id"+user.getId());
			LogUtil.getLog("Console").debug(logData + ", ERROR,HTTPClient.sendEmail,"+mex.toString()+",user_id"+user.getId());
            
        }

		return null;
    	
    }
    

public static void sendEmail1() {
	
	String to = "kadkskuruppuarachchi@gmail.com";
	String password = "ksandeepa123*";
	String sub = "hello javatpoint";
	String msg = "Test";
	String from = "ksandeepa.kuruppu@gmail.com";
	
	 Properties props = new Properties();    
     props.put("mail.smtp.host", "smtp.gmail.com");    
     props.put("mail.smtp.socketFactory.port", "465");    
     props.put("mail.smtp.socketFactory.class",    
               "javax.net.ssl.SSLSocketFactory");    
     props.put("mail.smtp.auth", "true");    
     props.put("mail.smtp.port", "465");    
     //get Session   
     Session session = Session.getDefaultInstance(props,    
      new javax.mail.Authenticator() {    
      protected PasswordAuthentication getPasswordAuthentication() {    
      return new PasswordAuthentication(from,password);  
      }    
     });    
     //compose message    
     try {    
      MimeMessage message = new MimeMessage(session);    
      message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
      message.setSubject(sub);    
      message.setText(msg);    
      //send message  
      Transport.send(message);    
      System.out.println("message sent successfully");    
     } catch (MessagingException e) {throw new RuntimeException(e);}    
        

	
	
}

public static int updateOtpByMobileNumber(String id, String otp , String forgotPass) throws SQLException {
	
	
   // User user = getUser(mobile);
	 User user = getUserById(id);
    
    int otpUpdateCount = user.getOtpUpdateCount();
    
    if(forgotPass.equals("no")) {
    if(otpUpdateCount<2) {
    	
    	
    	 otpUpdateCount++;
    	 PreparedStatement statement = null;

    	    int row = 0;

    	    String SQL = "UPDATE users SET otp = ? , otp_update_count = ? where user_auto_id = ?";
    	    try {
    	        statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
    	        statement.setString(1, otp);
    	        statement.setLong(2,  otpUpdateCount);
    	        statement.setString(3, id);
    	        row = statement.executeUpdate();
    	       

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        

    	    }
    	    return row;
    	
    }
    
    else {
    	return 0;
    }
    }else {
    	
    	 PreparedStatement statement = null;

 	    int row = 0;

 	    String SQL = "UPDATE users SET otp = ? , otp_update_count = ? where user_auto_id = ?";
 	    try {
 	        statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
 	        statement.setString(1, otp);
 	        statement.setLong(2,  otpUpdateCount);
 	        statement.setString(3, id);
 	        row = statement.executeUpdate();
 	      
 	    } catch (Exception e) {
 	        e.printStackTrace();
 	       
 	    }
 	    return row;
    }
    
    
  
   
}

public static void removeUser(String mobile) throws SQLException {
	
	
    User user = getUser(mobile);
    System.out.println("In remove method");

    	    try {
    	    	  int query1 = DBConnection.getInstance().delete("DELETE  FROM users WHERE contact_no='" + mobile + "'");
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
}
   
  
public static String generateOtp()  {
	
	Random random = new Random();
    String _Otp = String.valueOf(random.nextInt(100000));
    
    return _Otp;
}
  
   
public static String sendEmailOtp( User user , String otp) {
	
	 
	// Sender's email ID needs to be mentioned
    	String from = "ksandeepa.kuruppu@gmail.com";
      
     // Recipient's email ID needs to be mentioned.
        String to = user.getEmail();
    	//String to = "chamilabiyanvila@gmail.com";
        
        //User's full name
        String fullName = user.getName();


        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("ksandeepa.kuruppu@gmail.com", "ksandeepa123");

            }
            
        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Welcome to Drug Application , " + fullName);

            // Now set the actual message
            message.setText("We’re here to help you manage drug items  faster by making it easier to find and connect/n "
            		+ "Your reset Password code is : "+otp);

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            LogUtil.getLog("Emaillog").debug(logData + ",HTTPClient.sendEmailOtp,sent_email to "+to+",user_id"+user.getId());
            LogUtil.getLog("Console").debug(logData + ",HTTPClient.sendEmailOtp,sent_email to "+to+",user_id"+user.getId());

        } catch (MessagingException mex) {
            mex.printStackTrace();
            LogUtil.getLog("Emaillog").debug(logData + ",ERROR,HTTPClient.sendEmailOtp,"+mex.toString()+",user_id"+user.getId());
			LogUtil.getLog("Error").debug(logData + ",ERROR,HTTPClient.sendEmailOtp,"+mex.toString()+",user_id"+user.getId());
			LogUtil.getLog("Console").debug(logData + ",ERROR,HTTPClient.sendEmailOtp,"+mex.toString()+",user_id"+user.getId());
        }

		return null;
    	
    }
    
public static int resetPassword(String id, String password) throws SQLException {
	
	
    User user = getUserById(id);
    	 
    	 PreparedStatement statement = null;

    	    int row = 0;

    	    String SQL = "UPDATE users SET password = ? where user_auto_id = ?";
    	    try {
    	        statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
    	        statement.setString(1, password);
    	        statement.setString(2, id);
    	        row = statement.executeUpdate();
    	        LogUtil.getLog("Event").debug(logData + ",UserController.resetPassword,user_id="+id+",");
    	        LogUtil.getLog("Console").debug(logData + ",UserController.resetPassword,user_id="+id+",");

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        LogUtil.getLog("Event").debug(logData + ",ERROR,UserController.resetPassword,user_id="+id+",exception="+e);
    	        LogUtil.getLog("Error").debug(logData + ",ERROR,UserController.resetPassword,user_id="+id+",exception="+e);
    	        LogUtil.getLog("Console").debug(logData + ",ERROR,UserController.resetPassword,user_id="+id+",exception="+e);
    	    }
    	    return row;
    }
    
    
  
   
}



   



