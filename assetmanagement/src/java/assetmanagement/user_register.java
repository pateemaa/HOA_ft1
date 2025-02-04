/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assetmanagement;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author fatim
 */
@WebServlet(name = "user_register", urlPatterns = {"/user_register"})
public class user_register extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {    
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            
            String dp_img = request.getParameter("dp_img");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String phone_number = request.getParameter("phone_number");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Integer user_id = 0;
            String salt = PasswordUtil.generateSalt();
            String hashed_password = PasswordUtil.hashPassword(password, salt);
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(user_id) + 1 AS newID FROM users");
            ResultSet rst = pstmt.executeQuery();
            
            while(rst.next()){
                user_id = rst.getInt("newID");
                if (user_id == 0) { 
                    user_id = 1;  
                }
            }
            
            pstmt = conn.prepareStatement("INSERT INTO users (user_id, dp_img, first_name, last_name, email, phone_number, password, salt) "
                                        + "VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt    (1, user_id);
            pstmt.setString (2, dp_img);
            pstmt.setString (3, first_name);
            pstmt.setString (4, last_name);
            pstmt.setString (5, email);
            pstmt.setString (6, phone_number);
            pstmt.setString (7, hashed_password);
            pstmt.setString (8, salt);
            pstmt.executeUpdate();
            
            PrintWriter out = response.getWriter();
            if(rst.next()){
                RequestDispatcher rd = request.getRequestDispatcher("user_login.html");
                rd.forward(request, response);
            }else{
                out.println("Register failed");
                RequestDispatcher rd = request.getRequestDispatcher("user_register.html");
                rd.include(request, response);
            }
            
            pstmt.close();
            conn.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }


}
