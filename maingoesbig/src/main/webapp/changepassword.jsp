<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Change Password | MainGoesBig</title>
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
  	td img { width: 100%; }
  	img {width: 50px; height: 50px;}
  	.img-circle {border-radius:50%; width: 60px; height: 60px;}
	.pic {border-radius:50%; width: 50px; height: 50px;}
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
        <li class="active"><i class="fa fa-television"></i> <span>Channels</span></li>
        <li class="active"> Google API</li>
      </ol>
    </section> -->
      <!-- Navbar Right Menu -->
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
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<h3 class="text-center text-uppercase mb20"></h3>
			<p>${msg}</p>
			<div class="row">
				<div class="col-sm-offset-3 col-sm-6">
					<!-- general form elements -->
					<div class="box box-primary panel-body">
						<!-- /.box-header -->
						<!-- form start -->
						<form role="form" method="post" action="changepassword">
							<h4 style="text-align: center;color: #29AF8E;">Change Password</h4>
							<div class="box-body">
							<p>${msg}</p>
								<div class="form-group  has-feedback clearfix">
									<label   for="inputPassword">Password:</label>
									<input  class="form-control" type="password" name="password" id="password1"
											placeholder="Enter Password"   required/>
									<span class="glyphicon glyphicon-lock form-control-feedback " style="color: #29AF8E;"></span>
											
								 </div>
					             <div class="form-group  has-feedback clearfix">
									<label  for="inputPassword">Confirm Password:</label>
										<input  class="form-control"type="password" name="password" id="password2"
												placeholder="Enter Re-enter Password" c required />
										<span class="glyphicon glyphicon-log-in form-control-feedback" style="color: #29AF8E"></span>
										<span id="message"></span>
								  </div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" class="btn btn-primary" style="float: right;" name="submit" id="submit">Submit</button>
							</div>
						</form>
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
<script>
	$(function() {
		$(".select2").select2();
		$("#othername").hide();
		$("#othercheckbox").hide();
	});
	$(function() {
		$("input[type=radio]").on('click', function(){
			if ($('#other').is(':checked')){
				$("#othername").slideDown("slow");
			} else { 
				$("#othername").slideUp("slow");
			}
		});
	});
	$(function() {
		$("input[type=checkbox]").on('click', function(){
			if ($('#othercheck').is(':checked')){
				$("#othercheckbox").slideDown("slow");
			} else { 
				$("#othercheckbox").slideUp("slow");
			}
		});
	});
</script>
<script type="text/javascript">	
		$('#password1, #password2').on('keyup', function () {
		    if ($('#password1').val() == $('#password2').val()) {
		        $('#message').html('Matching').css('color', 'green');
		        $("#submit").prop('disabled',false);
		    } else {
		        $('#message').html('Not Matching').css('color', 'red');
		    	$("#submit").prop('disabled', true);
		}
		});
</script>

</body>
</html>