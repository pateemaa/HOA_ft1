<%-- 
    Document   : updateAsset_processing
    Created on : Jan 23, 2025, 5:59:25 PM
    Author     : fatim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, assetmanagement.*, java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Asset Information Processing</title>
        <link rel="stylesheet" href="styles\processing_style.css">
    </head>
    <body>
        <div id="form-container">
            <form action="pages\user_dashboard.html">
                <jsp:useBean id = "A" class = "assetmanagement.assets" scope = "session"/>

                <%
                    Integer v_asset_id = Integer.parseInt(request.getParameter("asset_id"));
                    String v_asset_name = request.getParameter("asset_name");
                    String v_asset_description = request.getParameter("asset_description");
                    String v_acquisition_date = request.getParameter("acquisition_date");
                    boolean v_forrent = Boolean.parseBoolean(request.getParameter("forrent"));

                    String asset_value_str = request.getParameter("asset_value");
                    double v_asset_value = 0.0;
                    if (asset_value_str != null && !asset_value_str.isEmpty()) {
                        v_asset_value = Double.parseDouble(asset_value_str);
                    }
                    DecimalFormat value = new DecimalFormat("#.00");
                    v_asset_value = Double.valueOf(value.format(v_asset_value));

                    String v_type_asset = request.getParameter("type_asset");
                    String v_status = request.getParameter("status");

                    String loc_lattitude_str = request.getParameter("loc_lattitude");
                    double v_loc_lattitude = 0.0;
                    if (loc_lattitude_str != null && !loc_lattitude_str.isEmpty()) {
                        v_loc_lattitude = Double.parseDouble(loc_lattitude_str);
                    }
                    DecimalFormat lat = new DecimalFormat("#.0000");
                    v_loc_lattitude = Double.valueOf(lat.format(v_loc_lattitude));

                    String loc_longiture_str = request.getParameter("loc_longiture");
                    double v_loc_longiture = 0.0;
                    if (loc_longiture_str != null && !loc_longiture_str.isEmpty()) {
                        v_loc_longiture = Double.parseDouble(loc_longiture_str);
                    }
                    DecimalFormat longi = new DecimalFormat("#.0000");
                    v_loc_longiture = Double.valueOf(longi.format(v_loc_longiture));
                    String v_hoa_name = request.getParameter("hoa_name");

                    String enclosingAssetParam = request.getParameter("enclosing_asset");
                    Integer v_enclosing_asset = null;
                    if(enclosingAssetParam != null && !enclosingAssetParam.isEmpty()) {
                        v_enclosing_asset = Integer.parseInt(enclosingAssetParam);
                    } else {
                        v_enclosing_asset = null;
                    }


                    A.asset_name = v_asset_name;
                    A.asset_description = v_asset_description;
                    A.acquisition_date = v_acquisition_date;
                    A.forrent = v_forrent;
                    A.asset_value = v_asset_value;
                    A.type_asset = v_type_asset;
                    A.status = v_status;
                    A.loc_lattitude = v_loc_lattitude;
                    A.loc_longiture = v_loc_longiture;
                    A.hoa_name = v_hoa_name;
                    A.enclosing_asset = v_enclosing_asset;

                    int status = A.update_asset();

                    if(status == 1){
                %>
                    <h1>Update Asset Information Successful</h1>
                <%
                    }else{
                %>
                    <h1>Update Asset Information Failed</h1>
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
