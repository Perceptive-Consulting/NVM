
	var globalAnsObj = null;
	var globalResponse;
	var globalPropertyId;

$(document).ready(function(){
  	
	$.getJSON(contextPath+"/property/loadHMOLicense.htm",
		    function(response, textStatus, jqXHR){
			globalAnsObj = response.ansObj;
			globalResponse = response.data;
			setHMOLicense(response.data, response.ansObj);
	});
	
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
	 
	 $("#reviewSubmit").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/loadHMOLicense.htm",
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'block');
			    	//window.location.href = contextPath+"/property/.htm?action=1&param=REVIEW-PROPERTY";
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });

	 
	 $("#pageOneId").click(function(event){
			$.ajax({	
			    url : contextPath+"/admin/displayAdpl2.htm?adpl2Id=2&id="+globalPropertyId,
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	globalAnsObj = response.ansObj;
			    	globalResponse = response.data;
			    	setHMOLicense(response.data, response.ansObj);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#pageTwoId").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/redirectDHSCriteriaA.htm",
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');	
			    	globalAnsObj = response.ansObj;
			    	setCriteriaA(response.data, response.ansObj);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#pageThreeId").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/redirectDHSCriteriaB.htm",
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');		
			    	setCriteriaB(response.data, response.ansObj);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#pageFourId").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/redirectDHSCriteriaC.htm",
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');	
			    	setCriteriaC(response.data, response.ansObj);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#pageFiveId").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/redirectDHSCriteriaD.htm",
			    type: "GET",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');	
			    	setCriteriaD(response.data, response.ansObj);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#downloadADPLPdfId").click(function(event){
		 window.location.href = contextPath+"/download/adplPDF.htm";
	 });
	 
	 
});

	function setHMOLicense(obj, ansObj){
		if(obj){
				var ans;
				if(obj.hmoLicence.response == 'true'){
					$("#hmoLicence").html('Yes');
					$("#HMOLicenceNumberID").html(obj.licenceNumber.comments);
				}else if(obj.hmoLicence.response == 'false'){
					$("#hmoLicence").html('No');
				}
				ans = ansObj.hmoLicence.affirmativeAns;
				if(obj.hmoLicence.response.toString() == ans.toString()){
					$("#hmoLicenceYes").show();
				}else{
					$("#hmoLicenceNo").show();
				}
				if(obj.hmoLicence.response == 'null'){
					$("#hmoLicenceNo").hide();
					$("#hmoLicenceYes").hide();
				}

 			if(obj.propertyMeetStandards.response == 'true'){
 					$("#propertyMeetStandards").html('Yes');
 					
				}else if(obj.propertyMeetStandards.response == 'false'){
					$("#propertyMeetStandards").html('No');
					$("#propertyMeetStandardsComments").html(obj.whereITFails.response);
				}
 				ans = ansObj.propertyMeetStandards.affirmativeAns;
 				if(obj.propertyMeetStandards.response.toString() == ans.toString()){
 					$("#propertyMeetStandardsYes").show();
 				}else{
 					$("#propertyMeetStandardsNo").show();
 				}
 				if(obj.propertyMeetStandards.response == 'null'){
					$("#propertyMeetStandardsNo").hide();
					$("#propertyMeetStandardsYes").hide();
				}
 				
 			if(obj.upgradeProperty.response == 'true'){
 					$("#upgradeProperty").html('Yes');
					$("#workCompletedBy").html(obj.workCompletedBy.comments);
				}else if(obj.upgradeProperty.response == 'false'){
					$("#upgradeProperty").html('No');
				}
 				ans = ansObj.upgradeProperty.affirmativeAns;
 				if(obj.upgradeProperty.response.toString() == ans.toString()){
 					$("#upgradePropertyYes").show();
 				}else{
 					$("#upgradePropertyNo").show();
 				}
 				if(obj.upgradeProperty.response == 'null'){
					$("#upgradePropertyNo").hide();
					$("#upgradePropertyYes").hide();
				}
 				
 			if(obj.electricalInstallation){
 				if(obj.electricalInstallation.response == 'true'){
  					$("#electricalInstallation").html('Yes');
  					
	 				if(obj.electricalInstallation.fileName){
	 					$("#electricalInstallationFileDisplay").show();
		 				$("#electricalInstallationFileName").html(obj.electricalInstallation.fileName);
	 				}
  				}else if(obj.electricalInstallation.response == 'false'){
  					$("#electricalInstallation").html('No');
  				}
 				ans = ansObj.electricalInstallation.affirmativeAns;
				if(obj.electricalInstallation.response.toString() == ans.toString()){
					$("#electricalInstallationYes").show();
				}else{
					$("#electricalInstallationNo").show();
				}
 			}
 				
 			if(obj.electricalTest){
 				if(obj.electricalTest.response == 'true'){
  					$("#electricalTest").html('Yes');
  					
  					if(obj.electricalTest.fileName){
	 					$("#electricalTestFileDisplay").show();
		 				$("#electricalTestFileName").html(obj.electricalTest.fileName);
	 				}
  				}else if(obj.electricalTest.response == 'false'){
  					$("#electricalTest").html('No');
  					
  				}	
 				ans = ansObj.electricalTest.affirmativeAns;
 				if(obj.electricalTest.response.toString() == ans.toString()){
 					$("#electricalTestYes").show(150);
				}else{
					$("#electricalTestNo").show();
				}
 			}
 			if(obj.gasCertificate){
 				if(obj.gasCertificate.response == 'true'){
 					$("#gasCertificate").html('Yes');
  					
  					if(obj.gasCertificate.fileName){
	 					$("#gasCertificateFileDisplay").show();
		 				$("#gasCertificateFileName").html(obj.gasCertificate.fileName);
	 				}
  					
  				}else if(obj.gasCertificate.response == 'false'){
  					$("#gasCertificate").html("No");
  				}	
 				ans = ansObj.gasCertificate.affirmativeAns;
 				if(obj.gasCertificate.response.toString() == ans.toString()){
 					$("#gasCertificateYes").show();
				}else{
					$("#gasCertificateNo").show();
				}
 			}
 			if(obj.energyPerformance){
 				if(obj.energyPerformance.response == 'true'){
  					$("#energyPerformance").html('Yes');
  					
  					if(obj.energyPerformance.fileName){
	 					$("#energyPerformanceFileDisplay").show();
		 				$("#energyPerformanceFileName").html(obj.energyPerformance.fileName);
	 				}
 				}else if(obj.energyPerformance.response == 'false'){
 					$("#energyPerformance").html('No');
  					
  				}
 				ans = ansObj.energyPerformance.affirmativeAns;
 				if(obj.energyPerformance.response.toString() == ans.toString()){
 					$("#energyPerformanceYes").show();
				}else{
					$("#energyPerformanceNo").show();
				}
 			}
 			if(obj.centralHeatingSystem){
 				if(obj.centralHeatingSystem.response == 'true'){
  					$("#centralHeatingSystem").html('Yes');
  					
  					if(obj.centralHeatingSystem.fileName){
	 					$("#centralHeatingSystemFileDisplay").show();
		 				$("#centralHeatingSystemFileName").html(obj.centralHeatingSystem.fileName);
	 				}
  				}else if(obj.centralHeatingSystem.response == 'false'){
  					$("#centralHeatingSystem").html('No');
  				}	
 				ans = ansObj.centralHeatingSystem.affirmativeAns;
 				if(obj.centralHeatingSystem.response.toString() == ans.toString()){
 					$("#centralHeatingSystemYes").show();
				}else{
					$("#centralHeatingSystemNo").show();
				}
 			}
 			if(obj.buildingInsaurance){
 				if(obj.buildingInsaurance.response == 'true'){
  					$("#buildingInsaurance").html("Yes");
  					
  					if(obj.buildingInsaurance.fileName){
	 					$("#buildingInsauranceFileDisplay").show();
		 				$("#buildingInsauranceFileName").html(obj.buildingInsaurance.fileName);
	 				}
  				}else if(obj.buildingInsaurance.response == 'false'){
  					$("#buildingInsaurance").html("No");
  				}	
 				ans = ansObj.buildingInsaurance.affirmativeAns;
 				if(obj.buildingInsaurance.response.toString() == ans.toString()){
 					$("#buildingInsauranceYes").show();
				}else{
					$("#buildingInsauranceNo").show();
				}
 			}
 			if(obj.sketchPlan){
 				if(obj.sketchPlan.response == 'true'){
  					$("#sketchPlan").html('Yes');
  					if(obj.sketchPlan.fileName){
	 					$("#sketchPlanFileDisplay").show();
		 				$("#sketchPlanFileName").html(obj.sketchPlan.fileName);
	 				}
  				}else if(obj.sketchPlan.response == 'false'){
  					$("#sketchPlan").html('No');
  				}	
 				ans = ansObj.sketchPlan.affirmativeAns;
 	 			if(obj.sketchPlan.response.toString() == ans.toString()){
 	 				$("#sketchPlanYes").show();
 				}else{
 					$("#sketchPlanNo").show();
 				}
 			}
 			if(obj.asbestosSurvey){
 				if(obj.asbestosSurvey.response == 'true'){
  					$("#asbestosSurvey").html('Yes');
  					if(obj.asbestosSurvey.fileName){
	 					$("#asbestosSurveyFileDisplay").show();
		 				$("#asbestosSurveyFileName").html(obj.asbestosSurvey.fileName);
	 				}
  				}else if(obj.asbestosSurvey.response == 'false'){
  					$("#asbestosSurvey").html('No');
  				}	
 				ans = ansObj.asbestosSurvey.affirmativeAns;
 	 			if(obj.asbestosSurvey.response.toString() == ans.toString()){
 	 				$("#asbestosSurveyYes").show();
 				}else{
 					$("#asbestosSurveyNo").show();
 				}
 			}
 			if(obj.periodicInspectionOfWaterSupply){
 				if(obj.periodicInspectionOfWaterSupply.response == 'true'){
  					$("#periodicInspectionOfWaterSupply").html('Yes');
  					if(obj.periodicInspectionOfWaterSupply.fileName){
	 					$("#periodicInspectionOfWaterSupplyFileDisplay").show();
		 				$("#periodicInspectionOfWaterSupplyFileName").html(obj.periodicInspectionOfWaterSupply.fileName);
	 				}
  				}else if(obj.periodicInspectionOfWaterSupply.response == 'false'){
  					$("#periodicInspectionOfWaterSupply").html('No');
  				}	
 				ans = ansObj.periodicInspectionOfWaterSupply.affirmativeAns;
 	 			if(obj.periodicInspectionOfWaterSupply.response.toString() == ans.toString()){
 	 				$("#periodicInspectionOfWaterSupplyYes").show();
 				}else{
 					$("#periodicInspectionOfWaterSupplyNo").show();
 				}
 			}
 			if(obj.keySet){
 				if(obj.keySet.response == 'true'){
  					$("#keySet").html('Yes');
  					
  				}else if(obj.keySet.response == 'false'){
  					$("#sketchPlan").html('No');
  				}	
 				ans = ansObj.keySet.affirmativeAns;
 	 			if(obj.keySet.response.toString() == ans.toString()){
 	 				$("#keySetYes").show();
 				}else{
 					$("#keySetNo").show();
 				}
 			}
 			
		}
	}
	
	function viewFile(fieldName){
	      $.getJSON("view.htm?eCommand=CHECK-CONTENT&param="+fieldName , function(response) {
				 if(response.success == true || response.success == 'true' ){
					 $("#imageModal").show(); 
					 $.ajax({
							type: "GET",
							url:"view.htm?eCommand=VIEW-FILE&param="+fieldName,
							dataType : "json",
							contentType: 'application/json',
							success: function(response){
								window.location.href= "#imageModal";
								 $('#imageId').html('<img alt="Embedded Image" style="height:auto; width:auto; max-width:980px; max-height:600px;" src="data:image/png;base64,' +response.data+'" />');
							}
						});
				 }else{
						window.location.href = "download.htm?param="+fieldName; 
					}
	    	 });
	}
	
	function setCriteriaA(obj, ansObj){
		if(obj){
				var ans ;
				if(obj.structurallyStable.response == 'true'){
					$("#structurallyStable").html("Yes");
				}else if(obj.structurallyStable.response == 'false'){
					$("#structurallyStable").html("No");
				}
				ans = ansObj.structurallyStable.affirmativeAns;
				if(obj.structurallyStable.response.toString() == ans.toString()){
					$("#structurallyStableYes").show();
				}else{
					$("#structurallyStableNo").show();
				}
				if(obj.structurallyStable.response == 'null'){
					$("#structurallyStableNo").hide();
					$("#structurallyStableYes").hide();
				}
				$("#structurallyStableComments").html(obj.structurallyStable.comments);
				
				if(obj.freeFromSeriousDisRepair.response == 'true'){
					$("#freeFromSeriousDisRepair").html("Yes");
				}else if(obj.freeFromSeriousDisRepair.response == 'false'){
					$("#freeFromSeriousDisRepair").html("No");
				}
				ans = ansObj.freeFromSeriousDisRepair.affirmativeAns;
				if(obj.freeFromSeriousDisRepair.response.toString() == ans.toString()){
					$("#freeFromSeriousDisRepairYes").show();
				}else{
					$("#freeFromSeriousDisRepairNo").show();
				}
				if(obj.freeFromSeriousDisRepair.response == 'null'){
					$("#freeFromSeriousDisRepairNo").hide();
					$("#freeFromSeriousDisRepairYes").hide();
				}
				$("#freeFromSeriousDisRepairComments").html(obj.freeFromSeriousDisRepair.comments);
				
				
				if(obj.freeFromDampness.response == 'true'){
					$("#freeFromDampness").html("Yes");
					
				}else if(obj.freeFromDampness.response == 'false'){
					$("#freeFromDampness").html("No");
				}
				ans = ansObj.freeFromDampness.affirmativeAns;
				if(obj.freeFromDampness.response.toString() == ans.toString()){
					$("#freeFromDampnessYes").show();
				}else{
					$("#freeFromDampnessNo").show();
				}
				if(obj.freeFromDampness.response == 'null'){
					$("#freeFromDampnessYes").hide();
					$("#freeFromDampnessNo").hide();
				}
				$("#freeFromDampnessComments").html(obj.freeFromDampness.comments);
				
				
				if(obj.secureFromRisk.response == 'true'){
					$("#secureFromRisk").html('Yes');
				}else if(obj.secureFromRisk.response == 'false'){
					$("#secureFromRisk").html('No');
				}
				ans = ansObj.secureFromRisk.affirmativeAns;
				if(obj.secureFromRisk.response.toString() == ans.toString()){
					$("#secureFromRiskYes").show();
				}else{
					$("#secureFromRiskNo").show();
				}
				if(obj.secureFromRisk.response == 'null'){
					$("#secureFromRiskYes").hide();
					$("#secureFromRiskNo").hide();
				}
				$("#secureFromRiskComments").html(obj.secureFromRisk.comments);
				
				
				if(obj.safeFromRiskOfFire.response == 'true'){
					$("#safeFromRiskOfFire").html('Yes');
					
				}else if(obj.safeFromRiskOfFire.response == 'false'){
					$("#safeFromRiskOfFire").html('No');
					
				}
				ans = ansObj.safeFromRiskOfFire.affirmativeAns;
				if(obj.safeFromRiskOfFire.response.toString() == ans.toString()){
					$("#safeFromRiskOfFireYes").show();
				}else{
					$("#safeFromRiskOfFireNo").show();
				}
				if(obj.safeFromRiskOfFire.response == 'null'){
					$("#safeFromRiskOfFireYes").hide();
					$("#safeFromRiskOfFireNo").hide();
				}
				$("#safeFromRiskOfFireComments").html(obj.safeFromRiskOfFire.comments);
				
				if(obj.adequateSpace.response == 'true'){
					$("#adequateSpace").html('Yes');
					
				}else if(obj.adequateSpace.response == 'false'){
					$("#adequateSpace").html('No');
				}
				ans = ansObj.adequateSpace.affirmativeAns;
				if(obj.adequateSpace.response.toString() == ans.toString()){
					$("#adequateSpaceYes").show();
				}else{
					$("#adequateSpaceNo").show();
				}
				if(obj.adequateSpace.response == 'null'){
					$("#adequateSpaceYes").hide();
					$("#adequateSpaceNo").hide();
				}
				$("#adequateSpaceComments").html(obj.adequateSpace.comments);
				
				if(obj.adequateLighting.response == 'true'){
					$("#adequateLighting").html('Yes');
					
				}else if(obj.adequateLighting.response == 'false'){
					$("#adequateLighting").html('No');
					
				}
				
				ans = ansObj.adequateLighting.affirmativeAns;
				if(obj.adequateLighting.response.toString() == ans.toString()){
					$("#adequateLightingYes").show();
				}else{
					$("#adequateLightingNo").show();
				}
				if(obj.adequateLighting.response == 'null'){
					$("#adequateLightingYes").hide();
					$("#adequateLightingNo").hide();
				}
				$("#adequateLightingComments").html(obj.adequateLighting.comments);
				
				if(obj.noiseInsulation.response == 'true'){
					$("#noiseInsulation").html('Yes');
				}else if(obj.noiseInsulation.response == 'false'){
					$("#noiseInsulation").html('No');
				}
				ans = ansObj.noiseInsulation.affirmativeAns;
				if(obj.noiseInsulation.response.toString() == ans.toString()){
					$("#noiseInsulationYes").show();
				}else{
					$("#noiseInsulationNo").show();
				}
				if(obj.noiseInsulation.response == 'null'){
					$("#noiseInsulationYes").hide();
					$("#noiseInsulationNo").hide();
				}
				$("#noiseInsulationComments").html(obj.noiseInsulation.comments);
				
				if(obj.facilityForRefuseStorage.response == 'true'){
					$("#facilityForRefuseStorage").html('Yes');
					
				}else if(obj.facilityForRefuseStorage.response == 'false'){
					$("#facilityForRefuseStorage").html('No');
					
				}
				ans = ansObj.facilityForRefuseStorage.affirmativeAns;
				if(obj.facilityForRefuseStorage.response.toString() == ans.toString()){
					$("#facilityForRefuseStorageYes").show();
				}else{
					$("#facilityForRefuseStorageNo").show();
				}
				if(obj.facilityForRefuseStorage.response == 'null'){
					$("#facilityForRefuseStorageYes").hide();
					$("#facilityForRefuseStorageNo").hide();
				}
				$("#facilityForRefuseStorageComments").html(obj.facilityForRefuseStorage.comments);
				
				if(obj.adequateHeating.response == 'true'){
					$("#adequateHeating").html('Yes');
					
				}else if(obj.adequateHeating.response == 'false'){
					$("#adequateHeating").html('No');
					
				}
				ans = ansObj.adequateHeating.affirmativeAns;
				if(obj.adequateHeating.response.toString() == ans.toString()){
					$("#adequateHeatingYes").show();
				}else{
					$("#adequateHeatingNo").show();
				}
				if(obj.adequateHeating.response == 'null'){
					$("#adequateHeatingYes").hide();
					$("#adequateHeatingNo").hide();
				}
				$("#adequateHeatingComments").html(obj.adequateHeating.comments);
				
				if(obj.adequateVentilation.response == 'true'){
					$("#adequateVentilation").html('Yes');
					
				}else if(obj.adequateVentilation.response == 'false'){
					$("#adequateVentilation").html('No');
					
				}
				ans = ansObj.adequateVentilation.affirmativeAns;
				if(obj.adequateVentilation.response.toString() == ans.toString()){
					$("#adequateVentilationYes").show();
				}else{
					$("#adequateVentilationNo").show();
				}
				if(obj.adequateVentilation.response == 'null'){
					$("#adequateVentilationYes").hide();
					$("#adequateVentilationNo").hide();
				}
				$("#adequateVentilationComments").html(obj.adequateVentilation.comments);
				
				
				if(obj.adequateDrinkingWater.response == 'true'){
					$("#adequateDrinkingWater").html('Yes');
				}else if(obj.adequateDrinkingWater.response == 'false'){
					$("#adequateDrinkingWater").html('No');
				}
				ans = ansObj.adequateDrinkingWater.affirmativeAns;
				if(obj.adequateDrinkingWater.response.toString() == ans.toString()){
					$("#adequateDrinkingWaterYes").show();
				}else{
					$("#adequateDrinkingWaterNo").show();
				}
				if(obj.adequateDrinkingWater.response == 'null'){
					$("#adequateDrinkingWaterYes").hide();
					$("#adequateDrinkingWaterNo").hide();
				}
				$("#adequateDrinkingWaterComments").html(obj.adequateDrinkingWater.comments);
				
				if(obj.effectiveDrainage.response == 'true'){
					$("#effectiveDrainage").html('Yes');
					
				}else if(obj.effectiveDrainage.response == 'false'){
					$("#effectiveDrainage").html('No');
					
				}
				ans = ansObj.effectiveDrainage.affirmativeAns;
				if(obj.effectiveDrainage.response.toString() == ans.toString()){
					$("#effectiveDrainageYes").show();
				}else{
					$("#effectiveDrainageNo").show();
				}
				if(obj.effectiveDrainage.response == 'null'){
					$("#effectiveDrainageYes").hide();
					$("#effectiveDrainageNo").hide();
				}
				$("#effectiveDrainageComments").html(obj.effectiveDrainage.comments);
				
				if(obj.suitablyLocatedWC.response == 'true'){
					$("#suitablyLocatedWC").html('Yes');
					
				}else if(obj.suitablyLocatedWC.response == 'false'){
					$("#suitablyLocatedWC").html('No');
					
				}
				ans = ansObj.suitablyLocatedWC.affirmativeAns;
				if(obj.suitablyLocatedWC.response.toString() == ans.toString()){
					$("#suitablyLocatedWCYes").show();
				}else{
					$("#suitablyLocatedWCNo").show();
				}
				if(obj.suitablyLocatedWC.response == 'null'){
					$("#suitablyLocatedWCYes").hide();
					$("#suitablyLocatedWCNo").hide();
				}
				$("#suitablyLocatedWCComments").html(obj.suitablyLocatedWC.comments);
				
				if(obj.suitablyLocatedBath.response == 'true'){
					$("#suitablyLocatedBath").html('Yes');
					
				}else if(obj.suitablyLocatedBath.response == 'false'){
					$("#suitablyLocatedBath").html('No');
					
				}
				ans = ansObj.suitablyLocatedBath.affirmativeAns;
				if(obj.suitablyLocatedBath.response.toString() == ans.toString()){
					$("#suitablyLocatedBathYes").show();
				}else{
					$("#suitablyLocatedBathNo").show();
				}
				if(obj.suitablyLocatedBath.response == 'null'){
					$("#suitablyLocatedBathYes").hide();
					$("#suitablyLocatedBathNo").hide();
				}
				$("#suitablyLocatedBathComments").html(obj.suitablyLocatedBath.comments);
				
				if(obj.satisfactoryFacilitiesForCookingFood.response == 'true'){
					$("#satisfactoryFacilitiesForCookingFood").html('Yes');
					
				}else if(obj.satisfactoryFacilitiesForCookingFood.response == 'false'){
					$("#satisfactoryFacilitiesForCookingFood").html('No');
					
				}
				ans = ansObj.satisfactoryFacilitiesForCookingFood.affirmativeAns;
				if(obj.satisfactoryFacilitiesForCookingFood.response.toString() == ans.toString()){
					$("#satisfactoryFacilitiesForCookingFoodYes").show();
				}else{
					$("#satisfactoryFacilitiesForCookingFoodNo").show();
				}
				if(obj.satisfactoryFacilitiesForCookingFood.response == 'null'){
					$("#satisfactoryFacilitiesForCookingFoodYes").hide();
					$("#satisfactoryFacilitiesForCookingFoodNo").hide();
				}
				$("#satisfactoryFacilitiesForCookingFoodComments").html(obj.satisfactoryFacilitiesForCookingFood.comments);
				
				if(obj.safetyBarriers.response == 'true'){
					$("#safetyBarriers").html('Yes');
					
				}else if(obj.safetyBarriers.response == 'false'){
					$("#safetyBarriers").html('No');
					
				}
				ans = ansObj.safetyBarriers.affirmativeAns;
				if(obj.safetyBarriers.response.toString() == ans.toString()){
					$("#safetyBarriersYes").show();
				}else{
					$("#safetyBarriersNo").show();
				}
				if(obj.safetyBarriers.response == 'null'){
					$("#safetyBarriersYes").hide();
					$("#safetyBarriersNo").hide();
				}
				$("#safetyBarriersComments").html(obj.safetyBarriers.comments);
				
				if(obj.unreasonableRiskOfFalls.response == 'true'){
					$("#unreasonableRiskOfFalls").html('Yes');
					
				}else if(obj.unreasonableRiskOfFalls.response == 'false'){
					$("#unreasonableRiskOfFalls").html('No');
					
				}
				ans = ansObj.unreasonableRiskOfFalls.affirmativeAns;
				if(obj.unreasonableRiskOfFalls.response.toString() == ans.toString()){
					$("#unreasonableRiskOfFallsYes").show();
				}else{
					$("#unreasonableRiskOfFallsNo").show();
				}
				if(obj.unreasonableRiskOfFalls.response == 'null'){
					$("#unreasonableRiskOfFallsYes").hide();
					$("#unreasonableRiskOfFallsNo").hide();
				}
				$("#unreasonableRiskOfFallsComments").html(obj.unreasonableRiskOfFalls.comments);
				
				
				if(obj.electricalHazards.response == 'true'){
					$("#electricalHazards").html('Yes');
					
				}else if(obj.electricalHazards.response == 'false'){
					$("#electricalHazards").html('No');
					
				}
				ans = ansObj.electricalHazards.affirmativeAns;
				if(obj.electricalHazards.response.toString() == ans.toString()){
					$("#electricalHazardsYes").show();
				}else{
					$("#electricalHazardsNo").show();
				}
				if(obj.electricalHazards.response == 'null'){
					$("#electricalHazardsYes").hide();
					$("#electricalHazardsNo").hide();
				}
				$("#electricatHazardsComments").html(obj.electricalHazards.comments);
				
				if(obj.riskFromExplosion.response == 'true'){
					
					$("#riskFromExplosionYes").show();
				}else if(obj.riskFromExplosion.response == 'false'){
					
					$("#riskFromExplosionNo").show();
				}
				
				ans = ansObj.riskFromExplosion.affirmativeAns;
				if(obj.riskFromExplosion.response.toString() == ans.toString()){
					$("#riskFromExplosion").html('Yes');
				}else{
					$("#riskFromExplosion").html('No');
				}
				$("#riskFromExplosionComments").html(obj.riskFromExplosion.comments);
				
				
				if(obj.riskOfEntrapment.response == 'true'){
					$("#riskOfEntrapment").html('Yes');
				}else if(obj.riskOfEntrapment.response == 'false'){
					$("#riskOfEntrapment").html('No');
				}
				ans = ansObj.riskOfEntrapment.affirmativeAns;
				if(obj.riskOfEntrapment.response.toString() == ans.toString()){
					$("#riskOfEntrapmentYes").show();
				}else{
					$("#riskOfEntrapmentNo").show();
				}
				if(obj.riskOfEntrapment.response == 'null'){
					$("#riskOfEntrapmentYes").hide();
					$("#riskOfEntrapmentNo").hide();
				}
				$("#riskOfEntrapmentComments").html(obj.riskOfEntrapment.comments);
				
				if(obj.pollutants.response == 'true'){
					$("#pollutants").html('Yes');
				}else if(obj.pollutants.response == 'false'){
					$("#pollutants").html('Yes');
				}
				ans = ansObj.pollutants.affirmativeAns;
				if(obj.pollutants.response.toString() == ans.toString()){
					$("#pollutantsYes").show();
				}else{
					$("#pollutantsNo").show();
				}
				if(obj.pollutants.response == 'null'){
					$("#pollutants").hide();
					$("#pollutantsNo").hide();
				}
				$("#pollutantsComments").html(obj.pollutants.comments);
			}
	}
	
	function setCriteriaB(obj, ansObj){
			if(obj){
				var ans ;
				if(obj.externalWalls.response == 'true'){
					$("#externalWalls").html('Yes');
				}else if(obj.externalWalls.response == 'false'){
					$("#externalWalls").html('No');
				}
				ans = ansObj.externalWalls.affirmativeAns;
				if(obj.externalWalls.response.toString() == ans.toString()){
					$("#externalWallsYes").show();
				}else{
					$("#externalWallsNo").show();
				}
				if(obj.externalWalls.response == 'null'){
					$("#externalWallsYes").hide();
					$("#externalWallsNo").hide();
				}
				$("#externalWallsComments").html(obj.externalWalls.comments);
				
				if(obj.roofStructure.response == 'true'){
					$("#roofStructure").html('Yes');
				}else if(obj.roofStructure.response == 'false'){
					$("#roofStructure").html('No');
					$("#").show();
				}
				ans = ansObj.roofStructure.affirmativeAns;
				if(obj.roofStructure.response.toString() == ans.toString()){
					$("#roofStructureYes").show();
				}else{
					$("#roofStructureNo").show();
				}
				if(obj.roofStructure.response == 'null'){
					$("#roofStructureYes").hide();
					$("#roofStructureNo").hide();
				}
				$("#roofStructureComments").html(obj.roofStructure.comments);
				
				if(obj.doorAndWindow.response == 'true'){
					$("#doorAndWindow").html('Yes');
					$("#").show();
				}else if(obj.doorAndWindow.response == 'false'){
					$("#doorAndWindow").html('No');
					$("#").show();
				}
				ans = ansObj.doorAndWindow.affirmativeAns;
				if(obj.doorAndWindow.response.toString() == ans.toString()){
					$("#doorAndWindowYes").show();
				}else{
					$("#doorAndWindowNo").show();
				}
				if(obj.doorAndWindow.response == 'null'){
					$("#doorAndWindowYes").hide();
					$("#doorAndWindowNo").hide();
				}
				$("#doorAndWindowComments").html(obj.doorAndWindow.comments);
				
				if(obj.chimney.response == 'true'){
					$("#chimney").html('Yes');
				}else if(obj.chimney.response == 'false'){
					$("#chimney").html('No');
				}
				ans = ansObj.chimney.affirmativeAns;
				if(obj.chimney.response.toString() == ans.toString()){
					$("#chimneyYes").show();
				}else{
					$("#chimneyNo").show();
				}
				if(obj.chimney.response == 'null'){
					$("#chimneyYes").hide();
					$("#chimneyNo").hide();
				}
				$("#chimneyComments").html(obj.chimney.comments);
				
				if(obj.centralHeatingBoilers.response == 'true'){
					$("#centralHeatingBoilers").html('Yes');
				}else if(obj.centralHeatingBoilers.response == 'false'){
					$("#centralHeatingBoilers").html('No');
				}
				ans = ansObj.centralHeatingBoilers.affirmativeAns;
				if(obj.centralHeatingBoilers.response.toString() == ans.toString()){
					$("#centralHeatingBoilersYes").show();
				}else{
					$("#centralHeatingBoilersNo").show();
				}
				if(obj.centralHeatingBoilers.response == 'null'){
					$("#centralHeatingBoilersYes").hide();
					$("#centralHeatingBoilersNo").hide();
				}
				$("#centralHeatingBoilersComments").html(obj.centralHeatingBoilers.comments);
				
				if(obj.centralHeatingDistributionSystem.response == 'true'){
					$("#centralHeatingDistributionSystem").html('Yes');
				}else if(obj.centralHeatingDistributionSystem.response == 'false'){
					$("#centralHeatingDistributionSystem").html('No');
				}
				ans = ansObj.centralHeatingDistributionSystem.affirmativeAns;
				if(obj.centralHeatingDistributionSystem.response.toString() == ans.toString()){
					$("#centralHeatingDistributionSystemYes").show();
				}else{
					$("#centralHeatingDistributionSystemNo").show();
				}
				if(obj.centralHeatingDistributionSystem.response == 'null'){
					$("#centralHeatingDistributionSystemYes").hide();
					$("#centralHeatingDistributionSystemNo").hide();
				}
				$("#centralHeatingDistributionSystemComments").html(obj.centralHeatingDistributionSystem.comments);
				
				if(obj.gasFires.response == 'true'){
					$("#gasFires").html('Yes');
				}else if(obj.gasFires.response == 'false'){
					$("#gasFires").html('No');
				}
				ans = ansObj.gasFires.affirmativeAns;
				if(obj.gasFires.response.toString() == ans.toString()){
					$("#gasFiresYes").show();
				}else{
					$("#gasFiresNo").show();
				}
				if(obj.gasFires.response == 'null'){
					$("#gasFiresYes").hide();
					$("#gasFiresNo").hide();
				}
				$("#gasFiresComments").html(obj.gasFires.comments);

				if(obj.storageHeaters.response == 'true'){
					$("#storageHeaters").html('Yes');
				}else if(obj.storageHeaters.response == 'false'){
					$("#storageHeaters").html('No');
				}
				ans = ansObj.storageHeaters.affirmativeAns;
				if(obj.storageHeaters.response.toString() == ans.toString()){
					$("#storageHeatersYes").show();
				}else{
					$("#storageHeatersNo").show();
				}
				if(obj.storageHeaters.response == 'null'){
					$("#storageHeatersYes").hide();
					$("#storageHeatersNo").hide();
				}
				$("#storageHeatersComments").html(obj.storageHeaters.comments);

				if(obj.electric.response == 'true'){
					$("#electric").html('Yes');
				}else if(obj.electric.response == 'false'){
					$("#electric").html('No');
				}
				ans = ansObj.electric.affirmativeAns;
				if(obj.electric.response.toString() == ans.toString()){
					$("#electricYes").show();
				}else{
					$("#electricNo").show();
				}
				if(obj.electric.response == 'null'){
					$("#electricYes").hide();
					$("#electricNo").hide();
				}
				$("#electricComments").html(obj.electric.comments);
				
				if(obj.kitchenUnits.response == 'true'){
					$("#kitchenUnits").html('Yes');
				}else if(obj.kitchenUnits.response == 'false'){
					$("#kitchenUnits").html('No');
				}
				ans = ansObj.kitchenUnits.affirmativeAns;
				if(obj.kitchenUnits.response.toString() == ans.toString()){
					$("#kitchenUnitsYes").show();
				}else{
					$("#kitchenUnitsNo").show();
				}
				if(obj.kitchenUnits.response == 'null'){
					$("#kitchenUnitsYes").hide();
					$("#kitchenUnitsNo").hide();
				}
				$("#kitchenUnitsComments").html(obj.kitchenUnits.comments);
				
				if(obj.bathroom.response == 'true'){
					$("#bathroom").html('Yes');
				}else if(obj.bathroom.response == 'false'){
					$("#bathroom").html('No');
				}
				ans = ansObj.bathroom.affirmativeAns;
				if(obj.bathroom.response.toString() == ans.toString()){
					$("#bathroomYes").show();
				}else{
					$("#bathroomNo").show();
				}
				if(obj.bathroom.response == 'null'){
					$("#bathroomYes").hide();
					$("#bathroomNo").hide();
				}
				$("#bathroomComments").html(obj.bathroom.comments);

				if(obj.centralHeatingParts.response == 'true'){
					$("#centralHeatingParts").html('Yes');
				}else if(obj.centralHeatingParts.response == 'false'){
					$("#centralHeatingParts").html('No');
				}
				ans = ansObj.centralHeatingParts.affirmativeAns;
				if(obj.centralHeatingParts.response.toString() == ans.toString()){
					$("#centralHeatingPartsYes").show();
				}else{
					$("#centralHeatingPartsNo").show();
				}
				if(obj.centralHeatingParts.response == 'null'){
					$("#centralHeatingPartsYes").hide();
					$("#centralHeatingPartsNo").hide();
				}
				$("#centralHeatingPartsComments").html(obj.centralHeatingParts.comments);
			}
	}
	
	function setCriteriaC(obj, ansObj){
			if(obj){
				if(obj.kitchen.response == 'true'){
					$("#kitchen").html('Yes');
				}else if(obj.kitchen.response == 'false'){
					$("#kitchen").html('Yes');
				}
				ans = ansObj.kitchen.affirmativeAns;
				if(obj.kitchen.response.toString() == ans.toString()){
					$("#kitchenYes").show();
				}else{
					$("#kitchenNo").show();
				}
				if(obj.kitchen.response == 'null'){
					$("#kitchenYes").hide();
					$("#kitchenNo").hide();
				}
				$("#kitchenComments").html(obj.kitchen.comments);

				if(obj.adequateKitchenSpace.response == 'true'){
					$("#adequateKitchenSpace").html('Yes');
				}else if(obj.adequateKitchenSpace.response == 'false'){
					$("#adequateKitchenSpace").html('No');
				}
				ans = ansObj.adequateKitchenSpace.affirmativeAns;
				if(obj.adequateKitchenSpace.response.toString() == ans.toString()){
					$("#adequateKitchenSpaceYes").show();
				}else{
					$("#adequateKitchenSpaceNo").show();
				}
				if(obj.adequateKitchenSpace.response == 'null'){
					$("#adequateKitchenSpaceYes").hide();
					$("#adequateKitchenSpaceNo").hide();
				}
					
				$("#adequateKitchenSpaceComments").html(obj.adequateKitchenSpace.comments);

				if(obj.adequateNoiceInsulation.response == 'true'){
					$("#adequateNoiceInsulation").html('Yes');
				}else if(obj.adequateNoiceInsulation.response == 'false'){
					$("#adequateNoiceInsulation").html('No');
				}
				ans = ansObj.adequateNoiceInsulation.affirmativeAns;
				if(obj.adequateNoiceInsulation.response.toString() == ans.toString()){
					$("#adequateNoiceInsulationYes").show();
				}else{
					$("#adequateNoiceInsulationNo").show();
				}
				if(obj.adequateNoiceInsulation.response == 'null'){
					$("#adequateNoiceInsulationYes").hide();
					$("#adequateNoiceInsulationNo").hide();
				}
				$("#adequateNoiceInsulationComments").html(obj.adequateNoiceInsulation.comments);

				if(obj.adequateLayoutofCommonEntrance.response == 'true'){
					$("#adequateLayoutofCommonEntrance").html('Yes');
				}else if(obj.adequateLayoutofCommonEntrance.response == 'false'){
					$("#adequateLayoutofCommonEntrance").html('No');
				}
				ans = ansObj.adequateLayoutofCommonEntrance.affirmativeAns;
				if(obj.adequateLayoutofCommonEntrance.response.toString() == ans.toString()){
					$("#adequateLayoutofCommonEntranceYes").show();
				}else{
					$("#adequateLayoutofCommonEntranceNo").show();
				}
				if(obj.adequateLayoutofCommonEntrance.response == 'null'){
					$("#adequateLayoutofCommonEntranceYes").hide();
					$("#adequateLayoutofCommonEntranceNo").hide();
				}
				$("#adequateLayoutofCommonEntranceComments").html(obj.adequateLayoutofCommonEntrance.comments);
				
				if(obj.bathroomAge.response == 'true'){
					$("#bathroomAge").html('Yes');
				}else if(obj.bathroomAge.response == 'false'){
					$("#bathroomAge").html('No');
				}
				ans = ansObj.bathroomAge.affirmativeAns;
				if(obj.bathroomAge.response.toString() == ans.toString()){
					$("#bathroomAgeYes").show();
				}else{
					$("#bathroomAgeNo").show();
				}
				if(obj.bathroomAge.response == 'null'){
					$("#bathroomAgeYes").hide();
					$("#bathroomAgeNo").hide();
				}
				$("#bathroomAgeComments").html(obj.bathroomAge.comments);

				if(obj.appropriateLocatedBathrooms.response == 'true'){
					$("#appropriateLocatedBathrooms").html('Yes');
					
				}else if(obj.appropriateLocatedBathrooms.response == 'false'){
					$("#appropriateLocatedBathrooms").html('No');
					
				}
				ans = ansObj.appropriateLocatedBathrooms.affirmativeAns;
				if(obj.appropriateLocatedBathrooms.response.toString() == ans.toString()){
					$("#appropriateLocatedBathroomsYes").show();
				}else{
					$("#appropriateLocatedBathroomsNo").show();
				}
				if(obj.appropriateLocatedBathrooms.response == 'null'){
					$("#appropriateLocatedBathroomsYes").hide();
					$("#appropriateLocatedBathroomsNo").hide();
				}
				$("#appropriateLocatedBathroomsComments").html(obj.appropriateLocatedBathrooms.comments);

			}
	}
	
	function setCriteriaD(obj, ansObj){
			if(obj){
				if(obj.programmableCentralHeating.response == 'true'){
					$("#programmableCentralHeating").html('Yes');
				}else if(obj.programmableCentralHeating.response == 'false'){
					$("#programmableCentralHeating").html('No');
				}
				ans = ansObj.programmableCentralHeating.affirmativeAns;
				if(obj.programmableCentralHeating.response.toString() == ans.toString()){
					$("#programmableCentralHeatingYes").show();
				}else{
					$("#programmableCentralHeatingNo").show();
				}
				if(obj.programmableCentralHeating.response == 'null'){
					$("#programmableCentralHeatingYes").hide();
					$("#programmableCentralHeatingNo").hide();
				}
				
				if(obj.electricStorageHeaters.response == 'true'){
					$("#electricStorageHeaters").html('No');
				}else if(obj.electricStorageHeaters.response == 'false'){
					$("#electricStorageHeaters").html('No');
				}
				ans = ansObj.electricStorageHeaters.affirmativeAns;
				if(obj.electricStorageHeaters.response.toString() == ans.toString()){
					$("#electricStorageHeatersYes").show();
				}else{
					$("#electricStorageHeatersNo").show();
				}
				if(obj.electricStorageHeaters.response == 'null'){
					$("#electricStorageHeatersYes").hide();
					$("#electricStorageHeatersNo").hide();
				}
				$("#electricStorageHeatersComments").html(obj.electricStorageHeaters.comments);

				if(obj.fuelCentralHeating.response == 'true'){
					$("#fuelCentralHeating").html('No');
				}else if(obj.fuelCentralHeating.response == 'false'){
					$("#fuelCentralHeating").html('No');
				}
				ans = ansObj.fuelCentralHeating.affirmativeAns;
				if(obj.fuelCentralHeating.response.toString() == ans.toString()){
					$("#fuelCentralHeatingYes").show();
				}else{
					$("#fuelCentralHeatingNo").show();
				}
				if(obj.fuelCentralHeating.response == 'null'){
					$("#fuelCentralHeatingYes").hide();
					$("#fuelCentralHeatingNo").hide();
				}
				
				if(obj.warmAirSystem.response == 'true'){
					$("#warmAirSystem").html('No');
					
				}else if(obj.warmAirSystem.response == 'false'){
					$("#warmAirSystem").html('No');
					
				}
				ans = ansObj.warmAirSystem.affirmativeAns;
				if(obj.warmAirSystem.response.toString() == ans.toString()){
					$("#warmAirSystemYes").show();
				}else{
					$("#warmAirSystemNo").show();
				}
				if(obj.warmAirSystem.response == 'null'){
					$("#warmAirSystemYes").hide();
					$("#warmAirSystemNo").hide();
				}
				$("#warmAirSystemComments").html(obj.warmAirSystem.comments);
				
				if(obj.underFloorSystem.response == 'true'){
					$("#underFloorSystem").html('No');
					
				}else if(obj.underFloorSystem.response == 'false'){
					$("#underFloorSystem").html('No');
					
				}
				ans = ansObj.underFloorSystem.affirmativeAns;
				if(obj.underFloorSystem.response.toString() == ans.toString()){
					$("#underFloorSystemYes").show();
				}else{
					$("#underFloorSystemNo").show();
				}
				if(obj.underFloorSystem.response == 'null'){
					$("#underFloorSystemYes").hide();
					$("#underFloorSystemNo").hide();
				}
				$("#underFloorSystemComments").html(obj.underFloorSystem.comments);
				
				if(obj.efficientHeatingSystem.response == 'true'){
					$("#efficientHeatingSystem").html('No');
					
				}else if(obj.efficientHeatingSystem.response == 'false'){
					$("#efficientHeatingSystem").html('No');
					
				}
				ans = ansObj.efficientHeatingSystem.affirmativeAns;
				if(obj.efficientHeatingSystem.response.toString() == ans.toString()){
					$("#efficientHeatingSystemYes").show();
				}else{
					$("#efficientHeatingSystemNo").show();
				}
				if(obj.efficientHeatingSystem.response == 'null'){
					$("#efficientHeatingSystemYes").hide();
					$("#efficientHeatingSystemNo").hide();
				}
				$("#efficientHeatingSystemComments").html(obj.efficientHeatingSystem.comments);
				
				if(obj.centralHeating.response == 'true'){
					$("#centralHeating").html('No');
					
				}else if(obj.centralHeating.response == 'false'){
					$("#centralHeating").html('No');
					
				}
				ans = ansObj.centralHeating.affirmativeAns;
				if(obj.centralHeating.response.toString() == ans.toString()){
					$("#centralHeatingYes").show();
				}else{
					$("#centralHeatingNo").show();
				}
				if(obj.centralHeating.response == 'null'){
					$("#centralHeatingYes").hide();
					$("#centralHeatingNo").hide();
				}
				$("#centralHeatingComments").html(obj.centralHeating.comments);

				
				if(obj.cavityWallInsulation50mm.response == 'true'){
					$("#cavityWallInsulation50mm").html('No');
					
				}else if(obj.cavityWallInsulation50mm.response == 'false'){
					$("#cavityWallInsulation50mm").html('No');
					
				}
				ans = ansObj.cavityWallInsulation50mm.affirmativeAns;
				if(obj.cavityWallInsulation50mm.response.toString() == ans.toString()){
					$("#cavityWallInsulation50mmYes").show();
				}else{
					$("#cavityWallInsulation50mmNo").show();
				}
				if(obj.cavityWallInsulation50mm.response == 'null'){
					$("#cavityWallInsulation50mmNo").hide();
					$("#cavityWallInsulation50mmYes").hide();
				}
				$("#cavityWallInsulation50mmComments").html(obj.cavityWallInsulation50mm.comments);

				if(obj.cavityWallInsulation200mm.response == 'true'){
					$("#cavityWallInsulation200mm").html('No');
					
				}else if(obj.cavityWallInsulation200mm.response == 'false'){
					$("#cavityWallInsulation200mm").html('No');
				}
				ans = ansObj.cavityWallInsulation200mm.affirmativeAns;
				if(obj.cavityWallInsulation200mm.response.toString() == ans.toString()){
					$("#cavityWallInsulation200mmYes").show();
				}else{
					$("#cavityWallInsulation200mmNo").show();
				}
				if(obj.cavityWallInsulation200mm.response == 'null'){
					$("#cavityWallInsulation200mmYes").hide();
					$("#cavityWallInsulation200mmNo").hide();
				}
				$("#cavityWallInsulation200mmComments").html(obj.cavityWallInsulation200mm.comments);
				
			}
	}