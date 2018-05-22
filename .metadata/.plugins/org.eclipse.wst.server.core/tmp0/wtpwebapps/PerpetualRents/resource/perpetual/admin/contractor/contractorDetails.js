  var id ;
  
  $(document).ready(function(){
		  $("#disapproveContractor").click(function(){
			  $.getJSON(contextPath +"/admin/disapproveContractor.htm?contractorId="+id,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disapproveContractor").hide();
				  				$("#approveContractor").show();
				  				$("#commonMessageSuccessId").html("Dis-Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  				addContractorDetails(id);
				  			}else{
				  				$("#commonMessageErrorId").html("Error while updating");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				}); 
		  });
		  
		  $("#approveContractor").click(function(){
			  $.getJSON(contextPath+"/admin/approveContractor.htm?contractorId="+id,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disapproveContractor").show();
				  				$("#approveContractor").hide();
				  				$("#commonMessageSuccessId").html("Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  				addContractorDetails(id);
				  			}else{
				  				$("#commonMessageErrorId").html("Error while updating");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				}); 
		  });
		  
		  
		  $("#contractorStep2").click(function(){
			  setContractorStep2Data();
		  });
		  
		  $("#contractorStep3").click(function(){
			  setContractorStep3Data();
		  });
		  
		  $("#contractorStep4").click(function(){
			  setContractorStep4Data();
		  });
		  
		  $("#showData").click(function(){
			  $("#moreData").show();
			  $("#showData").hide();
			  $("#hideData").show();
		  });
		  $("#hideData").click(function(){
			  $("#moreData").hide();
			  $("#showData").show();
			  $("#hideData").hide();
		  });
		  
		  $("#functionalityCancelBtn").click(function(){
			  $("#editFunctionalityDiv").hide();
		  });
		  
		  $("#cityCancelBtn").click(function(){
			  $("#editCitiesDiv").hide();
		  });
		  
		  
		 
	  });
  
  
   function editContractorFunctionality(){
	   
	   $("#functionalityUpdateBtn").click(function(event){
		   var functionalityStr = $("#functionalityId").val();
		   if(functionalityStr == null || functionalityStr == 'null'){
			   $("#functionalityLabel").show();
			   return false;
		   }
		   $.ajax({
			      url: contextPath+"/admin/updateContractorFunctionality.htm",
			      type: "post",
			      dataType : "json",
			      data: {functionalityStr : functionalityStr, contractorId : id},
			      success: function(response){
			    	  if(response.success == true){
			    		  addContractorDetails(id);
			    		  $("#editFunctionalityDiv").hide();
			    		  $("#commonMessageSuccessId").html("Functionalities successfully updated !");
			  				$("#commonMessageSuccessId").fadeIn();
							setTimeout(function(){
								$("#commonMessageSuccessId").fadeOut(4000);
							}, 4000);
			    	  }else{
			  				$("#commonMessageErrorId").html("Error while updating");
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);
			  			
			    	  }
			    	  functionalityUpdated = false;
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		    event.preventDefault();
			event.stopImmediatePropagation();
	   });
   }
   
   function loadContractorFunctionalities(){
	   
	   var functionalityIdStr =  $("#functionalityIdStr").html();
	   
	   var arr = functionalityIdStr.split(",");
	   var funArr = [];
	   $(arr).each(function( index , value) {
		   funArr.push(value);
	   });
	   
		$(".loader").css('height', $(document).height());
		$(".loader").css('display', 'block');				    
   
   $.getJSON(contextPath+"/register/loadContractorFunctionality.htm", function(options) {
  	      if (options) {
  	    	  var opts = options.data;
  	    	var htmlStr = '<option value=""></option>';
  	          $.each(opts, function(key, value) {
  	        	  htmlStr += formatDropDown(this.key, this.value);
  	          });
  	          $("#functionalityId").empty().html(htmlStr);
  	        readyFunctionalityChosen();
  	      }
  	  	});
   
   	function formatDropDown(key, value){
	   
		  var htmlStr = "";
		  	if(funArr.contains(key)){
		  		htmlStr = '<option selected value="'+key+'">'+value+'</option>';
		  	}else{
		  		htmlStr = '<option value="'+key+'">'+value+'</option>';
		  	}
	      return htmlStr;
		}
   	
    function readyFunctionalityChosen(){
    	$(".loader").css('display', 'none');
  			 var config = {
  		              '.chosen-select-functionality': {},
  		              '.chosen-select-deselect'  : {allow_single_deselect:true},
  		              '.chosen-select-no-single' : {disable_search_threshold:10},
  		              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
  		              '.chosen-select-width'     : {width:"100%"}
  		            };
  		            for (var selector in config) {
  		              $(selector).chosen(config[selector]);
  		          }
    		}
    
   }
   
   function loadContractorCities(){
	    var cityArrStr = $("#cityServicedId").html(); 
	   var tempArr = cityArrStr.split(",");
	   var selectedCityArr = [];
	   $(tempArr).each(function( index , value) {
		   selectedCityArr.push(value);
	   });
	   
	   $(".loader").css('height', $(document).height());
		$(".loader").css('display', 'block');
	   
	   $.getJSON(contextPath+"/register/loadCitiesForContractor.htm", function(options) {
	        if (options) {
	      	  var opts = options.data;
	      	var htmlStr = '<option value=""></option>';
	            $.each(opts, function(key, value) {
	          	  htmlStr += formatDropDown(this.id, this.city);
	            });
	            $("#citiesId").empty().html(htmlStr);
	            readyCityChosen();
        	}
        });
	   function formatDropDown(key, value){
			  var htmlStr = "";
			 
			  	if(selectedCityArr.contains(key)){
			  		htmlStr = '<option selected value="'+key+'">'+value+'</option>';
			  	}else{
			  		htmlStr = '<option value="'+key+'">'+value+'</option>';
			  	}
		      return htmlStr;
			}
	   
	   function readyCityChosen(){
		   $(".loader").css('display', 'none');
	 		 var config = {
	 	              '.chosen-select-city'           : {},
	 	              '.chosen-select-deselect'  : {allow_single_deselect:true},
	 	              '.chosen-select-no-single' : {disable_search_threshold:10},
	 	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
	 	              '.chosen-select-width'     : {width:"100%"}
	 	            };
	 	            for (var selector in config) {
	 	              $(selector).chosen(config[selector]);
	 	              
	 	          }
	 	           $(".chosen-select-city").trigger("chosen:updated");
	 		}
	   cityArrStr = null;
   		}
   
	function editContractorCities(){
		   
		   $("#cityUpdateBtn").click(function(event){
			   $(".chosen-select-city").trigger("chosen:updated");
			   var citiesStr = $("#citiesId").val();
			   if(citiesStr == null || citiesStr == 'null'){
				   $("#cityLabel").show();
				   return false;
			   }
			   $.ajax({
				      url: contextPath+"/admin/updateCities.htm",
				      type: "post",
				      dataType : "json",
				      data: {citiesStr : citiesStr, id : id, extraParam : 'Contractor'},
				      success: function(response){
				    	  if(response.success == true || response.success == 'true'){
				    		  addContractorDetails(id);
				    		  $(".chosen-select-city").trigger("chosen:updated");
				    		  $("#editCitiesDiv").hide();
				    		  $("#commonMessageSuccessId").html("Cities successfully updated !");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
								cityUpdated = false;
				    	  }else{
				  				$("#commonMessageErrorId").html("Error while updating");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				    	  }
				      },
				      error:function(){
				          $("#containerId").html('There is error while submit');
				      }
				  });
			    event.preventDefault();
				event.stopImmediatePropagation();
		   });
	   }
   
   Array.prototype.contains = function ( needle ) {
	   
	   for (i in this) {
	       if (this[i] == needle) return true;
	   }
	   return false;
	};
  
  function addContractorDetails(contId){
	  id = contId;
	  $.getJSON(contextPath+"/admin/viewContractorDetails.htm?contractorId="+id,
			    function(response, textStatus, jqXHR){
		  
		  		var loginObj = response.data.loginObj;
		  		var addressObj = response.data.addressObj;
		  		var conObj = response.data.conObj;
		  		var expertiseObj = response.data.expertise;
		  		var detailsObj = response.data.detailsObj;
		  		
		  		
			  $("#companyName").html(conObj.companyName);
			  $("#userName").html(loginObj.username);
			  $("#password").html(loginObj.password);
			  $("#reference").html(conObj.uniqueReference);
			  $("#status").html(conObj.status);
			  $("#businessNature").html(conObj.businessNature);
			  $("#createdOn").html(conObj.createdOn);
			  $("#createdBy").html(conObj.createdBy);
			  $("#modifiedOn").html(conObj.modifiedOn);
			  $("#modifiedBy").html(conObj.modifiedBy);
			  
			  
			  $("#tradingCommencementDate").html(conObj.tradingCommencementDate);
			  $("#companyRegisterationDate").html(conObj.companyRegisterationDate);
			  
			  $("#vatNo").html(conObj.vatNo);
			  $("#cityServiced").html(response.data.cityServicedStr);
			  
			  if(addressObj){
				  $("#address").html(addressObj.addressLine1 + " " + addressObj.addressLine2);
				  	$("#city").html(addressObj.city);
				  	$("#postCode").html(addressObj.postCode);
				  	$("#county").html(addressObj.county);
			  }
			  if(detailsObj){
				  $("#emailId").html(detailsObj.emailId);
				  $("#phoneNumber").html(detailsObj.phoneNumber);
			  }
			  var functionalityIdStr = "null";
			  if(expertiseObj){
				  $("#qualification").html(expertiseObj.qualification);
				  $("#trainingPlace").html(expertiseObj.trainingPlace);
				  $("#experienceYears").html(expertiseObj.experienceYears);
				  $("#functionality").html(expertiseObj.functionality);
				  $("#propOwnName1").html(expertiseObj.referenceOwnerName1);
				  $("#propOwnContact1").html(expertiseObj.referenceOwnercontact1);
				  $("#jobCompDate1").html(expertiseObj.referenceCompletionDate1);
				  $("#propOwnName2").html(expertiseObj.referenceOwnerName2);
				  $("#propOwnContact2").html(expertiseObj.referenceOwnercontact2);
				  $("#jobCompDate2").html(expertiseObj.referenceCompletionDate2);
				  if(conObj.status == 'Approved'){
					  $("#disapproveContractor").show();
		  				$("#approveContractor").hide();
				  }else{
					  $("#disapproveContractor").hide();
		  				$("#approveContractor").show();
				  }
				   functionalityIdStr = expertiseObj.functionalityIdStr;
			  }
				  
				 var tempCityServiced = "null";
				  var tempStr = response.data.cityServicedIdStr;
				  
				  if(tempStr){
					  tempCityServiced = tempStr;
					  $("#editCities").val("Edit");
				  }else{
					  $("#editCities").val("Add Cities");
				  }
				  
				  $("#functionalityIdStr").html(functionalityIdStr);
				  $("#cityServicedId").html(tempCityServiced);
				  
				 $("#editFunctionality").click(function(event){
						  $("#editFunctionalityDiv").show();
						  loadContractorFunctionalities();
						  editContractorFunctionality();
					  event.preventDefault();
					  event.stopImmediatePropagation();
				  });
				  
				  $("#editCities").click(function(event){
						  $("#editCitiesDiv").show();
						  loadContractorCities();
						  editContractorCities();
					  event.preventDefault();
					  event.stopImmediatePropagation();
				  });
	  		});
	 
	  setContractorStep2Data();
  }
   
  function setContractorStep2Data(){
		 $.getJSON(contextPath+"/admin/loadContractorStep2Info.htm?contractorId="+id, function(response) {
			 if(response.data){
				 var con = response.data.contractor;
				 var oAdd = response.data.officeAddress;
				 var cAdd = response.data.correspondenceAddress;
				 if(oAdd){
					 $("#oAddressLine1Str").html(oAdd.addressLine1);
					 $("#oAddressLine2Str").html(oAdd.addressLine2);
					 $("#oCityStr").html(oAdd.city);
					 $("#oCountyStr").html(oAdd.county);
					 $("#oPostCodeStr").html(oAdd.postCode);
					 $("#oPhoneNumberStr").html(oAdd.telephoneNumber);
					 
				 }
				 
				 if(cAdd){
					 $("#cAddressLine1Str").html(cAdd.addressLine1);
					 $("#cAddressLine2Str").html(cAdd.addressLine2);
					 $("#cCityStr").html(cAdd.city);
					 $("#cCountyStr").html(cAdd.county);
					 $("#cPostCodeStr").html(cAdd.postCode);
					 $("#cPhoneNumberStr").html(cAdd.telephoneNumber);
					 
				 }
				 if(con){
					 $("#companytypeStr").html(con.companyTypeStr);
					 
					 $("#allDirectorsOfCompanyStr").html(con.allDirectorsOfCompany);
					 
					 if(con.bankruptcyProceedings == 'true'){
						 $("#bankruptcyProceedingsResStr").html("Yes");
					 }else if(con.bankruptcyProceedings == 'false'){
						 $("#bankruptcyProceedingsResStr").html("No");
					 }
					 
					 $("#bankruptcyProceedingsCommentsStr").html(con.bankruptcyProceedingsComments);
					 
					 if(con.convictedToCriminalOffence == 'true'){
						 $("#convictedToCriminalOffenceResStr").html("Yes");
					 }else if(con.convictedToCriminalOffence == 'false'){
						 $("#convictedToCriminalOffenceResStr").html("No");
					 }
					 $("#convictedToCriminalOffenceCommentsStr").html(con.convictedToCriminalOffenceComments);
					 
					 if(con.trusteeOfAshantiDutch == 'true'){
						 $("#trusteeOfAshantiDutchResStr").html("Yes");
					 }else if(con.trusteeOfAshantiDutch == 'false'){
						 $("#trusteeOfAshantiDutchResStr").html("No");
					 }
					 $("#trusteeOfAshantiDutchCommentsStr").html(con.trusteeOfAshantiDutchComments);
					 
					 
					 $("#parentCompanyAddressStr").html(con.parentCompanyAddress);
					 
					 $("#companyRegisterationNumberStr").html(con.companyRegisterationNumber);
					 
					
					 $("#registeredWithTradeBodiescommentsStr").html(con.registerationNumber);
					 if(con.registeredWithTradeBodies == 'true'){
						 $("#registeredWithTradeBodiesResStr").html("Yes");
						 $("#registeredWithTradeBodies1").attr("checked", true);
					 }else if(con.registeredWithTradeBodies == 'false'){
						 $("#registeredWithTradeBodiesResStr").html("No");
						 $("#registeredWithTradeBodies1").attr("checked", true);
					 }
					
					 if(con.qualityMarks == 'true'){
						 $("#qualityMarksResStr").html("Yes");
						 $("#qualityMarks1").attr("checked", true); 
					 }else if(con.qualityMarks == 'false'){
						 $("#qualityMarksResStr").html("No");
						 $("#qualityMarks2").attr("checked", true);
					 }
					 $("#qualityMarksCommentsStr").html(con.qualityMarksDetails);
					 
					 if(con.registeredWithConstructionLine == 'true'){
						 $("#registeredWithConstructionLineResStr").html("Yes");
						 $("#registeredWithConstructionLine1").attr("checked", true); 
					 }else if(con.registeredWithConstructionLine == 'false'){
						 $("#registeredWithConstructionLineResStr").html("No");
						 $("#registeredWithConstructionLine2").attr("checked", true);
					 }
					 $("#registeredWithConstructionLineCommentsStr").html(con.constructionLineRegisterationNumber);
					 
					 $("#employeesCountStr").html(con.employeesCount);
					 
					 $("#employeesTradeStr").html(con.employeesTrade);
					 
					 
					 if(con.employSubcontractors == 'true'){
						 $("#employSubcontractorsResStr").html("Yes");
						 $("#employSubcontractors1").attr("checked", true); 
					 }else if(con.employSubcontractors == 'false'){
						 $("#employSubcontractorsResStr").html("No");
						 $("#employSubcontractors2").attr("checked", true);
					 }
					 $("#employSubContractorRegisterationNumberStr").html(con.employSubContractorRegisterationNumber);
					 
					 $("#taxOfficeAddressStr").html(con.taxOfficeAddress);
					 
					 $("#taxReferenceNumberStr").html(con.taxReferenceNumber);
					 
					 $("#insurerNameandAddressStr").html(con.insurerNameandAddress);
					 
					 $("#policyNumberStr").html(con.policyNumber);
					 
					 $("#employersLiabilityStr").html(con.employersLiability);
					 $("#publicLiabilityStr").html(con.publicLiability);
					 $("#proffessionalIndemnityStr").html(con.proffessionalIndemnity);
					 
					 $("#insauranceCoverExpiryDateStr").html(con.insauranceCoverExpiryDate);
				 }
			 
			 }
		 });
	}
  
  function setContractorStep3Data(){
		 $.getJSON(contextPath+"/admin/loadContractorStep3Info.htm?contractorId="+id, function(response) {
			 if(response.data){
				 var cPath = contextPath+"/";
				 var con = response.data.contractor;
				 var costsheet = response.data.costsheet;
				 if(con){
					 $("#writtenHealthPolicyCommentsStr").html(con.writtenHealthPolicyComments);
					 $("#writtenHealthPolicyFileNameStr").html(con.writtenPolicyFileName);
					 $("#writtenHealthPolicyFileNameStr").attr("href",cPath+"download/uploadedDocuments?fileId="+con.writtenHealthPolicyFileId);
					 
					 if(con.writtenHealthPolicy == 'true'){
						 $("#writtenHealthPolicyResStr").html("Yes");
						 $("#writtenHealthPolicyFileNameDiv").show();
						 $("#writtenHealthPolicy1").attr("checked", true); 
						 $("#writtenHealthPolicyYes").show();
					 }else if(con.writtenHealthPolicy == 'false'){
						 $("#writtenHealthPolicyResStr").html("No");
						 $("#writtenHealthPolicyFileNameDiv").hide();
						 $("#writtenHealthPolicy2").attr("checked", true);
						 $("#writtenHealthPolicyNo").show();
					 }
					 
					 
					 if(con.competentHealthAndSafetyAdvice == 'true'){
						 $("#competentHealthAndSafetyAdviceResStr").html("Yes");
						 $("#competentHealthAndSafetyAdvice1").attr("checked", true); 
					 }else if(con.competentHealthAndSafetyAdvice == 'false'){
						 $("#competentHealthAndSafetyAdviceResStr").html("No");
						 $("#competentHealthAndSafetyAdvice2").attr("checked", true);
					 }
					 $("#competentHealthAndSafetyAdviceCommentsStr").html(con.competentHealthAndSafetyAdviceComments);
					
					 if(con.receivedHealthAndSafety == 'true'){
						 $("#receivedHealthAndSafetyResStr").html("Yes");
						 $("#receivedHealthAndSafety1").attr("checked", true); 
					 }else if(con.receivedHealthAndSafety == 'false'){
						 $("#receivedHealthAndSafetyResStr").html("No");
						 $("#receivedHealthAndSafety2").attr("checked", true);
					 }
					 $("#receivedHealthAndSafetyCommentsStr").html(con.receivedHealthAndSafetyComments);
					 
					 $("#yearEnding1Str").html(con.yearEnding1);
					 $("#fatalAccidents1Str").html(con.fatalAccidents1);
					 $("#reportableInjuries1Str").html(con.reportableInjuries1);
					 $("#accidentRate1Str").html(con.accidentRate1);
					 $("#nonReportableInjuries1Str").html(con.nonReportableInjuries1);
					 
					 $("#yearEnding2StrStr").html(con.yearEnding2);
					 $("#fatalAccidents2StrStr").html(con.fatalAccidents2);
					 $("#reportableInjuries2Str").html(con.reportableInjuries2);
					 $("#accidentRate2Str").html(con.accidentRate2);
					 $("#nonReportableInjuries2Str").html(con.nonReportableInjuries2);
					 
					 if(con.enforcementNoticeforHealthSafety == 'true'){
						 $("#enforcementNoticeforHealthSafetyStr").html("Yes");
						 $("#enforcementNoticeforHealthSafety1").attr("checked", true);
						 $("#enforcementNoticeforHealthSafetyYes").show();
					 }else if(con.enforcementNoticeforHealthSafety == 'false'){
						 $("#enforcementNoticeforHealthSafetyStr").html("No");
						 $("#enforcementNoticeforHealthSafety2").attr("checked", true);
						 $("#enforcementNoticeforHealthSafetyYes").hide();
					 }
					 $("#enforcementNoticeforHealthSafetyCommentsStr").html(con.enforcementNoticeforHealthSafetyComments);
					 $("#enforcementNoticeforHealthSafetyComments").val(con.enforcementNoticeforHealthSafetyComments);
					 
					 
					 if(con.safetyAccreditation == 'true'){
						 $("#safetyAccreditationResStr").html("Yes");
						 $("#safetyAccreditation1").attr("checked", true); 
						 $("#safetyAccreditationYes").show(); 
					 }else if(con.safetyAccreditation == 'false'){
						 $("#safetyAccreditationResStr").html("No");
						 $("#safetyAccreditation2").attr("checked", true);
						 $("#safetyAccreditationYes").hide(); 
					 }
					 $("#safetyAccreditationCommentsStr").html(con.safetyAccreditationComments);
					 
					 $("#equalityPolicyCommentsStr").html(con.equalityPolicyComments);
					 $("#equalityPolicyFileName").html(con.equalityPolicyFileName);
					 $("#equalityPolicyFileName").attr("href",cPath+"download/uploadedDocuments?fileId="+con.equalityPolicyFileId);
					 
					 if(con.equalityPolicy == 'true'){
						 $("#equalityPolicyResStr").html("Yes");
						 $("#equalityPolicyFileNameDiv").show();
						 $("#equalityPolicy1").attr("checked", true);
						 $("#equalityPolicyYes").show();
						 $("#equalityPolicyNo").hide();
					 }else if(con.equalityPolicy == 'false'){
						 $("#equalityPolicyResStr").html("No");
						 $("#equalityPolicyFileNameDiv").hide();
						 $("#equalityPolicy2").attr("checked", true);
						 $("#equalityPolicyNo").show();
						 $("#equalityPolicyYes").hide();
					 }
					 
					 
					 if(con.anyunlawfulDiscrimination == 'true'){
						 $("#anyunlawfulDiscriminationStr").html("Yes");
						 $("#anyunlawfulDiscrimination1").attr("checked", true); 
					 }else if(con.anyunlawfulDiscrimination == 'false'){
						 $("#anyunlawfulDiscriminationStr").html("No");
						 $("#anyunlawfulDiscrimination2").attr("checked", true);
					 }
					 $("#anyunlawfulDiscriminationCommentsStr").html(con.anyunlawfulDiscriminationComments);
					 $("#anyunlawfulDiscriminationComments").val(con.anyunlawfulDiscriminationComments);
					 
					 
					 if(con.subjectOfFormalInvestigation == 'true'){
						 $("#subjectOfFormalInvestigationResStr").html("Yes");
						 $("#subjectOfFormalInvestigation1").attr("checked", true); 
					 }else if(con.subjectOfFormalInvestigation == 'false'){
						 $("#subjectOfFormalInvestigationResStr").html("No");
						 $("#subjectOfFormalInvestigation2").attr("checked", true);
					 }
					 $("#subjectOfFormalInvestigationCommentsStr").html(con.subjectOfFormalInvestigationComments);
					 
					 if(con.willingToAbideByCharities == 'true'){
						 $("#willingToAbideByCharitiesResStr").html("Yes");
						 $("#willingToAbideByCharities1").attr("checked", true); 
					 }else if(con.willingToAbideByCharities == 'false'){
						 $("#willingToAbideByCharitiesResStr").html("No");
						 $("#willingToAbideByCharities2").attr("checked", true);
					 }
					 
					 $("#additionalInformationOfCostStr").html(con.additionalInformationOfCost);
				 }
				 if(costsheet){
			  	    	var htmlStr = formatViewFirstRow();
			  	          $.each(costsheet, function(id, value) {
			  	        	  htmlStr += formatViewFunctionalityTable(id, value);
			  	          });
			  	          $("#priceScheduleIdStr").empty().html(htmlStr);
			  	      }
			 }
		 });
	}
  
  function  formatViewFunctionalityTable(key, value){
		var htmlStr = '<tr>'
						+ '<td class="new-2">'+value.functionalityStr+'</td>'
						+ '<td class="new-2">'+value.callOutMonToFri+'</td>'
						+ '<td class="new-2">'+value.callOutWeekends+'</td>'
	                    + '<td class="new-2">'+value.hourlyRate+'</td>'
	                    + '<td class="new-2">'+value.hourlyRateWeekends+'</td>'
                    + '</tr>';
                  
		return htmlStr;
	}
  
  function formatViewFirstRow(){
		var htmlStr = '<tr>'
					+'<td class="new-2"><strong>Trade</strong></td>'
					+'<td class="new-2"><strong>Call out charge (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Call out charge (weekends & bank holidays)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (weekends & bank holidays)</strong></td>'
					+'</tr>';
			return htmlStr;
			}
	
  
  function setContractorStep4Data(){
		 $.getJSON(contextPath+"/admin/loadContractorStep4Info.htm?contractorId="+id, function(response) {
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

/*------ for edit(not used now)------------*/		 
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
  $('#allContractorsId').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/contractorTable.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});
  
  $('#resetPassword').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/changeContractorPassword.htm?id="+id,
	      type: "post",
	      dataType: "json",
	      success: function(data){
	    	  if(data.success == true){
	    	  $("#password").html(data.password);
	    	  $("#commonMessageSuccessId").html("Password Successfully Reset");
	    	  $("#commonMessageSuccessId").fadeIn();
				setTimeout(function(){
					$("#commonMessageSuccessId").fadeOut(4000);
				}, 4000);
	    	  }
	    	  else{
					$("#commonMessageErrorId").html("Password could not be reset");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
				}
	      },
	      error:function(){
	          alert("Error");
	      }
	  });
	});
 