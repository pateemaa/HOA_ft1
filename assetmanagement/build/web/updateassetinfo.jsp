<%-- 
    Document   : updateassetinfo
    Created on : Jan 23, 2025, 6:00:12 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*, java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Information</title>
    </head>
    <body>
        <form action = "updateAsset_processing.jsp">
            
            <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
            
            Asset: <select id = "asset_id" name = "asset_id">
                    <%
                        A.assetsToUpdate();
                        for(int i = 0; i < A.asset_idlist.size(); i++){
                    %>
                    <option value = "<%=A.asset_idlist.get(i)%>"> <%=A.asset_idlist.get(i)%></option>
                    <%
                        }
                    %>
                   </select><br>
            
            Asset Name:         <input type = "text" id = "asset_name" name = "asset_name"><br>
            Asset Description:  <input type = "text" id = "asset_description" name = "asset_description"><br>
            Acquisition Date (YYYY-MM-DD):   <input type = "text" id = "acquisition_date" name = "acquisition_date"><br>
            For Rent:           <input type = "boolean" id = "forrent" name = "forrent"><br>
            Asset Value:        <input type = "double" id = "asset_value" name = "asset_value"><br>
            Asset Type:         <input type = "text" id = "type_asset" name = "type_asset"><br>
            Status:             <input type = "text" id = "status" name = "status"><br>
            Location Latitude:  <input type = "double" id = "loc_lattitude" name = "loc_lattitude"><br>
            Location Longitude: <input type = "double" id = "loc_longiture" name = "loc_longiture"><br>
            HOA Name:           <input type = "text" id = "hoa_name" name = "hoa_name"><br>
            Enclosing Asset:    <input type = "Integer" id = "enclosing_asset" name = "enclosing_asset"><br>
            
            <input type = "submit" value = "Update">
        </form>
    </body>
</html>
