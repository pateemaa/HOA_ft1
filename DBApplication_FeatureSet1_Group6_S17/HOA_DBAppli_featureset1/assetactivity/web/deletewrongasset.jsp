<%-- 
    Document   : deletewrongasset
    Created on : 04 15, 23, 5:09:26 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Wrongly Encoded Asset</title>
    </head>
    <body>
         <form action = "delete_processing.jsp">
            
             <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        A.assetsForDelete();
                        for(int i = 0; i < A.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=A.asset_idlist.get(i)%>"> <%=A.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
            <input type = "submit" value = "Delete Asset">
        </form>
    </body>
</html>
