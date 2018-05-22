  $(function() {
	    $("#createPopupFormId").validate({
	        rules: {
	        	"addressObj.city": "required",
	        	"addressObj.postCode": "required",
	        	"firstName" : "required",
	        	"lastName"  : "required",
	        	"loginObj.password" : "required",
	        	"addressObj.addressLine1" : "required",
	        	"primaryPhoneNumber" : {
	                required: true,
	                digits: true,
	                minlength :10
	            },
	        	"secondaryPhoneNumber": {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            },
	        	"loginObj.username": "required",
	        	"primaryEmailId": {
	                required: true,
	                email: true
	            }
	            
	        }
	    });
	  });

$(function() {
	    $("#editPopupForm").validate({
	        rules: {
	        	"firstName": "required",
	        	"lastName": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required",
	        	"addressObj.county" : "required",
	        	"primaryEmailId" : {
	                required: true,
	                email: true
	            },
	        	"primaryPhoneNumber": {
	                required: true,
	                minlength :10,
	                maxlength : 15
	            },
	        },
	    messages: {
	    	"addressObj.city": {
	         required: "Please Select City.",
	        }
	        },
	    });
	  });

function validateAOP(formId){
	  $(formId)[0].reset();
	  var validator = $(formId).validate();
	  validator.resetForm();
	  $("label.error").remove();
	  $(".error").removeClass();
}