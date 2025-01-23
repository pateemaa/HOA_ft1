<%-- 
    Document   : deleteAct_processing
    Created on : 04 15, 23, 7:45:54 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset Activity Processing</title>
    </head>
    <body>
        <form action="index.html">
        
        <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
        
        <%
           
            String asset_idParam = request.getParameter("asset_id");
            int v_asset_id;
            if(asset_idParam != null && !asset_idParam.isEmpty()) {
                v_asset_id = Integer.parseInt(asset_idParam);
            } else {
                v_asset_id = 0;
            }
           
            String v_activity_date = request.getParameter("activity_date");
            
            ACT.asset_id = v_asset_id;
            ACT.activity_date = v_activity_date;
            
            int status = ACT.delete_activity();
            
            if(status == 1){
        %>
            <h1>Deleting Asset Successful</h1>
        <%
            }else{
        %>
            <h1>Deleting Asset Failed</h1>
        <%
            }
        %>
        
        <input type = "submit" value="Return to Main Menu">
        
        </form>
    </body>
</html>
