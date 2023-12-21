<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>IMPASL Drug | TEST</title>
</head>
<body>




<form action="controller/LoginController.jsp">


<button type="submit">Submit</button>
  <input hidden name="action" value="mail">	
</form>



 <div class="mt-3 text-right" style="margin-top: 5px !important;"><a   class="text-muted" href="controller/LoginController.jsp?action=resend_otp1" onclick="clickAndDisable(this);">
                        <u>Re Send</u></a></div>
                    </div>



<%  
StringBuffer sb=new StringBuffer();  
for(int i=1;i<=5;i++)  
{  
    sb.append((char)(int)(Math.random()*79+23+7));  
}  
String cap=new String(sb);  
%>  
<script type ="text/javascript">  
function validation(){  
    var c = document.forms ["f1"]["cap1"].value;  
    var x = document.forms ["f1"]["cap2"].value;  
    if(c==null||c=="")  
    {  
       alert ("Please Enter Captcha");  
       return false;  
    }else if(c==x) {
    	
    	alert("Good");
    	return true;
    }else{
    	alert ("Try again");  
        return false;  
    }
}  
</script> 

<form action="#" name="f1" onsubmit="return validation()">  
<table border="0">  
    <tbody>  
       <tr>  
        <td>  
          <div style="background-color: aqua"><h2><s><i><font face="casteller"><%=cap%></font></i></s></h2></div>  
        </td>  
        <td><input type="text" name="cap1" value="" /></td>  
        <td><input type="hidden" name="cap2" value='<%=cap%>' readonly="readonly"/> </td>  
      </tr>  
   </tbody>  
</table>  
<input type="submit" value="OK" />  
<input type="reset" value="Reset" />  
</form>  






</body>
</html>