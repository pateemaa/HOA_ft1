<%-- 
    Document   : recordassetact.jsp
    Created on : 04 15, 23, 12:37:36 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Record Asset Activity</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action = "record_processing.jsp">
            
             <jsp:useBean id = "AT" class = "assetmanagement.asset_transactions" scope = "session"/>
             <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        AT.activityIdTo_record();
                        for(int i = 0; i < AT.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=AT.asset_idlist.get(i)%>"> <%=AT.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
            
            Activity Date: <select id = "activity_date" name = "activity_date">
                    <%
                        AT.activityDateTo_record();
                        for(int i = 0; i < AT.transaction_datelist.size(); i++){
                    %>
                    <option value = "<%=AT.transaction_datelist.get(i)%>"> <%=AT.transaction_datelist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
                   
            Activity Description: <input type = "text" id = "activity_description" name = "activity_description"><br>
            Tentative Start:      <input type = "text" id = "tent_start" name = "tent_start"><br>
            Tentative End:        <input type = "text" id = "tent_end" name = "tent_end"><br>
            Actual Start:         <input type = "text" id = "act_start" name = "act_start"><br>
            Actual End:           <input type = "text" id = "act_end" name = "act_end"><br>
            Cost:                 <input type = "double" id = "cost" name = "cost"><br>
            Status:               <input type = "text" id = "status" name = "status"><br>
            
            <input type = "submit" value = "Record Asset">
        </form>
    </body>
</html>