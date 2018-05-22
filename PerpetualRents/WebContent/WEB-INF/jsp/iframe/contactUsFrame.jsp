<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css"/>
<style>
	label.error{
		color: #FF0000;
		float: none;
	}
</style>


<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />
</head>

<body>
<div class="clearfix"></div>

<c:import url="${wordPressUrl}/contact-us/" ></c:import>

<!-- ---------------- JavaScript ------------------------------------>

<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
var contextPath = getContextPath();
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>

<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>

<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
  
  $(document).ready(function(){
	  //var abc = ${requestScope.name};
	  			$('.close').click(function () {
		  	    $('#alertSuccessId').hide(200);
		  	    $('#alertErrorId').hide(200);
		    }); 
		  	
	  			$( "#submitLead" ).click(function() {
	  			   var formData = form2object('registerLead', '.', true,
	  			  			function(node)
	  			  			{
	  			  				if (node.id && node.id.match(/callbackTest/))
	  			  				{
	  			  					return { name: node.id, value: node.innerHTML };
	  			  				}
	  			  			});
	  			  	var jObj = JSON.stringify(formData, null, '\t');
	  			  	if($("#registerLead").valid() == true){
	  			  	$.ajax({
	  			  		url:contextPath+"/register/registerLead.htm",
	  			  		data: jObj,
	  			  		method: "Post",
	  			  		dataType: "json",
	  			  		contentType: "application/json",															
	  			  		success:function(result){
	  			  			if(result.success==true){
	  			  				$("#registerLead")[0].reset();
	  			  				$("#commonMessageSuccessId").html("ThankYou! Soon we will get back to you.");
	  							$("#commonMessageSuccessId").fadeIn();
	  							setTimeout(function(){
	  								$("#commonMessageSuccessId").fadeOut(4000);
	  							}, 1000);
	  			  			}
	  				    	  else{
	  								$("#commonMessageErrorId").html("Error while creation");
	  								$("#commonMessageErrorId").fadeIn();
	  								setTimeout(function(){
	  									$("#commonMessageErrorId").fadeOut(4000);
	  								}, 1000);
	  							}
	  			  	  }});
	  			  	}
	  			  	});
	  			  
	  			$(function() {
	  			    $("#registerLead").validate({
	  			    	rules: {
	  			        	"name": "required",
	  			        	"message" : {
	  			                required: true,
	  			                maxlength : 500
	  			        	},
	  			        	"address" : "required",
	  			        	"email"  : {
	  			        		required: true,
	  			                email: true
	  			        	},
	  			        	"contactNumber" : {
	  			                required: true,
	  			                minlength : 10,
	  			                maxlength : 15
	  			        	},
	  			        } ,
	  			    });
	  			  });
 }); 
  
</script>
</body>
</html>