
<%@page import="drugfilter.controller.DrugController"%>
<%@ page import="drugfilter.model.*"%>
<%@page import="com.mobios.util.LogUtil"%>
<%@page import="java.util.UUID"%>
<%@ page import="drugfilter.util.MobileNoValidator"%>
<%@ page import="com.google.gson.Gson"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.Date"%>
<%@page import=" drugfilter.util.CommonUtill"%>

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
String action = "" + request.getParameter("action");
String user_id = (String) session.getAttribute("msisdn");
if (user_id == null) {
	System.out.println("null");
	user_id = "null";
}

if (action.equals("generateAllImcCodes")) {
	
	System.out.println("IMC Code Controller" );
	
	Date date = new Date();
    System.out.print(date);

	// print date


	List<IMC> imcListNotHaveCodes = DrugController.GetAllFromIMCNotHaveCodes();
	
	System.out.println("Number of Records :" + imcListNotHaveCodes.size());
	String status = null;
	List<String> successList = new ArrayList();
	
	
	for(IMC imc : imcListNotHaveCodes){
		
		String importer = imc.getIMPORTER();
		String manufacturer = imc.getMANUFACTURER();
		String country = imc.getCOUNTRY();
		
		importer = importer.replaceAll("\\s", "").toLowerCase();
		manufacturer = manufacturer.replaceAll("\\s", "").toLowerCase();
		country = country.replaceAll("\\s", "").toLowerCase();
		
		String i_code = null;
		String m_code = null;
		String c_code = null;
		String imc_code = null;
		
		if(importer.length() == 0 ||manufacturer.length() == 0 ){
			//do nothing
			
		}else {
			
			if(importer.length() == 1){
				i_code = importer;
			}else if(importer.length() == 2){
				i_code = importer;
			}else if (importer.length() == 3){
				i_code = importer;
			}else if(importer.length() == 4){
				i_code = importer;
			}else if(importer.length() >= 5){
				i_code = importer.substring(0, 5);
			}
			
			if(manufacturer.length() == 1){
				m_code = manufacturer;
			}else if(manufacturer.length() == 2){
				m_code = manufacturer;
			}else if (manufacturer.length() == 3){
				m_code = manufacturer;
			}else if(manufacturer.length() == 4){
				m_code = manufacturer;
			}else if(manufacturer.length() > 4){
				m_code = manufacturer.substring(0, 4);
			}
		
			if(country.length() == 0){
				imc_code = i_code+"_"+m_code;
			}else{
			
			if(country.length() == 1){
				c_code = country;
			}else if(country.length() == 2){
				c_code = country;
			}else if (country.length() == 3){
				c_code = country.substring(0, 2);
			}else if(country.length() > 3){
				c_code = country.substring(0, 2);;
			}
			imc_code = i_code+"_"+m_code+"_"+c_code;
			}
			
			
			int row =DrugController.UpdateImcCode(imc.getSENO(), imc_code, user_id);
			
			if(row > 0){
				successList.add("1");
			}else{
				successList.add("0");
			}
			
			
		}

}
	if(imcListNotHaveCodes.size() == 0){
		
		status = "0";
	} else if(successList.contains("0")){
		status = "false";
	}else{
		status = "true";
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(status));
}
%>

