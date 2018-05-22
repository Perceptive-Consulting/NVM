	$(document).ready(function () {
		
		 $.getJSON(contextPath+"/register/loadCompanyType.htm", function(options) {
 	        if (options) {
 	      	  var opts = options.data;
 	      	var htmlStr = '<option value=""></option>';
 	            $.each(opts, function(key, value) {
 	          	  htmlStr += formatDropDown(this.key, this.value);
 	            });
 	            $("#companyTypeId").empty().html(htmlStr);
 	           var config = {
 	  	              '.chosen-select'           : {},
 	  	              '.chosen-select-deselect'  : {allow_single_deselect:true},
 	  	              '.chosen-select-no-single' : {disable_search_threshold:10},
 	  	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
 	  	              '.chosen-select-width'     : {width:"100%"}
 	  	            }
 	  	            for (var selector in config) {
 	  	              $(selector).chosen(config[selector]);
 	  	          }
 	        	} 
 	        });
		 	$('.chosen-select').on('change', function(evt, params) {
		 		var val = $("#companyTypeId").val();
		 		if(val == 5){
		 			$("#otherCompanyType").show();
		 		}else{
		 			$("#otherCompanyType").hide();
		 		}
		 	});
		 	
		 	$('#copyAddress').click (function(){
		 		  var thisCheck = $(this);
		 		 if($("#copyAddress").is(':checked')){
		 			 	$("#cAddressLine1").val($("#rAddressLine1").val());
		 			 	$("#cAddressLine2").val($("#rAddressLine2").val());
		 			 	$("#cCity").val($("#rCity").val());
		 			 	$("#cCounty").val($("#rCounty").val());
		 			 	$("#cPostCode").val($("#rPostCode").val());
		 			 	$("#cPhoneNumber").val($("#rPhoneNumber").val());
					} else{
						$("#cAddressLine1").val('');
		 			 	$("#cAddressLine2").val('');
		 			 	$("#cCity").val('');
		 			 	$("#cCounty").val('');
		 			 	$("#cPostCode").val('');
		 			 	$("#cPhoneNumber").val('');
					}
		 		});
		 	
		 	$('#registeredWithTradeBodies1').click (function(){
		 		$("#registeredWithTradeBodiesYes").show();
		 	});
		 	$('#registeredWithTradeBodies2').click (function(){
		 		$("#registeredWithTradeBodiesYes").hide();
		 	});
		 	
		 	$('#qualityMarks1').click (function(){
		 		$("#qualityMarksYes").show();
		 	});
		 	$('#qualityMarks2').click (function(){
		 		$("#qualityMarksYes").hide();
		 	});
		 	
		 	$('#registeredWithConstructionLine1').click (function(){
		 		$("#registeredWithConstructionLineYes").show();
		 	});
		 	$('#registeredWithConstructionLine2').click (function(){
		 		$("#registeredWithConstructionLineYes").hide();
		 	});
		 	
		 	$('#employSubcontractors1').click (function(){
		 		$("#employSubcontractorsYes").show();
		 	});
		 	$('#employSubcontractors2').click (function(){
		 		$("#employSubcontractorsYes").hide();
		 	});
		 	
		 	$('#bankruptcyProceedings1').click (function(){
		 		$("#bankruptcyProceedingsYes").show();
		 	});
		 	
		 	$('#bankruptcyProceedings2').click (function(){
		 		$("#bankruptcyProceedingsYes").hide();
		 	});
		 	
		 	$('#convictedToCriminalOffence1').click (function(){
		 		$("#convictedToCriminalOffenceYes").show();
		 	});
		 	
		 	$('#convictedToCriminalOffence2').click (function(){
		 		$("#convictedToCriminalOffenceYes").hide();
		 	});
		 	
		 	$('#trusteeOfAshantiDutch1').click (function(){
		 		$("#trusteeOfAshantiDutchYes").show();
		 	});
		 	
		 	$('#trusteeOfAshantiDutch2').click (function(){
		 		$("#trusteeOfAshantiDutchYes").hide();
		 	});
		 	
			 validate();
	});
	
	function formatDropDown(key, value){
		var htmlStr = '<option value="'+key+'">'+value+'</option>';
        return htmlStr;
	}
	
	function validate() {
	    $("#fContractorRegStep2").validate({
	        rules: {
	            "officeAddObj.addressLine1": "required",
	            "officeAddObj.city": {
		        	 required: true,
		             maxlength : 35
		        },
	            "officeAddObj.county": {
		        	 required: true,
		             maxlength : 35
		        },
	            "officeAddObj.postCode": {
		        	 required: true,
		             maxlength : 20
		        },
	            "officeAddObj.telephoneNumber": {
		        	required: true,
		        	 minlength :10,
		             maxlength : 15
		        },
	            "correspondenceAddObj.addressLine1": "required",
	            "correspondenceAddObj.city": {
		        	 required: true,
		             maxlength : 35
		        },
	            "correspondenceAddObj.county": {
		        	 required: true,
		             maxlength : 35
		        },
	            "correspondenceAddObj.postCode": {
		        	 required: true,
		             maxlength : 20
		        },
	            "correspondenceAddObj.telephoneNumber": {
		        	required: true,
		        	 minlength :10,
		             maxlength : 15
		        },
		        
		        "allDirectorsOfCompany": "required",
		        "bankruptcyProceedings": "required",
		        "convictedToCriminalOffence": "required",
		        "trusteeOfAshantiDutch": "required",
		        
	            "registeredWithTradeBodies": "required",
	            "qualityMarks": "required",
	            "registeredWithConstructionLine": "required",
	            "qualityMarks": "required",
	            "employeesCount": "required",
	            "employeesTrade": "required",
	            "employSubcontractors": "required",
	            "taxOfficeAddress": "required",
	            "taxReferenceNumber": "required",
	            "insurerNameandAddress": "required",
	            "policyNumber": "required",
	            "employersLiability": "required",
	            "publicLiability": "required",
	            "proffessionalIndemnity": "required",
	            "insauranceCoverExpiryDate": "required"
	    },
	    messages: {
	    	"officeAddObj.addressLine1": {
		         required: "Please enter addressLine1.",
		        },
	        "officeAddObj.city": {
		         required: "Please enter name of city.",
		     },
	    	"officeAddObj.county": {
	    		required: "Please enter name of county.",
	        },
	        "officeAddObj.postCode": {
		         required: "Please enter postcode.",
		     },
		    "officeAddObj.phoneNumber": {
			      required: "Please enter your Phone Number.",
			 },
			 "correspondenceAddObj.addressLine1": {
				 required: "Please enter addressLine1.",
			 },
			 "correspondenceAddObj.city": {
				 required: "Please enter name of city.",
			 },
			 "correspondenceAddObj.county": {
				 required: "Please enter name of county.",
			 }, 
			 "correspondenceAddObj.postCode": {
				 required: "Please enter postcode.",
			 }, 
			 "correspondenceAddObj.phoneNumber": {
				 required: "Please enter your Phone Number.",
			 }, 
			 
			 "allDirectorsOfCompany": {
		         required: "Please list director or secretary of Company.",
		     },
		     "bankruptcyProceedings": {
		         required: "Please Select YES/NO.",
		     },
		     "convictedToCriminalOffence": {
		         required: "Please Select YES/NO.",
		     },
		     "trusteeOfAshantiDutch": {
		         required: "Please Select YES/NO.",
		     },
			 "registeredWithTradeBodies": {
		         required: "Please Select YES/NO.",
		     },
		     "qualityMarks": {
		         required: "Please Select YES/NO.",
		     },
		     "registeredWithConstructionLine": {
		         required: "Please Select YES/NO.",
		     },
		     "employSubcontractors": {
		         required: "Please Select YES/NO.",
		     },
		     
	        "employeesCount": {
		         required: "Please Enter Employee Count.",
		     },
		    "employeesTrade": {
		    	required: "Please Enter Employee Trade.",
			 },
			 "employSubcontractors": {
				 required: "Please Select YES/NO.",
				 },
			 "taxOfficeAddress": {
				 required: "Please Enter tax Office Address.",
			 },
			 "taxReferenceNumber": {
				 required: "Please Enter Tax Referecne Number.",
			 },
			 "insurerNameandAddress": {
				 required: "Please Enter Insurer Name & Address.",
			 }, 
			 "policyNumber": {
				 required: "Please enter Policy Number.",
			 }, 
			 "employersLiability": {
				 required: "Please Enter Employer's Liability.",
			 }, 
			 
			 "publicLiability": {
				 required: "Please Enter Public Liability.",
			 },
			 "proffessionalIndemnity": {
				 required: "Please enter name of county.",
			 }, 
			 "insauranceCoverExpiryDate": {
				 required: "Please enter Insurance Cover Expiry Date.",
			 }
	       }
	    });
	}