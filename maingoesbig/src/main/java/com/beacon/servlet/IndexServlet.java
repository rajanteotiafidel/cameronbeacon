package com.beacon.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.json.simple.parser.JSONParser;

public class IndexServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		
		if (session != null && (String) session.getAttribute("email") != "null") {
			JSONParser parser = new JSONParser();
	        try {
	            Object obj = parser.parse(new FileReader("F:\\FIDEL\\Cameron\\cameron.txt"));
//	            Object obj = parser.parse(new FileReader("/root/Cameron/cameron.txt"));
//	            Object obj = parser.parse(new FileReader("/src/main/webapp/properties/cameron.txt"));
	            System.out.println(obj);
//	            response.getWriter().write(obj.toString());
	            request.getRequestDispatcher("/index.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            return;
	        }
			
	    } else {
	    	response.sendRedirect(request.getContextPath()+"/login.jsp");
	    }
	}*/
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	JSONParser parser = new JSONParser();
        try {
            Object obj = parser.parse(new FileReader("F:\\FIDEL\\Cameron\\cameron.txt"));
//            Object obj = parser.parse(new FileReader("/root/Cameron/cameron.txt"));
//            Object obj = parser.parse(new FileReader("/src/main/webapp/properties/cameron.txt"));
            System.out.println(obj);
//            request.setAttribute("obj", obj.toString());
//            request.getRequestDispatcher("/index.jsp").forward(request, response);
            response.getWriter().write(obj.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
