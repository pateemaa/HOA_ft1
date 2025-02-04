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
        <link rel="stylesheet" href="..\styles\menu_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action = "deleteAct_processing.jsp">

                 <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
                <div id="header">
                        <h2>Delete an Activity</h2>
                </div>

                <div class="input-lbl">
                    Asset: 
                </div>
                    <select class="input-field" id = "asset_id" name = "asset_id">
                        <%
                            ACT.assetIdFor_deleteAct();
                            for(int i = 0; i < ACT.asset_idlist.size(); i++){
                        %>
                        <option value = "<%=ACT.asset_idlist.get(i)%>"> <%=ACT.asset_idlist.get(i)%></option>
                        <%
                            }
                        %>
                    </select><br>

                  <div class="input-lbl">
                    Activity Date: 
                  </div>
                  <br>
                    <select class="input-field" id = "activity_date" name = "activity_date">
                        <%
                            ACT.activityDateFor_deleteAct();
                            for(int i = 0; i < ACT.activity_datelist.size(); i++){
                        %>
                        <option value = "<%=ACT.activity_datelist.get(i)%>"> <%=ACT.activity_datelist.get(i)%></option>
                        <%
                            }
                        %>
                    </select><br>     
                <div id="submit-btn">
                    <input type = "submit" value = "Delete Activity">
                </div>
            </form>
        </div>
    </body>
</html>
