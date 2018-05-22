<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/datatables/css/font-awesome.min.css" />
<link type="text/css" rel="stylesheet" target="_blank" media="screen" href="<%=request.getContextPath()%>/resource/datatables/css/popup.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/net/jquery.dataTables.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/net/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/net/dataTables.bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datatables/css/tableTools.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datatables/css/admin-style.css"></link>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/logout-popup-elements.css"></link> 
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<%-- <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" /> --%>



<!-- ---------------- JavaScript --------------------------------->

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script  src="<%=request.getContextPath()%>/resource/js/jquery.colorbox.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/net/jquery.dataTables.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/net/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/datatables/js/tableTools.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.carouFredSel-5.6.4-packed.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/admin.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/logout-popup.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
 
<script type="text/javascript" charset="utf-8">
	var pdProperty;
</script>
<style>
label.error{
	color: #FF0000;
	float: right;
}

</style>
<!-- ---------------- Fonts Link --------------------------------->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" type="text/css" />
<script>
var fade = 2000;
	$(document).ready(function(){
		
		$("#logouthrefId").click(function(){
			$.ajax({
				  url: contextPath+"/home/userLogout.htm",
			      type: "get",
			      dataType : "json",
			      success: function(response){
			    	 if(response.success == 'true' || response.success == true){
			    		 window.location.href = contextPath+"/j_spring_security_logout";
			    	 }
			      },
			      error:function(){
			         console.log('Some error is there.');
			      }
			  });
		});
		
	});
	
	var globalPropertyId;
	var globalSuperPMCId;
</script>
</head>

<body id="bodyId">
<div id="maskLoader" class="loader" ></div>
<header>
	<span style="position: absolute; top:60px; margin: 0 auto; height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0;
	 line-height: 35px; background:#66FF99 url('resource/images/ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center; display:none;" id="commonMessageSuccessId">Successfully Saved...</span>
	 <span id="commonMessageErrorId" style="display:none; position: absolute; top:60px; margin: 0 auto; min-height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 20px;
  		background:#FFD6D6 url('resource/images/not-ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center; text-align: left; padding: 7px 0 0 58px; " ></span>
  
  <div class="logo"><a href="${contextPath}/home.htm"><img src="${contextPath}/resource/images/logo22.png" width="205" height="22" /></a></div>
  <section class="login-sec"> 
          <div class="user-bt"><a id="logouthrefId" href="#">Logout</a></div>
          
        </section>
   <div class="username">${loginName}</div>
   <div class="login"><a href="#"></a></div>
  <div class="clear"></div>

  <section class="head">
    <h1 id="headingId" style="margin-top: 0px; margin-bottom: 5px;">Property</h1>
    <ul class="bread-crum">
<!--       <li><a href="#"><i class="icon-sm fa fa-dashboard"></i>Home</a></li>
      <li><a href="#" class="selected">Dashboard</a></li> -->
    </ul>
    <div class="clear"></div>
  </section>
  
  <div class="logoutWindowPopUp" id="logoutWindowId" onclick = "check(event)" style="margin-top: 7%;">
  <div class="popupContact1">
    <div class="formClass1">
      <img src="resource/images/cross-image.png" id="close" style="display: none;"/> 
      <div class="h21" style=" padding:23px 35px;">
        <h1 style="text-align:center; font:20; font-size: 22px;">Logout Window</h1>
      </div>
      <div class="pop-p1">
        <p>Your Session is going to expire in</p>
        <p id="timeLeftId"> next 15 minutes</p>
        <p>Do You want to continue or logout??</p>
      </div>
      <div class="h21" style="border-top:1px solid #CCC; border-radius:0 0 6px 6px; padding: 8px 18px 12px 18px">
        <button id="logoutBtnId" class="button-file1">Logout</button>
        <button id="continueBtnId" class="button-file1" style="margin-right:50px;">Continue</button>
      </div>
    </div>
  </div>
</div>
  
</header>
<aside>
  <nav>
    <ul id="menu">
      <!-- <li><a href="#"><i class="icon fa fa-dashboard"></i>Dashboard</a></li> -->
      <li> <a href="#property" id="property"><i class="icon fa fa-th"></i>Property </a>
      </li>
       <li> <a href="#proposedDevelopment" id="proposedDevelopment"><i class="icon fa fa-bar-chart-o"></i>Property Development</a>
      </li>
      <li> <a href="#landlord" id="landlord"><i class="icon fa fa-bar-chart-o"></i>Landlord </a>
      </li>
      <li> <a href="#contractor" id="contractor"><i class="icon fa fa-laptop"></i>Contractor </a>
      </li>
      <li> <a href="#users" id="users"><i class="icon fa fa-laptop"></i>Users </a>
      </li>
      <li> <a href="#pmc" id="pmc"><i class="icon fa fa-edit"></i>Property Management Company </a>
      </li>
      <li> <a href="#" id="allJobs"><i class="icon fa fa-edit"></i>All Jobs</a>
      </li>
      <li> <a href="#anonymous" id="anonymous"><i class="icon fa fa-edit"></i>Contacts </a>
      </li>
      <li> <a href="#profile" id="profile"><i class="icon fa fa-edit"></i>My Profile </a>
      </li>
      <li> <a href="#settings" id="settings"><i class="icon fa fa-edit"></i>Settings </a>
      </li>
       <li> <a href="#uploadFiles" id="uploadFiles"><i class="icon fa fa-edit"></i>Upload Files </a>
      </li>
      <!-- <li> <a href="#settings" id="settings" onclick="div_show('bodyId', 'logoutWindowId')"><i class="icon fa fa-edit"></i>Settings </a>
      </li> -->
    </ul>
  </nav>
</aside>
<div id="containerId">
	
</div>
 
<script>
$(document).ready(function(){
$.ajax({
	url:contextPath+"/admin/adminType.htm",
		method: "Post",
		dataType: "json",
		contentType: "application/json",														
	success:function(result){
		if(result.success==true){
			if(result.show==false){
				$("#users").css("display", "none");
				$("#settings").css("display", "none");
				//$("#pmc").css("display", "none");
			}
		} else{
			alert("failure");
		}
  }});
  
	$.ajax({
	    url: contextPath+"/admin/redirectProperty.htm",
	    type: "post",
	    success: function(data){
	  	  $("#containerId").html(data);
	    },
	    error:function(){
	        $("#containerId").html('There is error while submit');
	    }
	});
});
</script>
 <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>


