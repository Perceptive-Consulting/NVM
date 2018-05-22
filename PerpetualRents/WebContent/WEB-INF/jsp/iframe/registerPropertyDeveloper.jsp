<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="SKYPE_TOOLBAR" content="SKYPE_TOOLBAR_PARSER_COMPATIBLE" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link href="<%=request.getContextPath()%>/resource/css/sumoselect.css" rel="stylesheet" />
<style>
	label.error{
		color: #FF0000;
		float: right;
	}
</style>

<!--================== Fonts Calling Section =====-->

<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>

<body>
<c:import url="${wordPressUrl}/sub-header" ></c:import>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container" id="containerId">
   	<div class="row">
      <div class="span10">
      <span id="commonMessageErrorId" style="display: none; position: absolute; top:50%; margin: 0 auto; min-height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 20px;
  		background: url('${contextPath}/resource/images/not-ok-icon.png') no-repeat scroll 25px 10px / 25px 25px #FFD6D6; z-index:99999; text-align: left; padding: 12px 0 0 58px;"></span>
        <h1 class="heading2 margin-top15">Property Developer Registration</h1>
        
        <div id="alertId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-success" animation="true" id="errorId">You got an error!</h4>
        </div>
        
        <div class="rg-p">
          <form  name="registerPropertyDeveloper" id="registerPropertyDeveloperId" autocomplete="on">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
	            <tr>
	              <td><label>First Name</label>
	                <input type="text" placeholder="Enter your first name" class="" name="firstName" id="" value="" maxlength="150" /></td>
	              <td><label>Last Name</label>
	                <input type="text" placeholder="Enter your last name" class="" name="lastName" id="" value="" maxlength="150"/></td>
	            </tr>
	            <tr>
	              <td><label>Primary Email Id</label>
	                <input type="text" placeholder="Enter your email id" class="" name="primaryEmailId" id="" value="" maxlength="150"/></td>
	              <td><label>Secondary Email Id</label>
	                <input type="text" placeholder="Enter your email id" class="" name="secondaryEmailId" id=""  maxlength="150"/></td>
	            </tr>
	             <tr>
	              <td><label>Primary Contact Number</label>
	                <input type="text" placeholder="Enter your contact number" class="" name="primaryPhoneNumber" id="" value="" maxlength="150"/></td>
	              <td><label>Secondary Contact Number</label>
	                <input type="text" placeholder="Enter your contact number" class="" name="secondaryPhoneNumber" id="" maxlength="150"/></td>
	            </tr>
	            <tr>
	              <td><label>User Name</label>
	                <input type="text" placeholder="Enter the field" class="" name="loginObj.username" id="userName" value="" maxlength="150" autocomplete="off"/><label id="lbl" style="float: right; color:red;"></label></td>
	               <td><label>Password</label>
	                <input type="password" placeholder="Enter your password" class="" name="loginObj.password" id="" value="" maxlength="150"/></td>
	            </tr>
	             <tr>
	             <td><label>Address Line1</label>
	            	 <input type="text" placeholder="Type your address line 1"  class="" name="addressObj.addressLine1" id="" value="" maxlength="150" /></td>
	              <td><label>Address Line2</label>
	              	  <input type="text" placeholder="Type your address line 1"  class="" name="addressObj.addressLine2" id="" value="" maxlength="150"/></td>
	            </tr>
	            <tr>
	          		 <td>
	          			<label>Choose City</label>
	          			<select name="addressObj.city" id="landlordCity">
	                  </select></td>
	              <td><label>County</label>
                  <input type="text" placeholder="Enter your County" class="" name="addressObj.county" id="" value="" maxlength="150" autocomplete="on"/></td>    
	           	 </tr>
              <tr>
              <td><label>PostCode</label>
	                <input type="text" placeholder="PostCode" class="" name="addressObj.postCode" id="" value="" maxlength="150" autocomplete="on" /></td>
                <td><label>Land Mark(optional)</label>
            	 <input type="text" placeholder="Any Landmark"  class="" name="addressObj.landmark" id="" maxlength="150"/></td>
                <td><input type="button" id="propertyDeveloperSubmitId" style="margin:0;" value="Register Now" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
<c:import url="${wordPressUrl}/sub-footer/" ></c:import>

<!-- ---------------- JavaScript ------------------------------------>
 
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
	var contextPath = getContextPath();
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.sumoselect.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloper.js"></script>

<!-- ---------------- flexslider --------------------------------->
<script type="text/javascript" charset="utf-8">
$(document).ready(function(){
	 $.getJSON(contextPath+"/register/loadCitiesForLandlord.htm", function(options) {
 	      var dropdown = $('#landlordCity');
 	      dropdown.empty();
 	      if (options) {
 	    	  var opts = options.data;
 	    	 dropdown.append($('<option/>').val('').text('Select City'));
 	          $.each(opts, function(id, city) {
 	        	  dropdown.append($('<option/>').val(this.id).text(this.city));
 	          });
 	      }
 	 });
	 
	    $("#userName").blur(function(){
	    	console.log(validateUser());
	    	
	    });
});

function validateUser(){
	var name = $("#userName").val();
	if(name.trim()){
    $("#lbl").html("");
	$.ajax({
		url:contextPath+"/register/validateUser. htm",
		method: "Post",
		dataType: "json",
		data : {user : name},
		success:function(data){
			if(data.success == true){
				$("#propertyDeveloperSubmitId").removeAttr('disabled');
				$("#propertyDeveloperSubmitId").css('cursor', 'pointer');
				$("#propertyDeveloperSubmitId").css('background', '#FF0000');
				console.log("Username Available");
			}
			if(data.success == false){	  
				$("#propertyDeveloperSubmitId").attr('disabled','true');
				$("#propertyDeveloperSubmitId").css('cursor', 'no-drop');
				$("#propertyDeveloperSubmitId").css('background', '#707070');
				console.log("Username not available");
				$("#lbl").html("Username Not Available");
			}
	    },
	   error: function(error){
			console.log("Can't Validate the Username");
  	      }
   });
 }
}
</script>
<script>
$(function() {
$("#registerPropertyDeveloperId").validate({
    rules: {
        "firstName": "required",
        "lastName": "required",
        "primaryEmailId": {
            required: true,
            email: true
        },
        "primaryPhoneNumber": {
        	required: true,
        	 minlength :10,
             maxlength : 15
        },
        "loginObj.username": {
        	required: true,
        	minlength: 3
        },
        "loginObj.password": {
        	required: true,
        	minlength: 3
        },
        "addressObj.city" : "required",
        "addressObj.postCode" : "required",
        "addressObj.addressLine1" : "required",
		},
	messages: {
		"addressObj.city": {
    	 required: "Please Select City.",
   		 },
  	 }
	});
});

</script>

	<script type="text/javascript">
		$('.close').click(function () {
	 		 $('#alertId').hide(200);
		}); 
	</script>
</body>
</html>

