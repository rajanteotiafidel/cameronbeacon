package com.beacon.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.parser.*;

public class BeaconServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public BeaconServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	JSONParser parser = new JSONParser();
        try {
            Object obj = parser.parse(new FileReader("F:\\FIDEL\\Cameron\\cameron.txt"));
//            Object obj = parser.parse(new FileReader("/root/Cameron/cameron.txt"));
//            Object obj = parser.parse(new FileReader("/src/main/webapp/properties/cameron.txt"));
            response.getWriter().write(obj.toString());
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
    }
}
