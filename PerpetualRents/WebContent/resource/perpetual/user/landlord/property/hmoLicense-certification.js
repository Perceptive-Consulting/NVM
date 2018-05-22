		var functionalityId;
		var globalResponse;
		var globalAnsObj;
		$(document).ready(function(){
			
			$(".FileView").fancybox({helpers: { title : { type : 'float' }}});  //to view image by fancybox
			
			$(".loader").css('height', $(document).height());
			$(".loader").css('display', 'block');
			setTimeout(function() {
				setHmoLicenceData();
				setPropetyStatus();
				$(".loader").css('display', 'none');
  	 		 }, 500);
			
				 var chkArray = [];
				 $("#sendQuotationId").click(function(event){
					 chkArray = [];
					 $(".chk:checked").each(function() {
						 chkArray.push($(this).val());
					 });
					 var jobsDescription = $("#jobsDescription").val();
					 if(chkArray == null || chkArray.length == 0){
						 event.preventDefault();
						 $("#invitationErrorMessageId").hide();
			    		  $("#invitationErrorMessageId").html("Please select a Contractor to Invite.");
			    		  $("#invitationErrorMessageId").show();
			    		  setTimeout(function(){
			    			  $("#invitationErrorMessageId").fadeOut(4000);
				    	  }, 4000);
						 return false;
					 }
					 if(jobsDescription == null || jobsDescription.length == 0){
						 event.preventDefault();
						 $("#invitationErrorMessageId").hide();
			    		  $("#invitationErrorMessageId").html("Please Enter a valid Description.");
			    		  $("#invitationErrorMessageId").show();
			    		  setTimeout(function(){
			    			  $("#invitationErrorMessageId").fadeOut(4000);
				    	  }, 4000);
						 return false;
					 }
					 		 
					 var functionality = $(".functionalityId").val();
					 
					 $.ajax({
						 beforeSend: function(){
								$(".loader").css('height', "100%");
								$(".loader").css('display', 'block');				    
						 },
					      url: contextPath+"/landlord/inviteContractors.htm",
					      type: "post",
					      dataType : "json",
					      data: {dataStr : chkArray, jobsDescription : jobsDescription , functionalityId : functionality},
					      success: function(response){
					    	  $(".loader").css('display', 'none');
					    	  if(response.success == true){
					    		  $('.remodal-cancel').click();
						    		  $(".loader").css('display', 'none');
						    		  setAssignedJobs();  
					    	  }else{
					    		  var conObj = response.data;
					    		  $("#invitationErrorMessageId").hide();
					    		  $('input:checkbox[value="' + conObj.id + '"]').attr('checked', false);
					    		  $("#invitationErrorMessageId").html(conObj.companyName + " has been already Invited.");
					    		  $("#invitationErrorMessageId").show();
					    		  setTimeout(function(){
					    			  $("#invitationErrorMessageId").fadeOut(4000);
						    	  }, 4000);
					    	  }
					      },
					      error:function(){
					          $("#containerId").html('There is error while submit');
					      }
					  });
					 event.stopImmediatePropagation();
				});
		});
		
		function setHmoLicenceData(){
			 $.getJSON(contextPath+"/property/loadHMOLicense.htm",
					    function(response, textStatus, jqXHR){
				  			var cPath = contextPath+"/";
				  			var obj = response.data;
				  			globalResponse = obj;
				  			globalAnsObj = response.ansObj;
			  				if(obj){
				  				if(obj.hmoLicence.response == 'true'){
				  					showData('#licenceDIVID','licenceNumber');
				  					$("#hmoLicence1").attr("checked", true);
				  					if(obj.licenceNumber.comments != 'null'){
										$("#licenceNumber").val(obj.licenceNumber.comments);
										showData('#licenceDIVID','licenceNumber');
									}
				  				}else if(obj.hmoLicence.response == 'false'){
				  					$("#hmoLicence2").attr("checked", true);
				  					hideLabel('#licenceDIVID','licenceNumber');
				  				}else if(obj.hmoLicence.response == 'equalToTrue'){
				  					$("#hmoLicence3").attr("checked", true);
				  					showTickImage("licenceNumber");
				  				}
								
					 			if(obj.electricalInstallation){
					 				if(obj.electricalInstallation.response == 'true'){
					  					$("#electricalInstallation1").attr("checked", true);
										$("#electricalInstallationYes").show();

						 				if(obj.electricalInstallation.fileName){
						 					$("#electricalInstallation1").attr("checked", true);
						 					$("#electricalInstallationFileDisplay").show();
							 				$("#electricalInstallationFileName").html(obj.electricalInstallation.fileName);
							 				if(obj.electricalInstallation.isImage){
							 					var path = obj.electricalInstallation.filePath;
							 					$("#electricalInstallationFileView").show();
							 					$("#electricalInstallationFileView").attr("href", cPath + path );
							 				}
						 				}
					  				}else if(obj.electricalInstallation.response == 'false'){
					  					$("#electricalInstallation2").attr("checked", true);
					  					$("#electricalInstallationNo").show();
					  				}else if(obj.electricalInstallation.response == 'later'){
					  					$("#electricalInstallation3").attr("checked", true);
					  					uploadLater('electricalInstallation');
					  				}
					 			}
					 			
					 			if(obj.electricalTest){
					 				if(obj.electricalTest.response == 'true'){
					  					$("#electricalTest1").attr("checked", true);
					  					$("#electricalTestYes").show();
					  					
					  					if(obj.electricalTest.fileName){
						 					$("#electricalTest1").attr("checked", true);
						 					$("#electricalTestFileDisplay").show();
							 				$("#electricalTestFileName").html(obj.electricalTest.fileName);
							 				if(obj.electricalTest.isImage){
							 					var path = obj.electricalTest.filePath;
							 					$("#electricalTestFileView").show();
								 				$("#electricalTestFileView").attr("href", cPath + path );	
							 				}
							 				
						 				}
					  				}else if(obj.electricalTest.response == 'false'){
					  					$("#electricalTest2").attr("checked", true);
					  					$("#electricalTestNo").show();
					  				}else if(obj.electricalTest.response == 'later'){
					  					$("#electricalTest3").attr("checked", true);
					  					uploadLater('electricalTest');
					  				}	
					 			}
					 			if(obj.gasCertificate){
					 				if(obj.gasCertificate.response == 'true'){
					  					$("#gasCertificate1").attr("checked", true);
					  					$("#gasCertificateYes").show();
					  					
					  					if(obj.gasCertificate.fileName){
						 					$("#gasCertificate1").attr("checked", true);
						 					$("#gasCertificateFileDisplay").show();
							 				$("#gasCertificateFileName").html(obj.gasCertificate.fileName);
							 				if(obj.gasCertificate.isImage){
							 					var path = obj.gasCertificate.filePath;
							 					$("#gasCertificateFileView").show();
								 				$("#gasCertificateFileView").attr("href", cPath + path );
							 				}
						 				} 
					  					
					  				}else if(obj.gasCertificate.response == 'false'){
					  					$("#gasCertificate2").attr("checked", true);
					  					$("#gasCertificateNo").show();
					  				}else if(obj.gasCertificate.response == 'later'){
					  					$("#gasCertificate3").attr("checked", true);
					  					uploadLater('gasCertificate');
					  				}	
					 			}
					 			if(obj.energyPerformance){
					 				if(obj.energyPerformance.response == 'true'){
					  					$("#energyPerformance1").attr("checked", true);
					  					$("#energyPerformanceYes").show();
					  					if(obj.energyPerformance.fileName){
						 					$("#energyPerformance1").attr("checked", true);
						 					$("#energyPerformanceFileDisplay").show();
							 				$("#energyPerformanceFileName").html(obj.energyPerformance.fileName);
							 				if(obj.energyPerformance.isImage){
							 					var path = obj.energyPerformance.filePath;
							 					$("#energyPerformanceFileView").show();
								 				$("#energyPerformanceFileView").attr("href", cPath + path );
							 				}
							 				
						 				}
					  				}else if(obj.energyPerformance.response == 'false'){
					  					$("#energyPerformance2").attr("checked", true);
					  					$("#energyPerformanceNo").show();
					  				}else if(obj.energyPerformance.response == 'later'){
					  					$("#energyPerformance3").attr("checked", true);
					  					uploadLater('energyPerformance');
					  				}
					 			}
					 			if(obj.centralHeatingSystem){
					 				if(obj.centralHeatingSystem.response == 'true'){
					  					$("#centralHeatingSystem1").attr("checked", true);
					  					$("#centralHeatingSystemYes").show();
					  					if(obj.centralHeatingSystem.fileName){
						 					$("#centralHeatingSystem1").attr("checked", true);
						 					$("#centralHeatingSystemFileDisplay").show();
							 				$("#centralHeatingSystemFileName").html(obj.centralHeatingSystem.fileName);
							 				if(obj.centralHeatingSystem.isImage){
							 					var path = obj.centralHeatingSystem.filePath;
							 					$("#centralHeatingSystemFileView").show();
								 				$("#centralHeatingSystemFileView").attr("href", cPath + path );
							 				}
						 				}
					  				}else if(obj.centralHeatingSystem.response == 'false'){
					  					$("#centralHeatingSystem2").attr("checked", true);
					  					$("#centralHeatingSystemNo").show();
					  				}else if(obj.centralHeatingSystem.response == 'later'){
					  					$("#centralHeatingSystem3").attr("checked", true);
					  					uploadLater('centralHeatingSystem');
					  				}else if(obj.centralHeatingSystem.response == 'N/A'){
					  					$("#centralHeatingSystem4").attr("checked", true);
					  					notApplicable('centralHeatingSystem');
					  				}	
					 				$("#centralHeatingSystemComments").val(obj.centralHeatingSystem.comments);
					 				
					 			}
					 			if(obj.buildingInsaurance){
					 				if(obj.buildingInsaurance.response == 'true'){
					  					$("#buildingInsaurance1").attr("checked", true);
					  					$("#buildingInsauranceYes").show();
					  					if(obj.buildingInsaurance.fileName){
						 					$("#buildingInsaurance1").attr("checked", true);
						 					$("#buildingInsauranceFileDisplay").show();
							 				$("#buildingInsauranceFileName").html(obj.buildingInsaurance.fileName);
							 				if(obj.buildingInsaurance.isImage){
							 					var path = obj.buildingInsaurance.filePath;
							 					$("#buildingInsauranceFileView").show();
								 				$("#buildingInsauranceFileView").attr("href", cPath + path );
							 				}
							 				
						 				}
					  				}else if(obj.buildingInsaurance.response == 'false'){
					  					$("#buildingInsaurance2").attr("checked", true);
					  					$("#buildingInsauranceNo").show();
					  				}else if(obj.buildingInsaurance.response == 'later'){
					  					$("#buildingInsaurance3").attr("checked", true);
					  					uploadLater('buildingInsaurance');
					  				}	
					 			}
					 			
					 			if(obj.asbestosSurvey){
					 				if(obj.asbestosSurvey.response == 'true'){
					  					$("#asbestosSurvey1").attr("checked", true);
					  					$("#asbestosSurveyYes").show();
					  					if(obj.asbestosSurvey.fileName){
						 					$("#asbestosSurvey1").attr("checked", true);
						 					$("#asbestosSurveyFileDisplay").show();
							 				$("#asbestosSurveyFileName").html(obj.asbestosSurvey.fileName);
							 				if(obj.asbestosSurvey.isImage){
							 					var path = obj.asbestosSurvey.filePath;
							 					$("#asbestosSurveyFileView").show();
								 				$("#asbestosSurveyFileView").attr("href", cPath + path );
							 				}
							 				
						 				}
					  				}else if(obj.asbestosSurvey.response == 'false'){
					  					$("#asbestosSurvey2").attr("checked", true);
					  					$("#asbestosSurveyNo").show();
					  				}else if(obj.asbestosSurvey.response == 'later'){
					  					$("#asbestosSurvey3").attr("checked", true);
					  					uploadLater('asbestosSurvey');
					  				}		
					 			}
					 			if(obj.periodicInspectionOfWaterSupply){
					 				if(obj.periodicInspectionOfWaterSupply.response == 'true'){
					  					$("#periodicInspectionOfWaterSupply1").attr("checked", true);
					  					$("#periodicInspectionOfWaterSupplyYes").show();
					  					if(obj.periodicInspectionOfWaterSupply.fileName){
						 					$("#periodicInspectionOfWaterSupply1").attr("checked", true);
						 					$("#periodicInspectionOfWaterSupplyFileDisplay").show();
						 					$("#periodicInspectionOfWaterSupplyFileName").html(obj.periodicInspectionOfWaterSupply.fileName);
						 					if(obj.periodicInspectionOfWaterSupply.isImage){
						 						var path = obj.periodicInspectionOfWaterSupply.filePath;
						 						$("#periodicInspectionOfWaterSupplyFileView").show();
								 				$("#periodicInspectionOfWaterSupplyFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.periodicInspectionOfWaterSupply.response == 'false'){
					  					$("#periodicInspectionOfWaterSupply2").attr("checked", true);
					  					$("#periodicInspectionOfWaterSupplyNo").show();
					  				}else if(obj.periodicInspectionOfWaterSupply.response == 'later'){
					  					$("#periodicInspectionOfWaterSupply3").attr("checked", true);
					  					uploadLater('periodicInspectionOfWaterSupply');
					  				}		
					 			}
					 			if(obj.keySet){
					 				if(obj.keySet.response == 'true'){
					  					$("#keySet1").attr("checked", true);
					  					$("#keySetYes").show();
					  					if(obj.keySet.fileName){
						 					$("#keySet1").attr("checked", true);
						 				}
					  				}else if(obj.keySet.response == 'false'){
					  					$("#keySet2").attr("checked", true);
					  					$("#keySetNo").show();
					  				}		
					 			}
					 			
					 			if(obj.landTitleRegisteryDocument){
					 				if(obj.landTitleRegisteryDocument.response == 'true'){
					  					$("#landTitleRegisteryDocument1").attr("checked", true);
					  					$("#landTitleRegisteryDocumentYes").show();
					  					if(obj.landTitleRegisteryDocument.fileName){
						 					$("#landTitleRegisteryDocument1").attr("checked", true);
						 					$("#landTitleRegisteryDocumentFileDisplay").show();
						 					$("#landTitleRegisteryDocumentFileName").html(obj.landTitleRegisteryDocument.fileName);
						 					if(obj.landTitleRegisteryDocument.isImage){
						 						var path = obj.landTitleRegisteryDocument.filePath;
						 						$("#landTitleRegisteryDocumentFileView").show();
								 				$("#landTitleRegisteryDocumentFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.landTitleRegisteryDocument.response == 'false'){
					  					$("#landTitleRegisteryDocument2").attr("checked", true);
					  					$("#landTitleRegisteryDocumentNo").show();
					  				}else if(obj.landTitleRegisteryDocument.response == 'later'){
					  					$("#landTitleRegisteryDocument3").attr("checked", true);
					  					uploadLater('landTitleRegisteryDocument');
					  				}		
					 			}
					 			
					 			if(obj.inventoryForProperty){
					 				if(obj.inventoryForProperty.response == 'true'){
					  					$("#inventoryForProperty1").attr("checked", true);
					  					$("#inventoryForPropertyYes").show();
					  					if(obj.inventoryForProperty.fileName){
						 					$("#inventoryForProperty1").attr("checked", true);
						 					$("#inventoryForPropertyFileDisplay").show();
						 					$("#inventoryForPropertyFileName").html(obj.inventoryForProperty.fileName);
						 					if(obj.inventoryForProperty.isImage){
						 						var path = obj.inventoryForProperty.filePath;
						 						$("#inventoryForPropertyFileView").show();
								 				$("#inventoryForPropertyFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.inventoryForProperty.response == 'false'){
					  					$("#inventoryForProperty2").attr("checked", true);
					  					$("#inventoryForPropertyNo").show();
					  				}else if(obj.inventoryForProperty.response == 'later'){
					  					$("#inventoryForProperty3").attr("checked", true);
					  					uploadLater('inventoryForProperty');
					  				}		
					 			}
					 			
					 			if(obj.landlordInsauranceForContent){
					 				if(obj.landlordInsauranceForContent.response == 'true'){
					  					$("#landlordInsauranceForContent1").attr("checked", true);
					  					$("#landlordInsauranceForContentYes").show();
					  					if(obj.landlordInsauranceForContent.fileName){
						 					$("#landlordInsauranceForContent1").attr("checked", true);
						 					$("#landlordInsauranceForContentFileDisplay").show();
						 					$("#landlordInsauranceForContentFileName").html(obj.landlordInsauranceForContent.fileName);
						 					if(obj.landlordInsauranceForContent.isImage){
						 						var path = obj.landlordInsauranceForContent.filePath;
						 						$("#landlordInsauranceForContentFileView").show();
								 				$("#landlordInsauranceForContentFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.landlordInsauranceForContent.response == 'false'){
					  					$("#landlordInsauranceForContent2").attr("checked", true);
					  					$("#landlordInsauranceForContentNo").show();
					  				}else if(obj.landlordInsauranceForContent.response == 'later'){
					  					$("#landlordInsauranceForContent3").attr("checked", true);
					  					uploadLater('landlordInsauranceForContent');
					  				}		
					 			}
					 			
					 			if(obj.windowAndDoorWarrantee){
					 				if(obj.windowAndDoorWarrantee.response == 'true'){
					  					$("#windowAndDoorWarrantee1").attr("checked", true);
					  					$("#windowAndDoorWarranteeYes").show();
					  					if(obj.windowAndDoorWarrantee.fileName){
						 					$("#windowAndDoorWarrantee1").attr("checked", true);
						 					$("#windowAndDoorWarranteeFileDisplay").show();
						 					$("#windowAndDoorWarranteeFileName").html(obj.windowAndDoorWarrantee.fileName);
						 					if(obj.windowAndDoorWarrantee.isImage){
						 						var path = obj.windowAndDoorWarrantee.filePath;
						 						$("#windowAndDoorWarranteeFileView").show();
								 				$("#windowAndDoorWarranteeFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.windowAndDoorWarrantee.response == 'false'){
					  					$("#windowAndDoorWarrantee2").attr("checked", true);
					  					$("#windowAndDoorWarranteeNo").show();
					  				}else if(obj.windowAndDoorWarrantee.response == 'later'){
					  					$("#windowAndDoorWarrantee3").attr("checked", true);
					  					uploadLater('windowAndDoorWarrantee');
					  				}		
					 			}
					 			
					 			if(obj.dampPoofcourse){
					 				if(obj.dampPoofcourse.response == 'true'){
					  					$("#dampPoofcourse1").attr("checked", true);
					  					$("#dampPoofcourseYes").show();
					  					if(obj.dampPoofcourse.fileName){
						 					$("#dampPoofcourse1").attr("checked", true);
						 					$("#dampPoofcourseFileDisplay").show();
						 					$("#dampPoofcourseFileName").html(obj.dampPoofcourse.fileName);
						 					if(obj.dampPoofcourse.isImage){
						 						var path = obj.dampPoofcourse.filePath;
						 						$("#dampPoofcourseFileView").show();
								 				$("#dampPoofcourseFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.dampPoofcourse.response == 'false'){
					  					$("#dampPoofcourse2").attr("checked", true);
					  					$("#dampPoofcourseNo").show();
					  				}else if(obj.dampPoofcourse.response == 'later'){
					  					$("#dampPoofcourse3").attr("checked", true);
					  					uploadLater('dampPoofcourse');
					  				}		
					 			}
					 			
					 			if(obj.fittedHobAndOven){
					 				if(obj.fittedHobAndOven.response == 'true'){
					  					$("#fittedHobAndOven1").attr("checked", true);
					  					$("#fittedHobAndOvenYes").show();
					  					if(obj.fittedHobAndOven.fileName){
						 					$("#fittedHobAndOven1").attr("checked", true);
						 					$("#fittedHobAndOvenFileDisplay").show();
						 					$("#fittedHobAndOvenFileName").html(obj.fittedHobAndOven.fileName);
						 					if(obj.fittedHobAndOven.isImage){
						 						var path = obj.fittedHobAndOven.filePath;
						 						$("#fittedHobAndOvenFileView").show();
								 				$("#fittedHobAndOvenFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.fittedHobAndOven.response == 'false'){
					  					$("#fittedHobAndOven2").attr("checked", true);
					  					$("#fittedHobAndOvenNo").show();
					  				}else if(obj.fittedHobAndOven.response == 'later'){
					  					$("#fittedHobAndOven3").attr("checked", true);
					  					uploadLater('fittedHobAndOven');
					  				}		
					 			}
					 			
					 			if(obj.fittedHobAndOven){
					 				if(obj.fittedHobAndOven.response == 'true'){
					  					$("#fittedHobAndOven1").attr("checked", true);
					  					$("#fittedHobAndOvenYes").show();
					  					if(obj.fittedHobAndOven.fileName){
						 					$("#fittedHobAndOven1").attr("checked", true);
						 					$("#fittedHobAndOvenFileDisplay").show();
						 					$("#fittedHobAndOvenFileName").html(obj.fittedHobAndOven.fileName);
						 					if(obj.fittedHobAndOven.isImage){
						 						var path = obj.fittedHobAndOven.filePath;
						 						$("#fittedHobAndOvenFileView").show();
								 				$("#fittedHobAndOvenFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.fittedHobAndOven.response == 'false'){
					  					$("#fittedHobAndOven2").attr("checked", true);
					  					$("#fittedHobAndOvenNo").show();
					  				}else if(obj.fittedHobAndOven.response == 'later'){
					  					$("#fittedHobAndOven3").attr("checked", true);
					  					uploadLater('fittedHobAndOven');
					  				}		
					 			}
					 			
					 			if(obj.electricShower){
					 				if(obj.electricShower.response == 'true'){
					  					$("#electricShower1").attr("checked", true);
					  					$("#electricShowerYes").show();
					  					if(obj.electricShower.fileName){
						 					$("#electricShower1").attr("checked", true);
						 					$("#electricShowerFileDisplay").show();
						 					$("#electricShowerFileName").html(obj.electricShower.fileName);
						 					if(obj.electricShower.isImage){
						 						var path = obj.electricShower.filePath;
						 						$("#electricShowerFileView").show();
								 				$("#electricShowerFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.electricShower.response == 'false'){
					  					$("#electricShower2").attr("checked", true);
					  					$("#electricShowerNo").show();
					  				}else if(obj.electricShower.response == 'later'){
					  					$("#electricShower3").attr("checked", true);
					  					uploadLater('electricShower');
					  				}		
					 			}
					 			
					 			if(obj.electricFires){
					 				if(obj.electricFires.response == 'true'){
					  					$("#electricFires1").attr("checked", true);
					  					$("#electricFiresYes").show();
					  					if(obj.electricFires.fileName){
						 					$("#electricFires1").attr("checked", true);
						 					$("#electricFiresFileDisplay").show();
						 					$("#electricFiresFileName").html(obj.electricFires.fileName);
						 					if(obj.electricFires.isImage){
						 						var path = obj.electricFires.filePath;
						 						$("#electricFiresFileView").show();
								 				$("#electricFiresFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.electricFires.response == 'false'){
					  					$("#electricFires2").attr("checked", true);
					  					$("#electricFiresNo").show();
					  				}else if(obj.electricFires.response == 'later'){
					  					$("#electricFires3").attr("checked", true);
					  					uploadLater('electricFires');
					  				}		
					 			}
					 			
					 			if(obj.manualForCentralHeating){
					 				if(obj.manualForCentralHeating.response == 'true'){
					  					$("#manualForCentralHeating1").attr("checked", true);
					  					$("#manualForCentralHeatingYes").show();
					  					if(obj.manualForCentralHeating.fileName){
						 					$("#manualForCentralHeating1").attr("checked", true);
						 					$("#manualForCentralHeatingFileDisplay").show();
						 					$("#manualForCentralHeatingFileName").html(obj.manualForCentralHeating.fileName);
						 					if(obj.manualForCentralHeating.isImage){
						 						var path = obj.manualForCentralHeating.filePath;
						 						$("#manualForCentralHeatingFileView").show();
								 				$("#manualForCentralHeatingFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.manualForCentralHeating.response == 'false'){
					  					$("#manualForCentralHeating2").attr("checked", true);
					  					$("#manualForCentralHeatingNo").show();
					  				}else if(obj.manualForCentralHeating.response == 'later'){
					  					$("#manualForCentralHeating3").attr("checked", true);
					  					uploadLater('manualForCentralHeating');
					  				}		
					 			}
					 			
					 			if(obj.timerForCentralHeating){
					 				if(obj.timerForCentralHeating.response == 'true'){
					  					$("#timerForCentralHeating1").attr("checked", true);
					  					$("#timerForCentralHeatingYes").show();
					  					if(obj.timerForCentralHeating.fileName){
						 					$("#timerForCentralHeating1").attr("checked", true);
						 					$("#timerForCentralHeatingFileDisplay").show();
						 					$("#timerForCentralHeatingFileName").html(obj.timerForCentralHeating.fileName);
						 					if(obj.timerForCentralHeating.isImage){
						 						var path = obj.timerForCentralHeating.filePath;
						 						$("#timerForCentralHeatingFileView").show();
								 				$("#timerForCentralHeatingFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.timerForCentralHeating.response == 'false'){
					  					$("#timerForCentralHeating2").attr("checked", true);
					  					$("#timerForCentralHeatingNo").show();
					  				}else if(obj.timerForCentralHeating.response == 'later'){
					  					$("#timerForCentralHeating3").attr("checked", true);
					  					uploadLater('timerForCentralHeating');
					  				}		
					 			}
					 			
					 			if(obj.manualForBoiler){
					 				if(obj.manualForBoiler.response == 'true'){
					  					$("#manualForBoiler1").attr("checked", true);
					  					$("#manualForBoilerYes").show();
					  					if(obj.manualForBoiler.fileName){
						 					$("#manualForBoiler1").attr("checked", true);
						 					$("#manualForBoilerFileDisplay").show();
						 					$("#manualForBoilerFileName").html(obj.manualForBoiler.fileName);
						 					if(obj.manualForBoiler.isImage){
						 						var path = obj.manualForBoiler.filePath;
						 						$("#manualForBoilerFileView").show();
								 				$("#manualForBoilerFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.manualForBoiler.response == 'false'){
					  					$("#manualForBoiler2").attr("checked", true);
					  					$("#manualForBoilerNo").show();
					  				}else if(obj.manualForBoiler.response == 'later'){
					  					$("#manualForBoiler3").attr("checked", true);
					  					uploadLater('manualForBoiler');
					  				}		
					 			}
					 			
					 			if(obj.manualForFittedOven){
					 				if(obj.manualForFittedOven.response == 'true'){
					  					$("#manualForFittedOven1").attr("checked", true);
					  					$("#manualForFittedOvenYes").show();
					  					if(obj.manualForFittedOven.fileName){
						 					$("#manualForFittedOven1").attr("checked", true);
						 					$("#manualForFittedOvenFileDisplay").show();
						 					$("#manualForFittedOvenFileName").html(obj.manualForFittedOven.fileName);
						 					if(obj.manualForFittedOven.isImage){
						 						var path = obj.manualForFittedOven.filePath;
						 						$("#manualForFittedOvenFileView").show();
								 				$("#manualForFittedOvenFileView").attr("href", cPath + path );
						 					}
						 				}
					  				}else if(obj.manualForFittedOven.response == 'false'){
					  					$("#manualForFittedOven2").attr("checked", true);
					  					$("#manualForFittedOvenNo").show();
					  				}else if(obj.manualForFittedOven.response == 'later'){
					  					$("#manualForFittedOven3").attr("checked", true);
					  					uploadLater('manualForFittedOven');
					  				}		
					 			}
					 			
			  				}
			  				var convList = response.conversation;
				 			 $.each(convList, function(key, value){
				 				 var id = "#" + value + "ConversationDisplay";
					            	$(id).show();
					         }); 
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				});
		}
		
		function setPropetyStatus(){
			 $.getJSON(contextPath+"/property/propertyStatus.htm",
					    function(response, textStatus, jqXHR){
				 
			  				if(response){
			  					var obj = response.status;
			  					progressBar(obj, $('#progressBar'));								
			  				}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
					});
		}
		
		function setAssignedJobs(){
			$.getJSON(contextPath+"/property/loadAssignedJobsDetails.htm",
				    function(response, textStatus, jqXHR){
				if(response.success == true){
					var lConversation = response.data;
					 $.each(lConversation, function(key, value){
		 				var fieldName = value.conversation;
		 				var conversationId = "#" + fieldName + "ConversationDisplay";
			 			var successId = "#" + fieldName + "SuccessId";
				            $(conversationId).show();
				            $(successId).hide();
			         }); 
				}
		  });
		}
		
		function closeAlert(name){
			var id = "#"+name +"SuccessId";
	  	    $(id).hide(250);
	  	    $(id).hide(250);
		}
		
		function formatContractor(contractor, expObj){
			 var html = '<td><input type = "hidden" name = "functionalityId" class = "functionalityId" value = "'+expObj.functionalityId+'"><input style="padding:14px 0 0 !important;" type="checkbox" class="chk" name="selContractor" value = '+contractor.id+'></td>'+ 
			 			'<td>' + contractor.companyName +'</td>'+ 
		      			'<td>' + contractor.businessNature + '</td>' +
		      			'<td>' + contractor.tradingCommencementDate + '</td>'+
		      			'<td>' + contractor.companyRegisterationDate + '</td>'+
		      			'<td>' + contractor.status + '</td>' ;
			 
			 return html;
		 }
		
		function contractorHeader(){
			var header = '<th style="width:20px;"></th>'
						+'<th>Company Name</th>'
						+'<th>Business Nature</th>'
						+'<th>Trading Commencement Date</th>'
						+'<th>Trading Registeration Date</th>'
						+'<th>Status</th>';
						
			return header;
		}
		
		function getMessageDisplayHtml(name){
			var htmlStr = '<div id="'+name+'SuccessId" class="alert alert-block alert-success hmoLicenseSuccess" style="margin-top: 5px !important;"  >'
			 			+ '<button id="successAlert" type="button" class="close" onclick="closeAlert(\''+name+'\');"><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>'
			 			+ '<h4 class="alert-heading" animation="true" id="hmoLicenceSuccessMessageId">'
			 			+ '<span style="float: left; margin-right: 15px;">We can help you to get the necessary certification.</span>'
			 			+ '<span class="form-anc" ><a href="#" id="yesId" onclick="getContractor(\''+name+'\');">Click here</a></span>'
	                    + '</h4>'
	                    + '<div class="clearfix"></div>'
	                    + '</div>';
	             return htmlStr;
		}
		
		function getErrorDisplayHtml(name){
			var htmlStr = '<div id="'+name+'ErrorId" class="alert alert-block alert-error hmoLicenseError" style="margin-top: 5px !important;" >'
						+ '<button id="errorAlert" type="button" class="close" onclick="closeAlert(\''+name+'\');" ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>'
						+ '<h4 class="alert-heading" animation="true" id="hmoLicenceErrorMessageId">Please attach file here.!</h4>'
						+ '</div>';
				
            return htmlStr;
		}
		
		function bindKeyPress(fieldName){
			
			var spanId = "#"+fieldName+"Label";
			var yesId = "#"+fieldName+"Yes";
			var noId = "#"+fieldName+"No";
			var fieldId = "#"+fieldName+"";
			$(fieldId).bind( "keypress", function() {
				var value = $(fieldId).val();
				if(value.length > 1){
					$(spanId).hide();
					$(noId).hide();
					$(yesId).show();
				}else{
					$(spanId).show();
					$(yesId).hide();
					$(noId).show();
				}
			});
		}
	
		function showTickImage(fieldName){
			var crossIconId = "#"+fieldName +"No";
			var tickIconId = "#"+fieldName +"Yes";
			
			$(crossIconId).hide();
			$(tickIconId).show();
			$("#licenceDIVID").hide();
		}
		
		function showData(id , name){
			//$(id).hide();
			var crossIconId = "#"+name +"No";
			//var messageId = "#"+name +"FileDisplay";
			var messageId = "#"+name +"MessageId";	
			$(crossIconId).hide();
			$(messageId).empty();
			$(id).show();
			
			if(name == 'licenceNumber'){
				var lNumber = $("#licenceNumber").val();
				if(lNumber == null || lNumber.length <= 0){
					$("#licenceNumberNo").show();
					$("#licenceNumberYes").hide();
					$("#licenceNumberLabel").show();
				}else{
					$("#licenceNumberNo").hide();
					$("#licenceNumberLabel").hide();
					$("#licenceNumberYes").show();
				}
				bindKeyPress('licenceNumber');
			}
			
		};
		
		function hideLabel(id, name){
			$(id).hide();
			var yesIconId = "#"+name +"Yes";
			$(yesIconId).hide();
			var crossIconId = "#"+name +"No";
			$(crossIconId).show();
			
			if(name == 'licenceNumber'){
				$(id).hide();
				$("#licenceNumberNo").show();
				$("#licenceNumberYes").hide();
				
			}
		};
		
		function uploadLater(name){
			var yesIconId = "#"+name+"Yes";
			var noIconId = "#"+name+"No";
			var lblId = "#"+name+"FileIDLbl";
			var browseFile = "#"+name+"FileID";
			var contractorMessageId = "#"+name+"MessageId";
			$(contractorMessageId).hide();
			$(yesIconId).hide();
			$(noIconId).show();
			$(lblId).show();
			$(browseFile).hide();
			$(lblId).html("Mandatory Attachment is pending.");
			$(lblId).css("color", "seagreen");
		}
		
		function notApplicable(name){
			var yesIconId = "#"+name+"Yes";
			var noIconId = "#"+name+"No";
			var lblId = "#"+name+"FileIDLbl";
			var browseFile = "#"+name+"FileID";
			
			$(yesIconId).hide();
			$(noIconId).hide();
			$(lblId).hide();
			$(browseFile).hide();
		}
		
		function hideData(id, name){
			functionalityId = name;
			$(id).hide();
			var lblId = "#"+name+"FileIDLbl";
			console.log('label : ' + lblId);
			$(lblId).hide();

			 if(name == 'electricalInstallation'){
					$("#electricalInstallationYes").hide();
					$("#electricalInstallationNo").show();
				}else if(name == 'electricalTest'){
					$("#electricalTestYes").hide();
					$("#electricalTestNo").show();
				}else if(name == 'gasCertificate'){
					$("#gasCertificateYes").hide();
					$("#gasCertificateNo").show();
				}else if(name == 'energyPerformance'){
					$("#energyPerformanceYes").hide();
					$("#energyPerformanceNo").show();
				}else if(name == 'centralHeatingSystem'){
					$("#centralHeatingSystemYes").hide();
					$("#centralHeatingSystemNo").show();
				}else if(name == 'buildingInsaurance'){
					$("#buildingInsauranceYes").hide();
					$("#buildingInsauranceNo").show();
				}else if(name == 'asbestosSurvey'){
					$("#asbestosSurveyYes").hide();
					$("#asbestosSurveyNo").show();
				}else if(name == 'periodicInspectionOfWaterSupply'){
					$("#periodicInspectionOfWaterSupplyYes").hide();
					$("#periodicInspectionOfWaterSupplyNo").show();
				}else if(name == 'inventoryForProperty'){
					$("#inventoryForPropertyYes").hide();
					$("#inventoryForPropertyNo").show();
				}
				else if(name == 'keySet'){
					$("#keySetYes").hide();
					$("#keySetNo").show();
				}else{
					var correctIconId = "#"+name+"Yes";
					var wrongIconId = "#"+name+"No";
					
					$(correctIconId).hide();
					$(wrongIconId).show();
					
				} 
		 
			$.getJSON(contextPath+"/contractor/loadContractorsByFunctionality.htm?functionality="+name+"" , function(response) {
				 if(response.success == true || response.success == 'true'){
					 if(name == 'electricalInstallation'){
							$("#electricalInstallationYes").hide();
							$("#electricalInstallationMessageId").show();
							$("#electricalInstallationMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'electricalTest'){
							$("#electricalTestYes").hide();
						//	$("#electricalTestNo").show();
							$("#electricalTestMessageId").show();
							$("#electricalTestMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'gasCertificate'){
							$("#gasCertificateYes").hide();
							$("#gasCertificateMessageId").show();
							$("#gasCertificateMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'energyPerformance'){
							$("#energyPerformanceYess").hide();
							$("#energyPerformanceMessageId").show();
							$("#energyPerformanceMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'centralHeatingSystem'){
							$("#centralHeatingSystemYes").hide();
							$("#centralHeatingSystemMessageId").show();
							$("#centralHeatingSystemMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'buildingInsaurance'){
							$("#buildingInsauranceYes").hide();
							$("#buildingInsauranceMessageId").show();
							$("#buildingInsauranceMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'asbestosSurvey'){
							$("#asbestosSurveyYes").hide();
							$("#asbestosSurveyMessageId").show();
							$("#asbestosSurveyMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'periodicInspectionOfWaterSupply'){
							$("#periodicInspectionOfWaterSupplyYes").hide();
							$("#periodicInspectionOfWaterSupplyMessageId").show();
							$("#periodicInspectionOfWaterSupplyMessageId").html(getMessageDisplayHtml(name));
						}else if(name == 'inventoryForProperty'){
							$("#inventoryForPropertyYes").hide();		
							$("#inventoryForPropertyMessageId").show();
							$("#inventoryForPropertyMessageId").html(getMessageDisplayHtml(name));
						}
					 
				 }
	    	 });
		};
		
		function getContractor(functionality){
			 functionalityId = functionality;
			  $.getJSON(contextPath+"/contractor/loadContractorsByFunctionality.htm?functionality="+functionality+"" , function(response) {
				 if(response.success == true ){  
					 $("#jobsDescription").val("");
					 window.location.href="#contractorId";
					 $("#contractorTable").show();
					 $("#alertErrorId").hide();
					 $('#contractorTable').empty();
					 var i = 0;
						 $.each(response.data, function(contractor, expObj){
							 if(i == 0){
								 $('#contractorTable').append($('<tr/>').html(contractorHeader()));	 
							 }
							 $('#contractorTable').append($('<tr/>').html(formatContractor(this.contractor, this.expObj)));
							 i++;
			            });
				 }else{
					 showErrorMessage("No Contractor Registered Yet.", "250px");
				 }
	    	 });
		}
		
		function validateYesData(name){
			var maxSize = 10000000;
			if(name == 'electricalInstallation'){
					 var fsize = $('#electricalInstallationFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#electricalInstallationFileIDLbl").show();
						$("#electricalInstallationFileIDLbl").html("Max size is 10Mb");
						$("#electricalInstallationFileIDLbl").css("color", "red");
					}else{
						$("#electricalInstallationFileIDLbl").hide();
						flag = false;
						var ans = globalAnsObj.electricalInstallation.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    		$("#electricalInstallationErrorId").hide();
						$("#electricalInstallationNo").hide();
						$("#electricalInstallationYes").show(150);
					}else{
						$("#electricalInstallationNo").show(150);
						$("#electricalInstallationYes").hide();
					}	
				}
			}else if(name == 'electricalTest'){
				var fsize = $('#electricalTestFileID')[0].files[0].size;
				if(fsize > maxSize){
					$("#electricalTestFileIDLbl").show();
					$("#electricalTestFileIDLbl").html("Max size is 10Mb");
					$("#electricalTestFileIDLbl").css("color", "red");
					flag = true;
				}else{
					$("#electricalTestFileIDLbl").hide();
					flag = false;
					var ans = globalAnsObj.electricalTest.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    		$("#electricalTestErrorId").hide();
						$("#electricalTestNo").hide();
						$("#electricalTestYes").show(150);
					}else{
						$("#electricalTestYes").hide();
						$("#electricalTestNo").show();
					}
				}
			}else if(name == 'gasCertificate'){
				var fsize = $('#gasCertificateFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#gasCertificateFileIDLbl").show();
					$("#gasCertificateFileIDLbl").html("Max size is 10Mb");
					$("#gasCertificateFileIDLbl").css("color", "red");
				}else{
					flag = false;
					$("#gasCertificateFileIDLbl").hide();
					var ans = globalAnsObj.gasCertificate.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    		$("#gasCertificateErrorId").hide();
						$("#gasCertificateNo").hide();
						$("#gasCertificateYes").show(150);
					}else{
						$("#gasCertificateNo").hide();
						$("#gasCertificateYes").show(150);
					}	
				}
			}else if(name == 'energyPerformance'){
				var fsize = $('#energyPerformanceFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#energyPerformanceFileIDLbl").show();
					$("#energyPerformanceFileIDLbl").html("Max size is 10Mb");
					$("#energyPerformanceFileIDLbl").css("color", "red");
				}else{
					$("#energyPerformanceFileIDLbl").hide();
					flag = false;
					var ans = globalAnsObj.energyPerformance.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
			    	if((ans == 'true' || ans == true) && file.length != 0){
			    		$("#energyPerformanceErrorId").hide();
						$("#energyPerformanceNo").hide();
						$("#energyPerformanceYes").show();
					}else{
						$("#energyPerformanceNo").hide();
						$("#energyPerformanceYes").show();
					}
				}
			}else if(name == 'centralHeatingSystem'){
				var fsize = $('#centralHeatingSystemFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#centralHeatingSystemFileIDLbl").show();
					$("#centralHeatingSystemFileIDLbl").html("Max size is 10Mb");
					$("#centralHeatingSystemFileIDLbl").css("color", "red");
				}else{
					flag = false;
					$("#centralHeatingSystemFileIDLbl").hide();
					var ans = globalAnsObj.centralHeatingSystem.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
			    	if((ans == 'true' || ans == true) && file.length != 0){
			    		$("#centralHeatingSystemErrorId").hide();
						$("#centralHeatingSystemNo").hide();
						$("#centralHeatingSystemYes").show();
					}else{
						$("#centralHeatingSystemNo").hide();
						$("#centralHeatingSystemYes").show();
					}
				}
			}else if(name == 'buildingInsaurance'){
				var fsize = $('#buildingInsauranceFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#buildingInsauranceFileIDLbl").show();
					$("#buildingInsauranceFileIDLbl").html("Max size is 10Mb");
					$("#buildingInsauranceFileIDLbl").css("color", "red");
				}else{
					flag = false;
					$("#buildingInsauranceFileIDLbl").hide();
					var ans = globalAnsObj.buildingInsaurance.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
				    if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#buildingInsauranceErrorId").hide();
							$("#buildingInsauranceNo").hide();
							$("#buildingInsauranceYes").show();
						}else{
							$("#buildingInsauranceNo").show(150);
							$("#buildingInsauranceYes").hide();
					}
				}
			}else if(name == 'asbestosSurvey'){
				var fsize = $('#asbestosSurveyFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#asbestosSurveyFileIDLbl").show();
					$("#asbestosSurveyFileIDLbl").html("Max size is 10Mb");
					$("#asbestosSurveyFileIDLbl").css("color", "red");
				}else{
					flag = false;
					$("#asbestosSurveyFileIDLbl").hide();
					var ans = globalAnsObj.asbestosSurvey.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
				if((ans == 'true' || ans == true) && file.length != 0){
		    			$("#asbestosSurveyErrorId").hide();
						$("#asbestosSurveyNo").hide();
						$("#asbestosSurveyYes").show(150);
					}else{
						$("#asbestosSurveyNo").show(150);
						$("#asbestosSurveyYes").hide();
					}
				} 
			}else if(name == 'periodicInspectionOfWaterSupply'){
				var fsize = $('#periodicInspectionOfWaterSupplyFileID')[0].files[0].size;
				if(fsize > maxSize){
					flag = true;
					$("#periodicInspectionOfWaterSupplyFileIDLbl").show();
					$("#periodicInspectionOfWaterSupplyFileIDLbl").html("Max size is 10Mb");
					$("#periodicInspectionOfWaterSupplyFileIDLbl").css("color", "red");
				}else{
					flag = false;
					$("#periodicInspectionOfWaterSupplyFileIDLbl").hide();
					var ans = globalAnsObj.periodicInspectionOfWaterSupply.affirmativeAns;
					var fileId = "#"+name+"FileID";
					 var file = $(fileId).val();
				if((ans == 'true' || ans == true) && file.length != 0){
		    			$("#periodicInspectionOfWaterSupplyErrorId").hide();
						$("#periodicInspectionOfWaterSupplyNo").hide();
						$("#periodicInspectionOfWaterSupplyYes").show(150);
					}else{
						$("#periodicInspectionOfWaterSupplyNo").show(150);
						$("#periodicInspectionOfWaterSupplyYes").hide();
					}
				} 
			}else if(name == 'keySet'){
					var ans = globalAnsObj.keySet.affirmativeAns;
				if(ans == 'true' || ans == true){
						$("#keySetNo").hide();
						$("#keySetYes").show(150);
					}else{
						$("#keySetNo").show(150);
						$("#keySetYes").hide();
					}
			}else if(name == 'landTitleRegisteryDocument'){
					var fsize = $('#landTitleRegisteryDocumentFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#landTitleRegisteryDocumentFileIDLbl").show();
						$("#landTitleRegisteryDocumentFileIDLbl").html("Max size is 10Mb");
						$("#landTitleRegisteryDocumentFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#landTitleRegisteryDocumentFileIDLbl").hide();
						var ans = globalAnsObj.landTitleRegisteryDocument.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#landTitleRegisteryDocumentErrorId").hide();
							$("#landTitleRegisteryDocumentNo").hide();
							$("#landTitleRegisteryDocumentYes").show(150);
						}else{
							$("#landTitleRegisteryDocumentNo").show(150);
							$("#landTitleRegisteryDocumentYes").hide();
						}
					} 
				}else if(name == 'inventoryForProperty'){
					var fsize = $('#inventoryForPropertyFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#inventoryForPropertyFileIDLbl").show();
						$("#inventoryForPropertyFileIDLbl").html("Max size is 10Mb");
						$("#inventoryForPropertyFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#inventoryForPropertyFileIDLbl").hide();
						var ans = globalAnsObj.inventoryForProperty.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#inventoryForPropertyErrorId").hide();
							$("#inventoryForPropertyNo").hide();
							$("#inventoryForPropertyYes").show(150);
						}else{
							$("#inventoryForPropertyNo").show(150);
							$("#inventoryForPropertyYes").hide();
						}
					} 
				}else if(name == 'landlordInsauranceForContent'){
					var fsize = $('#landlordInsauranceForContentFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#landlordInsauranceForContentFileIDLbl").show();
						$("#landlordInsauranceForContentFileIDLbl").html("Max size is 10Mb");
						$("#landlordInsauranceForContentFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#landlordInsauranceForContentFileIDLbl").hide();
						var ans = globalAnsObj.landlordInsauranceForContent.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#landlordInsauranceForContentErrorId").hide();
							$("#landlordInsauranceForContentNo").hide();
							$("#landlordInsauranceForContentYes").show();
						}else{
							$("#landlordInsauranceForContentNo").show();
							$("#landlordInsauranceForContentYes").hide();
						}
					} 
				}else if(name == 'windowAndDoorWarrantee'){
					var fsize = $('#windowAndDoorWarranteeFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#windowAndDoorWarranteeFileIDLbl").show();
						$("#windowAndDoorWarranteeFileIDLbl").html("Max size is 10Mb");
						$("#windowAndDoorWarranteeFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#windowAndDoorWarranteeFileIDLbl").hide();
						var ans = globalAnsObj.windowAndDoorWarrantee.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#windowAndDoorWarranteeErrorId").hide();
							$("#windowAndDoorWarranteeNo").hide();
							$("#windowAndDoorWarranteeYes").show(150);
						}else{
							$("#windowAndDoorWarranteeNo").show(150);
							$("#windowAndDoorWarranteeYes").hide();
						}
					} 
				}else if(name == 'dampPoofcourse'){
					var fsize = $('#dampPoofcourseFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#dampPoofcourseFileIDLbl").show();
						$("#dampPoofcourseFileIDLbl").html("Max size is 10Mb");
						$("#dampPoofcourseFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#dampPoofcourseFileIDLbl").hide();
						var ans = globalAnsObj.dampPoofcourse.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#dampPoofcourseErrorId").hide();
							$("#dampPoofcourseNo").hide();
							$("#dampPoofcourseYes").show(150);
						}else{
							$("#dampPoofcourseNo").show(150);
							$("#dampPoofcourseYes").hide();
						}
					} 
				}else if(name == 'fittedHobAndOven'){
					var fsize = $('#fittedHobAndOvenFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#fittedHobAndOvenFileIDLbl").show();
						$("#fittedHobAndOvenFileIDLbl").html("Max size is 10Mb");
						$("#fittedHobAndOvenFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#fittedHobAndOvenFileIDLbl").hide();
						var ans = globalAnsObj.fittedHobAndOven.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#fittedHobAndOvenErrorId").hide();
							$("#fittedHobAndOvenNo").hide();
							$("#fittedHobAndOvenYes").show(150);
						}else{
							$("#fittedHobAndOvenNo").show(150);
							$("#fittedHobAndOvenYes").hide();
						}
					} 
				}else if(name == 'electricShower'){
					var fsize = $('#electricShowerFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#electricShowerFileIDLbl").show();
						$("#electricShowerFileIDLbl").html("Max size is 10Mb");
						$("#electricShowerFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#electricShowerFileIDLbl").hide();
						var ans = globalAnsObj.electricShower.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#electricShowerErrorId").hide();
							$("#electricShowerNo").hide();
							$("#electricShowerYes").show(150);
						}else{
							$("#electricShowerNo").show(150);
							$("#electricShowerYes").hide();
						}
					} 
				}else if(name == 'electricFires'){
					var fsize = $('#electricFiresFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#electricFiresFileIDLbl").show();
						$("#electricFiresFileIDLbl").html("Max size is 10Mb");
						$("#electricFiresFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#electricFiresFileIDLbl").hide();
						var ans = globalAnsObj.electricFires.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#electricFiresErrorId").hide();
							$("#electricFiresNo").hide();
							$("#electricFiresYes").show(150);
						}else{
							$("#electricFiresNo").show(150);
							$("#electricFiresYes").hide();
						}
					} 
				}else if(name == 'manualForCentralHeating'){
					var fsize = $('#manualForCentralHeatingFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#manualForCentralHeatingFileIDLbl").show();
						$("#manualForCentralHeatingFileIDLbl").html("Max size is 10Mb");
						$("#manualForCentralHeatingFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#manualForCentralHeatingFileIDLbl").hide();
						var ans = globalAnsObj.manualForCentralHeating.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#manualForCentralHeatingErrorId").hide();
							$("#manualForCentralHeatingNo").hide();
							$("#manualForCentralHeatingYes").show(150);
						}else{
							$("#manualForCentralHeatingNo").show(150);
							$("#manualForCentralHeatingYes").hide();
						}
					} 
				}else if(name == 'timerForCentralHeating'){
					var fsize = $('#timerForCentralHeatingFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#timerForCentralHeatingFileIDLbl").show();
						$("#timerForCentralHeatingFileIDLbl").html("Max size is 10Mb");
						$("#timerForCentralHeatingFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#timerForCentralHeatingFileIDLbl").hide();
						var ans = globalAnsObj.timerForCentralHeating.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#timerForCentralHeatingErrorId").hide();
							$("#timerForCentralHeatingNo").hide();
							$("#timerForCentralHeatingYes").show(150);
						}else{
							$("#timerForCentralHeatingNo").show(150);
							$("#timerForCentralHeatingYes").hide();
						}
					} 
				}else if(name == 'manualForBoile'){
					var fsize = $('#manualForBoileFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#manualForBoileFileIDLbl").show();
						$("#manualForBoileFileIDLbl").html("Max size is 10Mb");
						$("#manualForBoileFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#manualForBoileFileIDLbl").hide();
						var ans = globalAnsObj.manualForBoile.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#manualForBoileErrorId").hide();
							$("#manualForBoileNo").hide();
							$("#manualForBoileYes").show(150);
						}else{
							$("#manualForBoileNo").show(150);
							$("#manualForBoileYes").hide();
						}
					} 
				}else if(name == 'manualForBoiler'){
					var fsize = $('#manualForBoilerFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#manualForBoilerFileIDLbl").show();
						$("#manualForBoilerFileIDLbl").html("Max size is 10Mb");
						$("#manualForBoilerFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#manualForBoilerFileIDLbl").hide();
						var ans = globalAnsObj.manualForBoiler.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#manualForBoilerErrorId").hide();
							$("#manualForBoilerNo").hide();
							$("#manualForBoilerYes").show(150);
						}else{
							$("#manualForBoilerNo").show(150);
							$("#manualForBoilerYes").hide();
						}
					} 
				}else if(name == 'manualForFittedOven'){
					var fsize = $('#manualForFittedOvenFileID')[0].files[0].size;
					if(fsize > maxSize){
						flag = true;
						$("#manualForFittedOvenFileIDLbl").show();
						$("#manualForFittedOvenFileIDLbl").html("Max size is 10Mb");
						$("#manualForFittedOvenFileIDLbl").css("color", "red");
					}else{
						flag = false;
						$("#manualForFittedOvenFileIDLbl").hide();
						var ans = globalAnsObj.manualForFittedOven.affirmativeAns;
						var fileId = "#"+name+"FileID";
						 var file = $(fileId).val();
					if((ans == 'true' || ans == true) && file.length != 0){
			    			$("#manualForFittedOvenErrorId").hide();
							$("#manualForFittedOvenNo").hide();
							$("#manualForFittedOvenYes").show(150);
						}else{
							$("#manualForFittedOvenNo").show(150);
							$("#manualForFittedOvenYes").hide();
						}
					} 
				}
		};
		
		function validateCross( name ){
			
			if(name == 'electricalInstallation'){
				var ans = globalAnsObj.electricalInstallation.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#electricalInstallationNo").show(150);
					$("#electricalInstallationYes").hide();
				}else{
					$("#electricalInstallationNo").hide();
					$("#electricalInstallationYes").show(150);
				}
			}else if(name == 'electricalTest'){
				var ans = globalAnsObj.electricalTest.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#electricalTestNo").show(150);
					$("#electricalTestYes").hide();
				}else{
					$("#electricalTestYes").show(150);
					$("#electricalTestNo").hide();
				}
			}else if(name == 'gasCertificate'){
				var ans = globalAnsObj.gasCertificate.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#gasCertificateNo").show(150);
					$("#gasCertificateYes").hide();
				}else{
					$("#gasCertificateNo").hide();
					$("#gasCertificateYes").show(150);
				}
			}else if(name == 'energyPerformance'){
				var ans = globalAnsObj.energyPerformance.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#energyPerformanceNo").show(150);
					$("#energyPerformanceYes").hide();
				}else{
					$("#energyPerformanceNo").show(150);
					$("#energyPerformanceYes").hide();
				}
			}else if(name == 'centralHeatingSystem'){
				var ans = globalAnsObj.centralHeatingSystem.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#centralHeatingSystemNo").show(150);
					$("#centralHeatingSystemYes").hide();
				}else{
					$("#centralHeatingSystemNo").hide();
					$("#centralHeatingSystemYes").show(150);
				}
			}else if(name == 'buildingInsaurance'){
				var ans = globalAnsObj.buildingInsaurance.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#buildingInsauranceNo").show(150);
					$("#efficientHeatingSystemYes").hide();
				}else{
					$("#buildingInsauranceNo").show(150);
					$("#buildingInsauranceYes").hide();
				}
			}else if(name == 'asbestosSurvey'){
				var ans = globalAnsObj.asbestosSurvey.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#asbestosSurveyNo").show(150);
					$("#asbestosSurveyYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#asbestosSurveyMessageId").html(htmlStr);
				}else{
					$("#asbestosSurveyNo").show(150);
					$("#asbestosSurveyYes").hide();
				}
			}else if(name == 'periodicInspectionOfWaterSupply'){
				var ans = globalAnsObj.periodicInspectionOfWaterSupply.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#periodicInspectionOfWaterSupplyNo").show(150);
					$("#periodicInspectionOfWaterSupplyYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#periodicInspectionOfWaterSupplyMessageId").html(htmlStr);
				}else{
					$("#periodicInspectionOfWaterSupplyNo").show(150);
					$("#periodicInspectionOfWaterSupplyYes").hide();
				}
			}else if(name == 'keySet'){
				var ans = globalAnsObj.keySet.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#keySetNo").show(150);
					$("#keySetYes").hide();
				}else{
					$("#keySetNo").show(150);
					$("#keySetYes").hide();
				}
			}else if(name == 'landTitleRegisteryDocument'){
				var ans = globalAnsObj.landTitleRegisteryDocument.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#landTitleRegisteryDocumentNo").show(150);
					$("#landTitleRegisteryDocumentYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#landTitleRegisteryDocumentMessageId").html(htmlStr);
				}else{
					$("#landTitleRegisteryDocumentNo").show(150);
					$("#landTitleRegisteryDocumentYes").hide();
				}
			}else if(name == 'inventoryForProperty'){
				var ans = globalAnsObj.inventoryForProperty.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#inventoryForPropertyNo").show(150);
					$("#inventoryForPropertyYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#inventoryForPropertyMessageId").html(htmlStr);
				}else{
					$("#inventoryForPropertyNo").show(150);
					$("#inventoryForPropertyYes").hide();
				}
			}else if(name == 'landlordInsauranceForContent'){
				var ans = globalAnsObj.landlordInsauranceForContent.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#landlordInsauranceForContentNo").show(150);
					$("#landlordInsauranceForContentYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#landlordInsauranceForContentMessageId").html(htmlStr);
				}else{
					$("#landlordInsauranceForContentNo").show(150);
					$("#landlordInsauranceForContentYes").hide();
				}
			}else if(name == 'windowAndDoorWarrantee'){
				var ans = globalAnsObj.windowAndDoorWarrantee.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#windowAndDoorWarranteeNo").show(150);
					$("#windowAndDoorWarranteeYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#windowAndDoorWarranteeMessageId").html(htmlStr);
				}else{
					$("#windowAndDoorWarranteeNo").show(150);
					$("#windowAndDoorWarranteeYes").hide();
				}
			}else if(name == 'dampPoofcourse'){
				var ans = globalAnsObj.dampPoofcourse.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#dampPoofcourseNo").show(150);
					$("#dampPoofcourseYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#dampPoofcourseMessageId").html(htmlStr);
				}else{
					$("#dampPoofcourseNo").show(150);
					$("#dampPoofcourseYes").hide();
				}
			}else if(name == 'fittedHobAndOven'){
				var ans = globalAnsObj.fittedHobAndOven.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#fittedHobAndOvenNo").show(150);
					$("#fittedHobAndOvenYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#fittedHobAndOvenMessageId").html(htmlStr);
				}else{
					$("#fittedHobAndOvenNo").show(150);
					$("#fittedHobAndOvenYes").hide();
				}
			}else if(name == 'electricShower'){
				var ans = globalAnsObj.electricShower.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#electricShowerNo").show(150);
					$("#electricShowerYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#electricShowerMessageId").html(htmlStr);
				}else{
					$("#electricShowerNo").show(150);
					$("#electricShowerYes").hide();
				}
			}else if(name == 'electricFires'){
				var ans = globalAnsObj.electricFires.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#electricFiresNo").show(150);
					$("#electricFiresYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#electricFiresMessageId").html(htmlStr);
				}else{
					$("#electricFiresNo").show(150);
					$("#electricFiresYes").hide();
				}
			}else if(name == 'manualForCentralHeating'){
				var ans = globalAnsObj.manualForCentralHeating.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#manualForCentralHeatingNo").show(150);
					$("#manualForCentralHeatingYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#manualForCentralHeatingMessageId").html(htmlStr);
				}else{
					$("#manualForCentralHeatingNo").show(150);
					$("#manualForCentralHeatingYes").hide();
				}
			}else if(name == 'timerForCentralHeating'){
				var ans = globalAnsObj.timerForCentralHeating.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#timerForCentralHeatingNo").show(150);
					$("#timerForCentralHeatingYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#timerForCentralHeatingMessageId").html(htmlStr);
				}else{
					$("#timerForCentralHeatingNo").show(150);
					$("#timerForCentralHeatingYes").hide();
				}
			}else if(name == 'manualForBoiler'){
				var ans = globalAnsObj.manualForBoiler.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#manualForBoilerNo").show(150);
					$("#manualForBoilerYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#manualForBoilerMessageId").html(htmlStr);
				}else{
					$("#manualForBoilerNo").show(150);
					$("#manualForBoilerYes").hide();
				}
			}else if(name == 'manualForFittedOven'){
				var ans = globalAnsObj.manualForFittedOven.affirmativeAns;
				if(ans == 'true' || ans == true){
					$("#manualForFittedOvenNo").show(150);
					$("#manualForFittedOvenYes").hide();
					var htmlStr = $("#hmoLicenceErrorDIVId").html();
					$("#manualForFittedOvenMessageId").html(htmlStr);
				}else{
					$("#manualForFittedOvenNo").show(150);
					$("#manualForFittedOvenYes").hide();
				}
			}
		};
		 
		 function fetchHMOLicenceDetails(){
			 $.getJSON(contextPath+"/property/questionData.htm?page=2" , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 var data = response.data;
						 $("#hmoLicenseTotalQuestion").html(data.totalQuestion);
						 $("#hmoLicenseUnattemptedQues").html(data.unattempted);
						 $("#hmoLicenseWrongQues").html(data.wrongAnswers);
				 }
	    	 });
		 }
		 
		 
		 function fetchCriteriaADetails(){
			 $.getJSON(contextPath+"/property/questionData.htm?page=3" , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 var data = response.data;
						 $("#criteriaATotalQuestion").html(data.totalQuestion);
						 $("#criteriaAUnattemptedQues").html(data.unattempted);
						 $("#criteriaAWrongQues").html(data.wrongAnswers);
				 }
	    	 });
		 }
		 
		 function fetchCriteriaBDetails(){
			 $.getJSON(contextPath+"/property/questionData.htm?page=4" , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 var data = response.data;
						 $("#criteriaBTotalQuestion").html(data.totalQuestion);
						 $("#criteriaBUnattemptedQues").html(data.unattempted);
						 $("#criteriaBWrongQues").html(data.wrongAnswers);
				 }
	    	 });
		 }
		 
		 function fetchCriteriaCDetails(){
			 $.getJSON(contextPath+"/property/questionData.htm?page=5" , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 var data = response.data;
						 $("#criteriaCTotalQuestion").html(data.totalQuestion);
						 $("#criteriaCUnattemptedQues").html(data.unattempted);
						 $("#criteriaCWrongQues").html(data.wrongAnswers);
				 }
	    	 });
		 }
		 
		 
		 function fetchCriteriaDDetails(){
			 $.getJSON(contextPath+"/property/questionData.htm?page=6" , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 var data = response.data;
						 $("#criteriaDTotalQuestion").html(data.totalQuestion);
						 $("#criteriaDUnattemptedQues").html(data.unattempted);
						 $("#criteriaDWrongQues").html(data.wrongAnswers);
				 }
	    	 });
		 }
