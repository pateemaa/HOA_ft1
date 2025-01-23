<%-- 
    Document   : updateassetactinfo
    Created on : 04 15, 23, 4:10:09 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Activity Information</title>
    </head>
    <body>
        <form action = "updateActivity_processing.jsp">
            
             <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        ACT.assetsFor_activityUpdate();
                        for(int i = 0; i < ACT.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=ACT.asset_idlist.get(i)%>"> <%=ACT.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
           
            Activity Date:        <input type = "text" id = "activity_date" name = "activity_date"><br>
            Activity Description: <input type = "text" id = "activity_description" name = "activity_description"><br>
            Tentative Start:      <input type = "text" id = "tent_start" name = "tent_start"><br>
            Tentative End:        <input type = "text" id = "tent_end" name = "tent_end"><br>
            Actual Start:         <input type = "text" id = "act_start" name = "act_start"><br>
            Actual End:           <input type = "text" id = "act_end" name = "act_end"><br>
            Cost:                 <input type = "double" id = "cost" name = "cost"><br>
            Status:               <input type = "text" id = "status" name = "status"><br>
            
            <input type = "submit" value = "Update Asset">
    </body>
</html>
