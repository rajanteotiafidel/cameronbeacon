<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Google API</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
<!--       <section class="content-header">
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><i class="fa fa-television"></i> <span>Channels</span></li>
        <li class="active"> Google API</li>
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
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
          		aria-expanded="false"> ${name} <span class="caret"></span></a>
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
        	<img src="dist/img/userpic.jpg" title="${name}" alt="${name}" class="img-circle">
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
    <!-- Main content -->
    <section class="content">
    <!-- Default box -->
    <div class="login-box">
    <div class="text-center">
   		 <img src="dist/img/google.png" width="100px" />
    </div>
  <h3 class="text-center text-uppercase mb20 mt0">Google Account</h3>
  <!-- /.login-logo -->
  <h1 class="text-center text-uppercase mb20 mt0">Google API Hit Successfully</h1>
  <!-- /.login-box-body -->
</div>
    <!-- /.box-body --> 
	</section>    
    <!-- /.box-footer--> 
  </div>
  <!-- /.content --> 
<!-- Control Sidebar -->
</div>
<!-- /.content-wrapper -->
<!-- ./wrapper --> 
<!-- jQuery 2.2.3 --> 
<script type="text/javascript" src="plugins/jQuery/jquery-2.2.3.min.js"></script> 
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
<%-- <script type="text/javascript">
	var init = function() {
	    var email = "<%= (String)session.getAttribute("projectId")%>";
	    if(email === "null") {
	    	window.location.href="googleapi.jsp";
	    	var i=true;
	    } else if(i) {
	    	if (email != "null") {
	    	i=false;
	    	window.location.href="googleapisuccess.jsp";
	    	}
	    }
	    init = true;
	};
	if(init) { init(); }
</script> --%>
</body>
</html>
