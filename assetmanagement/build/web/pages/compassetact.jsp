<%-- 
    Document   : compassetact
    Created on : Jan 23, 2025, 6:04:35 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="..\styles\menu_style.css">
        <title>Complete Asset Activity</title>
    </head>
    <body>
        <div id="form-container">
            <form action = "complete_processing.jsp">

                 <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>
                 
                <div id="header">
                        <h2>Complete an Asset Activity</h2>
                </div>

                <div class="input-lbl">Asset:</div> 
                        <select class="input-field" id = "asset_id" name = "asset_id">
                        <%
                            ACT.assetsFor_complete();
                            for(int i = 0; i < ACT.asset_idlist.size(); i++){
                        %>
                        <option value = "<%=ACT.asset_idlist.get(i)%>"> <%=ACT.asset_idlist.get(i)%></option>
                        <%
                            }
                        %>
                       </select><br>
                <div id="submit-btn">
                       <input type = "submit" value = "Complete Asset">
                </div>
            </form>
        </div>
    </body>
</html>
