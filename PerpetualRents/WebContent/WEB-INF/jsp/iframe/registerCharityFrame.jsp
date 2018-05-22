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
         <h1 class="heading2 margin-top15">Charity Registration</h1>
        <div class="clearfix"></div>
        <div class="rg-p">
          <form id="charityRegisteration">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
              <tr>
                <td>
                <label> Name </label>
                  <input type="text" value="" placeholder="Enter your name" class="" name="name" id="" /></td>
                <td>
                <label> Email Id  </label>
                  <input type="text" value="" placeholder="Enter your email id" class="" name="emailId" id="" /></td>
              </tr>
              <tr>
                <td>
                 <label> Contact Number </label>
                  <input type="text" value="" placeholder="Enter your contact number" class="" name="contactNumber" id="" /></td>
                <td>
                 <label>Enter City</label>
                 <input type="text" value="" placeholder="Enter your city" class="" name="city" id="" /></td>
              </tr>
               <tr>
               <td class="text-area">
               	<label> Message  </label>
               	<textarea class="txt5" placeholder="Message" name="message"></textarea>
               </td>
                <td><input type="button" style="float:right; margin-top: 35px;" value="Register Now" id="charityRegisterationBtn" /></td>
              </tr>
             <tr>
                <td>
                  </td>
                
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
    
  </div>
</section>
<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
<div class="clearfix"></div>
<script type="text/javascript">
	function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
	var contextPath = getContextPath();
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="//code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>


<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.sumoselect.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
  
  $(document).ready(function(){
	  	$('.close').click(function () {
	  	    $('#alertSuccessId').hide(200);
	  	    $('#alertErrorId').hide(200);
	    }); 
	}); 
  
  $(document).ready(function(){
	  $("#charityRegisterationBtn" ).click(function(event) {
	  		 if($("#charityRegisteration").valid() == true){
	  			 var formData = form2object('charityRegisteration', '.', true,function(node)
	  	    	          {
	  	    	                if (node.id && node.id.match(/callbackTest/))
	  	    	                {
	  	    	                        return { name: node.id, value: node.innerHTML };
	  	    	                }
	  	    	        });
	  	    	  var postData = JSON.stringify(formData, null, '\t');
	  	    		$.ajax({
	  	    		    url : contextPath+"/register/charityRegisteration.htm",
	  	    		    type: "POST",
	  	    		    data : postData,
	  	    		    dataType : "json",
	  	    		    contentType: 'application/json',
	  	    		    success:function(data, textStatus, jqXHR){
	  	    		       if(data.success == true){
	  	    		    	 $.ajax({
	  	    				      url: contextPath+"/register/charityRegisterationSuccess.htm",
	  	    				      type: "post",
	  	    				      success: function(data){
	  	    				    	  $("#containerId").html(data);
	  	    				      },
	  	    				      error:function(){
	  	    				          $("#containerId").html('There is error while submit');
	  	    				      }
	  	    				  });
	  	    		       }
	  	    		    },
	  	    		    error: function(jqXHR, textStatus, errorThrown){
	  	    		        alert("fail");  
	  	    		    }
	  	    		});
	  	    		event.stopImmediatePropagation();
	  		 }
	  	});
 	 
 	  $(function() {
 		    $("#charityRegisteration").validate({
 		        rules: {
 		            "name": "required",
 		           	"emailId": {
		                required: true,
		                email: true
		            },
 		            "contactNumber": {
 		            	required: true,
 			        	minlength: 10,
 			        	maxlength: 15
 		            },
 			        "city" : "required",
 			        "message" : "required",
 		    },
 		    messages: {
 		    	"name": {
 		         	required: "Please Enter Your Name.",
 		        },
 		       "emailId": {
 	 		      required: "Please Enter Your Email Id.",
 	 		     },
 	 		   "contactNumber": {
 	 		        required: "Please Enter Your Contact Number.",
 	 		      },
 	 		     "city": {
 	 	 		    required: "Please Enter City.",
 	 	 		  },  
 	 	 		"message": {
 	 	 		    required: "Please Enter Message.",
 	 	 		  },  
 		       }
 	    });
 	  });
 });
 
</script>
</body>
</html>