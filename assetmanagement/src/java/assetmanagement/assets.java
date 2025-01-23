/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assetmanagement;

/**
 *
 * @author fatim
 */
import java.util.*;
import java.sql.*;


public class assets {
    
    public int      asset_id;
    public String   asset_name;
    public String   asset_description;
    public String   acquisition_date;
    public boolean  forrent;
    public double   asset_value;
    public String   type_asset;
    public String   status;
    public double   loc_lattitude;
    public double   loc_longiture;
    public String   hoa_name;
    public Integer  enclosing_asset;
    
    public ArrayList<Integer>  asset_idlist            = new ArrayList<> ();
    public ArrayList<String>   asset_namelist          = new ArrayList<> ();
    public ArrayList<String>   asset_descriptionlist   = new ArrayList<> ();
    public ArrayList<String>   acquisition_datelist    = new ArrayList<> ();
    public ArrayList<Boolean>  forrentlist             = new ArrayList<> ();
    public ArrayList<Double>   asset_valuelist         = new ArrayList<> ();
    public ArrayList<String>   type_assetlist          = new ArrayList<> ();
    public ArrayList<String>   statuslist              = new ArrayList<> ();
    public ArrayList<Double>   loc_lattitudelist       = new ArrayList<> ();
    public ArrayList<Double>   loc_longiturelist       = new ArrayList<> ();
    public ArrayList<String>   hoa_namelist            = new ArrayList<> ();
    public ArrayList<Integer>  enclosing_assetlist     = new ArrayList<> ();
    
    
    public assets(){}
    
    public int register_asset(){
        
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(asset_id) + 1 AS newID FROM assets");
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next()){
                asset_id = rst.getInt("newID");
            }
            
            pstmt = conn.prepareStatement("INSERT INTO assets (asset_id, asset_name, asset_description, acquisition_date, forrent, asset_value, type_asset, status, loc_lattitude, loc_longiture, hoa_name, enclosing_asset) "
                                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt    (1, asset_id);
            pstmt.setString (2, asset_name);
            pstmt.setString (3, asset_description);
            pstmt.setString (4, acquisition_date);
            pstmt.setBoolean(5, forrent);
            pstmt.setDouble  (6, asset_value);
            pstmt.setString (7, type_asset);
            pstmt.setString (8, status);
            pstmt.setDouble  (9, loc_lattitude);
            pstmt.setDouble  (10, loc_longiture);
            pstmt.setString (11, hoa_name);
            if (enclosing_asset == null) {
                pstmt.setNull(12, java.sql.Types.INTEGER);
            } else {
                pstmt.setInt(12, enclosing_asset);
            }
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }
    }
    
    public int assetsToUpdate(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM assets ORDER BY asset_id");
            ResultSet rst = pstmt.executeQuery();
            
            asset_idlist.clear();
            
            while(rst.next()){
                asset_id = rst.getInt("asset_id");
                
                asset_idlist.add(asset_id);
            }
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }  
    }
    
    
    public int update_asset(){
        
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE assets "
                                                          + "SET asset_name = ?, "
                                                          + "asset_description = ?, "
                                                          + "acquisition_date = ?, "
                                                          + "forrent = ?, "
                                                          + "asset_value = ?, "
                                                          + "type_asset = ?, "
                                                          + "status = ?, "
                                                          + "loc_lattitude = ?, "
                                                          + "loc_longiture = ?, "
                                                          + "hoa_name = ?, "
                                                          + "enclosing_asset = ? "
                                                          + "WHERE asset_id = ?");
            
            pstmt.setString     (1, asset_name);
            pstmt.setString     (2, asset_description);
            pstmt.setString     (3, acquisition_date);
            pstmt.setBoolean    (4, forrent);
            pstmt.setDouble     (5, asset_value);
            pstmt.setString     (6, type_asset);
            pstmt.setString     (7, status);
            pstmt.setDouble     (8, loc_lattitude);
            pstmt.setDouble     (9, loc_longiture);
            pstmt.setString     (10, hoa_name);
            if (enclosing_asset == null) {
                pstmt.setNull(11, java.sql.Types.INTEGER);
            } else {
                pstmt.setInt(11, enclosing_asset);
            }
            pstmt.setInt        (12, asset_id);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }   
    }
    
    public int assetsForDelete(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM assets WHERE asset_id NOT IN (SELECT asset_id FROM asset_transactions) AND forrent = 0 ORDER BY asset_id");
            ResultSet rst = pstmt.executeQuery();
            
            asset_idlist.clear();
            
            while(rst.next()){
                asset_id = rst.getInt("asset_id");
                
                asset_idlist.add(asset_id);
            }
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }  
    }
    
    public int delete_asset(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM assets WHERE asset_id = ?");
            
            pstmt.setInt (1, asset_id);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }   
    }
    
    public int assetsForDisposal(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM assets WHERE status = 'S' ORDER BY asset_id");
            ResultSet rst = pstmt.executeQuery();
            
            asset_idlist.clear();
            
            while(rst.next()){
                asset_id = rst.getInt("asset_id");
                
                asset_idlist.add(asset_id);
            }
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }  
    }
    
    public int dispose_asset(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hoadb?user=root&password=");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE assets SET status = 'X' WHERE status = 'S'");
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            System.out.println("Successful");
            return 1;
        }catch (Exception e){
            System.out.println(e.getMessage());
        return 0;
        }   
    }
    
    
    public static void main(String args[]){
        assets A = new assets();
        A.asset_name = "Table";
        A.asset_description = "Modern Table";
        A.acquisition_date = "2022-01-01";
        A.forrent = false;
        A.asset_value = 100.00;
        A.type_asset = "F";
        A.status = "W";
        A.loc_lattitude = 101.4350;
        A.loc_longiture = 101.4360;
        A.hoa_name = "SJH";
        A.enclosing_asset = null;
        A.asset_id = 5011;
        
//        A.register_asset();
        A.update_asset();
        
//        A.dispose_asset();
//        A.delete_asset();
    }


}