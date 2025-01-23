<%-- 
    Document   : deleteact
    Created on : Jan 23, 2025, 6:03:37 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset Activity</title>
    </head>
    <body>
        <form action = "deleteAct_processing.jsp">
            
             <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        ACT.assetIdFor_deleteAct();
                        for(int i = 0; i < ACT.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=ACT.asset_idlist.get(i)%>"> <%=ACT.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
                   
              Activity Date: <select id = "activity_date" name = "activity_date">
                    <%
                        ACT.activityDateFor_deleteAct();
                        for(int i = 0; i < ACT.activity_datelist.size(); i++){
                    %>
                    <option value = "<%=ACT.activity_datelist.get(i)%>"> <%=ACT.activity_datelist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>     
            <input type = "submit" value = "Delete Activity">
        </form>
    </body>
</html>
