	$(document).ready(function (){
		$("#writtenHealthPolicy1").click(function(){
			$("#writtenHealthPolicyYes").show();
			$("#writtenHealthPolicyNo").hide();
			
		});
		$("#writtenHealthPolicy2").click(function(){
			$("#writtenHealthPolicyNo").show();
			$("#writtenHealthPolicyYes").hide();
		});
		
		$("#competentHealthAndSafetyAdvice1").click(function(){
			$("#competentHealthAndSafetyAdviceYes").show();
		});
		$("#competentHealthAndSafetyAdvice2").click(function(){
			$("#competentHealthAndSafetyAdviceYes").hide();
		});
		
		$("#receivedHealthAndSafety1").click(function(){
			$("#receivedHealthAndSafetyYes").show();
		});
		$("#receivedHealthAndSafety2").click(function(){
			$("#receivedHealthAndSafetyYes").hide();
		});
		
		$("#enforcementNoticeforHealthSafety1").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").show();
		});
		$("#enforcementNoticeforHealthSafety2").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").hide();
		});
		
		$("#enforcementNoticeforHealthSafety1").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").show();
		});
		$("#enforcementNoticeforHealthSafety2").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").hide();
		});
		
		$("#safetyAccreditation1").click(function(){
			$("#safetyAccreditationYes").show();
		});
		$("#safetyAccreditation2").click(function(){
			$("#safetyAccreditationYes").hide();
		});
		
		$("#equalityPolicy1").click(function(){
			$("#equalityPolicyYes").show();
			$("#equalityPolicyNo").hide();
		});
		$("#equalityPolicy2").click(function(){
			$("#equalityPolicyYes").hide();
			$("#equalityPolicyNo").show();
		});
		
		$("#safetyAccreditation1").click(function(){
			$("#safetyAccreditationYes").show();
			$("#safetyAccreditationNo").hide();
		});
		$("#safetyAccreditation2").click(function(){
			$("#safetyAccreditationYes").hide();
			$("#safetyAccreditationNo").show();
		});
		
		$("#anyunlawfulDiscrimination1").click(function(){
			$("#anyunlawfulDiscriminationYes").show();
		});
		$("#anyunlawfulDiscrimination2").click(function(){
			$("#anyunlawfulDiscriminationYes").hide();
		});
		
		$("#subjectOfFormalInvestigation1").click(function(){
			$("#subjectOfFormalInvestigationYes").show();
		});
		$("#subjectOfFormalInvestigation2").click(function(){
			$("#subjectOfFormalInvestigationYes").hide();
		});
		
		$("#accidentReports1").click(function(){
			$("#accidentReportYes").show();
		});
		$("#accidentReports2").click(function(){
			$("#accidentReportYes").hide();
		});
		
		$("#addCostEditId").click(function(){
			$("#additionalInformationOfCostDivision").show();
		});
		
			
		$.getJSON(contextPath+"/register/loadContractorFunctionalityForCost.htm", function(options) {
	  	      if (options.success == 'true' || options.success == true) {
	  	    	  var opts = options.data;
	  	    	var htmlStr = formatFirstRow();
	  	          $.each(opts, function(id, value) {
	  	        	  htmlStr += formatEditFunctionalityTable(this.id, this.value);
	  	          });
	  	          htmlStr += formatLastHtml();
	  	          $("#priceScheduleId").empty().html(htmlStr);
	  	      }
	  	  });
		
		 validate();
	});
	
	
	function formatEditFunctionalityTable(key, value){
		var htmlStr = '<tr>'
			        + '<td class="new-2td" ><input type="hidden" value = "'+key+'" name = "costSheet['+key+'].functionalityId">'+value+'</td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].callOutMonToFri" type="text" class="effect price-textBox" maxlength="100"/></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].callOutWeekends" type="text"  class="effect" maxlength="100" /></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].hourlyRate" type="text" class="effect" maxlength="100" /></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].hourlyRateWeekends" type="text" class="effect" maxlength="100" /></td>'
			        + '</tr>';
		return htmlStr;
				}
	
	function formatFirstRow(){
		var htmlStr = '<tr>'
					+'<td class="new-2"><strong>Trade</strong></td>'
					+'<td class="new-2"><strong>Call out charge (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Call out charge (weekends & bank holidays)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (weekends & bank holidays)</strong></td>'
					+'</tr>';
		return htmlStr;
			}
	
	function formatLastHtml(){
		var htmlStr = '<tr>'
					+ '<td class="new-2" colspan="5">If you would like to provide any additional information about your price schedule, please give details below.<textarea class="effect" name="additionalInformationOfCost" maxlength="500"> </textarea></td>'
					+ '</tr>';
		
		return htmlStr;
	}
	
	function validate() {
	    $("#fContractorRegStep2").validate({
	        rules: {
	            "officeAddObj.addressLine1": "required",
	            "officeAddObj.city": "required",
	            "officeAddObj.county": "required",
	            "officeAddObj.postCode": "required",
	            "officeAddObj.phoneNumber": "required",
	            "correspondenceAddObj.addressLine1": "required",
	            "correspondenceAddObj.city": "required",
	            "correspondenceAddObj.county": "required",
	            "correspondenceAddObj.postCode": "required",
	            "correspondenceAddObj.phoneNumber": "required",
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
