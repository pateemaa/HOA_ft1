<%-- 
    Document   : complete_processing
    Created on : Jan 23, 2025, 6:04:49 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity Processing</title>
        <link rel="stylesheet" href="..\styles\processing_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action="user_dashboard.html">

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

            <div id="submit-btn">
                <input type = "submit" value="Return to Main Menu">
            </div>
            </form>
        </div>
    </body>
</html>