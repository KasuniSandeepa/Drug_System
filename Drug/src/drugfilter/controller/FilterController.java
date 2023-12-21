package drugfilter.controller;

import drugfilter.db.DBConnection;
import drugfilter.model.ATC;
import drugfilter.model.Data;
import drugfilter.model.ISD;
import drugfilter.util.CommonUtill;

import org.apache.commons.lang3.StringUtils;

import com.mobios.util.LogUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

public class FilterController {

	//static String now = new Date().toString();
	static String softVersion = "V1.0";
	static String platformID = "EVI-ETI";
	static String uuid = CommonUtill.EMPTY_STRING + UUID.randomUUID();
	static String logData = CommonUtill.EMPTY_STRING + "," + softVersion + "," + platformID + "," + uuid;
	

    public static Data searchDrug(String name,String user_id) {


        List<ATC> atcs= new ArrayList<>();
        List<ISD> isds = new ArrayList<>();

        boolean isHaveATC = false;
        boolean isHaveISD = false;
        String genaricName = "";
        
        System.out.println("Name : "+name);

        try {

            ResultSet query1 = DBConnection.getInstance().query("SELECT * FROM atctbl where chemical LIKE '" + name + "%'");

            while (query1.next()){

                atcs.add(new ATC(query1.getString("pharmoClass"),query1.getString("therapClass"),
                        query1.getString("clinicClass"),query1.getString("anatClass"),
                        query1.getString("cautLbl")));
                isHaveATC = true;
            }


            if(isHaveATC){
//                ResultSet query = DBConnection.getInstance().query("SELECT  * FROM isdtbl INNER JOIN `imctbl` ON `isdtbl`.`SENO` = `imctbl`.`SENO` WHERE `isdtbl`.`generic` LIKE '%" + name + "%'");
                ResultSet query = DBConnection.getInstance().query("SELECT DISTINCT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.generic LIKE '" + name + "%'   and i.status = '1'");
                while (query.next()){
                    genaricName=query.getString("generic");
                    isds.add(new ISD(query.getString("brand"), StringUtils.capitalize(query.getString("dosageform")),
                            query.getString("strength"),query.getString("importer"),query.getString("manufacturer")));
                }


            }else{

                ResultSet query = DBConnection.getInstance().query("SELECT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.brand LIKE '" + name + "%'  and i.status = '1'");

                 genaricName = "";
                while (query.next()){
                    isHaveISD = true;
                    genaricName=query.getString("generic");
                    isds.add(new ISD(query.getString("brand"),StringUtils.capitalize(query.getString("dosageform")),
                            query.getString("strength"),query.getString("importer"),query.getString("manufacturer")));
                }

                if(isHaveISD){

                    ResultSet atc = DBConnection.getInstance().query("SELECT * FROM atctbl where chemical LIKE '%" + genaricName + "%'");
                    while (atc.next()){
                        atcs.add(new ATC(atc.getString("pharmoClass"),atc.getString("therapClass"),
                                atc.getString("clinicClass"),atc.getString("anatClass"),
                                atc.getString("cautLbl")));
                    }
                }else{



                }



            }
            LogUtil.getLog("Event").debug(logData + ",FilterController.searchDrug,user_id="+user_id+",search_drug = "+name+",");
            LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.searchDrug,user_id = "+user_id+",search_drug = "+name+",");
            LogUtil.getLog("Console").debug(logData + ",FilterController.searchDrug,user_id="+user_id+",search_drug = "+name+",");
            

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            LogUtil.getLog("Event").debug(logData + ", ERROR,FilterController.searchDrug,user_id="+user_id+",search_drug="+name+",exception="+throwables);
            LogUtil.getLog("Error").debug(logData + ", ERROR,FilterController.searchDrug,user_id="+user_id+",search_drug="+name+",exception="+throwables);
            LogUtil.getLog("Console").debug(logData + ", ERROR,FilterController.searchDrug,user_id="+user_id+",search_drug="+name+",exception="+throwables);
            
        }


        return new Data(atcs,isds,genaricName);


    }

    public static Data searchDrugAna(String name, String user_id) throws SQLException {

        List<ATC> atcs= new ArrayList<>();
        List<ISD> isds = new ArrayList<>();
        String genaricName = "";
        boolean isHaveATC = false;
        ResultSet atc = DBConnection.getInstance().query("SELECT * FROM atctbl where anatClass LIKE '%" + name + "%' ");
        while (atc.next()){

            isHaveATC = true;
            genaricName = atc.getString("chemical");
            atcs.add(new ATC(atc.getString("pharmoClass"),atc.getString("therapClass"),
                    atc.getString("clinicClass"),atc.getString("anatClass"),
                    atc.getString("cautLbl"),atc.getString("chemical")));
        }
        if( isHaveATC){
            ResultSet query = DBConnection.getInstance().query("SELECT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.generic LIKE '%" + genaricName + "%'  and i.status = '1'");
            genaricName = "";
            while (query.next()){
                genaricName=query.getString("generic");
                isds.add(new ISD(query.getString("brand"),StringUtils.capitalize(query.getString("dosageform")),
                        query.getString("strength"),query.getString("importer"),query.getString("manufacturer")));
            }
        }
        LogUtil.getLog("Event").debug(logData + ",FilterController.searchDrugAna,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.searchDrugAna,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("Console").debug(logData + ",FilterController.searchDrugAna,user_id="+user_id+",search_drug = "+name+",");


        return new Data(atcs,isds,genaricName);
    }

    public static Data searchDrugThe(String name, String user_id) throws SQLException {
        List<ATC> atcs= new ArrayList<>();
        List<ISD> isds = new ArrayList<>();
        String genaricName = "";
        boolean isHaveATC = false;

        ResultSet atc = DBConnection.getInstance().query("SELECT * FROM atctbl where therapClass LIKE '%" + name + "%'");
        while (atc.next()){
            isHaveATC = true;
            genaricName = atc.getString("chemical");
            atcs.add(new ATC(atc.getString("pharmoClass"),atc.getString("therapClass"),
                    atc.getString("clinicClass"),atc.getString("anatClass"),
                    atc.getString("cautLbl"),atc.getString("chemical")));
        }

        if( isHaveATC) {
            ResultSet query = DBConnection.getInstance().query("SELECT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.generic LIKE '%" + genaricName + "%'  and i.status = '1'");
            genaricName = "";
            while (query.next()) {
                genaricName = query.getString("generic");
                isds.add(new ISD(query.getString("brand"), StringUtils.capitalize(query.getString("dosageform")),
                        query.getString("strength"), query.getString("importer"), query.getString("manufacturer"),query.getString("generic")));
            }
        }
        
        LogUtil.getLog("Event").debug(logData + ",FilterController.searchDrugThe,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.searchDrugThe,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("Console").debug(logData + ",FilterController.searchDrugThe,user_id="+user_id+",search_drug = "+name+",");
        return new Data(atcs,isds,genaricName);
    }

    public static Data searchDrugCli(String name, String user_id) throws SQLException {
        List<ATC> atcs= new ArrayList<>();
        List<ISD> isds = new ArrayList<>();
        String genaricName = "";
        boolean isHaveATC = false;
        ResultSet atc = DBConnection.getInstance().query("SELECT * FROM atctbl where clinicClass LIKE '%" + name + "%'");
        while (atc.next()){
            isHaveATC = true;
            genaricName = atc.getString("chemical");
            atcs.add(new ATC(atc.getString("pharmoClass"),atc.getString("therapClass"),
                    atc.getString("clinicClass"),atc.getString("anatClass"),
                    atc.getString("cautLbl"),atc.getString("chemical")));
        }
        if( isHaveATC) {
            ResultSet query = DBConnection.getInstance().query("SELECT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.generic LIKE '%" + genaricName + "%'  and i.status = '1'");
            genaricName = "";
            while (query.next()) {
                genaricName = query.getString("generic");
                isds.add(new ISD(query.getString("brand"), StringUtils.capitalize(query.getString("dosageform")),
                        query.getString("strength"), query.getString("importer"), query.getString("manufacturer"),query.getString("generic")));
            }
        }

        LogUtil.getLog("Event").debug(logData + ",FilterController.searchDrugCli,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.searchDrugCli,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("Console").debug(logData + ",FilterController.searchDrugCli,user_id="+user_id+",search_drug = "+name+",");
        return new Data(atcs,isds,genaricName);
    }

    public static Data searchDrugPhr(String name,  String user_id) throws SQLException {

        List<ATC> atcs= new ArrayList<>();
        List<ISD> isds = new ArrayList<>();
        String genaricName = "";
        boolean isHaveATC = false;
        ResultSet atc = DBConnection.getInstance().query("SELECT * FROM atctbl where pharmoClass LIKE '%" + name + "%'");
        while (atc.next()){
            isHaveATC = true;
            genaricName = atc.getString("chemical");
            atcs.add(new ATC(atc.getString("pharmoClass"),atc.getString("therapClass"),
                    atc.getString("clinicClass"),atc.getString("anatClass"),
                    atc.getString("cautLbl"),atc.getString("chemical")));
        }
        if( isHaveATC) {
            ResultSet query = DBConnection.getInstance().query("SELECT generic,brand,strength,dosageform,IFNULL(importer,'') AS importer, IFNULL(manufacturer,'') AS manufacturer FROM isdtbl i LEFT JOIN imctbl im ON i.importer_code =im.imccode WHERE i.generic LIKE '%" + genaricName + "%'  and i.status = '1'");
            genaricName = "";
            while (query.next()) {
                genaricName = query.getString("generic");
                isds.add(new ISD(query.getString("brand"), StringUtils.capitalize(query.getString("dosageform")),
                        query.getString("strength"), query.getString("importer"), query.getString("manufacturer"),query.getString("generic")));
            }
        }

        LogUtil.getLog("Event").debug(logData + ",FilterController.searchDrugPhr,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.searchDrugPhr,user_id="+user_id+",search_drug = "+name+",");
        LogUtil.getLog("Console").debug(logData + ",FilterController.searchDrugPhr,user_id="+user_id+",search_drug = "+name+",");
        return new Data(atcs,isds,genaricName);

    }



    //all
    public  static  Data getAllAdvanceSearch(String colomn, String user_id) throws SQLException {

        List<String> all = new ArrayList<>();
        System.out.println("SELECT " + colomn + " FROM atctbl");
        ResultSet query = DBConnection.getInstance().query("SELECT " + colomn + " FROM atctbl");

        while (query.next()){
            all.add(query.getString(1));
        }

        LogUtil.getLog("Event").debug(logData + ",FilterController.getAllAdvanceSearch,user_id="+user_id+",search_drug = "+colomn+",");
        LogUtil.getLog("DrugFilterlog").debug(logData + ",FilterController.getAllAdvanceSearch,user_id="+user_id+",search_drug = "+colomn+",");
        LogUtil.getLog("Console").debug(logData + ",FilterController.getAllAdvanceSearch,user_id="+user_id+",search_drug = "+colomn+",");
        return  new Data(all);

    }
}
