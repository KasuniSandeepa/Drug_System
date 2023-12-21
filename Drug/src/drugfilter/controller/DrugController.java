package drugfilter.controller;

import java.util.Set;
import java.util.UUID;

import com.mobios.util.LogUtil;

import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import drugfilter.model.ATC_Model;
import drugfilter.model.IMC;
import drugfilter.model.ISD;
import drugfilter.model.User;
import java.sql.SQLException;
import java.util.LinkedHashSet;
import drugfilter.db.DBConnection;
import java.sql.PreparedStatement;

import drugfilter.util.CommonUtill;
import drugfilter.util.MobileNoValidator;

public class DrugController {

	// static String now = new Date().toString();
	static String softVersion = "V1.0";
	static String platformID = "EVI-ETI";
	static String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
	static String logData = CommonUtill.EMPTY_STRING + "" + softVersion + "," + platformID + "," + uuid;

	public static List<ISD> GetDrugs() {

		ArrayList<ISD> DrugList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query(
					"SELECT distinct  a.seno , a.brand , a.dosageform , a.strength ,a.status ,a.generic, a.generic2 ,a.generic3,a.brand_code,a.units, a.schedule, a.nmrano,a.importer_code, a.registered_date,a.registered_user,a.expiry_date,a.mrp,a.notes,b.importer , b.manufacturer , b.country FROM   isdtbl a LEFT JOIN imctbl b ON (a.importer_code = b.imccode) where a.status <> '-1' GROUP BY a.seno\r\n"
					
							
							+ " ");
			if (query.next()) {
				do {
					ISD Isd = new ISD();
					Isd.setID(query.getString("a.seno"));
					Isd.setBRAND(query.getString("a.brand"));
					Isd.setFORMULATION(query.getString("a.dosageform"));
					Isd.setSTRENGTH(query.getString("a.strength"));
					Isd.setIMPORTER(query.getString("b.importer"));
					Isd.setMANUFACTURER(query.getString("b.manufacturer"));
					Isd.setSTATUS(query.getString("a.status"));
					Isd.setSTATUS(query.getString("a.status"));
					Isd.setGENERIC(query.getString("a.generic"));
					Isd.setGENERIC2(query.getString("a.generic2"));
					Isd.setGENERIC3(query.getString("a.generic3"));
					Isd.setBRAND_CODE(query.getString("a.brand_code"));
					Isd.setUNITS(query.getString("a.units"));
					Isd.setSHEDULE(query.getString("a.schedule"));
					Isd.setNMRANO(query.getString("a.nmrano"));
					Isd.setREGISTERED_DATE(query.getString("a.registered_date"));
					Isd.setREGISTERED_USER(query.getString("a.registered_user"));
					Isd.setEXPIRE_DATE(query.getString("a.expiry_date"));
					Isd.setMRP(query.getString("a.mrp"));
					Isd.setNOTES(query.getString("a.notes"));
					Isd.setCOUNTRY(query.getString("b.country"));
					Isd.setIMC_CODE(query.getString("a.importer_code"));
					DrugList.add(Isd);
				} while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return DrugList;
	}

	public static int ApproveDrug(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE isdtbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "1");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.ApproveDrug,user_id=" + user_id + ",approved_drug_id=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.ApproveDrug,user_id=" + user_id + ",approved_drug_id=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.ApproveDrug,user_id=" + user_id + ",approved_drug_id=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.ApproveDrug,user_id=" + user_id
					+ ",approve_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.ApproveDrug,user_id=" + user_id
					+ ",approve_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.ApproveDrug,user_id=" + user_id
					+ ",approve_drug_id=" + Id + ",exception=" + e);
		}
		return Row;
	}

	public static int DisApproveDrug(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE isdtbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "2");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.DisApproveDrug,user_id=" + user_id + ",disapprove_drug_id=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.DisApproveDrug,user_id=" + user_id + ",disapproved_drug_id=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.DisApproveDrug,user_id=" + user_id + ",disapproved_drug_id=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.DisApproveDrug,user_id=" + user_id
					+ ",disapprove_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.DisApproveDrug,user_id=" + user_id
					+ ",disapprove_drug_id=" + Id + ",exception=" + e);
		}
		return Row;
	}

	public static String InsertIMCP(String Importer, String Manufacturer, String Country, String Imcnew, String Imccode,
			String Address, String Phone, String Fax, String Email, String RegistredUser) throws SQLException {
		String Result = "";
		int query = DBConnection.getInstance().insert(
				"insert into drug_db.imctbl(seno,importer,manufacturer,country,imcnew,imccode,address ,phone,fax,email,registred_user) values (0,'"
						+ Importer + "','" + Manufacturer + "','" + Country + "','" + Imcnew + "','" + Imccode + "','"
						+ Address + "','" + Phone + "','" + Fax + "','" + Email + "','" + RegistredUser + "')");
		if (query > 0) {
			Result = "true";
			LogUtil.getLog("Event").debug(logData + ",DrugController.InsertIMCP,user_id=" + RegistredUser
					+ ",data_importer=" + Importer + ",data_manufacturer" + Manufacturer);
			LogUtil.getLog("Druglog").debug(logData + ",DrugController.InsertIMCP,user_id=" + RegistredUser
					+ ",data_importer=" + Importer + ",data_manufacturer" + Manufacturer);
			LogUtil.getLog("Console").debug(logData + ",DrugController.InsertIMCP,user_id=" + RegistredUser
					+ ",data_importer=" + Importer + ",data_manufacturer" + Manufacturer);
		}
		return Result;
	}

	public static List<String> getManufactures() {
		ArrayList<ISD> drugList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query("SELECT * FROM imctbl");
			if (query.next()) {
				do{
					ISD isd = new ISD();
					isd.setMANUFACTURER(query.getString("manufacturer"));
					drugList.add(isd);
				}while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<String> manufecturerList = new ArrayList();
		ArrayList<String> manufecturerListOriginal = new ArrayList();

		for (ISD drug : drugList) {
			manufecturerList.add(drug.getMANUFACTURER());
		}

		for (String manufecturer : manufecturerList) {
			if (!manufecturerListOriginal.contains(manufecturer)) {
				manufecturerListOriginal.add(manufecturer);
			}
		}
		return manufecturerListOriginal;
	}

	public static List<String> getImporters() {
		ArrayList<ISD> drugList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query("SELECT * FROM imctbl");
			if (query.next()) {
				while (query.next()) {
					ISD isd = new ISD();
					isd.setIMPORTER((query.getString("importer")));
					drugList.add(isd);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<String> manufecturerList = new ArrayList();
		ArrayList<String> manufecturerListOriginal = new ArrayList();

		for (ISD drug : drugList) {
			manufecturerList.add(drug.getIMPORTER());
		}

		for (String manufecturer : manufecturerList) {
			if (!manufecturerListOriginal.contains(manufecturer)) {
				manufecturerListOriginal.add(manufecturer);
			}
		}
		return manufecturerListOriginal;
	}

	public static String insertISD(String generic, String generic2, String generic3, String brand, String brand_code,
			String dosageform, String strength, String units, String schedule, String nmrano, String importer_code,
			String registered_user, String expiry_date, String mrp, String notes) throws SQLException {

		String re = "";

		int query = DBConnection.getInstance().insert(
				"insert into isdtbl(seno,generic,generic2,generic3,brand,brand_code,dosageform ,strength,units,schedule,nmrano,importer_code,registered_user,expiry_date,mrp,notes) values (0,'"
						+ generic + "','" + generic2 + "','" + generic3 + "','" + brand + "','" + brand_code + "','"
						+ dosageform + "','" + strength + "','" + units + "','" + schedule + "','" + nmrano + "','"
						+ importer_code + "','" + registered_user + "','" + expiry_date + "','" + mrp + "','" + notes
						+ "')");
		if (query > 0) {
			re = "true";
			LogUtil.getLog("Event").debug(logData + ",DrugController.insertISD,user_id=" + registered_user
					+ ",data_brand=" + brand + ",data_imc_code" + importer_code);
			LogUtil.getLog("Druglog").debug(logData + ",DrugController.insertISD,user_id=" + registered_user
					+ ",data_brand=" + brand + ",data_imc_code" + importer_code);
			LogUtil.getLog("Console").debug(logData + ",DrugController.insertISD,user_id=" + registered_user
					+ ",data_brand=" + brand + ",data_imc_code" + importer_code);
		}

		return re;
	}

	public static String getImporterCode() {

		String code = " ";
		ArrayList<String> imcCodeList = new ArrayList();

		try {
			ResultSet query = DBConnection.getInstance().query("SELECT imccode FROM imctbl where status = 1");

			if (query.next()) {
				code = query.getString("imccode");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return code;

	}

	public static List<String> getIMCCodes() {

		ArrayList<String> imcList = new ArrayList();
		String code = " ";
		try {
			ResultSet query = DBConnection.getInstance().query("SELECT * FROM imctbl where status <> -1");

			if (query.next()) {
				do {

					code = query.getString("imccode");

					imcList.add(code);
				}while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		ArrayList<String> imcListOriginal = new ArrayList();

		for (String imc_code : imcList) {

			if (!imcListOriginal.contains(imc_code)) {
				imcListOriginal.add(imc_code);
			}

		}

		return imcListOriginal;

	}

	public static IMC getImporterManufacturer(String imc_code) {

		IMC imc = new IMC();

		if (imc_code == null) {

			imc.setIMPORTER(" ");
			imc.setMANUFACTURER(" ");

		} else {
			try {
				ResultSet query = DBConnection.getInstance()
						.query("SELECT * FROM drug_db.imctbl where imccode= '" + imc_code + "' group by imccode;");

				if (query.next()) {

					imc.setIMPORTER(query.getString("importer"));
					imc.setMANUFACTURER(query.getString("manufacturer"));
					imc.setCOUNTRY(query.getString("country"));

					/* System.out.println("lll" + query.getString("importer")); */

				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

		}

		return imc;

	}

	public static int UpdateISDDrug(String id, String Generic, String Generic2, String Generic3, String Brand,
			String Dosage, String Strength, String IMC_Code, String RegExpDate, String Schedule, String Notes,
			String user_id) throws SQLException {

		PreparedStatement statement = null;

		int row = 0;

		String SQL = "UPDATE isdtbl SET generic = ? ,  generic2 = ?,  generic3 = ?,  brand = ?, dosageform = ? , strength = ? ,  schedule = ? ,  importer_code = ? , expiry_date = ? , notes = ?  where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, Generic);
			statement.setString(2, Generic2);
			statement.setString(3, Generic3);
			statement.setString(4, Brand);
			statement.setString(5, Dosage);
			statement.setString(6, Strength);
			statement.setString(7, Schedule);
			statement.setString(8, IMC_Code);
			statement.setString(9, RegExpDate);
			statement.setString(10, Notes);
			statement.setString(11, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.UpdateISDDrug,user_id=" + user_id + ",drug_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.UpdateISDDrug,user_id=" + user_id + ",drug_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ",DrugController.UpdateISDDrug,user_id=" + user_id + ",drug_id=" + id + ",");
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + user_id
					+ ",drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + user_id
					+ ",drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + user_id
					+ ",drug_id=" + id + ",exception=" + e);

		}
		return row;
	}

	public static ISD getISDbyId(String id) {
		ISD isd = new ISD();
		try {
			ResultSet query = DBConnection.getInstance().query("SELECT * FROM isdtbl WHERE seno='" + id + "'");

			if (query.next()) {
				isd.setSTATUS(query.getString("status"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isd;
	}

	public static int DeleteDrug(String id, String user_id) throws SQLException {

		PreparedStatement statement = null;

		int row = 0;

		String SQL = "UPDATE isdtbl SET status = ?  where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, "-1");
			statement.setString(2, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.DeleteDrug,user_id=" + user_id + ",deleted_drug_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.DeleteDrug,user_id=" + user_id + ",deleted_drug_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ", DrugController.DeleteDrug,user_id=" + user_id + ",deleted_drug_id=" + id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(
					logData + ",ERROR,DrugController.DeleteDrug,user_id=" + " " + ",drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(
					logData + ",ERROR,DrugController.DeleteDrug,user_id=" + " " + ",drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(
					logData + ",ERROR,DrugController.DeleteDrug,user_id=" + " " + ",drug_id=" + id + ",exception=" + e);
		}
		return row;
	}

	public static String insertATC(String Chemical, String PharmoClass, String TherapeuticClass, String ClinicalClass,
			String AnatomicalClass, String ATCCode, String CautionaryLabel, String AdverseEffects,
			String registered_user, String Notes) throws SQLException {

		String re = "";

		int query = DBConnection.getInstance().insert(
				"insert into atctbl(seno,chemical,pharmoClass,therapClass,clinicClass,anatClass,atccode ,cautLbl,advEffect,registered_user,notes) values (0,'"
						+ Chemical + "','" + PharmoClass + "','" + TherapeuticClass + "','" + ClinicalClass + "','" + AnatomicalClass + "','"
						+ ATCCode + "','" + CautionaryLabel + "','" + AdverseEffects + "','" + registered_user +"','" + Notes +  "')");
		if (query > 0) {
			re = "true";
			LogUtil.getLog("Event").debug(logData + ",DrugController.insertATC,user_id=" + registered_user
					+ ",Chemical=" + Chemical + ",ATCCode" + ATCCode);
			LogUtil.getLog("Druglog").debug(logData + ",DrugController.insertATC,user_id=" + registered_user
					+ ",Chemical=" + Chemical + ",ATCCode" + ATCCode);
			LogUtil.getLog("Console").debug(logData + ",DrugController.insertATC,user_id=" + registered_user
					+ ",Chemical=" + Chemical + ",ATCCode" + ATCCode);
		}

		return re;
	}

	public static List<String> getAllGenerics() {
		ArrayList<ISD> drugList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query("SELECT * FROM isdtbl where status = '1'");
			if (query.next()) {
				do {
					ISD isd = new ISD();
					isd.setGENERIC(query.getString("generic"));
					drugList.add(isd);
				}while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		ArrayList<String> genericList = new ArrayList();
		ArrayList<String> genericListOriginal = new ArrayList();

		for (ISD drug : drugList) {
			genericList.add(drug.getGENERIC());
		}

		for (String generic : genericList) {
			if (!genericListOriginal.contains(generic)) {
				genericListOriginal.add(generic);
			}
		}
		return genericListOriginal;
	}
	
	public static List<IMC> GetAllFromIMC() {

		ArrayList<IMC> IMCList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query(
					"SELECT * FROM imctbl where status <> '-1' "
							+ " ");
			if (query.next()) {
				do {
				
					  IMC imc = new IMC(); 
					 imc.setSENO(query.getString("seno"));
					 imc.setIMPORTER(query.getString("importer"));
					 imc.setMANUFACTURER(query.getString("manufacturer"));
					 imc.setCOUNTRY(query.getString("country"));
					 imc.setIMCNEW(query.getString("imcnew"));
					 imc.setIMCCODE(query.getString("imccode"));
					 imc.setADDRESS(query.getString("address"));
					 imc.setPHONE(query.getString("phone"));
					 imc.setFAX(query.getString("fax"));
					 imc.setEMAIL(query.getString("email"));
					 imc.setSTATUS(query.getString("status"));
					
					 IMCList.add(imc);
					
				} while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return IMCList;
	}
	
	public static List<ATC_Model> GetAllFromATC() {

		ArrayList<ATC_Model> ATCList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query(
					"SELECT * FROM atctbl where status <> '-1' "
							+ " ");
			if (query.next()) {
				do {
				
					ATC_Model atc = new ATC_Model(); 
					 atc.setSENO(query.getString("seno"));
					 atc.setGENERIC(query.getString("chemical"));
					 atc.setCHEMICAL_CODE(query.getString("chemical_code"));
					 atc.setPHARMO_CLASS(query.getString("pharmoClass"));
					 atc.setTHERAPEUTIC_CLASS(query.getString("therapClass"));
					 atc.setCLINICAL_CLASS(query.getString("clinicClass"));
					 atc.setANATOMICAL_CLASS(query.getString("anatClass"));
					 atc.setATC_CODE(query.getString("atccode"));
					 atc.setCUTIONARY_LABLE(query.getString("cautLbl"));
					 atc.setADDVERSE_EFFECT(query.getString("advEffect"));
					 atc.setREGISTERED_DATE(query.getString("registered_date"));
					 atc.setREGISTERED_USER(query.getString("registered_user"));
					 atc.setNOTES(query.getString("notes"));
					 atc.setSTATUS(query.getString("status"));
					
					
					 ATCList.add(atc);
					
				} while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ATCList;
	}
	
	public static int UpdateATCDrug(String id, String Chemical, String PharmoClass, String TherapeuticClass, String ClinicalClass,
			String AnatomicalClass, String ATCCode, String CautionaryLabel, String AdverseEffects,
			String registered_user, String Notes) throws SQLException {

		System.out.println("id1"+id);
		System.out.println("Chemical1"+Chemical);
		System.out.println("PharmoClass1"+PharmoClass);
		System.out.println("TherapeuticClass"+TherapeuticClass);
		System.out.println("ClinicalClass"+ClinicalClass);
		System.out.println("AnatomicalClass"+AnatomicalClass);
		System.out.println("ATCCode"+ATCCode);
		System.out.println("CautionaryLabel"+CautionaryLabel);
		
		System.out.println("AdverseEffects"+AdverseEffects);
		System.out.println("registered_user"+registered_user);
		System.out.println("Notes"+Notes);
		
		PreparedStatement statement = null;

		int row = 0;

		String SQL = "UPDATE atctbl SET chemical = ? ,  pharmoClass = ?,  therapClass = ?,  clinicClass = ?, anatClass = ? , atccode = ? ,  cautLbl = ? ,  advEffect = ? , registered_user = ? , notes = ?  where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, Chemical);
			statement.setString(2, PharmoClass);
			statement.setString(3, TherapeuticClass);
			statement.setString(4, ClinicalClass);
			statement.setString(5, AnatomicalClass);
			statement.setString(6, ATCCode);
			statement.setString(7, CautionaryLabel);
			statement.setString(8, AdverseEffects);
			statement.setString(9, registered_user);
			statement.setString(10, Notes);
			statement.setString(11, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.UpdateATCDrug,user_id=" + registered_user + ",atc_drug_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.UpdateISDDrug,user_id=" + registered_user + ",atc_drug_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ",DrugController.UpdateISDDrug,user_id=" + registered_user + ",atc_drug_id=" + id + ",");
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + registered_user
					+ ",atc_drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + registered_user
					+ ",atc_drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.UpdateISDDrug,user_id=" + registered_user
					+ ",atc_drug_id=" + id + ",exception=" + e);

		}
		return row;
	}
	
	public static int ApproveATCDrug(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE atctbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "1");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.ApproveATCDrug,user_id=" + user_id + ",approved_ATC_drug_id=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.ApproveATCDrug,user_id=" + user_id + ",approved_ATC_drug_id=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.ApproveATCDrug,user_id=" + user_id + ",approved_ATC_drug_id=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.ApproveATCDrug,user_id=" + user_id
					+ ",approved_ATC_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.ApproveATCDrug,user_id=" + user_id
					+ ",approved_ATC_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.ApproveATCDrug,user_id=" + user_id
					+ ",approved_ATC_drug_id=" + Id + ",exception=" + e);
		}
		return Row;
	}
	
	public static int DisApproveATCDrug(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE atctbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "2");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.DisApproveATCDrug,user_id=" + user_id + ",disapprove_ATC_drug_id=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.DisApproveATCDrug,user_id=" + user_id + ",disapprove_ATC_drug_id=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.DisApproveATCDrug,user_id=" + user_id + ",disapprove_ATC_drug_id=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.DisApproveATCDrug,user_id=" + user_id
					+ ",disapprove_ATC_drug_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.DisApproveATCDrug,user_id=" + user_id
					+ ",disapprove_ATC_drug_id=" + Id + ",exception=" + e);
		}
		return Row;
	}
	

	public static int DeleteATCDrug(String id, String user_id) throws SQLException {

		PreparedStatement statement = null;

		int row = 0;

		String SQL = "UPDATE atctbl SET status = ?  where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, "-1");
			statement.setString(2, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ", DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id=" + id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(
					logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " + ",ATC_drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(
					logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " + ",ATC_drug_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(
					logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " + ",ATC_drug_id=" + id + ",exception=" + e);
		}
		return row;
	}
	
	public static int UpdateIMC(String id,String Importer, String Manufacturer, String Country, String Imcnew, String Imccode,
			String Address, String Phone, String Fax, String Email, String RegistredUser) throws SQLException {

		PreparedStatement statement = null;

		int row = 0;
		
		/*
		 * int phone = Integer.parseInt(Phone); int fax = Integer.parseInt(Fax);
		 */

		String SQL = "UPDATE imctbl SET importer = ? ,  manufacturer = ?,  country = ?,  imcnew = ?, imccode = ? , address = ? ,  phone = ? ,  fax = ? , email = ?   where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, Importer);
			statement.setString(2, Manufacturer);
			statement.setString(3, Country);
			statement.setString(4, Imcnew);
			statement.setString(5, Imccode);
			statement.setString(6, Address);
			statement.setString(7, Phone);
			statement.setString(8, Fax);
			statement.setString(9, Email);
			statement.setString(10, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.UpdateIMC,user_id=" + RegistredUser + ",IMC_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.UpdateIMC,user_id=" + RegistredUser + ",IMC_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ",DrugController.UpdateUpdateIMCISDDrug,user_id=" + RegistredUser + ",IMC_id=" + id + ",");
		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.UpdateIMC,user_id=" + RegistredUser
					+ ",IMC_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.UpdateIMC,user_id=" + RegistredUser
					+ ",IMC_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.UpdateIMC,user_id=" + RegistredUser
					+ ",IMC_id=" + id + ",exception=" + e);

		}
		return row;
	}
	
	public static int ApproveIMC(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE imctbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "1");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.ApproveIMC,user_id=" + user_id + ",approved_IMC_id=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.ApproveIMC,user_id=" + user_id + ",approved_IMC_id=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.ApproveIMC,user_id=" + user_id + ",approved_IMC_id=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.ApproveIMC,user_id=" + user_id
					+ ",approved_IMC_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.ApproveIMC,user_id=" + user_id
					+ ",approved_IMC_id=" + Id + ",exception=" + e);
			LogUtil.getLog("Console").debug(logData + ",ERROR,DrugController.ApproveIMC,user_id=" + user_id
					+ ",approved_IMC_id=" + Id + ",exception=" + e);
		}
		return Row;
	}
	
	public static int DisApproveIMC(String Id, String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE imctbl SET status = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, "2");
			Statement.setString(2, Id);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.DisApproveIMC,user_id=" + user_id + ",disapprove_IMC=" + Id + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.DisApproveIMC,user_id=" + user_id + ",disapprove_IMC=" + Id + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.DisApproveIMC,user_id=" + user_id + ",disapprove_IMC=" + Id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.DisApproveIMC,user_id=" + user_id
					+ ",disapprove_IMC=" + Id + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.DisApproveIMC,user_id=" + user_id
					+ ",disapprove_IMC=" + Id + ",exception=" + e);
		}
		return Row;
	}
	
	public static int DeleteIMC(String id, String user_id) throws SQLException {

		PreparedStatement statement = null;

		int row = 0;

		String SQL = "UPDATE imctbl SET status = ?  where seno = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, "-1");
			statement.setString(2, id);
			row = statement.executeUpdate();

			LogUtil.getLog("Event")
					.debug(logData + ",DrugController.DeleteIMC,user_id=" + user_id + ",deleted_IMC_id=" + id + ",");
			LogUtil.getLog("Druglog")
					.debug(logData + ",DrugController.DeleteIMC,user_id=" + user_id + ",deleted_IMC_id=" + id + ",");
			LogUtil.getLog("Console")
					.debug(logData + ", DrugController.DeleteIMC,user_id=" + user_id + ",deleted_IMC_id=" + id + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(
					logData + ",ERROR,DrugController.DeleteIMC,user_id=" + " " + ",deleted_IMC_id=" + id + ",exception=" + e);
			LogUtil.getLog("Error").debug(
					logData + ",ERROR,DrugController.DeleteIMC,user_id=" + " " + ",deleted_IMC_id=" + id + ",exception=" + e);
			LogUtil.getLog("Console").debug(
					logData + ",ERROR,DrugController.DeleteIMC,user_id=" + " " + ",deleted_IMC_id=" + id + ",exception=" + e);
		}
		return row;
	}

	/*
	 * public static int DeleteATCDrug(String id, String user_id) throws
	 * SQLException {
	 * 
	 * PreparedStatement statement = null;
	 * 
	 * int row = 0;
	 * 
	 * String SQL = "UPDATE atctbl SET status = ?  where seno = ?"; try { statement
	 * = DBConnection.getInstance().getConnection().prepareStatement(SQL);
	 * statement.setString(1, "-1"); statement.setString(2, id); row =
	 * statement.executeUpdate();
	 * 
	 * LogUtil.getLog("Event") .debug(logData +
	 * ",DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id="
	 * + id + ","); LogUtil.getLog("Druglog") .debug(logData +
	 * ",DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id="
	 * + id + ","); LogUtil.getLog("Console") .debug(logData +
	 * ", DrugController.DeleteATCDrug,user_id=" + user_id + ",deleted_ATC_drug_id="
	 * + id + ",");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); LogUtil.getLog("Event").debug(
	 * logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " +
	 * ",ATC_drug_id=" + id + ",exception=" + e); LogUtil.getLog("Error").debug(
	 * logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " +
	 * ",ATC_drug_id=" + id + ",exception=" + e); LogUtil.getLog("Console").debug(
	 * logData + ",ERROR,DrugController.DeleteATCDrug,user_id=" + " " +
	 * ",ATC_drug_id=" + id + ",exception=" + e); } return row; }
	 */
	
	public static int SaveNewGeneratedImcCode(String importer, String manufacturer , String Country , String imcCode) throws SQLException {

		PreparedStatement statement = null;
		System.out.println("1234 Country" + Country);

		int row = 0;

		if(Country.equals("null")) {
			
			String SQL = "UPDATE imctbl SET imccode = ?  where importer = ? and  manufacturer = ?";
			try {
				statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
				statement.setString(1, imcCode);
				statement.setString(2, importer);
				statement.setString(3, manufacturer);
			
				
			
				row = statement.executeUpdate();

			
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			
			
		}else {
		String SQL = "UPDATE imctbl SET imccode = ?  where importer = ? and  manufacturer = ? and country = ?";
		try {
			statement = DBConnection.getInstance().getConnection().prepareStatement(SQL);
			statement.setString(1, imcCode);
			statement.setString(2, importer);
			statement.setString(3, manufacturer);
			statement.setString(4, Country);
			
		
			row = statement.executeUpdate();

		
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		}
		return row;
	}

	public static List<IMC> GetAllFromIMCNotHaveCodes() {

		ArrayList<IMC> IMCList = new ArrayList();
		try {
			ResultSet query = DBConnection.getInstance().query(
					"SELECT * FROM drug_db.imctbl where imccode is null or imccode = '' or imccode='null' ; "
							+ " ");
			if (query.next()) {
				do {
				
					  IMC imc = new IMC(); 
					 imc.setSENO(query.getString("seno"));
					 imc.setIMPORTER(query.getString("importer"));
					 imc.setMANUFACTURER(query.getString("manufacturer"));
					 imc.setCOUNTRY(query.getString("country"));
					 imc.setIMCNEW(query.getString("imcnew"));
					 imc.setIMCCODE(query.getString("imccode"));
					 imc.setADDRESS(query.getString("address"));
					 imc.setPHONE(query.getString("phone"));
					 imc.setFAX(query.getString("fax"));
					 imc.setEMAIL(query.getString("email"));
					 imc.setSTATUS(query.getString("status"));
					
					 IMCList.add(imc);
					
				} while (query.next());
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return IMCList;
	}
	
	
	public static int UpdateImcCode(String seno, String imc_code,  String user_id) throws SQLException {
		PreparedStatement Statement = null;
		int Row = 0;
		String Sql = "UPDATE imctbl SET imccode = ?  where seno = ?";
		try {
			Statement = DBConnection.getInstance().getConnection().prepareStatement(Sql);
			Statement.setString(1, imc_code);
			Statement.setString(2, seno);
			Row = Statement.executeUpdate();

			LogUtil.getLog("Event").debug(
					logData + ",DrugController.UpdateImcCode,user_id=" + user_id + ",update_imc_id=" + seno + ",");
			LogUtil.getLog("Druglog").debug(
					logData + ",DrugController.UpdateImcCode,user_id=" + user_id + ",update_imc_id=" + seno + ",");
			LogUtil.getLog("Console").debug(
					logData + ",DrugController.UpdateImcCode,user_id=" + user_id + ",update_imc_id=" + seno + ",");

		} catch (Exception e) {
			e.printStackTrace();
			LogUtil.getLog("Event").debug(logData + ",ERROR,DrugController.UpdateImcCode,user_id=" + user_id
					+ ",update_imc_id=" + seno + ",exception=" + e);
			LogUtil.getLog("Error").debug(logData + ",ERROR,DrugController.UpdateImcCode,user_id=" + user_id
					+ ",update_imc_id=" + seno + ",exception=" + e);
		}
		return Row;
	}
	
}
