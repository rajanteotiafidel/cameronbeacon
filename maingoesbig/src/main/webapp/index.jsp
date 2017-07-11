<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" 
	content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Beacons | MainGoesBig</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" type="text/css" 
  	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" type="text/css" href="plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" type="text/css" href="css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
  <style>
  	td img { width: 100%; }
  	#map{height:500px; left-margin: 50px;}
  	.copyright { position:absolute; bottom:0.1px; color:#fff; text-align:center; font-size:85%; }
  	.avatar { width: 40px; height: 40px; position: relative; margin-top: -13px; margin-bottom: -11px; margin-right: 10px;}
    .img-circle {border-radius:50%; width: 60px; height: 60px;}
    img {width: 50px; height: 50px; border-radius: 50%;}
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="index" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><a href="BeaconSuccess.jsp" class="logo"></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg text-left">MainGoesBig</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
<!--       <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Beacons</li>
      </ol>
    </section> -->
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <%-- <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs">${name}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <p> ${name} <small></small> </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left"> <a href="profile" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right"> <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li> --%>
          <li><img src="http://placehold.it/100x100" title="${name}" alt="${name}" class="img-circle"></li>
          <li class="dropdown">
            
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          		aria-haspopup="true" aria-expanded="false"> ${name} <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<li class="user-header"> <p style="text-align:center;"> ${name} <small></small> </p> </li>
            <li><a href="profile">Profile</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="logout">Sign out</a></li>
          </ul>
        </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image"> 
        	<img src="http://placehold.it/100x100" title="${name}" alt="${name}" class="img-circle">
        </div> 
        <div class="pull-left info"> <p>${name}</p> </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
       <li class="treeview"> <a href="index"> <i class="fa fa-dashboard"></i> <span>Location</span> </a> </li>
       <li class="treeview"> <a href="BeaconSuccess.jsp"> <i class="fa fa-signal"></i> <span>Beacons</span> </a> </li>
<!--        <li class="treeview"> <a href="nearable.jsp"> <i class="fa fa-road"></i> <span>Nearables</span> </a> </li>
       <li class="treeview"> <a href="app.jsp"> <i class="fa fa-bolt"></i> <span>App</span> </a> </li>
       <li class="treeview"> <a href="location.jsp"> <i class="fa fa-location-arrow"></i> <span>Locations</span> </a> </li>
       <li class="treeview">
          <a href="">
            <i class="fa fa-map-o"></i> <span>Here & Now</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
          <ul class="treeview-menu">
            <li><a href="beacon.jsp"><i class="fa fa-circle-o"></i> Beacon</a></li>
            <li><a href="links.jsp"><i class="fa fa-circle-o"></i> Links</a></li>
          </ul>
          </a>
        </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-connectdevelop"></i> <span>Analytics</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           <ul class="treeview-menu">
            <li><a href="analytics.jsp"><i class="fa fa-circle-o"></i> Analytics</a></li>
            <li><a href="dwelltime.jsp"><i class="fa fa-circle-o"></i> Dwell Time</a></li>
            <li><a href="location.jsp"><i class="fa fa-circle-o"></i> Locations</a></li>
            <li><a href="loyalty.jsp"><i class="fa fa-circle-o"></i> Loyalty</a></li>
            <li><a href="tags.jsp"><i class="fa fa-circle-o"></i> Tags</a></li>
            <li><a href="univisitors.jsp"><i class="fa fa-circle-o"></i> Unique Visitors</a></li>
            <li><a href="visits.jsp"><i class="fa fa-circle-o"></i> Visits</a></li>
          </ul>
          </a>
        </li> -->
        <li class="treeview"> <a href="profile"> <i class="fa fa-signal"></i> <span>Profile</span> </a> </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-television"></i> <span>Channels</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           	<ul class="treeview-menu">
            	<li><a href="googleapi"><i class="fa fa-circle-o"></i> Google API</a></li>
            </ul>
          </a>
        </li>
        <li style="position:absolute; bottom:10px; color:#fff; text-align:center; font-size:85%;">
        	Copyright &copy; 2017 MainGoesBig <br>All rights reserved.
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <section class="content">
    <div class="container-fluid"> <a href="#edit" data-toggle="modal" class="btn btn-primary pull-right" >Add Beacon</a>
    <div id="edit" class="modal fade" role="dialog">
            <div class="modal-dialog"> 
              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#add" data-toggle="tab" style="cursor:pointer">Beacon Details</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">AdvertisedId:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="aidtype" placeholder="Enter Type" type="text">
                          </div><br><br>
                          <div class="col-sm-12">
                          <input class="form-control" id="aidid" placeholder="Enter ID" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Status:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="status" placeholder="Enter Status" type="text">
                          </div>
                        </div>
                      
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Place ID:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="placeid" placeholder="Enter Place ID" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Co-ordinates:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="latitude" placeholder="Enter Latitude" type="text">
                          </div>
                          <div class="col-sm-12">
                          <input class="form-control" id="longitude" placeholder="Enter Longitude" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Indoor Level:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="ilname" placeholder="Enter Indoor Level" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Expected Stability:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="expstab" placeholder="Enter Expected Stability" type="text">
                          </div>
                        </div><div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Description:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="desc" placeholder="Enter Description" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Properties:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="position" placeholder="Enter Position" type="text">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Save</button>
              </div>
              </div>
            </div>
          </div>
         </div>
    <div id="map"></div>
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th style="width:100px">Image</th>
                  <th>Description</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody id="beacondetail">
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 </div>
<!-- jQuery 2.2.3 -->
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script type="text/javascript" src="plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script type="text/javascript" src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript" src="dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script type="text/javascript" src="dist/js/demo.js"></script>
<!-- page script -->
<script type="text/javascript">
$(document).ready(function() {
	var settings = {
		  "async": true,
		  "crossDomain": true,
//		  "url": "http://45.114.79.187/MainGoesBig/beaconSuccess",
 		  "url": "http://localhost:8080/maingoesbig/beaconSuccess", 
		  "method": "GET",
		  "headers": {
		    "cache-control": "no-cache",
		    "postman-token": "bebf12a5-6901-8b78-2b26-1cec2d6e7aa7"
		  }
		}
		$.ajax(settings).done(function (response) {
		  var data = JSON.parse(response);
	 		var content = null;
		 	 		 content += "<tr>"
				 	 			+"<td><img src='dist/img/Beacon.jpg'></td>"
	 	 						+"<td>Beacon Name: &nbsp;" + data.beaconName + ""
	 							+"<br>ID: &nbsp;" + data.advertisedId.type + ""
			         			+"<br>Type: &nbsp;" + data.advertisedId.id + ""
			         			+"<br>Status: &nbsp;" + data.status + ""
			         			+"<br>Place Id: &nbsp;" + data.placeId + ""
			         			+"<br>Latitude: &nbsp;" + data.latLng.latitude + ""
			         			+"<br>Longitude: &nbsp;" + data.latLng.longitude + ""
			         			+"<br>Floor Name: &nbsp;" + data.indoorLevel.name + ""
			         			+"<br>Expected Stability: &nbsp;" + data.expectedStability + ""
			         			+"<br>Description: &nbsp;" + data.description + ""
			         			+"<br>Name: &nbsp;" + data.properties.Name + ""
			         			+"<br>Place: &nbsp;" + data.properties.Place + "</td>"
			         			+"<td>"
								+"<a class='btn btn-primary' disabled>View</a>"
								+"</td>"
							+"</tr>";
			$('#beacondetail').append(content);
	 	 		});
		});
</script>
<script type="text/javascript">
function toggle(source) {
	  checkboxes = document.getElementsByName('foo');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
</script>
<script>
function myMap() {
  var myCenter = new google.maps.LatLng(18.5643478,73.781288);
  var mapCanvas = document.getElementById("map");
  var mapOptions = {center: myCenter, zoom: 10};
  var map = new google.maps.Map(mapCanvas, mapOptions);
  var marker = new google.maps.Marker({position:myCenter});
  marker.setMap(map);
  google.maps.event.addListener(marker,'click',function() {
    map.setZoom(5);
    map.setCenter(marker.getPosition());
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&callback=myMap"></script>
<script type="text/javascript">
	var init = function() {
	    var email = "<%= (String)session.getAttribute("email")%>";
	    if(email === "null") {
	    	window.location.href="login.jsp";
	    	var i=true;
	    } else if(i) {
	    	if (email != "null") {
	    	i=false;
	    	window.location.href="index.jsp";
	    	}
	    }
	    init = true;
	};
	if(init) { init(); }
</script>
</body>
</html>
