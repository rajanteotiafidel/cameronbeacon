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

public class UpdateBeacon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBeacon() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("Update Beacons ===================>>>>>>>>>>>>>> ");
		try {
	        String beaconName = request.getParameter("bn");
			String adtype = request.getParameter("atype");
			String adid = request.getParameter("aid");
			String status = request.getParameter("stats");
			String pid = request.getParameter("placid");
			String lat = request.getParameter("lati");
			String lng = request.getParameter("longi");
			String level = request.getParameter("ilname");
			String stability = request.getParameter("stabily");
			String desc = request.getParameter("descrip");
			String pname = request.getParameter("pname");
		    String pplace = request.getParameter("pplace");
		    String pos = request.getParameter("pos");
			
			AdvertisedId aid = new AdvertisedId();
			aid.setType(adtype);
			aid.setId(adid);
			
			LatLng ll = new LatLng();
			ll.setLatitude(Double.parseDouble(lat));
			ll.setLongitude(Double.parseDouble(lng));
			
			IndoorLevel il = new IndoorLevel();
			il.setName(level);
			
			Properties prop = new Properties();
			prop.setName(pname);
			prop.setPlace(pplace);
			prop.setPosition(pos);
			
			Beacon b = new Beacon();
			b.setBeaconName(beaconName);
			b.setAdvertisedId(aid);
			b.setStatus(status);
			b.setPlaceId(pid);
			b.setLatLng(ll);
			b.setIndoorLevel(il);
			b.setExpectedStability(stability);
			b.setDescription(desc);
			b.setProperties(prop);
			System.out.println("b*********--/////-------------- "+b);

			Gson ga = new Gson();
			String f = ga.toJson(b);
			System.out.println("JSON===========;:>>>>>>>>>> "+f);
			String data = "refresh_token=1/q-BzRTo3NFiZWmIO7_ZkBpbb0uFp-kWZW_mgjbcU-es"
	                + "&client_id=337655747815-2l4ghd53davhqfvtehhdpo6dmj46eop9.apps.googleusercontent.com"
	                + "&client_secret=7L7NFlGsWrBpdDGuD7_WaVAQ"
	                + "&grant_type=refresh_token";
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpPost(urlstr,data);
			System.out.println("httpresponse====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in Update beacon === "+googleReponse.getAccess_token());
			StringBuffer beaconJSON = sendPost(googleReponse.getAccess_token(), beaconName, f);
			System.out.println("beaconJSON ========--------->>>>>>>> "+beaconJSON );
			String msg ="";
			
			try {
				if (Integer.parseInt(beaconJSON.toString())>=400) {
					switch(Integer.parseInt(beaconJSON.toString())) {
						case 400:
							msg = "Invalid UUID or Major or Minor";
							System.out.println("msg = "+msg);
							break;
						case 404:
							msg = "Bad Request";
							System.out.println("msg = "+msg);
							break;
						default:
							msg = "Invalid Request";
							System.out.println("msg = "+msg);
					}	
				}
			} catch (NumberFormatException e) {
				System.out.println("NumberFormatException * ");
				msg = "Beacon Updated Successfully";
				e.printStackTrace();
			} catch(NullPointerException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect(request.getContextPath()+"/BeaconSuccess.jsp?error="+msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doPost of Update Beacons");
	}
	
	public String httpPost(String urlstr, String data) throws IOException {
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
	private StringBuffer sendPost(String token, String beaconName, String g) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/"+beaconName;
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("PUT");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		con.setRequestProperty("Content-Length", String.valueOf(g.length()));
		con.setRequestProperty("charset", "utf-8");
		con.setRequestProperty("cache", "false");
		con.setUseCaches( false );
	    con.setDefaultUseCaches( false );
		con.setDoOutput(true);
		con.setDoInput(true);
		
	    OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
	    writer.write(g);
	    writer.flush();
	    System.out.println("writer = "+writer);
	    writer.close();
	    
	    int responseCode = con.getResponseCode();
		System.out.println("\nSending 'PUT' request to URL : " + url);
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
		System.out.println("str Update beacon List------->>>>>> "+strbeaconList);
/*		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		BeaconList beaconList=gson.fromJson(strbeaconList, BeaconList.class);
		System.out.println("beaconList === "+beaconList.getTotalCount());
		List<Object> al = new ArrayList<Object>();
		al.add(beaconList.getBeacons());*/
		return response;
	}
}