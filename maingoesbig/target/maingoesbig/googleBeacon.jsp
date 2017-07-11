<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" name="viewport" 
	content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Beacon Profile | MainGoesBig</title>
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
        <div class="pull-left image">
        	<p>${name}</p>
        </div> 
        <div class="pull-left info">
          <p>${name}</p> <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
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
            	<li><a href="estimote.jsp"><i class="fa fa-circle-o"></i> Estimote</a></li>
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
      <h1> Beacons </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>Beacons</li>
      </ol>
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
                  <th><input type="checkbox" onClick="toggle(this)"/></th>
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
  <footer class="main-footer">
    Copyright &copy; 2017 <a href="http://www.maingoesbig.com"> MainGoesBig</a> All rights reserved.
  </footer>
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
			  "url": "http://45.114.79.187/maingoesbig/beaconSuccess",
			  "method": "GET",
			  "headers": {
			    "cache-control": "no-cache",
			    "postman-token": "d57f8b77-3232-0da8-fb17-7966407c71fb"
			  }
			}
 	 	 	$.ajax(settings).done(function (response) {
 	 		var data = JSON.parse(response);
 	 		var content = null;
			var img = JSON.parse(
		"{\"candy\":\"dist/img/beacon_blue.png\",\"lemon\":\"dist/img/lemon.png\",\"beetroot\":\"dist/img/beetroot.png\"}");
 	 	 		$.each(data, function(i, item) {
 				 var identifier = item.identifier;
 	 	 		 content += "<tr>"
 	 	 						+"<td><input type='checkbox' name='foo' /></td>"
 	 	 						+"<td><img src=" + img[item.color] + " /></td>"
 	 	 						+"<td><br>Identifier: &nbsp;" + item.identifier + ""
 	 	 						+"<br>Name: &nbsp;" + item.shadow.name + ""
			         			+"<br>Color: &nbsp;" + item.color + "</td>"
			         			+"<td>"
								+"<a class='btn btn-primary' onclick=openBeaconDetail(\""+identifier+"\");>View</a>"
								+"</td>"
							+"</tr>";
 	 	 		 });
			$('#beacondetail').append(content);
 	 	 		});
       });
</script>
<script type="text/javascript">
function openBeaconDetail(identifier){
	   window.location.href = "beaconDetail.jsp?identifier="+identifier;
  }
</script> 
<script type="text/javascript">
function toggle(source) {
	  checkboxes = document.getElementsByName('foo');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
</script>
</body>
</html>
