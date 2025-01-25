<%-- 
    Document   : deletewrongasset
    Created on : Jan 23, 2025, 6:03:51 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Wrongly Encoded Asset</title>
        <link rel="stylesheet" href="styles\menu_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action = "delete_processing.jsp">

                <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
                <div id="header">
                    <h2>Delete an Wrongly Encoded Asset</h2>
                </div>

                <div class="input-lbl">
                    Asset: 
                </div>
                    <select class="input-field" id = "asset_id" name = "asset_id">
                        <%
                            A.assetsForDelete();
                            for(int i = 0; i < A.asset_idlist.size(); i++){
                        %>
                        <option value = "<%=A.asset_idlist.get(i)%>"> <%=A.asset_idlist.get(i)%></option>
                        <%
                            }
                        %>
                    </select><br>
                <div id="submit-btn">       
                    <input type = "submit" value = "Delete Asset">
                </div>    
            </form>
        </div>            
    </body>
</html>
