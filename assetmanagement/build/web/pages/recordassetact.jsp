<%-- 
    Document   : recordassetact
    Created on : Jan 23, 2025, 6:05:23 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Record Asset Activity</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="..\styles\menu_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action = "record_processing.jsp">

                 <jsp:useBean id = "AT" class = "assetmanagement.asset_transactions" scope = "session"/>
                 <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
                <div id="header">
                    <h2>Record an Asset Activity</h2>
                </div>

                <div class="input-lbl">
                    Asset: 
                </div>
                    <select class="input-field" id = "asset_id" name = "asset_id">
                        <%
                            AT.activityIdTo_record();
                            for(int i = 0; i < AT.asset_idlist.size(); i++){
                        %>
                        <option value = "<%=AT.asset_idlist.get(i)%>"> <%=AT.asset_idlist.get(i)%></option>
                        <%
                            }
                        %>
                    </select><br>

                <div class="input-lbl">
                    Activity Date: <select class="input-field" id = "activity_date" name = "activity_date">
                        <%
                            AT.activityDateTo_record();
                            for(int i = 0; i < AT.transaction_datelist.size(); i++){
                        %>
                        <option value = "<%=AT.transaction_datelist.get(i)%>"> <%=AT.transaction_datelist.get(i)%></option>
                        <%
                            }
                        %>
                       </select><br>
                </div>       
                <div class="input-lbl">
                    Activity Description: <input type = "text" class="input-field" id = "activity_description" name = "activity_description"><br>
                </div>
                <div class="input-lbl">    
                    Tentative Start:      <input type = "text" class="input-field" id = "tent_start" name = "tent_start"><br>
                </div>
                <div class="input-lbl">    
                    Tentative End:        <input type = "text" class="input-field" id = "tent_end" name = "tent_end"><br>
                </div>
                <div class="input-lbl">    
                    Actual Start:         <input type = "text" class="input-field" id = "act_start" name = "act_start"><br>
                </div>
                <div class="input-lbl">    
                    Actual End:           <input type = "text" class="input-field" id = "act_end" name = "act_end"><br>
                </div>
                <div class="input-lbl">    
                    Cost:                 <input type = "double" class="input-field" id = "cost" name = "cost"><br>
                </div>
                <div class="input-lbl">    
                    Status:               <input type = "text" class="input-field" id = "status" name = "status"><br>
                </div>
                <div id="submit-btn">
                    <input type = "submit" value = "Record Asset">
                </div>    
            </form>
        </div>           
    </body>
</html>