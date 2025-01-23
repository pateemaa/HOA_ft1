<%-- 
    Document   : delete_processing
    Created on : 04 15, 23, 5:27:31 PM
    Author     : ccslearner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Wrongly Encoded Asset Processing</title>
    </head>
    <body>
        <form action="index.html">
        
        <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
        
        <%
           
            String asset_idParam = request.getParameter("asset_id");
            int v_asset_id;
            if(asset_idParam != null && !asset_idParam.isEmpty()) {
                v_asset_id = Integer.parseInt(asset_idParam);
            } else {
                v_asset_id = 0;
            }
           
            A.asset_id = v_asset_id;
            
            int status = A.delete_asset();
            
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
        
        <input type = "submit" value="Return to Main Menu">
        
        </form>
    </body>
</html>
