	$(document).ready(function () {
		$("#externalHealthAndSafetyAccrediation1").click(function(){
			$("#externalHealthAndSafetyAccrediationYes").show();
		});
		$("#externalHealthAndSafetyAccrediation2").click(function(){
			$("#externalHealthAndSafetyAccrediationYes").hide();
		});
		
		 validate();
	});
	
	function validate() {
	    $("#fContractorRegStep4").validate({
	        rules: {
	            "referenceAddress1": "required",
	            "referenceContact1": "required",
	            "description1": "required",
	            "referenceAddress2": "required",
	            "referenceContact2": "required",
	            "description2": "required",
	            "referenceAddress3": "required",
	            "referenceContact3": "required",
	            "description3": "required",
	            "externalHealthAndSafetyAccrediation": "required",
	            
	            
	            "signedBy": "required",
	            "signedDate": "required",
	            "signeeName": "required",
	            "signeePosition": "required",
	            "signeePhoneNumber": "required",
	            "signeeEmailAddress": "required",
	    },
	    messages: {
	    	"referenceAddress1": {
		         required: "Please enter Address of Reference.",
		        },
	        "referenceContact1": {
		         required: "Please enter contact information of Reference.",
		     },
	    	"description1": {
	    		required: "Please enter description of Reference.",
	        },
	        
	        "referenceAddress2": {
		         required: "Please enter Address of Reference.",
		        },
	        "referenceContact2": {
		         required: "Please enter contact information of Reference.",
		     },
	    	"description2": {
	    		required: "Please enter description of Reference.",
	        },
	        
	        "referenceAddress3": {
		         required: "Please enter Address of Reference.",
		        },
	        "referenceContact3": {
		         required: "Please enter contact information of Reference.",
		     },
	    	"description3": {
	    		required: "Please enter description of Reference.",
	        },
	        
	        "externalHealthAndSafetyAccrediation": {
	    		required: "Please select YES/NO.",
	        },
	        
		     "signedBy": {
		    	 required: "Please enter name of the person.",
		    },
		    "signedDate": {
		         required: "Please enter Date.",
		      },
	        "signeeName": {
	        	required: "Please enter Name of Person.",
		     },
	    	"signeePosition": {
	    		 required: "Please Enter Designation",
	        },
	        "signeePhoneNumber": {
	        	required: "Please enter Telephone Number.",
		     },
		     "signeeEmailAddress": {
		    	 required: "Please enter Email Address.",
		    }
	       }
	    });
	}