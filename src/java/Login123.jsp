
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.*;


@WebServlet(urlPatterns = {"/Login123"})

public class Login123 extends HttpServlet {
    @Override
    public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
    {
            PrintWriter out=res.getWriter();
         String name=req.getParameter("a1");
       String email=req.getParameter("b1");
       int phone_no=Integer.parseInt(req.getParameter("b2"));
       out.println("WELCOME");
      // out.println("your name is: "+name);
      // out.println( "your mail id is:"+email);
      // out.println("your phone no is:"+" "+phone_no);
       
       try{
          
                  Class.forName("com.mysql.jdbc.Driver");
         Connection com = DriverManager.getConnection("jdbc:mysql://localhost:3306/himanshu","root","john");
       // out.println("connection successful\n");
	Statement st=com.createStatement();
	 st.executeUpdate("insert into registration values('"+name+"','"+email+"','"+phone_no+"');");
        // out.println("insertion successful");
        out.println("you are successfully registered");
         com.close();
       }   
    
     catch (SQLException ex) {
        out.println("connection unsuccessful");
     }  
     catch (ClassNotFoundException ex) {   
     }
       if(name.equals(""))
       {
           res.sendRedirect("project.jsp");
       }
       else {
           res.sendRedirect("ncu.jsp");
       }
    }
}
   
