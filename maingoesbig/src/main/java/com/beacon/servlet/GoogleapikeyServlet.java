package com.beacon.servlet;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class GoogleapikeyServlet extends HttpServlet{
 
    private static final long serialVersionUID = 1L;
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	/*HttpSession session = request.getSession(false);
    	String apikey = (String) session.getAttribute("apikey");
    	String email = (String) session.getAttribute("email");
    	if (email == null) {
    		response.sendRedirect(request.getContextPath()+"/login.jsp");
    	} else {
    		try {
       			try {
       				Class.forName("com.mysql.jdbc.Driver");
       			} catch (ClassNotFoundException e) {
       				e.printStackTrace();
       				return;
       			}
       			Connection connection = null;

       			String selectTableSQL = "SELECT * from user_profile where email=?";
       			try {
       				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/rajan", "rajan", "password");
//       				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/beacondata", "root", "YxHocWGCqO6NlTMn");
       				PreparedStatement preparedStatement = connection.prepareStatement(selectTableSQL);
       				preparedStatement.setString(1, email);
       				ResultSet rs = preparedStatement.executeQuery();
					while(rs.next()) {
						session.setAttribute("projectid", (String)rs.getObject("projectid"));
						session.setAttribute("apikey", (String)rs.getObject("apikey"));
					}*/
    				response.sendRedirect(request.getContextPath()+"/googleapi.jsp");
        		/*} catch (SQLException e) {
        			e.printStackTrace();
        			return;
        		}
        		if(connection!=null) {
        			connection.close();
        		}
        	}catch(Exception e){
        		e.printStackTrace();
        	}
		}*/ 
    }
			
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		HttpSession session=request.getSession(false);		
		try {
				request.getRequestDispatcher("location.href='https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/userlocation.beacon.registry&amp;access_type=offline&amp;include_granted_scopes=true&amp;state=state_parameter_passthrough_value&amp;redirect_uri=https://eabb6d23.ngrok.io/Googleoauth/callback&amp;response_type=code&amp;client_id=337655747815-2l4ghd53davhqfvtehhdpo6dmj46eop9.apps.googleusercontent.com");
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
}