
var rules;
var messages;

$(document).ready(function(){
	$("#updatePropertyDetails").click(function(event){
		if($("#fPropertyDetails").valid() == true){
		  var formData = form2object('fPropertyDetails', '.', true,function(node)
		          {
		                if (node.id && node.id.match(/callbackTest/))
		                {
		                        return { name: node.id, value: node.innerHTML };
		                }
		        });
		  var postData = JSON.stringify(formData, null, '\t');
			$.ajax({
			    url : contextPath+"/property/updateProperty.htm",
			    type: "POST",
			    data : postData,
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR) 
			    {	
			    	if(response.success == true){
			    		window.location.href= contextPath+"/property/redirectHMOLicence.htm";
			    	}else{
			    		
			    	}
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
		}
		else{
			return false;
		}
	  });
	
	$("#savePropertyDetails").click(function(event){
		
		if($("#fPropertyDetails").valid() == true){
			
		  var formData = form2object('fPropertyDetails', '.', true,function(node){
		                if (node.id && node.id.match(/callbackTest/))
		                {
		                        return { name: node.id, value: node.innerHTML };
		                }
		        });
		  var postData = JSON.stringify(formData, null, '\t');
			$.ajax({
			    url : contextPath+"/property/saveProperty.htm",
			    type: "POST",
			    data : postData,
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	if(response.success == true){
			    		window.location.href= contextPath+"/property/redirectHMOLicence.htm";
			    	}else{
			    		
			    	}
			    }
			});
		}
		event.stopImmediatePropagation();
	  });
	
	$("#next").click(function(event){
		$.ajax({
		    url : contextPath+"/property/proceed.htm",
		    type: "GET",
		    success:function(response, textStatus, jqXHR){
		    	$("#containerId").html(response);
		    }
		});
		event.stopImmediatePropagation();
	  });
	
	$( "#saveHMOLicencePage" ).click(function() {
		
		 if($('#electricalInstallation1').is(':checked')){
	   		 var electricalInstallationFile = $("#electricalInstallationFileID").val();
			 var electricalInstallationFileName = $("#electricalInstallationFileName").html();
	   		if( electricalInstallationFile.length == 0 && electricalInstallationFileName.length == 0){
				var p = $("#electricalInstallation2").offset().top;
				var topMargin = p - 12;
				$("#electricalInstallationFileID").show();
				$("#electricalInstallationFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		 if($('#electricalTest1').is(':checked')){
	   		 var electricalTestFile = $("#electricalTestFileID").val();
			 var electricalTestFileName = $("#electricalTestFileName").html();
	   		if( electricalTestFile.length == 0 && electricalTestFileName.length == 0){
				var p = $("#electricalTest2").offset().top;
				var topMargin = p - 12;
				$("#electricalTestFileID").show();
				$("#electricalTestFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		 if($('#gasCertificate1').is(':checked')){
	   		 var gasCertificateFile = $("#gasCertificateFileID").val();
			 var gasCertificateFileName = $("#gasCertificateFileName").html();
	   		if( gasCertificateFile.length == 0 && gasCertificateFileName.length == 0){
				var p = $("#gasCertificate2").offset().top;
				var topMargin = p - 12;
				$("#gasCertificateFileID").show();
				$("#gasCertificateFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		 if($('#energyPerformance1').is(':checked')){
	   		 var energyPerformanceFile = $("#energyPerformanceFileID").val();
			 var energyPerformanceFileName = $("#energyPerformanceFileName").html();
	   		if( energyPerformanceFile.length == 0 && energyPerformanceFileName.length == 0){
				var p = $("#energyPerformance2").offset().top;
				var topMargin = p - 12;
				$("#energyPerformanceFileID").show();
				$("#energyPerformanceFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		 if($('#centralHeatingSystem1').is(':checked')){
	   		 var centralHeatingSystemFile = $("#centralHeatingSystemFileID").val();
			 var centralHeatingSystemFileName = $("#centralHeatingSystemFileName").html();
	   		if( centralHeatingSystemFile.length == 0 && centralHeatingSystemFileName.length == 0){
				var p = $("#centralHeatingSystem2").offset().top;
				var topMargin = p - 12;
				$("#centralHeatingSystemFileID").show();
				$("#centralHeatingSystemFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		 if($('#buildingInsaurance1').is(':checked')){
	   		 var buildingInsauranceFile = $("#buildingInsauranceFileID").val();
			 var buildingInsauranceFileName = $("#buildingInsauranceFileName").html();
	   		if( buildingInsauranceFile.length == 0 && buildingInsauranceFileName.length == 0){
				var p = $("#buildingInsaurance2").offset().top;
				var topMargin = p - 12;
				$("#buildingInsauranceFileID").show();
				$("#buildingInsauranceFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		
		if($('#asbestosSurvey1').is(':checked')){
	   		 var asbestosSurveyFile = $("#asbestosSurveyFileID").val();
			 var asbestosSurveyFileName = $("#asbestosSurveyFileName").html();
	   		if( asbestosSurveyFile.length == 0 && asbestosSurveyFileName.length == 0){
				var p = $("#asbestosSurvey2").offset().top;
				var topMargin = p - 12;
				$("#asbestosSurveyFileID").show();
				$("#asbestosSurveyFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#periodicInspectionOfWaterSupply1').is(':checked')){
	   		 var periodicInspectionOfWaterSupplyFile = $("#periodicInspectionOfWaterSupplyFileID").val();
			 var periodicInspectionOfWaterSupplyFileName = $("#periodicInspectionOfWaterSupplyFileName").html();
	   		if( periodicInspectionOfWaterSupplyFile.length == 0 && periodicInspectionOfWaterSupplyFileName.length == 0){
				var p = $("#periodicInspectionOfWaterSupply2").offset().top;
				var topMargin = p - 12;
				$("#periodicInspectionOfWaterSupplyFileID").show();
				$("#periodicInspectionOfWaterSupplyFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#landTitleRegisteryDocument1').is(':checked')){
	   		 var landTitleRegisteryDocumentFile = $("#landTitleRegisteryDocumentFileID").val();
			 var landTitleRegisteryDocumentFileName = $("#landTitleRegisteryDocumentFileName").html();
	   		if( landTitleRegisteryDocumentFile.length == 0 && landTitleRegisteryDocumentFileName.length == 0){
				var p = $("#landTitleRegisteryDocument2").offset().top;
				var topMargin = p - 12;
				$("#landTitleRegisteryDocumentFileID").show();
				$("#landTitleRegisteryDocumentFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#inventoryForProperty1').is(':checked')){
	   		 var inventoryForPropertyFile = $("#inventoryForPropertyFileID").val();
			 var inventoryForPropertyFileName = $("#inventoryForPropertyFileName").html();
	   		if( inventoryForPropertyFile.length == 0 && inventoryForPropertyFileName.length == 0){
				var p = $("#inventoryForProperty2").offset().top;
				var topMargin = p - 12;
				$("#inventoryForPropertyFileID").show();
				$("#inventoryForPropertyFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#landlordInsauranceForContent1').is(':checked')){
	   		 var landlordInsauranceForContentFile = $("#landlordInsauranceForContentFileID").val();
			 var landlordInsauranceForContentFileName = $("#landlordInsauranceForContentFileName").html();
	   		if( landlordInsauranceForContentFile.length == 0 && landlordInsauranceForContentFileName.length == 0){
				var p = $("#landlordInsauranceForContent2").offset().top;
				var topMargin = p - 12;
				$("#landlordInsauranceForContentFileID").show();
				$("#landlordInsauranceForContentFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		
		if($('#windowAndDoorWarrantee1').is(':checked')){
	   		 var windowAndDoorWarranteeFile = $("#windowAndDoorWarranteeFileID").val();
			 var windowAndDoorWarranteeFileName = $("#windowAndDoorWarranteeFileName").html();
	   		if( windowAndDoorWarranteeFile.length == 0 && windowAndDoorWarranteeFileName.length == 0){
				var p = $("#windowAndDoorWarrantee2").offset().top;
				var topMargin = p - 12;
				$("#windowAndDoorWarranteeFileID").show();
				$("#windowAndDoorWarranteeFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#fittedHobAndOven1').is(':checked')){
	   		 var fittedHobAndOvenFile = $("#fittedHobAndOvenFileID").val();
			 var fittedHobAndOvenFileName = $("#fittedHobAndOvenFileName").html();
	   		if( fittedHobAndOvenFile.length == 0 && fittedHobAndOvenFileName.length == 0){
				var p = $("#fittedHobAndOven2").offset().top;
				var topMargin = p - 12;
				$("#fittedHobAndOvenFileID").show();
				$("#fittedHobAndOvenFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#electricShower1').is(':checked')){
	   		 var electricShowerFile = $("#electricShowerFileID").val();
			 var electricShowerFileName = $("#electricShowerFileName").html();
	   		if( electricShowerFile.length == 0 && electricShowerFileName.length == 0){
				var p = $("#electricShower2").offset().top;
				var topMargin = p - 12;
				$("#electricShowerFileID").show();
				$("#electricShowerFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#electricFires1').is(':checked')){
	   		 var electricFiresFile = $("#electricFiresFileID").val();
			 var electricFiresFileName = $("#electricFiresFileName").html();
	   		if( electricFiresFile.length == 0 && electricFiresFileName.length == 0){
				var p = $("#electricFires2").offset().top;
				var topMargin = p - 12;
				$("#electricFiresFileID").show();
				$("#electricFiresFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#manualForCentralHeating1').is(':checked')){
	   		 var manualForCentralHeatingFile = $("#manualForCentralHeatingFileID").val();
			 var manualForCentralHeatingFileName = $("#manualForCentralHeatingFileName").html();
	   		if( manualForCentralHeatingFile.length == 0 && manualForCentralHeatingFileName.length == 0){
				var p = $("#manualForCentralHeating2").offset().top;
				var topMargin = p - 12;
				$("#manualForCentralHeatingFileID").show();
				$("#manualForCentralHeatingFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		

		if($('#timerForCentralHeating1').is(':checked')){
	   		 var timerForCentralHeatingFile = $("#timerForCentralHeatingFileID").val();
			 var timerForCentralHeatingFileName = $("#timerForCentralHeatingFileName").html();
	   		if( timerForCentralHeatingFile.length == 0 && timerForCentralHeatingFileName.length == 0){
				var p = $("#timerForCentralHeating2").offset().top;
				var topMargin = p - 12;
				$("#timerForCentralHeatingFileID").show();
				$("#timerForCentralHeatingFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#manualForBoiler1').is(':checked')){
	   		 var manualForBoilerFile = $("#manualForBoilerFileID").val();
			 var manualForBoilerFileName = $("#manualForBoilerFileName").html();
	   		if( manualForBoilerFile.length == 0 && manualForBoilerFileName.length == 0){
				var p = $("#manualForBoiler2").offset().top;
				var topMargin = p - 12;
				$("#manualForBoilerFileID").show();
				$("#manualForBoilerFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		if($('#manualForFittedOven1').is(':checked')){
	   		 var manualForFittedOvenFile = $("#manualForFittedOvenFileID").val();
			 var manualForFittedOvenFileName = $("#manualForFittedOvenFileName").html();
	   		if( manualForFittedOvenFile.length == 0 && manualForFittedOvenFileName.length == 0){
				var p = $("#manualForFittedOven2").offset().top;
				var topMargin = p - 12;
				$("#manualForFittedOvenFileID").show();
				$("#manualForFittedOvenFileID").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		
		
		if(flag == 'true' || flag == true){
			return false;
		}
		$( "#fHMOLicencePage" ).submit();
	});
	

	
	$( "#dhsCriteriaASave" ).click(function() {

	  	  if($('#insulation270mm1').is(':checked')){
	  		  var value = $("#installationDate").val();
	      	  if(value.length > 0){
	      		  $("#installationDateLabel").hide();
	      	  }else{
	      		  $("#installationDateLabel").show();
	      		  return false;
	      	  }
	  	  }
		 if($('#adequateHeating1').is(':checked')){
   		  var value = $("#boilerAge").val();
       	  if(value == ""){
       		  $("#boilerAgeLabel").show();
       		  return false;
       	  }else{
       		  $("#boilerAgeLabel").hide();
       	  }
   	  }
		 
		 if($('#needRadonRiskReport1').is(':checked')){
	   		 var needRadonRiskReportFile = $("#needRadonRiskReportFile").val();
			 var needRadonRiskReportFileName = $("#needRadonRiskReportFileName").html();
	   		if( needRadonRiskReportFile.length == 0 && needRadonRiskReportFileName.length == 0){
				var p = $("#needRadonRiskReportFile").offset().top;
				var topMargin = p - 12;
				$("#needRadonRiskReportFileDiv").show();
				$("#needRadonRiskReportFile").focus();
				showErrorMessage("Please attach file.", topMargin+"px");
				return false;
			}
	   	  }
		 
		 if($('#propertyMeetStandards2').is(':checked')){
				var whereITFails = $("#whereITFails").val();
				if(whereITFails == null || whereITFails.length == 0){
					$("#propertyMeetStandardsLabel").show();
					return false;
				}else{
					$("#propertyMeetStandardsLabel").hide();
				}
			}
			if($('#upgradeProperty1').is(':checked')){
				var workCompletedBy = $("#workCompletedBy").val();
				if(workCompletedBy == null || workCompletedBy.length == 0){
					$("#workCompletedBySpanId").html("Please enter date.");
					
					return false;
				}else{
					$("#workCompletedBySpanId").empty();
				}
			}
		 
		$( "#fDHS-Criteria-APage" ).submit();
	});
	
	$( "#dhsCriteriaBSave" ).click(function() {
		var maxSize = 10000000;
		var burglarAlarmFile = $('#burglarAlarmSystemFile').val();
		if(burglarAlarmFile){
			 var fsize = $('#burglarAlarmSystemFile')[0].files[0].size;
			 if((fsize > maxSize) == 'true' || (fsize > maxSize) == true){
				$("#burglarAlarmLabel").show();
				$("#burglarAlarmLabel").html("Max Size is 10Mb");
				$("#burglarAlarmSystemFile").focus();
				return false;
			}else{
				$("#writtenHealthPolicyFileIDLbl").hide();
			}
		}
		$( "#fDHS-Criteria-BPage" ).submit();
	});
	
	$( "#dhsCriteriaCSave" ).click(function() {
		$( "#fDHS-Criteria-CPage" ).submit();
	});
	
	$("#dhsCriteriaDSave" ).click(function() {
		if($('#buildingRegulation2').is(':checked')){
			var buildingRegulationDate = $("#buildingRegulationDate").val();
			if(buildingRegulationDate == null || buildingRegulationDate.length == 0){
				$("#buildingRegulationDateSpanId").show();
				return false;
			}else{
				$("#buildingRegulationDateSpanId").hide();
			}
		}
		$( "#fDHS-Criteria-DPage" ).submit();
	});
	
	$("#marketingInformationSubmit" ).click(function(event) {
		if($("#fMarketingInfo").valid() == true){
			 var files = $('#furnishedPropertyFile')[0].files;
			 var counter = 0;
			 var isFileInValid = false;
			 $.each(files, function( index, value ) {
				 var fsize = $('#furnishedPropertyFile')[0].files[index].size;
				 
				 var fileToUpload = $('#furnishedPropertyFile')[0].files[index];
					 
				if(fileToUpload.type.match(/image.*/)){
					 var maxSize = 10000000;
					 if((fsize > maxSize) == 'true' || (fsize > maxSize) == true){
						$("#furnishedPropertyFileIDLbl").show();
						$("#furnishedPropertyFileIDLbl").html("Cannot upload file having size more than 10Mb");
						isFileInValid = true;
					}else{
						$("#writtenHealthPolicyFileIDLbl").hide();
					}
					 counter++;
				}else{
					$("#furnishedPropertyFileIDLbl").show();
					$("#furnishedPropertyFileIDLbl").html("Only images can be uploaded.");
					isFileInValid = true;
				}
			});
			 
			 if(counter > 15){
				 $("#furnishedPropertyFile").focus();
				 $("#furnishedPropertyFileIDLbl").show();
				 $("#furnishedPropertyFileIDLbl").html("Cannot select more than 15 files");
				 $('#furnishedPropertyFile').val(null);
				 isFileInValid = true;
			 }
			 if(isFileInValid == 'false' || isFileInValid == false){
				  $("#fMarketingInfo").submit(); 
			 }else{
				 $('#furnishedPropertyFile').val(null);
			 }
		}
		event.stopImmediatePropagation();
	});
	

	$("#submitProperty" ).click(function() {
			window.location.href = contextPath+"/property/redirectReviewProperty.htm";
	});
	
  // ---------------------- Back Button -----------------------
	$("#dhsCriteriaABack").click(function(event){
		 window.location.href = contextPath+"/property/redirectHMOLicence.htm";
	  });
	
	$("#dhsCriteriaBBack").click(function(event){
		 window.location.href = contextPath+"/property/redirectDHSCriteriaA.htm";
	});
	
	$("#dhsCriteriaCBack").click(function(event){
		 window.location.href = contextPath+"/property/redirectDHSCriteriaB.htm";
	});
	
	$("#dhsCriteriaDBack").click(function(event){
		 window.location.href = contextPath+"/property/redirectDHSCriteriaC.htm";
	});
	
	$("#marketingInformationBack").click(function(event){
		 window.location.href = contextPath+"/property/redirectDHSCriteriaD.htm";
	});
	 
  // ---------------------- Common Function -----------------------
  
  $.fn.serializeObject = function()
  {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function() {
          if (o[this.name] !== undefined) {
              if (!o[this.name].push) {
                  o[this.name] = [o[this.name]];
              }
              o[this.name].push(this.value || '');
          } else {
              o[this.name] = this.value || '';
          }
      });
      return o;
  	};
	

// ---------------------- Common Function -----------------------

	//----------- Page Redirection Only --------------
	
  	$("#registerProperty").click(function(){
		  $.ajax({
		      url: contextPath+"/property/redirectRegisterProperty.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
  	
  	$("#landlordProfilePH").click(function(){
		  window.location.href = contextPath+"/landlord/redirectCompleteProfile.htm";
	});
  	
  	$("#editLandlordPH").click(function(){
		  window.location.href = contextPath+"/landlord/redirectCompleteEditProfile.htm";
	});
	
	$("#changeLandlordPasswordPH").click(function(){
		  window.location.href = contextPath+"/landlord/redirectCompleteChangePassword.htm";
	});
	
	$("#myPropertyPH").click(function(){
		 window.location.href = contextPath+"/landlord/redirectCompleteProperties.htm";
	});
	
	
	$("#dhsMyPropertiesBtnLink").click(function(){
		 window.location.href = contextPath+"/landlord/redirectCompleteProperties.htm";
	});
	
	$("#registerPropertyPH").click(function(){
		  window.location.href = contextPath+"/landlord/redirectCompleteRegisterProperty.htm";
	});
	
	/*-------------------------------------------------------------------------------------------------------------------------*/
	
	
}); 


