<%-- 
    Document   : dispose_processing
    Created on : Jan 23, 2025, 6:06:43 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dispose Asset Processing</title>
        <link rel="stylesheet" href="styles\processing_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action="pages\user_dashboard.html">
                <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>

                <%

                    String v_status = request.getParameter("status");

                    A.status = v_status;

                    int status = A.dispose_asset();

                    if(status == 1){
                %>
                    <h1>Dispose Asset Successful</h1>
                <%
                    }else{
                %>
                    <h1>Dispose Asset Failed</h1>
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

