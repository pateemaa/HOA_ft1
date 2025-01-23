<%-- 
    Document   : compassetact
    Created on : 04 15, 23, 4:43:12 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complete Asset Activity</title>
    </head>
    <body>
         <form action = "complete_processing.jsp">
            
             <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        ACT.assetsFor_complete();
                        for(int i = 0; i < ACT.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=ACT.asset_idlist.get(i)%>"> <%=ACT.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
            <input type = "submit" value = "Complete Asset">
        </form>
    </body>
</html>
