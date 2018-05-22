$(function() {
		    $("#editPopupFormId").validate({
		    	rules: {
		        	"contactPerson": "required",
		        	"companyName": "required",
		        	"addressObj.city" : "required",
		        	"addressObj.postCode"  : "required",
		        	"addressObj.county" : "required",
		        	"vatNo" : "required",
		        	"addressObj.addressLine1" : "required",
		        }
		    });
		  });
$(function() {
	    $("#createPopupFormId").validate({
	        rules: {
	        	"contactPerson": "required",
	        	"companyName": "required",
	        	"vatNo": "required",
	        	"weburl": "required",
	        	"expertiseObj.qualification": "required",
	        	"loginObj.username": "required",
	        	"loginObj.password": "required",
	        	"expertiseObj.trainingPlace": "required",
	        	"expertiseObj.experienceYears": "required",
	        	"expertiseObj.referenceOwnerName1": "required",
	        	"expertiseObj.referenceOwnercontact1": "required",
	        	"expertiseObj.referenceCompletionDate1": "required",
	        	"expertiseObj.referenceOwnerName2": "required",
	        	"expertiseObj.referenceOwnercontact2": "required",
	        	"expertiseObj.referenceCompletionDate2": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required",
	        	"addressObj.county" : "required",
	        	"cities[0].city" : "required"
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