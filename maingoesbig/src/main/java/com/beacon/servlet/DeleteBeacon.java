package com.beacon.servlet;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.math.BigInteger;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import com.google.gson.*;
import com.beacon.model.*;
import com.beacon.model.Properties;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class DeleteBeacon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteBeacon() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("DeleteBeacon doGet ===================>>>>>>>>>>>>>> ");
		try {
	        String beaconName = request.getParameter("gbn");
	        System.out.println("beaconName = "+beaconName);
			String data = "refresh_token=1/q-BzRTo3NFiZWmIO7_ZkBpbb0uFp-kWZW_mgjbcU-es"
	                + "&client_id=337655747815-2l4ghd53davhqfvtehhdpo6dmj46eop9.apps.googleusercontent.com"
	                + "&client_secret=7L7NFlGsWrBpdDGuD7_WaVAQ"
	                + "&grant_type=refresh_token";
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpGet(urlstr,data);
			System.out.println("httpresponse ====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in DeleteBeacon === "+googleReponse.getAccess_token());
			StringBuffer beaconJSON = sendGet(googleReponse.getAccess_token(), beaconName);
			System.out.println("beaconJSON ========--------->>>>>>>> "+beaconJSON );

			response.getWriter().write(beaconName.toString()); 
//			response.sendRedirect(request.getContextPath()+"/BeaconSuccess.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doGet of DeleteBeacon");
	}
	
	public String httpGet(String urlstr, String data) throws IOException {
	    URL url = new URL(urlstr);
	    URLConnection connection = url.openConnection();
	    connection.setDoOutput(true);
	    OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
	    writer.write(data);
	    writer.flush();
	    
	    HttpURLConnection httpConn = (HttpURLConnection)connection;
	    InputStream is;
	    if (httpConn.getResponseCode() >= 400) {
	        is = httpConn.getErrorStream();
	    } else {
	        is = httpConn.getInputStream();
	    }
	    BufferedReader reader = new BufferedReader(new InputStreamReader(is));
	    String line = "";
	    StringBuilder builder = new StringBuilder();
	    while((line = reader.readLine()) != null) {
	        builder.append(line);
	    }
		System.out.println("Add builder------------>>>>>>>. "+builder.toString());
		return builder.toString();
	}
	
	// HTTP GET request
	private StringBuffer sendGet(String token, String beaconName) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/"+beaconName+"?projectId=beacons-160503&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8";
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("DELETE");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("cache", "false");
		con.setUseCaches( false );
	    con.setDefaultUseCaches( false );
		
	    int responseCode = con.getResponseCode();
		System.out.println("\nSending 'DELETE' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		
	    HttpURLConnection httpConn = (HttpURLConnection)con;
	    InputStream is;
	    if (httpConn.getResponseCode() >= 400) {
	        is = httpConn.getErrorStream();
	    } else {
	        is = httpConn.getInputStream();
	    }
	    
	    if(responseCode>=400) {
	    	return new StringBuffer(Integer.toString(responseCode));
	    }

		BufferedReader in = new BufferedReader( new InputStreamReader(is));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		String strbeaconList = response.toString();
		System.out.println("str DeleteBeacon List ------->>>>>> "+strbeaconList);
		return response;
	}
}