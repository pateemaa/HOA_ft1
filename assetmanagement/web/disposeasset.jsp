<%-- 
    Document   : disposeasset
    Created on : Jan 23, 2025, 6:04:15 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dispose an Asset</title>
    </head>
    <body>
        <form action = "dispose_processing.jsp">
            
            <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        A.assetsForDisposal();
                        for(int i = 0; i < A.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=A.asset_idlist.get(i)%>"> <%=A.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
                    
            <input type = "submit" value = "Dispose">
        </form>
    </body>
</html>