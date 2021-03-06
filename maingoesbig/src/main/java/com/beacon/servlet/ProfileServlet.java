package com.beacon.servlet;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProfileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    	InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
    	
    	Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
    	
    	HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		if (session != null && email != "null") {
			String selectProfileTableSQL = "SELECT * from user_profile where email = ?";
			Connection connection = null;
			try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					return;
				}
				try {
					connection = DriverManager.getConnection(url, dbusername, dbpassword);
					PreparedStatement preparedStatement = connection.prepareStatement(selectProfileTableSQL);
					preparedStatement.setString(1, email);
					ResultSet rs = preparedStatement.executeQuery();
					while(rs.next()) {
						session.setAttribute("orgName",(String)rs.getObject("orgName"));
					}
					request.getRequestDispatcher("/profile.jsp").forward(request, response);
				} catch (SQLException e) {
					e.printStackTrace();
					return;
				}
				if(connection!=null) {
					connection.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
				return;
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    	InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
    	
    	Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
    	
    	HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("email");
		String selectProfileTableSQL = "SELECT * from user_profile where email = ?";
		if(request.getParameter("submit")!=null) {
	    	String orgName=request.getParameter("orgName");
	    	String password=request.getParameter("password");
	    	try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					return;
				}
				Connection connection = null;
				String insertTableSQL = "UPDATE user_profile SET orgName=?, password=? where email = ?";
				try {
					connection = DriverManager.getConnection(url, dbusername, dbpassword);
					PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
					preparedStatement.setString(1, orgName);
					preparedStatement.setString(2, password);
					preparedStatement.setString(3, email);
					preparedStatement.executeUpdate();
					String success = "Records updated successfully";
					PreparedStatement st = connection.prepareStatement(selectProfileTableSQL);
					st.setString(1, email);
					ResultSet rs = st.executeQuery();
					while(rs.next()) {
						session.setAttribute("orgName",(String)rs.getObject("orgName"));
						if (password != session.getAttribute("password")) {
							String insertLoginTableSQL = "UPDATE user_profile SET password=? where email = ?";
							PreparedStatement ps = connection.prepareStatement(insertLoginTableSQL);
							ps.setString(1, password);
							ps.setString(2, email);
							ps.executeUpdate();
							session.setAttribute("password",(String)rs.getObject("password"));
						}
					}
		            request.setAttribute("msg", success);
					response.sendRedirect(request.getContextPath()+"/profile");
				} catch (SQLException e) {
					e.printStackTrace();
					return;
				}
				if(connection!=null) {
					connection.close();
				}
			}catch(Exception e){
				e.printStackTrace();
				return;
			}
		}
	}
}
