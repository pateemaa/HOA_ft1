<%-- 
    Document   : deleteAct_processing
    Created on : Jan 23, 2025, 6:03:08 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Asset Activity Processing</title>
        <link rel="stylesheet" href="styles\processing_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action="pages\user_dashboard.html">

            <jsp:useBean id = "ACT" class = "assetmanagement.asset_activity" scope = "session"/>

            <%

                String asset_idParam = request.getParameter("asset_id");
                int v_asset_id;
                if(asset_idParam != null && !asset_idParam.isEmpty()) {
                    v_asset_id = Integer.parseInt(asset_idParam);
                } else {
                    v_asset_id = 0;
                }

                String v_activity_date = request.getParameter("activity_date");

                ACT.asset_id = v_asset_id;
                ACT.activity_date = v_activity_date;

                int status = ACT.delete_activity();

                if(status == 1){
            %>
                <h1>Deleting Asset Successful</h1>
            <%
                }else{
            %>
                <h1>Deleting Asset Failed</h1>
            <%
                }
            %>

            <div id="submit-btn">
                <input type = "submit" value="Return to Main Menu">
            </div>
            </form>
        </div>
    </body>
</html>