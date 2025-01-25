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
        <link rel="stylesheet" href="styles\menu_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action = "updateAsset_processing.jsp">

                <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>
                <div id="header">
                    <h2>Update an Asset Information</h2>
                </div>

                <div class="input-lbl">
                    Asset: 
                </div>    
                    <select class="input-field" id = "asset_id" name = "asset_id">
                        <%
                            A.assetsToUpdate();
                            for(int i = 0; i < A.asset_idlist.size(); i++){
                        %>
                        <option value = "<%=A.asset_idlist.get(i)%>"> <%=A.asset_idlist.get(i)%></option>
                        <%
                            }
                        %>
                    </select><br>

                <div class="input-lbl">
                    Asset Name:         <input type = "text" class="input-field" id = "asset_name" name = "asset_name"><br>
                </div>
                <div class="input-lbl">    
                    Asset Description:  <input type = "text" class="input-field" id = "asset_description" name = "asset_description"><br>
                </div>
                <div class="input-lbl">    
                    Acquisition Date (YYYY-MM-DD):   <input type = "text" class="input-field" id = "acquisition_date" name = "acquisition_date"><br>
                </div>
                <div class="input-lbl">    
                    For Rent:           <input type = "boolean" class="input-field" id = "forrent" name = "forrent"><br>
                </div>
                <div class="input-lbl">    
                    Asset Value:        <input type = "double" class="input-field" id = "asset_value" name = "asset_value"><br>
                </div>
                <div class="input-lbl">    
                    Asset Type:         <input type = "text" class="input-field" id = "type_asset" name = "type_asset"><br>
                </div>
                <div class="input-lbl">    
                    Status:             <input type = "text" class="input-field" id = "status" name = "status"><br>
                </div>
                <div class="input-lbl">    
                    Location Latitude:  <input type = "double" class="input-field" id = "loc_lattitude" name = "loc_lattitude"><br>
                </div>
                <div class="input-lbl">    
                    Location Longitude: <input type = "double" class="input-field" id = "loc_longiture" name = "loc_longiture"><br>
                </div>
                <div class="input-lbl">    
                    HOA Name:           <input type = "text" class="input-field" id = "hoa_name" name = "hoa_name"><br>
                </div>
                <div class="input-lbl">    
                    Enclosing Asset:    <input type = "Integer" class="input-field" id = "enclosing_asset" name = "enclosing_asset"><br>
                </div>
                <div id="submit-btn">
                    <input type = "submit" value = "Update">
                </div>
            </form>
        </div>
    </body>
</html>
