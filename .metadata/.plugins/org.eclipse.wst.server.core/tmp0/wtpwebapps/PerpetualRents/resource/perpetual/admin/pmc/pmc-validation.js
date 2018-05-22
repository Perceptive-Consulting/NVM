	 $(function() {
 	    $("#editPopupForm").validate({
 	        rules: {
 	        	"authorisedPerson": "required",
 	        	"contactDetailsObj.emailId" : {
 	                required: true,	
 	                email: true
 	            },
 	        	"contactDetailsObj.phoneNumber" : {
 	                required: true,
 	                minlength : 10,
 	                maxlength: 15
 	            },
 	        	"addressObj.addressLine1": "required",
 	        	"addressObj.postCode": "required",
 	        	"addressObj.city": "required",
 	        	"addressObj.county": "required",
 	        	"loginObj.username" : "required"
 	        }
 	    });
 	  });

 $(function() {
 	    $("#createPopupFormId").validate({
 	        rules: {
 	        	"authorisedPerson": "required",
 	        	"contactDetailsObj.emailId": {
 	                required: true,
 	                email: true
 	            },
 	        	"contactDetailsObj.phoneNumber" : {
 	                required: true,
 	                minlength :10,
 	                maxlength: 15
 	            },
 	            "citiesCoveredList"  : "required",
 	        	"addressObj.addressLine1" : "required",
 	        	"companyName": "required",
 	        	"addressObj.postCode" : "required",
 	        	"addressObj.city" : "required",
 	        	"addressObj.county" : "required",
 	        	"loginObj.username" : "required"
 	        }
 	    });
 	  });

 function validateAOP(formId){
 	  $(formId)[0].reset();
 	  var validator = $(formId).validate();
 	  validator.resetForm();
 	  $("label.error").remove();
 	  $(".error").removeClass();
 	  $("#cityErrorDivId").hide();
 }