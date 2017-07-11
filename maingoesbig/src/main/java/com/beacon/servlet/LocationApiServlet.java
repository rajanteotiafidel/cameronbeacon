package com.beacon.servlet;

import java.io.*;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import org.codehaus.jettison.json.JSONObject;

public class LocationApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LocationApiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		HttpSession session = request.getSession(false);
/*		String address = (String) session.getAttribute("add");
		System.out.println("address p====" + address);*/
	//	String address="America/Los_Angeles";
		String argurl = "http://maps.googleapis.com/maps/api/geocode/json?address=%20" + (String) session.getAttribute("add") + "&sensor=true";
		System.out.println("argurl=" + argurl);
		String accoutnXml = "";
		JSONObject xmlJSONObj = null;
		String jsonPrettyPrintString = null;

		try {
			URL url = new URL(argurl);
			URLConnection con = url.openConnection();
			// specify that we will send output and accept input
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(20000); // long timeout, but not infinite
			con.setReadTimeout(20000);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);
			// tell the web server what we are sending
			con.setRequestProperty("Content-Type", "application/json charset=utf-8");
			OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
			writer.write(accoutnXml);
			writer.flush();
			writer.close();
			// reading the response
			InputStreamReader reader = new InputStreamReader(con.getInputStream());
			StringBuilder buf = new StringBuilder();
			char[] cbuf = new char[2048];
			int num;
			while (-1 != (num = reader.read(cbuf))) {
				buf.append(cbuf, 0, num);
			}
			String accountresult = buf.toString();
			response.getWriter().write(accountresult.toString());
		} catch (Throwable t) {
			t.printStackTrace(System.out);
		}

	}
}
