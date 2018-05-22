  $(function() {
	    $("#editPopupForm").validate({
	        rules: {
	        	"contactPerson": "required",
	        	"agentContactNumber"  : {
	                required: true,
	                minlength :10,
	                maxlength : 15
	             },
	        }
	    });
	  });

	$(function() {
	    $("#createPopupFormId").validate({
	        rules: {
	        	"firstName": "required",
	        	"lastName": "required",
	        	"primaryEmailId": {
	                required: true,
	                email: true
	            },
	        	"secondaryEmailId": {
	                required: true,
	                email: true
	            },
	        	"primaryPhoneNumber" : {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            },
	        	"secondaryPhoneNumber": {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            },
	        	"loginObj.username": "required",
	        	"loginObj.password": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.addressLine2" : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required"
	        }
	    });
	  });
	
	function validateAOP(formId){
		  $(formId)[0].reset();
		  var validator = $(formId).validate();
		  validator.resetForm();
		  $("label.error").remove();
		  $(".error").removeClass();
}