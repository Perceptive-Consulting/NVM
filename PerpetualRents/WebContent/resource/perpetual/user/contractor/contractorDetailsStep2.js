	$(document).ready(function () {
			$.getJSON(contextPath+"/register/loadCompanyType.htm", function(options) {
	 	        if (options) {
	 	      	  var opts = options.data;
	 	      	var htmlStr = '<option value="">Select Company Type</option>';
	 	            $.each(opts, function(key, value) {
	 	          	  htmlStr += formatDropDown(this.key, this.value);
	 	            });
	 	            $("#companyTypeId").empty().html(htmlStr);
	 	        	} 
	 	        });
			 	$('.chosen-select').on('change', function(evt, params) {
			 		var val = $("#companyTypeId").val();
			 		if(val == 5){
			 			$("#otherCompanyTypeDiv").show();
			 			$(".companyTypeBtnClass").hide();
			 			$("#otherCompanyTypeBtnId").hide();
			 		}else{
			 			$("#otherCompanyTypeDiv").hide();
			 			$(".companyTypeBtnClass").show();
			 			$("#otherCompanyTypeBtnId").show();
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
		 	
		 	 $("#contractorInfoNextStep2Btn").click(function(){
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
		 	 
		 	 $("#contractorInfoPreviousStep2Btn").click(function(){
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
	
	$(document).ready(function () {
		
		$("#officeAddressBtn").click(function(){
			var data = $("#officeAddressId").toObject({skipEmpty:true});
			var postData = JSON.stringify(data);
			  $.ajax({
			      url: contextPath+"/contractor/updateAddress.htm",
			      type: "post",
			      data: postData,
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		  var p = $("#officeAddressDivisionId").offset().top;
						  var topMargin = p - 40;
						  showContractorSuccessMessage("Successfully Updated.!", topMargin);
			    		  $("#officeAddressDivisionId").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		
		$("#correspondenceAddresssBtn").click(function(){
			var data = $("#correspondenceAddresssId").toObject({skipEmpty:true});
			var postData = JSON.stringify(data);
			  $.ajax({
			      url: contextPath+"/contractor/updateAddress.htm",
			      type: "post",
			      data: postData,
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		  var p = $("#correspondenceAddresssDivisionId").offset().top;
						  var topMargin = p - 40;
						  showContractorSuccessMessage("Successfully Updated.!", topMargin);
			    		  $("#correspondenceAddresssDivisionId").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		
		$("#parentCompanyAddressBtn").click(function(){
			 var parentCompanyAddress = $("#parentCompanyAddress").val();
			  $.ajax({
			      url: contextPath+"/contractor/update.htm",
			      type: "post",
			      data: {page : 'page2', fieldName : 'parentCompanyAddress', value : parentCompanyAddress},
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		 
			    		  var p = $("#parentCompanyAddressDivision").offset().top;
						  var topMargin = p - 40;
						  showContractorSuccessMessage("Successfully Updated.!", topMargin);
						  $("#parentCompanyAddressDivision").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		
		
	});
	
	function updateData(fieldNameString){
		var fieldNameArray = fieldNameString.split(",");
		var fieldData = [];
		var delim = "";
		var divisionId = $.trim(fieldNameArray[0])+"Division";
		$.each(fieldNameArray, function( index, value ) {
			var radioValue = jQuery("input:radio[name="+value+"]:checked").val();
			if(typeof radioValue === "undefined"){
				var valueId = "#"+$.trim(value);
				 radioValue = $(valueId).val();
			}
			fieldData.push(radioValue);
		 });
		
		$.ajax({
		      url: contextPath+"/contractor/update.htm",
		      type: "post",
		      data: {page : 'page2', fieldName : fieldNameArray, value : fieldData},
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
		  });
	}
	
	function formatDropDown(key, value){
		var htmlStr = '<option value="'+key+'">'+value+'</option>';
        return htmlStr;
	}
	
	function setContractorData(){
		 $.getJSON(contextPath+"/contractor/loadContractorStep2Info.htm", function(response) {
			 if(response.data){
				 var con = response.data.contractor;
				 var oAdd = response.data.officeAddress;
				 var cAdd = response.data.correspondenceAddress;
				 if(oAdd){
					 
					 $("#oAddressLine1Str").html(oAdd.addressLine1);
					 $("#oAddressLine2Str").html(oAdd.addressLine2);
					 $("#oCityStr").html(oAdd.addressLine2);
					 $("#oCountyStr").html(oAdd.addressLine2);
					 $("#oPostCodeStr").html(oAdd.addressLine2);
					 $("#oPhoneNumberStr").html(oAdd.telephoneNumber);
					 
					 $("#oId").val(oAdd.id);
					 $("#oAddressLine1").val(oAdd.addressLine1);
					 $("#oAddressLine2").val(oAdd.addressLine2);
					 $("#oCity").val(oAdd.addressLine2);
					 $("#oCounty").val(oAdd.addressLine2);
					 $("#oPostCode").val(oAdd.addressLine2);
					 $("#oPhoneNumber").val(oAdd.telephoneNumber);
				 }
				 
				 if(cAdd){
					 $("#cAddressLine1Str").html(cAdd.addressLine1);
					 $("#cAddressLine2Str").html(cAdd.addressLine2);
					 $("#cCityStr").html(cAdd.addressLine2);
					 $("#cCountyStr").html(cAdd.addressLine2);
					 $("#cPostCodeStr").html(cAdd.addressLine2);
					 $("#cPhoneNumberStr").html(cAdd.telephoneNumber);
					 
					 $("#cId").val(cAdd.id);
					 $("#cAddressLine1").val(cAdd.addressLine1);
					 $("#cAddressLine2").val(cAdd.addressLine2);
					 $("#cCity").val(cAdd.addressLine2);
					 $("#cCounty").val(cAdd.addressLine2);
					 $("#cPostCode").val(cAdd.addressLine2);
					 $("#cPhoneNumber").val(cAdd.telephoneNumber);
				 }
				 if(con){
					 $("#companytypeStr").html(con.companyTypeStr);
					 
					 
					 $("#allDirectorsOfCompanyStr").html(con.allDirectorsOfCompany);
					 $("#allDirectorsOfCompany").val(con.allDirectorsOfCompany);
					 
					 if(con.bankruptcyProceedings == 'true'){
						 $("#bankruptcyProceedingsResStr").html("Yes");
						 $("#bankruptcyProceedings1").attr("checked", true);
					 }else if(con.bankruptcyProceedings == 'false'){
						 $("#bankruptcyProceedingsResStr").html("No");
						 $("#bankruptcyProceedings1").attr("checked", true);
					 }
					 $("#bankruptcyProceedingscommentsStr").html(con.bankruptcyProceedingsComments);
					 $("#bankruptcyProceedingsComments").val(con.bankruptcyProceedingsComments);
					 
					 
					 if(con.convictedToCriminalOffence == 'true'){
						 $("#convictedToCriminalOffenceResStr").html("Yes");
						 $("#convictedToCriminalOffence1").attr("checked", true);
					 }else if(con.bankruptcyProceedings == 'false'){
						 $("#convictedToCriminalOffenceResStr").html("No");
						 $("#convictedToCriminalOffence2").attr("checked", true);
					 }
					 $("#convictedToCriminalOffenceCommentsStr").html(con.convictedToCriminalOffenceComments);
					 $("#convictedToCriminalOffenceComments").val(con.convictedToCriminalOffenceComments);
					 
					 if(con.trusteeOfAshantiDutch == 'true' || con.trusteeOfAshantiDutch == true){
						 $("#trusteeOfAshantiDutchResStr").html("Yes");
						 $("#trusteeOfAshantiDutch1").attr("checked", true);
					 }else if(con.trusteeOfAshantiDutch == 'false'){
						 $("#trusteeOfAshantiDutchResStr").html("No");
						 $("#trusteeOfAshantiDutch2").attr("checked", true);
					 }
					 $("#trusteeOfAshantiDutchcommentsStr").html(con.trusteeOfAshantiDutchComments);
					 $("#trusteeOfAshantiDutchComments").val(con.trusteeOfAshantiDutchComments);
					 
					 
					 $("#parentCompanyAddressStr").html(con.parentCompanyAddress);
					 $("#parentCompanyAddress").val(con.parentCompanyAddress);
					 
					 $("#companyRegisterationNumberStr").html(con.companyRegisterationNumber);
					 $("#companyRegisterationNumber").val(con.companyRegisterationNumber);
					
					 $("#registeredWithTradeBodiescommentsStr").html(con.registerationNumber);
					 if(con.registeredWithTradeBodies == 'true'){
						 $("#registeredWithTradeBodiesResStr").html("Yes");
						 $("#registeredWithTradeBodies1").attr("checked", true);
					 }else if(con.registeredWithTradeBodies == 'false'){
						 $("#registeredWithTradeBodiesResStr").html("No");
						 $("#registeredWithTradeBodies1").attr("checked", true);
					 }
					 $("#registerationNumber").val(con.registerationNumber);
	  					
					 if(con.qualityMarks == 'true'){
						 $("#qualityMarksResStr").html("Yes");
						 $("#qualityMarks1").attr("checked", true); 
					 }else if(con.qualityMarks == 'false'){
						 $("#qualityMarksResStr").html("No");
						 $("#qualityMarks2").attr("checked", true);
					 }
					 $("#qualityMarksCommentsStr").html(con.qualityMarksDetails);
					 $("#qualityMarksDetails").val(con.qualityMarksDetails);
					 
					 if(con.registeredWithConstructionLine == 'true'){
						 $("#registeredWithConstructionLineResStr").html("Yes");
						 $("#registeredWithConstructionLine1").attr("checked", true); 
					 }else if(con.registeredWithConstructionLine == 'false'){
						 $("#registeredWithConstructionLineResStr").html("No");
						 $("#registeredWithConstructionLine2").attr("checked", true);
					 }
					 $("#registeredWithConstructionLineCommentsStr").html(con.constructionLineRegisterationNumber);
					 $("#constructionLineRegisterationNumber").val(con.constructionLineRegisterationNumber);
					 
					 $("#employeesCountStr").html(con.employeesCount);
					 $("#employeesCount").val(con.employeesCount);
					 
					 $("#employeesTradeStr").html(con.employeesTrade);
					 $("#employeesTrade").val(con.employeesTrade);
					 
					 
					 if(con.employSubcontractors == 'true'){
						 $("#employSubcontractorsResStr").html("Yes");
						 $("#employSubcontractors1").attr("checked", true); 
					 }else if(con.employSubcontractors == 'false'){
						 $("#employSubcontractorsResStr").html("No");
						 $("#employSubcontractors2").attr("checked", true);
					 }
					 $("#employSubContractorRegisterationNumberStr").html(con.employSubContractorRegisterationNumber);
					 $("#employSubContractorRegisterationNumber").val(con.employSubContractorRegisterationNumber);
					 
					 $("#taxOfficeAddressStr").html(con.taxOfficeAddress);
					 $("#taxOfficeAddress").val(con.taxOfficeAddress);
					 
					 $("#taxReferenceNumberStr").html(con.taxReferenceNumber);
					 $("#taxReferenceNumber").val(con.taxReferenceNumber);
					 
					 $("#insurerNameandAddressStr").html(con.insurerNameandAddress);
					 $("#insurerNameandAddress").val(con.insurerNameandAddress);
					 
					 $("#policyNumberStr").html(con.policyNumber);
					 $("#policyNumber").val(con.policyNumber);
					 
					 $("#employersLiabilityStr").html(con.employersLiability);
					 $("#publicLiabilityStr").html(con.publicLiability);
					 $("#proffessionalIndemnityStr").html(con.proffessionalIndemnity);
					 $("#employersLiability").val(con.employersLiability);
					 $("#publicLiability").val(con.publicLiability);
					 $("#proffessionalIndemnity").val(con.proffessionalIndemnity);
					 
					 $("#insauranceCoverExpiryDateStr").html(con.insauranceCoverExpiryDate);
				 }
			 }
		 });
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