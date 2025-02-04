/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assetmanagement;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.*;

/**
 *
 * @author fatim
 */
@WebServlet(name = "user_login", urlPatterns = {"/user_login"})
public class user_login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        try {    
            Connection conn;
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/HOADB?user=user1&password=dbconnect");
            System.out.println("Database connected successfully.");
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            PreparedStatement pstmt = conn.prepareStatement("SELECT password, salt FROM users WHERE email=?");
            pstmt.setString    (1, email);
            
            ResultSet rst = pstmt.executeQuery();
            
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            
            if(email.equals("admin@gmail.com") && password.equals("admin123")){
                response.sendRedirect("admin_dashboard.html");
            }else if(rst.next()){
                String storedHash = rst.getString("password");
                String storedSalt = rst.getString("salt");
                
                if (PasswordUtil.verifyPassword(password, storedSalt, storedHash)) {
                    out.println("Log in successful");
                    RequestDispatcher rd = request.getRequestDispatcher("user_dashboard.html");
                    rd.include(request, response);
                } else {
                    out.println("Log in failed.");
                    RequestDispatcher rd = request.getRequestDispatcher("user_login.html");
                    rd.include(request, response);
                }
            }else{
                out.println("Log in failed");
                RequestDispatcher rd = request.getRequestDispatcher("user_login.html");
                rd.include(request, response);
            }
            
            pstmt.close();
            conn.close();
        }catch(Exception e){
            System.out.println("Database connection failed: " + e.getMessage());
        }
    }

}
