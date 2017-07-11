<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Beacons Details</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" type="text/css" 
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
<style>
  	td img { width: 45%; }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="index" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">MGB</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg text-left">MainGoesBig</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
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
        <div class="pull-left image"> <p>${name}</p> </div> 
        <div class="pull-left info"> <p>${name}</p> <a href="#"><i class="fa fa-circle text-success"></i> Online</a> </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
       <li class="treeview"> <a href="index"> <i class="fa fa-dashboard"></i> <span>Dashboard</span> </a> </li>
       <li class="treeview"> <a href="BeaconSuccess.jsp"> <i class="fa fa-signal"></i> <span>Beacons</span> </a> </li>
       <li class="treeview"> <a href="nearable.jsp"> <i class="fa fa-road"></i> <span>Nearables</span> </a> </li>
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
        </li>
        <li class="treeview"> <a href="profile"> <i class="fa fa-signal"></i> <span>Profile</span> </a> </li>
        <li class="treeview">
          <a href="">
            <i class="fa fa-television"></i> <span>Channels</span>
            <span class="pull-right-container"> <i class="fa fa-angle-left pull-right"></i> </span>
           	<ul class="treeview-menu">
            	<li><a href="googleapi.jsp"><i class="fa fa-circle-o"></i> Google API</a></li>
            </ul>
          </a>
        </li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>  
<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper"> 
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1> iBeacon Detail </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="BeaconSuccess.jsp"><i class="fa fa-signal"></i> Beacons</a></li>
        <li class="active">Beacon Details</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
    <!-- Default box -->
    <div class="box">
      <div class="box-body">
        <div class="container-fluid"> <a href="#edit" data-toggle="modal" class="btn btn-primary pull-right" >Edit Settings</a> 
          <!-- Modal -->
          <div id="edit" class="modal fade" role="dialog">
            <div class="modal-dialog"> 
              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#device" data-toggle="tab" style="cursor:pointer">Device</a></li>
                    <li class=""><a data-target="#beacon" data-toggle="tab" style="cursor:pointer">iBeacon</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Name:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter name" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Geo Location:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Geo Location" type="text">
                          </div>
                        </div>
                      
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Tags:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Tags" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Basic Battery Saving:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Super Battery Saving:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="beacon">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Proximity UUID:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Proximity UUID" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Major:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter Major" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">minor:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="exampleInputEmail1" placeholder="Enter minor" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Secure UUID:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Custom Advertising Interval:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>Yes</option>
                            <option>No</option>
                          </select>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="Interval" class="col-sm-12">Interval:</label>
                          <div class="col-sm-12">
                          <input class="form-control" id="Interval" placeholder="Enter Interval" type="text">
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Broadcasting Power:</label>
                          <div class="col-sm-12">
                          <select class="form-control">
                            <option>-30</option>
                            <option>-20</option>
                            <option>-16</option>
                            <option>-12</option>
                            <option>-8</option>
                            <option>-4</option>
                            <option>0</option>
                            <option>4</option>
                          </select>
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
        <div style="width: 100%; text-align: center; margin: 30px auto;">  </div>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
         <img src="dist/img/beacon_blue.png" class="beaconimg" width="100">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Identifier</p>
              <p class="">Name</p>
              <p class="">Color</p>
              <p class="">Geo Location</p>
              <p class="">Indoor Location</p>
              <p class="">Tags</p>
              <p class="">Mesh Group</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="identifier"></p>
              <p id="name"></p>
              <p id="color"></p>
              <p id="geol"></p>
              <p id="inlocation"></p>
              <p id="tags"></p>
              <p id="mesh"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Smart Battery Saving</p>
              <p class="">Motion Detection</p>
              <p class="">Motion Only Broadcasting</p>
              <p class="">Motion Only Broadcasting Delay</p>
              <p class="">Flip To Sleep</p>
              <p class="">Eddystone Configuration Service</p>
              <p class="">Automatic Firmware Update</p>
              <p class="">Dark To Sleep</p>
              <p class="">Firmware Version</p>
              <p class="">Hardware Version</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="SmartBattery"></p>
              <p id="MotionDetection"></p>
              <p id="MotionBroadcasting"></p>
              <p id="MotionBroadDelay"></p>
              <p id="FlipSleep"></p>
              <p id="EddystoneConfig"></p>
              <p id="AutomaticFirm"></p>
              <p id="DarkSleep"></p>
              <p id="FirmwareVer"></p>
              <p id="HardwareVer"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2>Beacon Health Check</h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Battery Monitoring</p>
              <p class="">Remaining Battery Life</p>
            </div>
            <div class="col-sm-6 text-right rowbeacon pl">
              <p id="btrymonitrng"></p>
              <p id="btrylyf"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Beacon Fall Alert</p>
              <p class="">Beacon Missing Alert</p>
            </div>
            <div class="col-sm-6 text-right rowbeacon pl">
              <p id="fallalrt"></p>
              <p id="missingAlrt"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2>Broadcast Packets</h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
          <h3>Connection</h3>
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Broadcasting Power</p>
              <p class="">Advertising Interval</p>
              <p class="">Shake to Connect</p>
            </div>
            <div class="col-sm-6 pl text-right rowbeacon">
              <p id="power"></p>
              <p id="advertinterval"></p>
              <p id="shaketoconn"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2 id="ibeacon"></h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Proximity UUID</p>
              <p class="">Major</p>
              <p class="">Minor</p>
              <p class="">Security UUID</p>
            </div>
            <div class="col-sm-6 pl rowbeacon text-right">
              <p id="prouuid" style="font-size: 12px;padding-bottom: 13px;"></p>
              <p id="major"></p>
              <p id="minor"></p>
              <p id="secureuuid"></p>
            </div>
          </div>
          <div class="col-sm-6">
            <div class="col-sm-6 pr rowbeacon">
              <p class="">Broadcasting Power</p>
              <p class="">Maximum Range</p>
              <p class="">Advertising Interval</p>
            </div>
            <div class="col-sm-6 pl rowbeacon text-right">
              <p id="brodpower"></p>
              <p id="maxrange"></p>
              <p id="advertintibeacon"></p>
            </div>
          </div>
        </div>
      </div>
      <div class="container-fluid panel-body">
        <h2 id="telemetry"></h2>
        <div class="col-sm-12 clearfix">
          <div class="col-sm-6 pull-right">
            <div class="col-sm-6 rowbeacon pr">
              <p class="">Broadcasting Power</p>
              <p class="">Maximum Range</p>
              <p class="">Advertising Interval</p>
            </div>
            <div class="col-sm-6 rowbeacon pl text-right">
              <p id="brodpowerTelemetry"></p>
              <p id="maxrangeTelemetry"></p>
              <p id="advertintTelemetry"></p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- /.box-body --> 
    </section>
    <!-- /.box-footer--> 
  </div>
  <!-- /.content --> 
  <footer class="main-footer">
   Copyright &copy; 2017 <a href="http://www.maingoesbig.com">MainGoesBig</a> All rights reserved.
  </footer>
<!-- Control Sidebar -->
</div>
<!-- /.content-wrapper -->
<!-- ./wrapper --> 
<!-- jQuery 2.2.3 --> 
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<script>
$(document).ready(function() {
	var name ="<%=request.getParameter("identifier") %>";
	var settings = {
			  "async": true,
			  "crossDomain": true,
			  "url": "http://45.114.79.187/beacons/beaconDetail",
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "d57f8b77-3232-0da8-fb17-7966407c71fb"
			  }
			}
	$.get(
            "beaconDetail", 
            {identifier: "<%=request.getParameter("identifier")%>"},
            function(response) {
            	var myObj = JSON.parse(response);
            	$('#beaconName').append(myObj.beaconName);
        		$('#type').append(myObj.advertisedId.type);
        		$('#id').append(myObj.advertisedId.id);
        		$('#status').append(myObj.status);
        		$('#placeId').append(myObj.placeId);
        		$('#latitude').append(myObj.latLng.latitude);
        		$('#longitude').append(myObj.latLng.longitude);
        		$('#name').append(myObj.indoorLevel.name);
        		$('#expectedStability').append(myObj.expectedStability);
        		$('#description').append(myObj.description);
        		$('#Name').append(myObj.properties.Name);
        		$('#Place').append(myObj.properties.Place);
            });			
});
</script>
<!-- Bootstrap 3.3.6 --> 
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 
<!-- SlimScroll --> 
<script type="text/javascript" src="plugins/slimScroll/jquery.slimscroll.min.js"></script> 
<!-- FastClick --> 
<script type="text/javascript" src="plugins/fastclick/fastclick.js"></script> 
<!-- AdminLTE App --> 
<script type="text/javascript" src="dist/js/app.min.js"></script> 
<!-- AdminLTE for demo purposes --> 
<script type="text/javascript" src="dist/js/demo.js"></script>
</body>
</html>
