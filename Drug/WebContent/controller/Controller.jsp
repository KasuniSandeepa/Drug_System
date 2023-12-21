<%@ page import="drugfilter.controller.FilterController" %>
<%@ page import="drugfilter.model.Data" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 3/12/2021
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    String name = ""+request.getParameter("name");
    String col = ""+request.getParameter("col");
    String drug = "" + request.getParameter("action");
    
   String user_id = (String)session.getAttribute("msisdn");
    if (user_id == null) {
    	System.out.println("null");
    	user_id = "null";
    }


    if (drug.equals("drug")) {
        if (!name.trim().equals("")) {

            Data data = FilterController.searchDrug(name,user_id);
            response.setContentType("application/json");
            out.print(new Gson().toJson(data));

        }

    } else if (drug.equals("ana")) {
        if (!name.trim().equals("")) {

            Data data = FilterController.searchDrugAna(name, user_id);
            response.setContentType("application/json");
            out.print(new Gson().toJson(data));

        }


    } else if (drug.equals("the")) {
        if (!name.trim().equals("")) {

            if(name.equalsIgnoreCase("all")){
                System.out.println(name+"asass");
                Data data = FilterController.getAllAdvanceSearch(col, user_id);
                response.setContentType("application/json");
                out.print(new Gson().toJson(data));
            }else{

                Data data = FilterController.searchDrugThe(name, user_id);
                response.setContentType("application/json");
                out.print(new Gson().toJson(data));
            }


        }


    } else if (drug.equals("cli")) {
        if (!name.trim().equals("")) {

            Data data = FilterController.searchDrugCli(name, user_id);
            response.setContentType("application/json");
            out.print(new Gson().toJson(data));

        }

    } else   if(drug.equals("phr")){
        if (!name.trim().equals("")) {

            Data data = FilterController.searchDrugPhr(name, user_id);
            response.setContentType("application/json");
            out.print(new Gson().toJson(data));

        }

    }


%>