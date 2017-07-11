<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Beacons | MainGoesBig</title>
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
<!-- DataTables -->
<link rel="stylesheet" type="text/css" href="plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" type="text/css" href="dist/css/skins/_all-skins.min.css">
<link rel="stylesheet" type="text/css" href="plugins/select2/select2.min.css">
<style>
	td img { width: 95%; }
  	.copyright { position:absolute; bottom:0.1px; color:#fff; text-align:center; font-size:85%; }
  	.avatar { width: 40px; height: 40px; position: relative; margin-top: -13px; margin-bottom: -11px; margin-right: 10px;}
    .img-circle {border-radius:50%; width: 60px; height: 60px;}
    .pic {border-radius:50%; width: 50px; height: 50px;}
    #locationField, #controls { position: relative; }
    .controls { background-color: #fff; border-radius: 2px; border: 1px solid transparent; width: 400px; 
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3); box-sizing: border-box; font-family: Roboto; font-size: 15px; font-weight: 300;
        height: 29px; margin-left: 17px; margin-top: 10px; outline: none; padding: 0 11px 0 13px; text-overflow: ellipsis; }
    .controls:focus { border-color: #4d90fe; }
    .title { font-weight: bold; }
    #infowindow-content { display: inline; }
	#map1 {height: calc(100vh - 150px); min-height: 100%;overflow-x: auto;overflow-y: auto;cursor:pointer;}
    .search { height: calc(100vh - 150px); min-height: auto; overflow: auto; margin-left:-20px;width:370px}
    .searchbox{float:left; border-radius:0px; margin-top:0px;margin-left:0px;margin-bottom:-15px; width:265px;border-color:white; margin-top: -2px;}
	.pluscustom{float:right;border: 0;background: none;padding-top: 8px;padding-bottom: 8px;padding-left:25px;}
	@media (min-width: 800px) { .col-sm-8 {width: 66.66666667%;}}
	#myTable tr{cursor:pointer;}
	#myTable {table-layout:fixed;}
	#myTable1 tr{cursor:pointer;}
	#myTable1 {table-layout:fixed;}
	.p0{padding: 0 !important;}
	.inputcustom{border:1px solid #ccc; padding:3px; margin-bottom:5px;}
	.mb14{margin-bottom:14px;}
	.searchlist { height: calc(100vh - 150px); min-height: auto; overflow: auto; }
	.addbutton { padding-top: 3px; padding-left:15px; padding-right: 20px; height: 25px; font-size: 12px; line-height: 1.5; 
			border-radius: 0px; border-left-color: white; margin-top:-2px; margin-left:8px; padding-bottom:7px}
	.text-center {text-align:center;}
	.pac-container { background-color: #ffe; z-index: 1040 !important; position: fixed; display: inline-block; float: left; }
	.modal{ z-index: 20; margin-top:50px;}
	.modal-backdrop{ z-index: 10; }
	.col-sm-12{width:100%;}
</style>
<!-- favicon icon -->
<!-- <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
<link rel="icon" href="dist/img/r1.jpg" type="image" sizes="16x16">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="BeaconSuccess.jsp" class="logo">
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
        <li class="active"> Beacons</li>
      </ol>
    </section> -->
      <!-- Navbar Right Menu -->
<%--       <div class="">
      <span>${error}</span></div> --%>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li><img src="dist/img/defaultuser.png" title="${name}" alt="${name}" class="pic"></li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
          		aria-haspopup="true" aria-expanded="false"> ${name} <span class="caret"></span></a>
          <ul class="dropdown-menu">
          	<li class="user-header"> <p style="text-align:center;"> ${name} <small></small> </p> </li>
             <span class="glyphicon glyphicon-user" style="margin-left: 14px; color: #29AF8E;"></span>
            <li><a href="profile" style="margin-left: 13px; margin-top: -24px;">Profile</a></li>
                      <li role="separator" class="divider"></li>
             <span class="glyphicon glyphicon-edit" style="margin-left: 14px; color: #29AF8E;"></span>
            <li><a href="changepassword" style="margin-left: 13px; margin-top: -24px;">  Change Password</a>
              <li role="separator" class="divider"></li>
           <span class="fa fa-sign-out" style="margin-left: 14px; color: #29AF8E;"></span>
            <li><a href="logout" style="margin-left: 13px; margin-top: -24px;">Sign out</a>
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
        	<img src="dist/img/defaultuser.png" title="${name}" alt="${name}" class="pic">
        </div> 
        <div class="pull-left info"> <p>${name}</p> </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
<!--        <li class="treeview"> <a href="index"> <i class="fa fa-dashboard"></i> <span>Location</span> </a> </li> -->
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
            	<li><a href="googleapi.jsp"><i class="fa fa-circle-o"></i> Google API</a></li>
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
	 <div class="content-wrapper" style="min-height:598px;">
  	<section class="content" style="height:300px;padding-right:5px;margin-left:-5px;padding-left:2%;">
        <div id="detail" class="modal fade" role="dialog" tabindex='-1'>
        	<div class="modal-dialog"> 
              <form method="post" action="updateBeacon" id="updateBeacon">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#device" data-toggle="tab" style="cursor:pointer">Details</a></li>
                    <li class=""><a data-target="#properties" data-toggle="tab" style="cursor:pointer">Properties</a></li>
                    <li class="">
                    	<input class="form-control" type="hidden" name="attachli" id="attachli" value="">
                    	<a onclick="attachment()" data-target="#attachments" data-toggle="modal" style="cursor:pointer">Attachments</a>
                    </li>
                    <button onclick="deleteBeacon()" type="button" class="btn btn-primary" style="float:right;">Delete</button>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
<!--                       <div class="text-center">
                      	<img src="dist/img/Beacon.jpg" class="beaconimg" width="15%" >
                      	</div> -->
                      	<div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Beacon Name :</label>
                          <div class="col-sm-12">
                          <input class="form-control" type="text" name="bn" id="bn" value="" autofocus readonly>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Advertised Id :</label>
                          <div class="col-sm-12" style="margin-bottom:10px;">
							<input class="form-control" name="atype" id="atype" type="text" value="" readonly>
                          </div><br><br>
                          <div class="col-sm-12">
                          <input class="form-control" name="aid" id="aid" type="text" value="" readonly>
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Status :</label>
                          <div class="col-sm-12">
                          <input class="form-control" type="text" name="stats" id="stats" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          	<label for="name" class="col-sm-12">Address :</label>
                          	<div class="col-sm-12">
                          		<input class="form-control" name="placid" id="placid" type="hidden" value="" readonly>
                          		<input class="form-control" name="lati" id="lati" type="hidden" value="">
                          		<input class="form-control" name="longi"id="longi" type="hidden" value="">
                          		<input class="form-control col-sm-12" name="beaconaddress" id="beaconaddress" 
                          			type="text" value="" onFocus="geolocate()">
                          		<input class="form-control" name="placeid1" id="placeid1" type="hidden" value="" required>
                          	</div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Expected Stability :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="stabily" id="stabily" type="text" value="" >
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Description :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="descrip" id="descrip" type="text" value="" >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="tab-pane" id="properties">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Properties :</label>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          	<input class="form-control" name="pos" id="pos" placeholder="Enter Position" type="text" value="" >
                          </div>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          	<input class="form-control" name="pname" id="pname" placeholder="Enter Property Name" type="text" value="" >
                          </div>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          	<input class="form-control" name="pplace" id="pplace" placeholder="Enter Property Value" type="text" value="" >
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save Changes</button>
              	</div>
              </div>
              </form>
            </div>
          </div>
        <div id="attachments" class="modal fade" role="dialog" tabindex='-1'>
        	<div class="modal-dialog"> 
              <form method="post" action="" id="addAttachments">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#listattach" data-toggle="tab" style="cursor:pointer">List Attachments</a></li>
                    <li class=""><a data-target="#attach" data-toggle="tab" style="cursor:pointer">Add Attachments</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane" id="attach">
                      <div class="panel-body clearfix">
                        <div id="iterateattach" class="form-group clearfix">
                          <div class="col-sm-12">
                          	<input class="form-control" name="aname" id="aname" type="hidden" value="">
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="atitle" id="atitle" type="text" placeholder="Enter Title" value="" autofocus required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="aurl" id="aurl" type="text" placeholder="Enter URL" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="sdate" id="sdate" data-date-inline-picker="true" type="date" placeholder="Enter Start Date" value="">
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="edate" id="edate" data-date-inline-picker="true" type="date" placeholder="Enter End Date" value="">
                          </div>
<!--                           <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="stime" id="stime" type="text" placeholder="Enter Start Time" value="" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom: 10px;">
                          	<input class="form-control" name="etime" id="etime" type="text" placeholder="Enter End Time" value="" required>
                          </div> -->
                        </div>
<!--                         <button type="button" id="addFields" class="btn btn-primary" style="float:right;">Add Fields</button> -->
                      </div>
                    </div>
                    <div class="tab-pane" id="listattach">
                      <div class="panel-body clearfix">
                        <div id="iterateattach1" class="form-group clearfix">
<!--                           <div class="col-sm-12">
                          	<input class="form-control" name="aname" id="aname" type="text" value="" readonly>
                          </div>
                          <div class="col-sm-12">
                          	<input class="form-control" name="atitle" id="atitle" type="text" value="" autofocus required>
                          </div>
                          <div class="col-sm-12">
                          	<input class="form-control" name="aurl" id="aurl" type="text" value="" required>
                          </div><br> -->
                          <div class="" style="width:100%" >
                          <table id="myTable1" class="table table-bordered table-striped">
						<tbody style="font-size: 15px; overflow-x: hidden;" id="beacondetail1"> </tbody>
					</table></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" onclick="addAttachments()">Save Changes</button>
              	</div>
              </div>
              </form>
            </div>
          </div>   
		<div id="add" class="modal fade" role="dialog" tabindex='-1'>
            <div class="modal-dialog"> 
              <!-- Modal content-->
              <form method="post" action="addBeacon" id="addbeacon">
              <div class="modal-content">
                <div class="modal-body">
                  <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a data-target="#add" data-toggle="tab" style="cursor:pointer">Add Details</a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="device">
                      <div class="panel-body clearfix">
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Advertised Id :</label>
                          <div class="col-sm-12" style="margin-bottom:10px;">
								<select id="aidtype" name="aidtype" form="addbeacon" class="form-control" autofocus required>
									<option value="">---Select Type---</option>
									<option value="EDDYSTONE">EDDYSTONE</option>
									<option value="iBEACON">iBEACON</option>
									<option value="ALTBEACON">ALTBEACON</option>
									<option value="EDDYSTONE-EID">EDDYSTONE-EID</option>
								</select>
                          </div><br><br>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          <input class="form-control" name="uuid" id="uuid" placeholder="Enter UUID" type="text" required>
                          </div>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          <input class="form-control numeric" name="major" id="major" placeholder="Enter Major" type="number" required>
                          </div>
                          <div class="col-sm-12">
                          <input class="form-control numeric" name="minor" id="minor" placeholder="Enter Minor" type="number" required>
                          </div>
                        </div>
                        <div class="form-group clearfix" >
                          <label for="name" class="col-sm-12">Address :</label>
                          <div class="col-sm-12" id="locationField">
                          <input class="form-control col-sm-12" type="text" name="address" id="address" value="" 
                          			placeholder="Enter beacon address" onFocus="geolocate()" required>
                          <input class="form-control" name="placeid" id="placeid" type="hidden" value="" required>
                          <input class="form-control" name="addi" id="addi" type="hidden" value="" required>
                          </div>
                        </div>
                         <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Co-ordinates :</label>
                          <div class="col-sm-12" style="margin-bottom:10px;">
                          <input class="form-control" name="latitude" id="latitude" placeholder="Enter Latitude" type="text" readonly required>
                          </div>
                          <div class="col-sm-12">
                          <input class="form-control" name="longitude"id="longitude" placeholder="Enter Longitude" type="text" readonly required>
                          </div>
                        </div>
                        <div class="form-group clearfix">
                          <label for="name" class="col-sm-12">Description :</label>
                          <div class="col-sm-12">
                          	<input class="form-control" name="description"id="description" placeholder="Enter Description" type="text" required>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
              	</div>
              </div>
              </form>
            </div>
          </div>
          <div class="col-sm-12"style="height:190%;padding-right:2px;padding-left:10px">
          	<div class="col-sm-4 pl panel searchlist" id="hidecol" style="width:25%;padding:1%;margin-left:-15px;height:105%">
				<div style="display: inline-flex; width: 100%; margin-top:10px; margin-bottom:10px;" class="">
					<input class="searchbox search form-control mb20 mt10" type="text" value="" onkeyUp="myFunction()"
							placeholder="Search by Name" id="myInput" autofocus style="border-color: #29AF8E; 
							border-radius: 0px; background-color: white; margin-left:0px; height:25px;width:70%">
					<button data-target="#add" data-toggle="modal" type="button" class="btn btn-primary btn-sm  addbutton"
							style="border-radius: 0px; margin-bottom: 1; padding-bottom: 7px; border-left:0px;
							padding-top: 4px; padding-left: 0px; padding-right: 0px; width:30%;
							border-left-color: white; color: white; ">
						<span class="glyphicon glyphicon-plus-sign">  Add  </span>
					</button>
				</div>
				<div class="" style="width:100%" >
					<table id="myTable" class="table table-bordered table-striped">
						<tbody style="font-size: 12px; overflow-x: hidden;" id="beacondetail"> </tbody>
					</table></div>
				</div>
			<div class="col-sm-8 pr" style="width:75%;padding-left:5px;height:105%">
				<div id="map1"></div>
			</div>
	</div>
</section>
<!-- <section class="content"> </section>  -->
</div>
	<!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->
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
<script type="text/javascript" src="plugins/select2/select2.full.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var gbn = '';
	var error = "<%=(String)request.getParameter("error")%>";
	console.log(error);
	if (error != "null") {
	    alert(error);
	    error = "null";
	    if (window.parent.location.href.match(/error=/)){
	        if (typeof (history.pushState) != "undefined") {
	            var obj = { Title: document.title, Url: window.parent.location.pathname };
	            history.pushState(obj, obj.Title, obj.Url);
	        } else {
	            window.parent.location = window.parent.location.pathname;
	        }
	    }
	}
	var settings = {
		  "async": true,
		  "crossDomain": true,
     	  "url": "http://45.114.79.187/maingoesbig/beaconSuccess",
// 		  "url": "http://localhost:8080/maingoesbig/beaconSuccess", 
 		  "cache": false,
		  "method": "GET",
		  "headers": {
		    "cache-control": "no-cache",
		    "postman-token": "bebf12a5-6901-8b78-2b26-1cec2d6e7aa7"
		  }
		}
		$.ajax(settings).done(function (response) {
			console.log("1 "+response);
			var addy="";
		   var content = "";
			var x=0;
			var bc = JSON.parse(response.toString());
			console.log(bc);
		 	$.each(bc.beacons[x], function(i, item) {
		 	   if(x==bc.totalCount) {return false;}
		 	  console.log(x);
		 	  console.log(bc.beacons[x]);
			   	var bn = bc.beacons[x].beaconName;
//			   	attachment(bn);
			   	var at = bc.beacons[x].advertisedId.type;
			   	var ai = bc.beacons[x].advertisedId.id;
			   	var s = bc.beacons[x].status;
			   	var p = bc.beacons[x].placeId;
			   	var llt = bc.beacons[x].latLng.latitude;
			    var llg = bc.beacons[x].latLng.longitude;
			    
			    var settings1 = {
	 					"async": false,
	 					"crossDomain": true,
	 					"url": "https://maps.googleapis.com/maps/api/geocode/json?latlng="+llt+"%2C"+llg+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8",
	 					"method": "GET",
	 					"cache":false,
	 					"headers": { }
					}
					$.ajax(settings1).done(function (response) {
	 					console.log(response);
	 					addy=response.results[0].formatted_address;
					});
				var iln = bc.beacons[x].indoorLevel.name;
				var ex = bc.beacons[x].expectedStability;
				var des = bc.beacons[x].description;
				var pn = bc.beacons[x].properties.Name;
				var pp = bc.beacons[x].properties.Place;
				x++;
				console.log(bc.beacons[x]);
	content += "<tr data-target='#detail' data-toggle='modal' onclick='bd(\""+bn+"\")' onmouseover='myMap1(\"" + llt + "\",\"" + llg+ "\",\"" + p+ "\",\"" + des + "\");'>"

	 	 						+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + des.toUpperCase().bold() + ""
	 	 						+"<br>" + addy + "</td>"
			         			+"<td style='width:30%;padding-left:5px;vertical-align:middle;text-align:right;'><img src=dist/img/Beacon.jpg></td>"
							+"</tr>";
			   });
			$('#beacondetail').append(content);
			
	 	 });
	});
</script>
<script type="text/javascript">
var gbn = ''; 
function bd(bn) {
//	$.post("http://localhost:8080/maingoesbig/oneBeacon", { 
	$.post("http://45.114.79.187/maingoesbig/oneBeacon", {
			bn : bn
	},  function(response) {
		  console.log(response);
		  var bd = JSON.parse(response.toString());
		  console.log(bd);
		    gbn = bd.beaconName;
		  	$('#bn').val(bd.beaconName);
		  	$('#attachli').val(bd.beaconName);
			$('#atype').val(bd.advertisedId.type);
			$('#aid').val(bd.advertisedId.id);
			$('#stats').val(bd.status);
			$('#placid').val(bd.placeId);
			$('#lati').val(bd.latLng.latitude);
			$('#longi').val(bd.latLng.longitude);
			var addy = '';
			var settings1 = {
 					"async": false,
 					"crossDomain": true,
 					"url": "https://maps.googleapis.com/maps/api/geocode/json?latlng="+bd.latLng.latitude+"%2C"+bd.latLng.longitude+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8",
 					"method": "GET",
 					"cache":false,
 					"headers": { }
				}
				$.ajax(settings1).done(function (response) {
 					console.log(response);
 					addy=response.results[0].formatted_address;
				});
		    $('#beaconaddress').val(addy);
		    console.log('addy = '+addy);
			$('#ilname').val(bd.indoorLevel.name);
			$('#stabily').val(bd.expectedStability);
			$('#descrip').val(bd.description);
			$('#pname').val(bd.properties.Name);
			$('#pplace').val(bd.properties.Place);
			$('#pos').val(bd.properties.position);
		});
}
//var adata = $('#adata').val();
console.log("gbn 0 = "+gbn);

//clear modal contents
$('#attachments').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
});
$('#add').on('hidden.bs.modal', function () {
    $(this).find("input,textarea,select").val('').end();
});

//allow numeric entry in input field
$('.numeric').keypress(function(e) {
	if(isNaN(this.value+""+String.fromCharCode(e.charCode))) return false;
    })
	.on("cut copy paste",function(e){
    	e.preventDefault();
   });
         
//Add Attachment to Google API
function addAttachments() {
//	$.post("http://localhost:8080/maingoesbig/addAttachments", { 
	$.post("http://45.114.79.187/maingoesbig/addAttachments", {
					gbn : gbn,
					atitle : $('#atitle').val(),
					aurl : $('#aurl').val(),
					sdate : $('#sdate').val(),
					edate : $('#edate').val()
//					stime : $('#stime').val(),
//					etime : $('#etime').val()
			},  function(response) {
				console.log("gbn addAttachments = "+gbn);  
				console.log(response);
			});
 	}
//delete Beacon code
function deleteBeacon() {
	
	var result = confirm("Want to delete?");
	if (result) {
// 			$.get("http://localhost:8080/maingoesbig/deleteBeacon", { 
			$.get("http://45.114.79.187/maingoesbig/deleteBeacon", {
					gbn : gbn
			},  function(response) {
				console.log("gbn deleteBeacon = "+gbn);  
				console.log(response);
				location.reload();
			});
		}
 	}
 	
//get Attachment List
function attachment() {
	$('#beacondetail1').html('');
// 			$.get("http://localhost:8080/maingoesbig/addAttachments", { 
			$.get("http://45.114.79.187/maingoesbig/addAttachments", {
					gbn : gbn
			},  function(response) {
					var content = '';
					console.log("response");  
					console.log(response);
				  	var bd = JSON.parse(response.toString());
				  	console.log(bd);
				  	console.log("gbn attachment = "+gbn);
				  	var content = '';
				  	var x=0;
			
					if(response!=="{}"){
						$.each(bd.attachments[x], function(i, item) {
							if(x === 'NaN') {
				 				return false;
				 			}
				 		console.log(bd.attachments[x]);
				 	 	if(bd.attachments[x] === undefined) {
				 		  return false;
			 		  	}
				 	 	console.log(x);
				 	  	console.log("i = "+i);
				 	  	console.log(bd.attachments[x]);
					  	console.log(bd.attachments[x].namespacedType);
					  	console.log(bd.attachments[x].data);
					  	var decodedString = atob(bd.attachments[x].data);
					  	console.log("decodedString=="+decodedString);
					  	console.log("json = "+decodedString.title);
						var len = 0;
						var startdate = '';
						var enddate = '';
					  	if (decodedString.charAt(0) === '{') { 
						  json = JSON.parse(decodedString); 
						  console.log("title = "+json.title);
						  console.log("url = "+json.url);
						  if (json.targeting !== undefined) {
							  var target = json.targeting;
						  		console.log("targeting = "+JSON.stringify(target));
						  		console.log("startdate:"+target[0].startdate);
						  		console.log("enddate:"+target[0].enddate);
						  		startdate = target[0].startdate;
						  		enddate = target[0].enddate;
					  		}
						  content += "<tr>"
								+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + bd.attachments[x].namespacedType.bold() + ""
								+"<br>" + json.title + ""
								+"<br>" + json.url + ""
								+"<br>" + startdate + ""
								+"<br>" + enddate + "</td>"
								+"<td><button onclick='deleteAttachment(\""+ bd.attachments[x].attachmentName  + "\")' type='button' class='btn btn-primary' style='float:right;'>"
								+"<span class='glyphicon glyphicon-trash'></span></button></td>"
							+"</tr>";
						}
					  else {
						  content += "<tr>"
								+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + bd.attachments[x].namespacedType.bold() + ""
								+"<br>"+decodedString+"</td>"
							+"</tr>";
				 		  }
					  x++		
	   });
			} else {
		     	var errormsg="No Attachments Found For This Beacon" 
				content += "<tr>"
					+"<td style='padding-left:10px;white-space:no-wrap;overflow:hidden;text-overflow:ellipsis;max-width:200px;'>" + errormsg.fontsize(5).fontcolor("green").bold() + "</td>"
				+"</tr>"; 
			}
		$('#beacondetail1').html(content);
			});
}

//deleteAttachment from Google
function deleteAttachment(attachmentName) {
	
//	$.post("http://localhost:8080/maingoesbig/deleteAttachment", {
	$.post("http://45.114.79.187/maingoesbig/deleteAttachment", { 
					attachmentName : attachmentName
			},  function(response) {
				  console.log(response);
				  alert("Attachment Deleted Successfully");
				  location.reload();
				});
	}
	
$('#addFields').click(function () {
    var zzz = "<br><br><div class='col-sm-12'> <input class='form-control' name='adata' id='adata' type='text' placeholder='Enter Title' value='' required> </div> <div class='col-sm-12'> <input class='form-control' name='aurl' id='aurl' type='text' placeholder='Enter Url' value='' required> </div>";
    $('#iterateattach').append(zzz);
});
</script>
<script type="text/javascript">
function myFunction() {
	// Declare variables 
	var input, filter, table, tr, td, i;
	input = document.getElementById("myInput");
	filter = input.value.toUpperCase();
	table = document.getElementById("myTable");
	tr = table.getElementsByTagName("tr");
	// Loop through all table rows, and hide those who don't match the search query
	for (i = 0; i < tr.length; i++) {
		td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	    	} else {
	        	tr[i].style.display = "none";
	    	}
		}
	}
 }
</script>
<script type="text/javascript">
var map;
  function myMap1(lat, lng, pid, des) {
	var lat = lat;
	var lng = lng;
	var pid = pid;
	var des = des;
	var myCenter = new google.maps.LatLng(lat,lng);
	var map = new google.maps.Map(document.getElementById('map1'), {
		center: myCenter,
		zoom: 15
	});
	var infowindow = new google.maps.InfoWindow();
	var service = new google.maps.places.PlacesService(map);
	service.getDetails({
		placeId: pid
	}, function(place, status) {
			if (status === google.maps.places.PlacesServiceStatus.OK) {
		    	var marker = new google.maps.Marker({
		    		map: map,
		        	position: place.geometry.location
		    	});
		    	google.maps.event.addListener(marker, 'mouseover', function() {
		    		infowindow.setContent('<div><strong>' + des + '</strong><br>' +
		    		place.formatted_address + '</div>');
		    		infowindow.open(map, this);
				});
			}
		});
	}
</script>
<!-- <script type="text/javascript" 
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwkCKOpcsfgI5z4eGIu8yHlm8T_ZM4hNQ&libraries=places&callback=myMap"
		async defer></script> -->
<script type="text/javascript">
 function myMap() {
	  var myCenter = new google.maps.LatLng(18.5643478,73.781288);
	  var mapCanvas = document.getElementById("map1");
	  var mapOptions = {center: myCenter, zoom: 10};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	  google.maps.event.addListener(marker,'click',function() {
	    map.setZoom(5);
	    map.setCenter(marker.getPosition());
	  });

        var input = document.getElementById('addi');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map); 
//        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({ map: map });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
         autocomplete.addListener('place_changed', function() {
          infowindow.close();
          var place = autocomplete.getPlace();
          if (!place.geometry) {
            return;
          }
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);
          }
          // Set the position of the marker using the place ID and location.
          marker.setPlace({
            placeId: place.place_id,
            location: place.geometry.location
          });
          marker.setVisible(true);
          var x = place.place_id;
          var y = place.formatted_address;
          console.log("x "+x);
		  console.log("y "+y); 
		  document.getElementById("pid").value = x;
		  document.getElementById("add").value = y;
		  infowindowContent.children['place-name'].textContent = place.name;
          infowindowContent.children['place-id'].textContent = x;
          infowindowContent.children['place-address'].textContent = x;
          infowindow.open(map, marker);
        });
         google.maps.event.addDomListener(window, "load", myMap);
      }
</script>
<script>
var autocomplete;
var llt, llg;
/* var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      }; */
function initAutocomplete() {
	var myCenter = new google.maps.LatLng(18.5643478,73.781288);
	  var mapCanvas = document.getElementById("map1");
	  var mapOptions = {center: myCenter, zoom: 10};
	  var map = new google.maps.Map(mapCanvas, mapOptions);
	  var marker = new google.maps.Marker({position:myCenter});
	  marker.setMap(map);
	  google.maps.event.addListener(marker,'click',function() {
	    map.setZoom(5);
	    map.setCenter(marker.getPosition());
	  });
	  
	var input = document.getElementById('address');
	var input1 = document.getElementById('beaconaddress');
	autocomplete = new google.maps.places.Autocomplete( (input), {types: ['geocode']});
	console.log(autocomplete);
	autocomplete.bindTo('bounds', map);
    autocomplete.addListener('place_changed', fillInAddress);
    
    autocomplete1 = new google.maps.places.Autocomplete( (input1), {types: ['geocode']});
	console.log(autocomplete1);
	autocomplete1.bindTo('bounds', map);
    autocomplete1.addListener('place_changed', fillInAddress1);
  }
  function fillInAddress() {
    var place = autocomplete.getPlace();
/*     for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
    } 
    for (var i = 0; i < place.address_components.length; i++) {
      var addressType = place.address_components[i].types[0];
      if (componentForm[addressType]) {
         var val = place.address_components[i][componentForm[addressType]];
         document.getElementById(addressType).value = val;
      }
    } */
      
    var x = place.place_id;
    var y = place.formatted_address;
	document.getElementById("placeid").value = x;
	document.getElementById("address").value = y;
	var a = y.replace(/,/g, "");
    console.log(a);
    var settings = {
    		  "async": true,
    		  "crossDomain": true,
    		  "url": "https://maps.googleapis.com/maps/api/geocode/json?address=%20"+a+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&sensor=true",
    		  "method": "GET",
    		  "Access-Control-Allow-Origin": "",
    		  "headers": {}
    		}
    		$.ajax(settings).done(function (response) {
	   		  console.log(response);
  			var ab = response.results;
  			var bc = ab[0];
  			var cd = bc.geometry;
  			var de = cd.location;
  			document.getElementById("latitude").value = de.lat;
  			document.getElementById("longitude").value = de.lng;
    		});
  }
  function fillInAddress1() {
	    var place = autocomplete.getPlace();
	    var x = place.place_id;
	    var y = place.formatted_address;
	    console.log("x = "+x);
	    console.log("y = "+y);
		document.getElementById("placeid1").value = x;
		document.getElementById("beaconaddress").value = y;
		var a = y.replace(/,/g, "");
	    console.log(a);
	    var settings = {
	    		  "async": true,
	    		  "crossDomain": true,
	    		  "url": "https://maps.googleapis.com/maps/api/geocode/json?address=%20"+a+"&key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&sensor=true",
	    		  "method": "GET",
	    		  "Access-Control-Allow-Origin": "",
	    		  "headers": {}
	    		}
	    		$.ajax(settings).done(function (response) {
		   		  console.log(response);
	  			var ab = response.results;
	  			var bc = ab[0];
	  			var cd = bc.geometry;
	  			var de = cd.location;
	  			document.getElementById("lati").value = de.lat;
	  			document.getElementById("longi").value = de.lng;
	    		});
	  }
  function geolocate() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
          var geolocation = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };
          var circle = new google.maps.Circle({
            center: geolocation,
            radius: position.coords.accuracy
          });
          autocomplete.setBounds(circle.getBounds());
        });
      }
    }
</script>
<script type="text/javascript" 
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDwDjx6u8i7YId716VD1FrtCvo6BdRQGg8&libraries=places&callback=initAutocomplete"
        async defer></script>
<script type="text/javascript">
	var init = function() {
	    var email = "<%= (String)session.getAttribute("email")%>";
	    if(email === "null") {
	    	window.location.href="login.jsp";
	    	var i=true;
	    } else if(i) {
	    	if (email != "null") {
	    	i=false;
	    	window.location.href="BeaconSuccess.jsp";
	    	}
	    }
	    init = true;
	};
	if(init) { init(); }
</script>
</body>
</html>