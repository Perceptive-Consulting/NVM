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
	        	"addressObj.addressLine2": "required",
	        	"contactDetailsObj.phoneNumber": {
	                required: true,
	                digits: true,
	                minlength :10
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
	                digits: true,
	                minlength :10
	            }
	        }
	    });
	  });