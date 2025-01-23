<%-- 
    Document   : dispose_processing
    Created on : 04 14, 23, 8:59:04 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dispose Asset Processing</title>
    </head>
    <body>
        <form action="index.html">
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

            <input type = "submit" value="Return to Main Menu">
        </form>
    </body>
</html>
