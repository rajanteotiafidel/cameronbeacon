package com.beacon.servlet;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.parser.JSONParser;
import com.google.gson.*;
import com.beacon.model.BeaconList;

public class ListBeacon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListBeacon() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("List Beacons");
		try {
	        String data = "refresh_token=1/q-BzRTo3NFiZWmIO7_ZkBpbb0uFp-kWZW_mgjbcU-es"
	                + "&client_id=337655747815-2l4ghd53davhqfvtehhdpo6dmj46eop9.apps.googleusercontent.com"
	                + "&client_secret=7L7NFlGsWrBpdDGuD7_WaVAQ"
	                + "&grant_type=refresh_token";
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpPost(urlstr,data);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("ListBeacon google Response === "+googleReponse.getAccess_token());
			StringBuffer beaconJSON = sendGet(googleReponse.getAccess_token());
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(beaconJSON.toString());
			System.out.println("object-----************ "+obj);
			response.getWriter().write(obj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("leaving ListBeacon doGet");
	}
	
	public String httpPost(String urlstr, String data) throws IOException
	{
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
		System.out.println(builder.toString());
		return builder.toString();
	}
	
	// HTTP GET request
	private StringBuffer sendGet(String token) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/beacons?q=status:active";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		//print result
		String strbeaconList = response.toString();
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		BeaconList beaconList=gson.fromJson(strbeaconList, BeaconList.class);
		System.out.println("beaconList==="+beaconList.getBeacons());
		return response;
	}
}