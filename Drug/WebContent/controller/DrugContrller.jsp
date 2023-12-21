<%@page import="java.time.LocalDate"%>
<%@page import="drugfilter.controller.DrugController"%>
<%@ page import="drugfilter.controller.UserController"%>
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
String now = new Date().toString();
String softVersion = "V1.0";
String platformID = "EVI-ETI";
String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
String logData = CommonUtill.EMPTY_STRING + now + "," + softVersion + "," + platformID + "," + uuid;

String username = request.getParameter("email");
String password = request.getParameter("password");
String action = "" + request.getParameter("action");
String action_resend = "" + request.getParameter("action_resend");

String drugId = "" + request.getParameter("drugId");
String seno = "" + request.getParameter("seno");

String Importer = "" + request.getParameter("Importer");
String Manufacturer = "" + request.getParameter("Manufacturer");
String Country = "" + request.getParameter("Country");
String IMCcode = "" + request.getParameter("IMCcode");
String Address = "" + request.getParameter("Address");
String Phone = "" + request.getParameter("Phone");
String Fax = "" + request.getParameter("Fax");
String email = "" + request.getParameter("email");

String Generic = "" + request.getParameter("Generic");
String Generic2 = "" + request.getParameter("Generic2");
String Generic3 = "" + request.getParameter("Generic3");
String Brand = "" + request.getParameter("Brand");
String Dosage = "" + request.getParameter("Dosage");
String Strength = "" + request.getParameter("Strength");
String IMC = "" + request.getParameter("IMC");
String RegExpDate = "" + request.getParameter("RegExpDate");
String Shedule = "" + request.getParameter("Schedule");
String Notes = "" + request.getParameter("Notes");

String Chemical = "" + request.getParameter("Chemical");
String PharmoClass = "" + request.getParameter("PharmoClass");
String TherapeuticClass = "" + request.getParameter("TherapeuticClass");
String ClinicalClass = "" + request.getParameter("ClinicalClass");
String AnatomicalClass = "" + request.getParameter("AnatomicalClass");
String ATCCode = "" + request.getParameter("ATCCode");
String CautionaryLabel = "" + request.getParameter("CautionaryLabel");
String AdverseEffects = "" + request.getParameter("AdverseEffects");
String AtcNotes = "" + request.getParameter("AtcNotes");

String c_page = "" + request.getParameter("c_page");

String page1 = "";

boolean validUser = false;
String lan = (String) session.getAttribute("lan");
if (lan == null) {
	lan = "en";
}

String user_id = (String) session.getAttribute("msisdn");
if (user_id == null) {
	System.out.println("null");
	user_id = "null";
}

if (action.equals("approved")) {
	if (c_page.equals("drug_update")) {

		int sucess = DrugController.ApproveDrug(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";
	LogUtil.getLog("Event")
			.debug(logData + ",DrugController.ApproveDrug,user_id=" + user_id + ",approved_drug_seno " + seno);
	LogUtil.getLog("Druglog")
			.debug(logData + ",DrugController.ApproveDrug,user_id=" + user_id + ",approved_drug_seno " + seno);
		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.ApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}

} else if (action.equals("disapprove")) {
	if (c_page.equals("drug_update")) {
		int sucess = DrugController.DisApproveDrug(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";
	LogUtil.getLog("Event").debug(
			logData + ",DrugController.disapprove,user_id=" + user_id + ",disapproved_drug_seno " + seno);
	LogUtil.getLog("Druglog").debug(
			logData + ",DrugController.disapprove,user_id=" + user_id + ",disapproved_drug_seno " + seno);
		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.DisApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}

} else if (action.equals("saveImctable")) {
	try {
	
		String imcnew = "0";
		String registred_user = user_id;
		String b = DrugController.InsertIMCP(Importer, Manufacturer, Country, imcnew, IMCcode, Address, Phone, Fax,
		email, registred_user);
		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}

} else if (action.equals("saveIsdtable")) {
	try {

		String brand_code = "0";
		String nmrano = "0";
		String units = "0";
		String mrp = "0";
		String registred_user = user_id;
		if(RegExpDate.equals("")){
			RegExpDate = "0000-00-00";
		}
		String b = DrugController.insertISD(Generic, Generic2, Generic3, Brand, brand_code, Dosage, Strength, units,
		Shedule, nmrano, IMC, registred_user, RegExpDate, mrp, Notes);

		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
} else if (action.equals("updateIsdtable")) {
	try {
		String brand_code = "0";
		String nmrano = "0";
		String units = "0";
		String mrp = "0";
		String registred_user = "kk";
		String b = " ";
		if(RegExpDate.equals("")){
			RegExpDate = "0000-00-00";
		}
		//String b =	DrugController.UpdateISDDrug(Generic, Generic2, Generic3, Brand, brand_code, Dosage, Strength, units, Shedule, nmrano, IMC, registred_user, RegExpDate, mrp, Notes);
		int success = DrugController.UpdateISDDrug(seno, Generic, Generic2, Generic3, Brand, Dosage, Strength, IMC,
		RegExpDate, Shedule, Notes, user_id);
		if (success > 0) {
	b = "true";
		} else {
	b = "EXE";
		}
		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
}

if (action.equals("test")) {
	IMC imc = DrugController.getImporterManufacturer(IMC);
	response.setContentType("application/json");
	out.print(new Gson().toJson(imc.getIMPORTER()));
}

if (action.equals("getImporterIsd")) {
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedImporterList = new ArrayList();
	List<String> selectedImporterListDistinct = new ArrayList();

	for (IMC importer : IMCList) {
		if (importer.getIMCCODE().equals(IMC)) {
			selectedImporterList.add(importer.getIMPORTER());

		}
	}

	for (String imp : selectedImporterList) {
		if (selectedImporterListDistinct.contains(imp)) {
			//do nothing
		}
		else{
			selectedImporterListDistinct.add(imp);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedImporterListDistinct));

}

if (action.equals("test1")) {
	IMC imc = DrugController.getImporterManufacturer(IMC);
	response.setContentType("application/json");
	out.print(new Gson().toJson(imc.getMANUFACTURER()));
}


if (action.equals("getManufacturerIsd")) {
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedManufacturerList = new ArrayList();
	List<String> selectedManufactrerListDistinct = new ArrayList();

	for (IMC manufacturer : IMCList) {
		if (manufacturer.getIMCCODE().equals(IMC)) {
			selectedManufacturerList.add(manufacturer.getMANUFACTURER());

		}
	}

	for (String man : selectedManufacturerList) {
		if (selectedManufactrerListDistinct.contains(man)) {
			//do nothing
		}
		else{
			selectedManufactrerListDistinct.add(man);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedManufactrerListDistinct));

}

if (action.equals("test2")) {
	IMC imc = DrugController.getImporterManufacturer(IMC);
	response.setContentType("application/json");
	out.print(new Gson().toJson(imc.getCOUNTRY()));
}

if (action.equals("getCountryIsd")) {
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedCountryList = new ArrayList();
	List<String> selectedCountryListDistinct = new ArrayList();

	for (IMC imc : IMCList) {
		if (imc.getIMCCODE().equals(IMC)) {
			selectedCountryList.add(imc.getCOUNTRY());

		}
	}

	for (String country : selectedCountryList) {
		if (selectedCountryListDistinct.contains(country)) {
			//do nothing
		}
		else{
			selectedCountryListDistinct.add(country);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedCountryListDistinct));

}


if (action.equals("deleteDrug")) {
	int sucess = DrugController.DeleteDrug(seno, user_id);
	String b = " ";
	if (sucess > 0) {
		b = "true";
	} else {
		b = "EXE";
	}

	if (b.equals("true")) {
		response.setContentType("application/json");
		out.print(new Gson().toJson(true));
	} else {
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
}

if (action.equals("saveAtctable")) {
	try {
		String registred_user = user_id;
		System.out.println(AtcNotes);
		String b = DrugController.insertATC(Chemical, PharmoClass, TherapeuticClass, ClinicalClass, AnatomicalClass,
		ATCCode, CautionaryLabel, AdverseEffects, registred_user, AtcNotes);
		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(false));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}
}

else if (action.equals("updateAtctable")) {
	try {

		String registered_user = user_id;
		String b = " ";
	
		
		//String b =	DrugController.UpdateISDDrug(Generic, Generic2, Generic3, Brand, brand_code, Dosage, Strength, units, Shedule, nmrano, IMC, registred_user, RegExpDate, mrp, Notes);
		int success = DrugController.UpdateATCDrug(seno, Chemical, PharmoClass, TherapeuticClass, ClinicalClass,
		AnatomicalClass, ATCCode, CautionaryLabel, AdverseEffects, registered_user, Notes);
		if (success > 0) {
	b = "true";
		} else {
	b = "EXE";
		}
		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}

	
}

if (action.equals("atc_approved")) {
	if (c_page.equals("atc_drug_update")) {

		int sucess = DrugController.ApproveATCDrug(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";

		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.ApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}

}

if (action.equals("atc_disapprove")) {
	if (c_page.equals("atc_drug_update")) {
		int sucess = DrugController.DisApproveATCDrug(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";

		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.DisApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}

}

if (action.equals("deleteATCDrug")) {
	int sucess = DrugController.DeleteATCDrug(seno, user_id);
	String b = " ";
	if (sucess > 0) {
		b = "true";
	} else {
		b = "EXE";
	}

	if (b.equals("true")) {
		response.setContentType("application/json");
		out.print(new Gson().toJson(true));
	} else {
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}

}

if (action.equals("updateImctable")) {

	try {

		String registered_user = user_id;
		String imcnew = "0";
		String b = " ";

		int success = DrugController.UpdateIMC(seno, Importer, Manufacturer, Country, imcnew, IMCcode, Address, Phone,
		Fax, email, registered_user);
		if (success > 0) {
	b = "true";
		} else {
	b = "EXE";
		}
		if (b.equals("true")) {
	application.setAttribute("verify", "done");
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} catch (SQLException e) {
		e.printStackTrace();
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}

}

if (action.equals("imc_approved")) {
	
	if (c_page.equals("imc_update")) {
		int sucess = DrugController.ApproveIMC(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";

		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.ApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}
}

if (action.equals("imc_disapprove")) {
	if (c_page.equals("imc_update")) {

		int sucess = DrugController.DisApproveIMC(seno, user_id);
		String b = " ";
		if (sucess > 0) {
	b = "true";

		}
		if (b.equals("true")) {
	response.setContentType("application/json");
	out.print(new Gson().toJson(true));
	//response.sendRedirect("../" + "Edit_ISDForm.jsp");
		} else {
	response.setContentType("application/json");
	out.print(new Gson().toJson(b));
		}
	} else {
		DrugController.DisApproveDrug(drugId, user_id);
		response.sendRedirect("../" + "Approve.jsp");
	}

}

if (action.equals("deleteIMC")) {

	System.out.println("seno" + seno);
	int sucess = DrugController.DeleteIMC(seno, user_id);
	String b = " ";
	if (sucess > 0) {
		b = "true";
	} else {
		b = "EXE";
	}

	if (b.equals("true")) {
		response.setContentType("application/json");
		out.print(new Gson().toJson(true));
	} else {
		response.setContentType("application/json");
		out.print(new Gson().toJson(false));
	}

}

if (action.equals("manufacturerList")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedManufacturerList = new ArrayList();
	List<String> selectedManufacturerDistinctList = new ArrayList();

	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer)) {
	selectedManufacturerList.add(importer.getMANUFACTURER());
		}
	}
	
	for (String man : selectedManufacturerList) {
		if (selectedManufacturerDistinctList.contains(man)) {
			//do nothing
		}
		else{
			selectedManufacturerDistinctList.add(man);
		}
	}
	
	

	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedManufacturerDistinctList));

}

if (action.equals("getCountry")) {
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedCountryList = new ArrayList();
	List<String> selectedCountryDistinctList = new ArrayList();

	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)) {
	selectedCountryList.add(importer.getCOUNTRY());

		}
	}

	for (String country : selectedCountryList) {
		if (selectedCountryDistinctList.contains(country)) {
			//do nothing
		}
		else{
			selectedCountryDistinctList.add(country);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedCountryDistinctList));

}

if (action.equals("getimccode")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedIMCCode = new ArrayList();
	List<String> selectedIMCCodeDistinct = new ArrayList();
	
	if(Country.equals("")){
		for (IMC importer : IMCList) {
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		) {
		selectedIMCCode.add(importer.getIMCCODE());

			}
		}
	}
	else{
	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country)) {
	selectedIMCCode.add(importer.getIMCCODE());

		}
	}
	}

	for (String code : selectedIMCCode) {
		if (selectedIMCCodeDistinct.contains(code)) {
			//do nothing
		}
		else{
			selectedIMCCodeDistinct.add(code);
		}
	}
	
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedIMCCodeDistinct));
}

if (action.equals("getAddress")) {

	
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedAddress = new ArrayList();
	List<String> selectedAddressDistinct = new ArrayList();

	if(Country.equals("")){
	
		for (IMC importer : IMCList) {
			
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
			 && importer.getIMCCODE().equals(IMCcode)) {
		selectedAddress.add(importer.getADDRESS());

			}
		}
	}else{
	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country) && importer.getIMCCODE().equals(IMCcode)) {
	selectedAddress.add(importer.getADDRESS());

		}
	}
	}

	for (String address : selectedAddress) {
		if (selectedAddressDistinct.contains(address)) {
			//do nothing
		}
		else{
			selectedAddressDistinct.add(address);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedAddressDistinct));

}

if (action.equals("getPhone")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedPhone = new ArrayList();
	List<String> selectedPhoneDistinct = new ArrayList();
	
	if(Country.equals("")){
		for (IMC importer : IMCList) {
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
			 && importer.getIMCCODE().equals(IMCcode)) {
		selectedPhone.add(importer.getPHONE());

			}
		}
	}
	
	else{
	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country) && importer.getIMCCODE().equals(IMCcode)) {
	selectedPhone.add(importer.getPHONE());

		}
	}
	}
	
	for (String phone : selectedPhone) {
		if (selectedPhoneDistinct.contains(phone)) {
			//do nothing
		}
		else{
			selectedPhoneDistinct.add(phone);
		}
	}

	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedPhoneDistinct));

}

if (action.equals("getFax")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedFax = new ArrayList();
	List<String> selectedFaxDistinct = new ArrayList();
	
	if(Country.equals("")){
		for (IMC importer : IMCList) {
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
			 && importer.getIMCCODE().equals(IMCcode)) {
				selectedFax.add(importer.getFAX());

			}
		}
	}
	else{
	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country) && importer.getIMCCODE().equals(IMCcode)) {
	selectedFax.add(importer.getFAX());

		}
	}
	}

	for (String fax : selectedFax) {
		if (selectedFaxDistinct.contains(fax)) {
			//do nothing
		}
		else{
			selectedFaxDistinct.add(fax);
		}
	}

	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedFaxDistinct));

}

if (action.equals("getEmail")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedEmail = new ArrayList();
	List<String> selectedEmailDistinct = new ArrayList();
	
	if(Country.equals("")){
		for (IMC importer : IMCList) {
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
			 && importer.getIMCCODE().equals(IMCcode)) {
				selectedEmail.add(importer.getEMAIL());

			}
		}
	}
	
	else{
	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country) && importer.getIMCCODE().equals(IMCcode)) {
	selectedEmail.add(importer.getEMAIL());

		}
	}
	}

	for (String emailAddress : selectedEmail) {
		if (selectedEmailDistinct.contains(emailAddress)) {
			//do nothing
		}
		else{
			selectedEmailDistinct.add(emailAddress);
		}
	}
	response.setContentType("application/json");
	out.print(new Gson().toJson(selectedEmailDistinct));

}

if (action.equals("checkAvaibility")) {

	List<IMC> IMCList = DrugController.GetAllFromIMC();
	List<String> selectedEmail = new ArrayList();

	boolean available = false;
	
	if(Country.equals("")){
		for (IMC importer : IMCList) {
			if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
			 && importer.getIMCCODE().equals(IMCcode)) {
		available = true;
		break;
			}
		}
	}else{

	for (IMC importer : IMCList) {
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)
		&& importer.getCOUNTRY().equals(Country) && importer.getIMCCODE().equals(IMCcode)) {
	available = true;
	break;
		}
	}
	}

	response.setContentType("application/json");
	out.print(new Gson().toJson(available));

}

if (action.equals("getIMCCodes")) {

	List<String> imcCodeList = DrugController.getIMCCodes();

	response.setContentType("application/json");
	out.print(new Gson().toJson(imcCodeList));

}

if (action.equals("getGenericList")) {

	List<String> genericList = DrugController.getAllGenerics();

	response.setContentType("application/json");
	out.print(new Gson().toJson(genericList));

}

if (action.equals("setISDFormData")) {

	
	List<ATC_Model> atcList = DrugController.GetAllFromATC();
	
	String _PharmoClass = null;
	String _TheraputicClass = null;
	String _ClinicalClass = null;
	String _AnotamicalClass = null;
	
	for(ATC_Model atc : atcList){
		
		if(atc.getGENERIC().equals(Chemical)){
			_PharmoClass = atc.getPHARMO_CLASS();
			_TheraputicClass = atc.getTHERAPEUTIC_CLASS();
			_ClinicalClass = atc.getCLINICAL_CLASS();
			_AnotamicalClass = atc.getANATOMICAL_CLASS();
			break;
		}
		
	}
	
	
	List<String> _MatchedAtcDataSet = new ArrayList();
	
	_MatchedAtcDataSet.add(_PharmoClass);
	_MatchedAtcDataSet.add(_TheraputicClass);
	_MatchedAtcDataSet.add(_ClinicalClass);
	_MatchedAtcDataSet.add(_AnotamicalClass);
	
	response.setContentType("application/json");
	out.print(new Gson().toJson(_MatchedAtcDataSet));
	

}

if (action.equals("saveNewImcCode")) {

	
	if(Country.equals("")){
	
		Country = "null";
		int status = DrugController.SaveNewGeneratedImcCode(Importer, Manufacturer, Country, IMCcode);
		
	}
	else{
		
	int status = DrugController.SaveNewGeneratedImcCode(Importer, Manufacturer, Country, IMCcode);
	
	}


}

if (action.equals("generateAllImcCodes")) {
	
	Date date = new Date();
  

	// print date


	List<IMC> imcListNotHaveCodes = DrugController.GetAllFromIMCNotHaveCodes();
	
	
	
	
	
	for(IMC imc : imcListNotHaveCodes){
		
		String importer = imc.getIMPORTER();
		String manufacturer = imc.getMANUFACTURER();
		
		importer = importer.replaceAll("\\s", "").toLowerCase();
		manufacturer = manufacturer.replaceAll("\\s", "").toLowerCase();
		
		String i_code = null;
		String m_code = null;
		
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
		
			System.out.println("SENO : " + imc.getSENO()+ " importer: "+importer + " manufacturer: " + manufacturer + " i_code: " + i_code + " m_code: "+m_code);
			
			boolean success = true;
			response.setContentType("application/json");
			out.print(new Gson().toJson(success));
		}
		
		
	

}
}


if (action.equals("checkAvalabilityImcCode")) {
	List<IMC> IMCList = DrugController.GetAllFromIMC();
	String status = "";
	
	
	for (IMC importer : IMCList) {
	
		if (importer.getIMPORTER().equals(Importer) && importer.getMANUFACTURER().equals(Manufacturer)) {
			
		
	          if(importer.getIMCCODE() == null || importer.getIMCCODE().equals("") ){
	        	  status = "false";
	          }else{
	        	  status = "true";
	          }

		}
	}

System.out.println("Status"+status);
	response.setContentType("application/json");
	out.print(new Gson().toJson(status));

}
%>
