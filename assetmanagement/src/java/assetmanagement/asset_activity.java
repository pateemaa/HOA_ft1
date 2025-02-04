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

public class asset_activity {
    
    public int      asset_id;
    public String   activity_date;
    public String   activity_description;
    public String   tent_start;
    public String   tent_end;
    public String   act_start;
    public String   act_end;
    public double   cost;
    public String   status;
   
    
    public ArrayList<Integer>  asset_idlist               = new ArrayList<> ();
    public ArrayList<String>   activity_datelist          = new ArrayList<> ();
    public ArrayList<String>   activity_descriptionlist   = new ArrayList<> ();
    public ArrayList<String>   tent_startlist             = new ArrayList<> ();
    public ArrayList<String>   tent_endlist               = new ArrayList<> ();
    public ArrayList<String>   act_startlist              = new ArrayList<> ();
    public ArrayList<String>   act_endlist                = new ArrayList<> ();
    public ArrayList<Double>   costlist                   = new ArrayList<> ();
    public ArrayList<String>   statuslist                 = new ArrayList<> ();
    
    public asset_activity(){}
    
    public int assetsFor_activityUpdate(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hoadb?useTimezone=true&serverTimezone=UTC&user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM asset_activity ORDER BY asset_id");
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
    
    public int assetsFor_complete(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM asset_activity WHERE status = 'O' ORDER BY asset_id");
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
    
    public int assetIdFor_deleteAct(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM asset_activity ORDER BY asset_id");
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
    
    public int activityDateFor_deleteAct(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT activity_date FROM asset_activity");
            ResultSet rst = pstmt.executeQuery();
            
            activity_datelist.clear();
            
            while(rst.next()){
                activity_date = rst.getString("activity_date");
                
                activity_datelist.add(activity_date);
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
   
    
    public int record_activity(){
        
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO asset_activity(asset_id, activity_date, activity_description, tent_start, tent_end, act_start, act_end, cost, status) "
                                                          + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt    (1, asset_id);
            pstmt.setString (2, activity_date);
            pstmt.setString (3, activity_description);
            pstmt.setString (4, tent_start);
            pstmt.setString (5, tent_end);
            pstmt.setString (6, act_start);
            pstmt.setString (7, act_end);
            pstmt.setDouble  (8,cost);
            pstmt.setString (9, status);
            pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement("UPDATE assets SET status = 'P' WHERE asset_id = ?");
            pstmt.setInt    (1, asset_id);
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
    
    public int update_activity(){
         try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE asset_activity SET activity_date = ?, activity_description = ?, tent_start = ?, tent_end = ?, act_start = ?, act_end = ?, cost = ?, status = ? WHERE asset_id = ?");
            
            pstmt.setString (1, activity_date);
            pstmt.setString (2, activity_description);
            pstmt.setString (3, tent_start);
            pstmt.setString (4, tent_end);
            pstmt.setString (5, act_start);
            pstmt.setString (6, act_end);
            pstmt.setDouble  (7, cost);
            pstmt.setString (8, status);
            pstmt.setInt    (9, asset_id);
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
    
    public int complete_activity(){
         try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("UPDATE asset_activity SET status = 'C'");
            pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement("UPDATE assets SET status = 'W'");
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
    
    public int delete_activity(){
         try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("DELETE FROM asset_activity WHERE asset_id = ? AND activity_date = ?");
            pstmt.setInt    (1, asset_id);
            pstmt.setString (2, activity_date);
            pstmt.executeUpdate();
            
            pstmt = conn.prepareStatement("UPDATE asset_transactions SET isdeleted = 1 WHERE asset_id = ? AND transaction_date = ?");
            pstmt.setInt    (1, asset_id);
            pstmt.setString (2, activity_date);
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
        asset_activity ACT = new asset_activity();
        
        ACT.activity_date = "2022-12-23";
//        ACT.activity_description = "For Repair";
//        ACT.tent_start = "2023-04-16";
//        ACT.tent_end = "2023-04-20";
//        ACT.act_start = "2023-04-18";
//        ACT.act_end = "2023-04-24";
//        ACT.cost = 4000.00;
//        ACT.status = "S";
        ACT.asset_id = 5003;
        ACT.delete_activity();
    }
}
