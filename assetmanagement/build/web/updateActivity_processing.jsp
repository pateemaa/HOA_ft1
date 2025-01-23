<%-- 
    Document   : updateActivity_processing
    Created on : Jan 23, 2025, 5:59:05 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*, java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Activity Processing</title>
    </head>
    <body>
        <form action="index.html">
        
        <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
        
        <%
            String v_activity_date = request.getParameter("activity_date");
            String v_activity_description = request.getParameter("activity_description");
            String v_tent_start = request.getParameter("tent_start");
            String v_tent_end = request.getParameter("tent_end");
            String v_act_start = request.getParameter("act_start");
            String v_act_end = request.getParameter("act_end");
            
            String cost_str = request.getParameter("cost");
            double v_cost = 0.0;
            if (cost_str != null && !cost_str.isEmpty()) {
                v_cost = Double.parseDouble(cost_str);
            }
            DecimalFormat value = new DecimalFormat("#.00");
            v_cost = Double.valueOf(value.format(v_cost));
            
            String v_status = request.getParameter("status");
            
            
            ACT.activity_date = v_activity_date;
            ACT.activity_description = v_activity_description;
            ACT.tent_start = v_tent_start;
            ACT.tent_end = v_tent_end;
            ACT.act_start = v_act_start;
            ACT.act_end = v_act_end;
            ACT.cost = v_cost;
            ACT.status = v_status;
            
            int status = ACT.update_activity();
            
            if(status == 1){
        %>
            <h1>Update Asset Successful</h1>
        <%
            }else{
        %>
            <h1>Update Asset Failed</h1>
        <%
            }
        %>
        
        <input type = "submit" value="Return to Main Menu">
    </body>
</html>
