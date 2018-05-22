 $(document).ready(function(){
	 $("#userName").blur(function(){
	    	console.log(validateUser());
	    	
	    }); 
 });

$(function() {
	    $("#createPopupFormIdAdmin").validate({
	    	rules: {
	        	"firstName": "required",
	        	"lastName": "required",
	        	"loginObj.username" : "required",
	        	"addressObj.addressLine1"  : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required",
	        	"addressObj.county" : "required",
	        	"contactDetailsObj.emailId": {
	                required: true,
	                email: true
	            },
	        	"contactDetailsObj.phoneNumber": {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            }
	        }
	    });
	  });
  
  $(function() {
	    $("#editPopupFormIdAdmin").validate({
	    	rules: {
	        	"firstName": "required",
	        	"lastName": "required",
	        	"addressObj.addressLine1"  : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required",
	        	"contactDetailsObj.emailId": {
	                required: true,
	                email: true
	            },
	        	"contactDetailsObj.phoneNumber": {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            }
	        }
	    });
	  });
  
  function validateUser(){
  	var name = $("#userName").val();
  	if(name.trim()){
	    $("#lbl").html("");
  	$.ajax({
  		url:contextPath+"/register/validateUser",
  		method: "Post",
  		dataType: "json",
  		data : {user : name},
  		success:function(data){
  			if(data.success == true){
  				$("#createAdminButton").removeAttr('disabled');
  				$("#createAdminButton").css('cursor', 'pointer');
  				$("#createAdminButton").css('background', '#FF0000');
  				console.log("Username Available");
  			}
  			if(data.success == false){	  
  				$("#createAdminButton").attr('disabled','true');
  				$("#createAdminButton").css('cursor', 'no-drop');
  				$("#createAdminButton").css('background', '#707070');
  				$("#commonMessageErrorId").html("Username Not Available.");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
				status = "false";
  			}
  	  },
  	  error: function(error){
				console.log("Can't Validate the Username");
	  		}
  	  });
  }
  }