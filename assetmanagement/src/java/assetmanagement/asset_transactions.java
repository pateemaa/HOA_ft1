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

public class asset_transactions {
    
    public int      asset_id;
    public String   transaction_date;
    public int      trans_hoid;
    public String   trans_position;
    public String   trans_electiondate;
    public boolean  isdeleted;
    public Integer  approval_hoid;
    public String   approval_position;
    public String   approval_electiondate;
    public Integer  ornum;
    public String   transaction_type;
    
    public ArrayList<Integer>  asset_idlist              = new ArrayList<> ();
    public ArrayList<String>   transaction_datelist      = new ArrayList<> ();
    public ArrayList<Integer>  trans_hoidlist            = new ArrayList<> ();
    public ArrayList<String>   trans_positionslist       = new ArrayList<> ();
    public ArrayList<String>   trans_electiondatelist    = new ArrayList<> ();
    public ArrayList<Boolean>  ideletedlist              = new ArrayList<> ();
    public ArrayList<Integer>  approval_hoidlist         = new ArrayList<> ();
    public ArrayList<String>   approval_positionlist     = new ArrayList<> ();
    public ArrayList<String>   approval_electiondatelist = new ArrayList<> ();
    public ArrayList<Integer>  ornumlist                 = new ArrayList<> ();
    public ArrayList<String>   transaction_typelist      = new ArrayList<> ();
    
    public asset_transactions(){}
    
     public int activityIdTo_record(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=root");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT asset_id FROM asset_transactions WHERE transaction_type = 'A'");
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
     
    public int activityDateTo_record(){
        try{
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=root");
            System.out.println("Connection Successful");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT transaction_date FROM asset_transactions WHERE transaction_type = 'A'");
            ResultSet rst = pstmt.executeQuery();
            
            transaction_datelist.clear();
            
            while(rst.next()){
                transaction_date = rst.getString("transaction_date");
                
                transaction_datelist.add(transaction_date);
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
    
}