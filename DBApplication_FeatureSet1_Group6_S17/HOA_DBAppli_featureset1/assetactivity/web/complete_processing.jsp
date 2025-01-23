<%-- 
    Document   : complete_processing
    Created on : 04 15, 23, 4:45:57 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity Processing</title>
    </head>
    <body>
        <form action="index.html">
        
        <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
        
        <%
           
            String v_status = request.getParameter("status");
           
            ACT.status = v_status;
            
            int status = ACT.complete_activity();
            
            if(status == 1){
        %>
            <h1>Completing Asset Successful</h1>
        <%
            }else{
        %>
            <h1>Completing Asset Failed</h1>
        <%
            }
        %>
        
        <input type = "submit" value="Return to Main Menu">
        
        </form>
    </body>
</html>
