	$(document).ready(function () {
		$("#externalHealthAndSafetyAccrediation1").click(function(){
			$("#externalHealthAndSafetyAccrediationYes").show();
		})
		$("#externalHealthAndSafetyAccrediation2").click(function(){
			
			$("#externalHealthAndSafetyAccrediationYes").hide();
		})
		
		 $("#contractorInfoStep3PreviousBtn").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep3.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		
		$("#contractorInfoStep4SubmitBtn").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep4Submit.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		
		
		$("#generalInfo").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectProfileView.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep2").click(function(){
			 console.log('contractorProfileStep2');
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep2.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep3").click(function(){
			 console.log('contractorProfileStep3');
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep3.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep4").click(function(){
			 console.log('contractorProfileStep4');
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep4.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 setContractorData();
		 validate();
	});
	
	function setContractorData(){
		 $.getJSON(contextPath+"/contractor/loadContractorStep4Info.htm", function(response) {
			 if(response.data){
				 var con = response.data.contractor;
				 if(con){
					 $("#referenceAddress1Str").html(con.referenceAddress1);
					 $("#referenceContact1Str").html(con.referenceContact1);
					 $("#description1Str").html(con.description1);
					 
					 $("#referenceAddress1").val(con.referenceAddress1);
					 $("#referenceContact1").val(con.referenceContact1);
					 $("#description1").val(con.description1);
					 
					 $("#referenceAddress2Str").html(con.referenceAddress2);
					 $("#referenceContact2Str").html(con.referenceContact2);
					 $("#description2Str").html(con.description2);
					 
					 $("#referenceAddress2").val(con.referenceAddress2);
					 $("#referenceContact2").val(con.referenceContact2);
					 $("#description2").val(con.description2);
					 
					 $("#referenceAddress3Str").html(con.referenceAddress3);
					 $("#referenceContact3Str").html(con.referenceContact3);
					 $("#description3Str").html(con.description3);
					 
					 $("#referenceAddress3").val(con.referenceAddress3);
					 $("#referenceContact3").val(con.referenceContact3);
					 $("#description3").val(con.description3);
					 
					 
					 if(con.externalHealthAndSafetyAccrediation == 'true'){
						 $("#externalHealthAndSafetyAccrediationResStr").html("Yes");
						 $("#externalHealthAndSafetyAccrediationYes").show();
						 $("#externalHealthAndSafetyAccrediation1").attr("checked", true); 
					 }else if(con.externalHealthAndSafetyAccrediation == 'false'){
						 $("#externalHealthAndSafetyAccrediationResStr").html("No");
						 $("#externalHealthAndSafetyAccrediationYes").hide();
						 $("#externalHealthAndSafetyAccrediation2").attr("checked", true);
					 }
					 $("#externalHealthAndSafetyAccrediationCommentsStr").html(con.externalHealthAndSafetyAccrediationComments);
					 
					 $("#additionalInformationStr").html(con.additionalInformation);
					 $("#additionalInformation").val(con.additionalInformation);
					 
					 $("#signedByStr").html(con.signedBy);
					 $("#signedDateStr").html(con.signedDate);
					 $("#signeeNameStr").html(con.signeeName);
					 $("#signeePositionStr").html(con.signeePosition);
					 $("#signeePhoneNumberStr").html(con.signeePhoneNumber);
					 $("#signeeAlternatePhoneNumberStr").html(con.signeeAlternatePhoneNumber);
					 $("#signeeEmailAddressStr").html(con.signeeEmailAddress);
					 
					 $("#signedBy").val(con.signedBy);
					 $("#signedDate").val(con.signedDate);
					 $("#signeeName").val(con.signeeName);
					 $("#signeePosition").val(con.signeePosition);
					 $("#signeePhoneNumber").val(con.signeePhoneNumber);
					 $("#signeeAlternatePhoneNumber").val(con.signeeAlternatePhoneNumber);
					 $("#signeeEmailAddress").val(con.signeeEmailAddress);
					 
					 $("#contactPersonNameStr").html(con.contactPersonName);
					 $("#contactPersonPositionStr").html(con.contactPersonPosition);
					 $("#contactPersonTelephoneNumberStr").html(con.contactPersonTelephoneNumber);
					 $("#contactPersonEmailAddressStr").html(con.contactPersonEmailAddress);
					 
					 $("#contactPersonName").val(con.contactPersonName);
					 $("#contactPersonPosition").val(con.contactPersonPosition);
					 $("#contactPersonTelephoneNumber").val(con.contactPersonTelephoneNumber);
					 $("#contactPersonEmailAddress").val(con.contactPersonEmailAddress);
					 
				 }
			 
			 }
		 });
	}
	
	function updateData(fieldNameString){
		var fieldNameArray = fieldNameString.split(",");
		console.log('fieldNameArray : ' + fieldNameArray);
		var fieldData = [];
		var delim = "";
		var divisionId = $.trim(fieldNameArray[0])+"Division";
		console.log('divisionId : ' + divisionId);
		$.each(fieldNameArray, function( index, value ) {
			var radioValue = jQuery("input:radio[name="+value+"]:checked").val();
			if(typeof radioValue === "undefined"){
				var valueId = "#"+$.trim(value);
				 radioValue = $(valueId).val();
			}
			fieldData.push(radioValue);
		 });
		
		console.log("fieldData : " + fieldData);
		console.log("filedArr : " + fieldNameArray);
		$.ajax({
		      url: contextPath+"/contractor/update.htm",
		      type: "post",
		      data: {page : 'page4', fieldName : fieldNameArray, value : fieldData},
		      dataType : "json",
		      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		      success: function(response){
		    	  if(response.success == true){
		    		  var p = $("#"+divisionId).offset().top;
					  var topMargin = p - 40;
					  showContractorSuccessMessage("Successfully Updated.!", topMargin);
		    		  $("#"+divisionId).fadeOut();
		    		  setContractorData();
		    	  }
		      }
		  })
	}
	
	function showContractorSuccessMessage(message, topMargininPx){
		 $("#contractorFormMsg").css("top", topMargininPx);
		 $("#contractorFormMsg").html(message);
		 $("#contractorFormMsg").show();
		 setTimeout(function(){
			 $("#contractorFormMsg").fadeOut(4000);
		 }, 1000);
	}
	
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
	            "contactPersonName": "required",
	            "contactPersonPosition": "required",
	            "contactPersonTelephoneNumber": "required",
	            "contactPersonEmailAddress": "required"
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
		    },

		    "contactPersonName": {
		         required: "Please enter Name of Person.",
		      },
	        "contactPersonPosition": {
		         required: "Please Enter Designation",
		     },
	    	"contactPersonTelephoneNumber": {
	    		required: "Please enter Telephone Number.",
	        },
	        "contactPersonEmailAddress": {
		         required: "Please enter Email Address.",
		     }
	       }
	    });
	}