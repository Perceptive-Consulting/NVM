
	var globalAnsObj = null;
	var globalResponse;

$(document).ready(function(){
	$(".FileView").fancybox({helpers: { title : { type : 'float' }}});
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
			    	window.location.href = contextPath+"/property/submitReviewProperty.htm";
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });

	 
	 $("#hmoLicenceId").click(function(event){
			$.ajax({	
				
			    url : contextPath+"/property/loadHMOLicense.htm",
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
	 
	 $("#criteriaA").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/loadDHSCriteriaA.htm",
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
	 
	 $("#criteriaB").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/loadDHSCriteriaB.htm",
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
	 
	 $("#criteriaC").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/loadDHSCriteriaC.htm",
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
	 
	 $("#criteriaD").click(function(event){
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/property/loadDHSCriteriaD.htm",
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
				var cPath = contextPath + "/";
				if(obj.hmoLicence.response == 'true'){
					$("#hmoLicence").html('Yes');
					$("#hmoLicenceComments").html(obj.licenceNumber.comments);
				}else if(obj.hmoLicence.response == 'false'){
					$("#hmoLicence").html('No');
				}else if(obj.hmoLicence.response == 'equalToTrue'){
					$("#hmoLicence").html('Not Applicable');
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
				if(obj.hmoLicence.response.toString() == 'equalToTrue'){
					$("#hmoLicenceNo").hide();
					$("#hmoLicenceYes").show();
				}

 			if(obj.electricalInstallation){
 				if(obj.electricalInstallation.response == 'true'){
  					$("#electricalInstallation").html('Yes');
  					
	 				if(obj.electricalInstallation.fileName){
	 					$("#electricalInstallationFileDisplay").show();
		 				$("#electricalInstallationFileName").html(obj.electricalInstallation.fileName);
		 				if(obj.electricalInstallation.isImage == true || obj.electricalInstallation.isImage == 'true' ){
		 					var path = obj.electricalInstallation.filePath;
		 					$("#electricalInstallationFileView").show();
			 				$("#electricalInstallationFileView").attr("href", cPath + path );
		 				}
	 				}
  				}else if(obj.electricalInstallation.response == 'false'){
  					$("#electricalInstallation").html('No');
  				}else if(obj.electricalInstallation.response == 'later'){
  					$("#electricalInstallation").html('Yes, But Certificate is not uploaded');
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
		 				if(obj.electricalTest.isImage == true || obj.electricalTest.isImage == 'true'){
		 					var path = obj.electricalTest.filePath;
		 					$("#electricalTestFileView").show();
			 				$("#electricalTestFileView").attr("href", cPath + path );
		 				}
	 				}
  				}else if(obj.electricalTest.response == 'false'){
  					$("#electricalTest").html('No');
  				}else if(obj.electricalTest.response == 'later'){
  					$("#electricalTest").html('Yes, But Certificate is not uploaded');
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
		 				if(obj.gasCertificate.isImage == true || obj.gasCertificate.isImage == 'true'){
		 					var path = obj.gasCertificate.filePath;
		 					$("#gasCertificateFileView").show();
			 				$("#gasCertificateFileView").attr("href", cPath + path );
		 				}
	 				}
  					
  				}else if(obj.gasCertificate.response == 'false'){
  					$("#gasCertificate").html("No");
  				}else if(obj.gasCertificate.response == 'later'){
  					$("#gasCertificate").html('Yes, But Certificate is not uploaded');
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
		 				if(obj.energyPerformance.isImage == true || obj.energyPerformance.isImage == 'true'){
		 					var path = obj.energyPerformance.filePath;
		 					$("#energyPerformanceFileView").show();
			 				$("#energyPerformanceFileView").attr("href", cPath + path );
		 				}
	 				}
 				}else if(obj.energyPerformance.response == 'false'){
 					$("#energyPerformance").html('No');
  				}else if(obj.energyPerformance.response == 'later'){
  					$("#energyPerformance").html('Yes, But Certificate is not uploaded');
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
		 				if(obj.centralHeatingSystem.isImage){
		 					var path = obj.centralHeatingSystem.filePath;
		 					$("#centralHeatingSystemFileView").show();
			 				$("#centralHeatingSystemFileView").attr("href", cPath + path );
		 				}
	 				}
  				}else if(obj.centralHeatingSystem.response == 'false'){
  					$("#centralHeatingSystem").html('No');
  				}else if(obj.centralHeatingSystem.response == 'later'){
  					$("#energyPerformance").html('Yes, But Certificate is not uploaded');
  				}else if(obj.centralHeatingSystem.response == 'N/A'){
  					$("#centralHeatingSystem").html('Not Applicable');
  					$("#centralHeatingSystemYes").hide();
  					$("#centralHeatingSystemNo").hide();
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
		 				if(obj.buildingInsaurance.isImage == 'true' || obj.buildingInsaurance.isImage == true){
		 					var path = obj.buildingInsaurance.filePath;
		 					$("#buildingInsauranceFileView").show();
			 				$("#buildingInsauranceFileView").attr("href", cPath + path );
		 				}
	 				}
  				}else if(obj.buildingInsaurance.response == 'false'){
  					$("#buildingInsaurance").html("No");
  				}else if(obj.buildingInsaurance.response == 'later'){
  					$("#buildingInsaurance").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.buildingInsaurance.affirmativeAns;
 				if(obj.buildingInsaurance.response.toString() == ans.toString()){
 					$("#buildingInsauranceYes").show();
				}else{
					$("#buildingInsauranceNo").show();
				}
 			}
 			
 			if(obj.asbestosSurvey){
 				if(obj.asbestosSurvey.response == 'true'){
  					$("#asbestosSurvey").html('Yes');
  					if(obj.asbestosSurvey.fileName){
	 					$("#asbestosSurveyFileDisplay").show();
		 				$("#asbestosSurveyFileName").html(obj.asbestosSurvey.fileName);
		 				if(obj.asbestosSurvey.isImage == true || obj.asbestosSurvey.isImage == 'true'){
		 					var path = obj.asbestosSurvey.filePath;
		 					$("#asbestosSurveyFileView").show();
			 				$("#asbestosSurveyFileView").attr("href", cPath + path );
		 				}else{
		 					$("#asbestosSurveyFileView").hide();
		 				}
	 				}
  				}else if(obj.asbestosSurvey.response == 'false'){
  					$("#asbestosSurvey").html('No');
  				}else if(obj.asbestosSurvey.response == 'later'){
  					$("#asbestosSurvey").html("Yes, But Certificate is not uploaded");
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
		 				if(obj.periodicInspectionOfWaterSupply.isImage == true || obj.periodicInspectionOfWaterSupply.isImage == 'true'){
		 					var path = obj.periodicInspectionOfWaterSupply.filePath;
		 					$("#periodicInspectionOfWaterSupplyFileView").show();
			 				$("#periodicInspectionOfWaterSupplyFileView").attr("href", cPath + path );
		 				}else{
		 					$("#periodicInspectionOfWaterSupplyFileView").hide();
		 				}
	 				}
  				}else if(obj.periodicInspectionOfWaterSupply.response == 'false'){
  					$("#periodicInspectionOfWaterSupply").html('No');
  				}else if(obj.periodicInspectionOfWaterSupply.response == 'later'){
  					$("#periodicInspectionOfWaterSupply").html("Yes, But Certificate is not uploaded");
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
  					$("#keySet").html('No');
  				}	
 				ans = ansObj.keySet.affirmativeAns;
 	 			if(obj.keySet.response.toString() == ans.toString()){
 	 				$("#keySetYes").show();
 				}else{
 					$("#keySetNo").show();
 				}
 			}
 			if(obj.landTitleRegisteryDocument){
 				if(obj.landTitleRegisteryDocument.response == 'true'){
  					$("#landTitleRegisteryDocument").html('Yes');
  					if(obj.landTitleRegisteryDocument.fileName){
	 					$("#landTitleRegisteryDocumentFileDisplay").show();
		 				$("#landTitleRegisteryDocumentFileName").html(obj.landTitleRegisteryDocument.fileName);
		 				if(obj.landTitleRegisteryDocument.isImage == true || obj.landTitleRegisteryDocument.isImage == 'true'){
		 					var path = obj.landTitleRegisteryDocument.filePath;
		 					$("#landTitleRegisteryDocumentFileView").show();
			 				$("#landTitleRegisteryDocumentFileView").attr("href", cPath + path );
		 				}else{
		 					$("#landTitleRegisteryDocumentFileView").hide();
		 				}
	 				}
  				}else if(obj.landTitleRegisteryDocument.response == 'false'){
  					$("#landTitleRegisteryDocument").html('No');
  				}else if(obj.landTitleRegisteryDocument.response == 'later'){
  					$("#landTitleRegisteryDocument").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.landTitleRegisteryDocument.affirmativeAns;
 	 			if(obj.landTitleRegisteryDocument.response.toString() == ans.toString()){
 	 				$("#landTitleRegisteryDocumentYes").show();
 				}else{
 					$("#landTitleRegisteryDocumentNo").show();
 				}
 			}
 			
 			if(obj.inventoryForProperty){
 				if(obj.inventoryForProperty.response == 'true'){
  					$("#inventoryForProperty").html('Yes');
  					if(obj.inventoryForProperty.fileName){
	 					$("#inventoryForPropertyFileDisplay").show();
		 				$("#inventoryForPropertyFileName").html(obj.inventoryForProperty.fileName);
		 				if(obj.inventoryForProperty.isImage == true || obj.inventoryForProperty.isImage == 'true'){
		 					var path = obj.inventoryForProperty.filePath;
		 					$("#inventoryForPropertyFileView").show();
			 				$("#inventoryForPropertyFileView").attr("href", cPath + path );
		 				}else{
		 					$("#inventoryForPropertyFileView").hide();
		 				}
	 				}
  				}else if(obj.inventoryForProperty.response == 'false'){
  					$("#inventoryForProperty").html('No');
  				}else if(obj.inventoryForProperty.response == 'later'){
  					$("#inventoryForProperty").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.inventoryForProperty.affirmativeAns;
 	 			if(obj.inventoryForProperty.response.toString() == ans.toString()){
 	 				$("#inventoryForPropertyYes").show();
 				}else{
 					$("#inventoryForPropertyNo").show();
 				}
 			}
 			
 			
 			
 			if(obj.landlordInsauranceForContent){
 				if(obj.landlordInsauranceForContent.response == 'true'){
  					$("#landlordInsauranceForContent").html('Yes');
  					if(obj.landlordInsauranceForContent.fileName){
	 					$("#landlordInsauranceForContentFileDisplay").show();
		 				$("#landlordInsauranceForContentFileName").html(obj.landlordInsauranceForContent.fileName);
		 				if(obj.landlordInsauranceForContent.isImage == true || obj.landlordInsauranceForContent.isImage == 'true'){
		 					var path = obj.landlordInsauranceForContent.filePath;
		 					$("#landlordInsauranceForContentFileView").show();
			 				$("#landlordInsauranceForContentFileView").attr("href", cPath + path );
		 				}else{
		 					$("#landlordInsauranceForContentFileView").hide();
		 				}
	 				}
  				}else if(obj.landlordInsauranceForContent.response == 'false'){
  					$("#landlordInsauranceForContent").html('No');
  				}else if(obj.landlordInsauranceForContent.response == 'later'){
  					$("#landlordInsauranceForContent").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.landlordInsauranceForContent.affirmativeAns;
 	 			if(obj.landlordInsauranceForContent.response.toString() == ans.toString()){
 	 				$("#landlordInsauranceForContentYes").show();
 				}else{
 					$("#landlordInsauranceForContentNo").show();
 				}
 			}
 			
 			if(obj.windowAndDoorWarrantee){
 				if(obj.windowAndDoorWarrantee.response == 'true'){
  					$("#windowAndDoorWarrantee").html('Yes');
  					if(obj.windowAndDoorWarrantee.fileName){
	 					$("#windowAndDoorWarranteeFileDisplay").show();
		 				$("#windowAndDoorWarranteeFileName").html(obj.windowAndDoorWarrantee.fileName);
		 				if(obj.windowAndDoorWarrantee.isImage == true || obj.windowAndDoorWarrantee.isImage == 'true'){
		 					var path = obj.windowAndDoorWarrantee.filePath;
		 					$("#windowAndDoorWarranteeFileView").show();
			 				$("#windowAndDoorWarranteeFileView").attr("href", cPath + path );
		 				}else{
		 					$("#windowAndDoorWarranteeFileView").hide();
		 				}
	 				}
  				}else if(obj.windowAndDoorWarrantee.response == 'false'){
  					$("#windowAndDoorWarrantee").html('No');
  				}else if(obj.windowAndDoorWarrantee.response == 'later'){
  					$("#windowAndDoorWarrantee").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.windowAndDoorWarrantee.affirmativeAns;
 	 			if(obj.windowAndDoorWarrantee.response.toString() == ans.toString()){
 	 				$("#windowAndDoorWarranteeYes").show();
 				}else{
 					$("#windowAndDoorWarranteeNo").show();
 				}
 			}
 			
 			if(obj.dampPoofcourse){
 				if(obj.dampPoofcourse.response == 'true'){
  					$("#dampPoofcourse").html('Yes');
  					if(obj.dampPoofcourse.fileName){
	 					$("#dampPoofcourseFileDisplay").show();
		 				$("#dampPoofcourseFileName").html(obj.dampPoofcourse.fileName);
		 				if(obj.dampPoofcourse.isImage == true || obj.dampPoofcourse.isImage == 'true'){
		 					var path = obj.dampPoofcourse.filePath;
		 					$("#dampPoofcourseFileView").show();
			 				$("#dampPoofcourseFileView").attr("href", cPath + path );
		 				}else{
		 					$("#dampPoofcourseFileView").hide();
		 				}
	 				}
  				}else if(obj.dampPoofcourse.response == 'false'){
  					$("#dampPoofcourse").html('No');
  				}else if(obj.dampPoofcourse.response == 'later'){
  					$("#dampPoofcourse").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.dampPoofcourse.affirmativeAns;
 	 			if(obj.dampPoofcourse.response.toString() == ans.toString()){
 	 				$("#dampPoofcourseYes").show();
 				}else{
 					$("#dampPoofcourseNo").show();
 				}
 			}
 			
 			if(obj.fittedHobAndOven){
 				if(obj.fittedHobAndOven.response == 'true'){
  					$("#fittedHobAndOven").html('Yes');
  					if(obj.fittedHobAndOven.fileName){
	 					$("#fittedHobAndOvenFileDisplay").show();
		 				$("#fittedHobAndOvenFileName").html(obj.fittedHobAndOven.fileName);
		 				if(obj.fittedHobAndOven.isImage == true || obj.fittedHobAndOven.isImage == 'true'){
		 					var path = obj.fittedHobAndOven.filePath;
		 					$("#fittedHobAndOvenFileView").show();
			 				$("#fittedHobAndOvenFileView").attr("href", cPath + path );
		 				}else{
		 					$("#fittedHobAndOvenFileView").hide();
		 				}
	 				}
  				}else if(obj.fittedHobAndOven.response == 'false'){
  					$("#fittedHobAndOven").html('No');
  				}else if(obj.fittedHobAndOven.response == 'later'){
  					$("#fittedHobAndOven").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.fittedHobAndOven.affirmativeAns;
 	 			if(obj.fittedHobAndOven.response.toString() == ans.toString()){
 	 				$("#fittedHobAndOvenYes").show();
 				}else{
 					$("#fittedHobAndOvenNo").show();
 				}
 			}
 			
 			if(obj.electricShower){
 				if(obj.electricShower.response == 'true'){
  					$("#electricShower").html('Yes');
  					if(obj.electricShower.fileName){
	 					$("#electricShowerFileDisplay").show();
		 				$("#electricShowerFileName").html(obj.electricShower.fileName);
		 				if(obj.electricShower.isImage == true || obj.electricShower.isImage == 'true'){
		 					var path = obj.electricShower.filePath;
		 					$("#electricShowerFileView").show();
			 				$("#electricShowerFileView").attr("href", cPath + path );
		 				}else{
		 					$("#electricShowerFileView").hide();
		 				}
	 				}
  				}else if(obj.electricShower.response == 'false'){
  					$("#electricShower").html('No');
  				}else if(obj.electricShower.response == 'later'){
  					$("#electricShower").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.electricShower.affirmativeAns;
 	 			if(obj.electricShower.response.toString() == ans.toString()){
 	 				$("#electricShowerYes").show();
 				}else{
 					$("#electricShowerNo").show();
 				}
 			}
 			
 			if(obj.electricFires){
 				if(obj.electricFires.response == 'true'){
  					$("#electricFires").html('Yes');
  					if(obj.electricFires.fileName){
	 					$("#electricFiresFileDisplay").show();
		 				$("#electricFiresFileName").html(obj.electricFires.fileName);
		 				if(obj.electricFires.isImage == true || obj.electricFires.isImage == 'true'){
		 					var path = obj.electricFires.filePath;
		 					$("#electricFiresFileView").show();
			 				$("#electricFiresFileView").attr("href", cPath + path );
		 				}else{
		 					$("#electricFiresFileView").hide();
		 				}
	 				}
  				}else if(obj.electricFires.response == 'false'){
  					$("#electricFires").html('No');
  				}else if(obj.electricFires.response == 'later'){
  					$("#electricFires").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.electricFires.affirmativeAns;
 	 			if(obj.electricFires.response.toString() == ans.toString()){
 	 				$("#electricFiresYes").show();
 				}else{
 					$("#electricFiresNo").show();
 				}
 			}
 			
 			if(obj.manualForCentralHeating){
 				if(obj.manualForCentralHeating.response == 'true'){
  					$("#manualForCentralHeating").html('Yes');
  					if(obj.manualForCentralHeating.fileName){
	 					$("#manualForCentralHeatingFileDisplay").show();
		 				$("#manualForCentralHeatingFileName").html(obj.manualForCentralHeating.fileName);
		 				if(obj.manualForCentralHeating.isImage == true || obj.manualForCentralHeating.isImage == 'true'){
		 					var path = obj.manualForCentralHeating.filePath;
		 					$("#manualForCentralHeatingFileView").show();
			 				$("#manualForCentralHeatingFileView").attr("href", cPath + path );
		 				}else{
		 					$("#manualForCentralHeatingFileView").hide();
		 				}
	 				}
  				}else if(obj.manualForCentralHeating.response == 'false'){
  					$("#manualForCentralHeating").html('No');
  				}else if(obj.manualForCentralHeating.response == 'later'){
  					$("#manualForCentralHeating").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.manualForCentralHeating.affirmativeAns;
 	 			if(obj.manualForCentralHeating.response.toString() == ans.toString()){
 	 				$("#manualForCentralHeatingYes").show();
 				}else{
 					$("#manualForCentralHeatingNo").show();
 				}
 			}
 			
 			if(obj.timerForCentralHeating){
 				if(obj.timerForCentralHeating.response == 'true'){
  					$("#timerForCentralHeating").html('Yes');
  					if(obj.timerForCentralHeating.fileName){
	 					$("#timerForCentralHeatingFileDisplay").show();
		 				$("#timerForCentralHeatingFileName").html(obj.timerForCentralHeating.fileName);
		 				if(obj.timerForCentralHeating.isImage == true || obj.timerForCentralHeating.isImage == 'true'){
		 					var path = obj.timerForCentralHeating.filePath;
		 					$("#timerForCentralHeatingFileView").show();
			 				$("#timerForCentralHeatingFileView").attr("href", cPath + path );
		 				}else{
		 					$("#timerForCentralHeatingFileView").hide();
		 				}
	 				}
  				}else if(obj.timerForCentralHeating.response == 'false'){
  					$("#timerForCentralHeating").html('No');
  				}else if(obj.timerForCentralHeating.response == 'later'){
  					$("#timerForCentralHeating").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.timerForCentralHeating.affirmativeAns;
 	 			if(obj.timerForCentralHeating.response.toString() == ans.toString()){
 	 				$("#timerForCentralHeatingYes").show();
 				}else{
 					$("#timerForCentralHeatingNo").show();
 				}
 			}
 			
 			if(obj.manualForBoiler){
 				if(obj.manualForBoiler.response == 'true'){
  					$("#manualForBoiler").html('Yes');
  					if(obj.manualForBoiler.fileName){
	 					$("#manualForBoilerFileDisplay").show();
		 				$("#manualForBoilerFileName").html(obj.manualForBoiler.fileName);
		 				if(obj.manualForBoiler.isImage == true || obj.manualForBoiler.isImage == 'true'){
		 					var path = obj.manualForBoiler.filePath;
		 					$("#manualForBoilerFileView").show();
			 				$("#manualForBoilerFileView").attr("href", cPath + path );
		 				}else{
		 					$("#manualForBoilerFileView").hide();
		 				}
	 				}
  				}else if(obj.manualForBoiler.response == 'false'){
  					$("#manualForBoiler").html('No');
  				}else if(obj.manualForBoiler.response == 'later'){
  					$("#manualForBoiler").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.manualForBoiler.affirmativeAns;
 	 			if(obj.manualForBoiler.response.toString() == ans.toString()){
 	 				$("#manualForBoilerYes").show();
 				}else{
 					$("#manualForBoilerNo").show();
 				}
 			}
 			
 			if(obj.manualForFittedOven){
 				if(obj.manualForFittedOven.response == 'true'){
  					$("#manualForFittedOven").html('Yes');
  					if(obj.manualForFittedOven.fileName){
	 					$("#manualForFittedOvenFileDisplay").show();
		 				$("#manualForFittedOvenFileName").html(obj.manualForFittedOven.fileName);
		 				if(obj.manualForFittedOven.isImage == true || obj.manualForFittedOven.isImage == 'true'){
		 					var path = obj.manualForFittedOven.filePath;
		 					$("#manualForFittedOvenFileView").show();
			 				$("#manualForFittedOvenFileView").attr("href", cPath + path );
		 				}else{
		 					$("#manualForFittedOvenFileView").hide();
		 				}
	 				}
  				}else if(obj.manualForFittedOven.response == 'false'){
  					$("#manualForFittedOven").html('No');
  				}else if(obj.manualForFittedOven.response == 'later'){
  					$("#manualForFittedOven").html("Yes, But Certificate is not uploaded");
  				}	
 				ans = ansObj.manualForFittedOven.affirmativeAns;
 	 			if(obj.manualForFittedOven.response.toString() == ans.toString()){
 	 				$("#manualForFittedOvenYes").show();
 				}else{
 					$("#manualForFittedOvenNo").show();
 				}
 			}
		}
	}
	
	function setCriteriaA(obj, ansObj){
		if(obj){
				var ans ;
				var cPath = contextPath + "/";
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
				
				if(obj.insulation270mm.response == 'true'){
					$("#insulation270mm").html('Yes');
					$("#insulation270mmChild").show();
					if(obj.installationDate){
						$("#installationDate").html(obj.installationDate.comments);
					}
				}else if(obj.insulation270mm.response == 'false'){
					$("#insulation270mm").html('No');
				}
				ans = ansObj.insulation270mm.affirmativeAns;
				if(obj.insulation270mm.response.toString() == ans.toString()){
					$("#insulation270mmYes").show();
				}else{
					$("#insulation270mmNo").show();
				}
				if(obj.insulation270mm.response == 'null'){
					$("#insulation270mmYes").hide();
					$("#insulation270mmNo").hide();
				}
				$("#insulation270mmComments").html(obj.insulation270mm.comments);
				
				if(obj.adequateHeating.response == 'true'){
					$("#adequateHeating").html('Yes');
					$("#adequateHeatingChild").show();
					if(obj.boilerAge){
						$("#boilerAge").html(obj.boilerAge.comments + " Years");
					}
					
				}else if(obj.adequateHeating.response == 'false'){
					$("#adequateHeating").html('No');
					$("#adequateHeatingChild").hide();
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
				
				if(obj.pollutants.response == 'true'){
					$("#pollutants").html('Yes');
					
				}else if(obj.pollutants.response == 'false'){
					$("#pollutants").html('No');
					
				}
				ans = ansObj.pollutants.affirmativeAns;
				if(obj.pollutants.response.toString() == ans.toString()){
					$("#pollutantsYes").show();
				}else{
					$("#pollutantsNo").show();
				}
				if(obj.pollutants.response == 'null'){
					$("#pollutantsYes").hide();
					$("#pollutantsNo").hide();
				}
				$("#pollutantsComments").html(obj.pollutants.comments);
				
				if(obj.needRadonRiskReport){
	 				if(obj.needRadonRiskReport.response == 'true'){
	  					$("#needRadonRiskReport").html('Yes');
	  					if(obj.needRadonRiskReport.fileName){
		 					$("#needRadonRiskReportFileDisplay").show();
			 				$("#needRadonRiskReportFileName").html(obj.needRadonRiskReport.fileName);
			 				if(obj.needRadonRiskReport.isImage == true || obj.needRadonRiskReport.isImage == 'true'){
			 					var path = obj.needRadonRiskReport.filePath;
			 					$("#needRadonRiskReportFileView").show();
				 				$("#needRadonRiskReportFileView").attr("href", cPath + path );
			 				}else{
			 					$("#needRadonRiskReportFileView").hide();
			 				}
		 				}
	  				}else if(obj.needRadonRiskReport.response == 'false'){
	  					$("#needRadonRiskReport").html('No');
	  				}else if(obj.needRadonRiskReport.response == 'later'){
	  					$("#needRadonRiskReport").html("Yes, But Certificate is not uploaded");
	  				}	
	 				ans = ansObj.needRadonRiskReport.affirmativeAns;
	 	 			if(obj.needRadonRiskReport.response.toString() == ans.toString()){
	 	 				$("#needRadonRiskReportYes").show();
	 				}else{
	 					$("#needRadonRiskReportNo").show();
	 				}
	 			}
				$("#needRadonRiskReportComments").html(obj.needRadonRiskReport.comments);
				
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
				
			}
	}
	
	function setCriteriaB(obj, ansObj){
			if(obj){
				var ans ;
				var cPath = contextPath + "/";
				if(obj.adequateSizeandLayout.response == 'true'){
					$("#adequateSizeandLayout").html('Yes');
				}else if(obj.adequateSizeandLayout.response == 'false'){
					$("#adequateSizeandLayout").html('No');
				}
				ans = ansObj.adequateSizeandLayout.affirmativeAns;
				if(obj.adequateSizeandLayout.response.toString() == ans.toString()){
					$("#adequateSizeandLayoutYes").show();
				}else{
					$("#adequateSizeandLayoutNo").show();
				}
				if(obj.adequateSizeandLayout.response == 'null'){
					$("#adequateSizeandLayoutYes").hide();
					$("#adequateSizeandLayoutNo").hide();
				}
				$("#adequateSizeandLayoutComments").html(obj.adequateSizeandLayout.comments);
				
				if(obj.safeAgainstUnauthorizedEntry.response == 'true'){
					$("#safeAgainstUnauthorizedEntry").html('Yes');
				}else if(obj.safeAgainstUnauthorizedEntry.response == 'false'){
					$("#safeAgainstUnauthorizedEntry").html('No');
					$("#").show();
				}
				ans = ansObj.safeAgainstUnauthorizedEntry.affirmativeAns;
				if(obj.safeAgainstUnauthorizedEntry.response.toString() == ans.toString()){
					$("#safeAgainstUnauthorizedEntryYes").show();
				}else{
					$("#safeAgainstUnauthorizedEntryNo").show();
				}
				if(obj.safeAgainstUnauthorizedEntry.response == 'null'){
					$("#safeAgainstUnauthorizedEntryYes").hide();
					$("#safeAgainstUnauthorizedEntryNo").hide();
				}
				$("#safeAgainstUnauthorizedEntryComments").html(obj.safeAgainstUnauthorizedEntry.comments);
				
				if(obj.careTaker.response == 'true'){
					$("#careTaker").html('Yes');
				}else if(obj.careTaker.response == 'false'){
					$("#careTaker").html('No');
				}
				ans = ansObj.careTaker.affirmativeAns;
				if(obj.careTaker.response.toString() == ans.toString()){
					$("#careTakerYes").show();
				}else{
					$("#careTakerNo").show();
				}
				if(obj.careTaker.response == 'null'){
					$("#careTakerYes").hide();
					$("#careTakerNo").hide();
				}
				$("#careTakerComments").html(obj.careTaker.comments);
				
				if(obj.burglarAlarmSystem){
	 				if(obj.burglarAlarmSystem.response == 'true'){
	  					$("#burglarAlarmSystem").html('Yes');
	  				}else if(obj.burglarAlarmSystem.response == 'false'){
	  					$("#burglarAlarmSystem").html('No');
	  				}else if(obj.burglarAlarmSystem.response == 'later'){
	  					$("#burglarAlarmSystem").html("Yes, But Certificate is not uploaded");
	  				}
	 				if(obj.burglarAlarmSystem.fileName){
	 					$("#burglarAlarmSystemFileDisplay").show();
		 				$("#burglarAlarmSystemFileName").html(obj.burglarAlarmSystem.fileName);
		 				if(obj.burglarAlarmSystem.isImage == true || obj.burglarAlarmSystem.isImage == 'true'){
		 					var path = obj.burglarAlarmSystem.filePath;
		 					$("#burglarAlarmSystemFileView").show();
			 				$("#burglarAlarmSystemFileView").attr("href", cPath + path );
		 				}else{
		 					$("#burglarAlarmSystemFileView").hide();
		 				}
	 				}
	 				ans = ansObj.burglarAlarmSystem.affirmativeAns;
	 	 			if(obj.burglarAlarmSystem.response.toString() == ans.toString()){
	 	 				$("#burglarAlarmSystemYes").show();
	 				}else{
	 					$("#burglarAlarmSystemNo").show();
	 				}
	 			}
				if(obj.burglarAlarmSystem.response == 'null'){
					$("#burglarAlarmSystemYes").hide();
					$("#burglarAlarmSystemNo").hide();
				}
				$("#burglarAlarmSystemComments").html(obj.burglarAlarmSystem.comments);
				
				if(obj.allWindowsHaveKeys.response == 'true'){
					$("#allWindowsHaveKeys").html('Yes');
				}else if(obj.allWindowsHaveKeys.response == 'false'){
					$("#allWindowsHaveKeys").html('No');
				}
				ans = ansObj.allWindowsHaveKeys.affirmativeAns;
				if(obj.allWindowsHaveKeys.response.toString() == ans.toString()){
					$("#allWindowsHaveKeysYes").show();
				}else{
					$("#allWindowsHaveKeysNo").show();
				}
				if(obj.allWindowsHaveKeys.response == 'null'){
					$("#allWindowsHaveKeysYes").hide();
					$("#allWindowsHaveKeysNo").hide();
				}
				$("#allWindowsHaveKeysComments").html(obj.allWindowsHaveKeys.comments);
				
				if(obj.allWindowsHaveKeys.response == 'true'){
					$("#allWindowsHaveKeys").html('Yes');
				}else if(obj.allWindowsHaveKeys.response == 'false'){
					$("#allWindowsHaveKeys").html('No');
				}
				ans = ansObj.allWindowsHaveKeys.affirmativeAns;
				if(obj.allWindowsHaveKeys.response.toString() == ans.toString()){
					$("#allWindowsHaveKeysYes").show();
				}else{
					$("#allWindowsHaveKeysNo").show();
				}
				if(obj.allWindowsHaveKeys.response == 'null'){
					$("#allWindowsHaveKeysYes").hide();
					$("#allWindowsHaveKeysNo").hide();
				}
				$("#allWindowsHaveKeysComments").html(obj.allWindowsHaveKeys.comments);
				
				if(obj.adequateLightening.response == 'true'){
					$("#adequateLightening").html('Yes');
				}else if(obj.adequateLightening.response == 'false'){
					$("#adequateLightening").html('No');
				}
				ans = ansObj.adequateLightening.affirmativeAns;
				if(obj.adequateLightening.response.toString() == ans.toString()){
					$("#adequateLighteningYes").show();
				}else{
					$("#adequateLighteningNo").show();
				}
				if(obj.adequateLightening.response == 'null'){
					$("#adequateLighteningYes").hide();
					$("#adequateLighteningNo").hide();
				}
				$("#adequateLighteningComments").html(obj.adequateLightening.comments);

				if(obj.adequateSecurityLightening.response == 'true'){
					$("#adequateSecurityLightening").html('Yes');
				}else if(obj.adequateSecurityLightening.response == 'false'){
					$("#adequateSecurityLightening").html('No');
				}
				ans = ansObj.adequateSecurityLightening.affirmativeAns;
				if(obj.adequateSecurityLightening.response.toString() == ans.toString()){
					$("#adequateSecurityLighteningYes").show();
				}else{
					$("#adequateSecurityLighteningNo").show();
				}
				if(obj.adequateSecurityLightening.response == 'null'){
					$("#adequateSecurityLighteningYes").hide();
					$("#adequateSecurityLighteningNo").hide();
				}
				$("#adequateSecurityLighteningComments").html(obj.adequateSecurityLightening.comments);

				if(obj.externalLighteningAtNight.response == 'true'){
					$("#externalLighteningAtNight").html('Yes');
				}else if(obj.externalLighteningAtNight.response == 'false'){
					$("#externalLighteningAtNight").html('No');
				}
				ans = ansObj.externalLighteningAtNight.affirmativeAns;
				if(obj.externalLighteningAtNight.response.toString() == ans.toString()){
					$("#externalLighteningAtNightYes").show();
				}else{
					$("#externalLighteningAtNightNo").show();
				}
				if(obj.externalLighteningAtNight.response == 'null'){
					$("#externalLighteningAtNightYes").hide();
					$("#externalLighteningAtNightNo").hide();
				}
				$("#externalLighteningAtNightComments").html(obj.externalLighteningAtNight.comments);
				
				if(obj.complaintsAgainstNoise.response == 'true'){
					$("#complaintsAgainstNoise").html('Yes');
				}else if(obj.complaintsAgainstNoise.response == 'false'){
					$("#complaintsAgainstNoise").html('No');
				}
				ans = ansObj.complaintsAgainstNoise.affirmativeAns;
				if(obj.complaintsAgainstNoise.response.toString() == ans.toString()){
					$("#complaintsAgainstNoiseYes").show();
				}else{
					$("#complaintsAgainstNoiseNo").show();
				}
				if(obj.complaintsAgainstNoise.response == 'null'){
					$("#complaintsAgainstNoiseYes").hide();
					$("#complaintsAgainstNoiseNo").hide();
				}
				$("#complaintsAgainstNoiseComments").html(obj.complaintsAgainstNoise.comments);
				
				if(obj.safeBarriersAgainstFire.response == 'true'){
					$("#safeBarriersAgainstFire").html('Yes');
				}else if(obj.safeBarriersAgainstFire.response == 'false'){
					$("#safeBarriersAgainstFire").html('No');
				}
				ans = ansObj.safeBarriersAgainstFire.affirmativeAns;
				if(obj.safeBarriersAgainstFire.response.toString() == ans.toString()){
					$("#safeBarriersAgainstFireYes").show();
				}else{
					$("#safeBarriersAgainstFireNo").show();
				}
				if(obj.safeBarriersAgainstFire.response == 'null'){
					$("#safeBarriersAgainstFireYes").hide();
					$("#safeBarriersAgainstFireNo").hide();
				}
				$("#safeBarriersAgainstFireComments").html(obj.safeBarriersAgainstFire.comments);
				
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

			}
	}
	
	function setCriteriaC(obj, ansObj){
			if(obj){
				if(obj.kitchen.response == 'true'){
					$("#kitchen").html('Yes');
				}else if(obj.kitchen.response == 'false'){
					$("#kitchen").html('No');
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

				if(obj.appropriatePowerSockets.response == 'true'){
					$("#appropriatePowerSockets").html('Yes');
				}else if(obj.appropriatePowerSockets.response == 'false'){
					$("#appropriatePowerSockets").html('No');
				}
				ans = ansObj.appropriatePowerSockets.affirmativeAns;
				if(obj.appropriatePowerSockets.response.toString() == ans.toString()){
					$("#appropriatePowerSocketsYes").show();
				}else{
					$("#appropriatePowerSocketsNo").show();
				}
				if(obj.appropriatePowerSockets.response == 'null'){
					$("#appropriatePowerSocketsYes").hide();
					$("#appropriatePowerSocketsNo").hide();
				}
				$("#appropriatePowerSocketsComments").html(obj.appropriatePowerSockets.comments);
				
				if(obj.facilitiesForPreparationOfFood.response == 'true'){
					$("#facilitiesForPreparationOfFood").html('Yes');
				}else if(obj.facilitiesForPreparationOfFood.response == 'false'){
					$("#facilitiesForPreparationOfFood").html('No');
				}
				ans = ansObj.facilitiesForPreparationOfFood.affirmativeAns;
				if(obj.facilitiesForPreparationOfFood.response.toString() == ans.toString()){
					$("#facilitiesForPreparationOfFoodYes").show();
				}else{
					$("#facilitiesForPreparationOfFoodNo").show();
				}
				if(obj.facilitiesForPreparationOfFood.response == 'null'){
					$("#facilitiesForPreparationOfFoodYes").hide();
					$("#facilitiesForPreparationOfFoodNo").hide();
				}
				$("#facilitiesForPreparationOfFoodComments").html(obj.facilitiesForPreparationOfFood.comments);
				
				if(obj.storageOfFood.response == 'true'){
					$("#storageOfFood").html('Yes');
				}else if(obj.storageOfFood.response == 'false'){
					$("#storageOfFood").html('No');
				}
				ans = ansObj.storageOfFood.affirmativeAns;
				if(obj.storageOfFood.response.toString() == ans.toString()){
					$("#storageOfFoodYes").show();
				}else{
					$("#storageOfFoodNo").show();
				}
				if(obj.storageOfFood.response == 'null'){
					$("#storageOfFoodYes").hide();
					$("#storageOfFoodNo").hide();
				}
				$("#storageOfFoodComments").html(obj.storageOfFood.comments);
				
				if(obj.suitableVentilationOfKitchen.response == 'true'){
					$("#suitableVentilationOfKitchen").html('Yes');
				}else if(obj.suitableVentilationOfKitchen.response == 'false'){
					$("#suitableVentilationOfKitchen").html('No');
				}
				ans = ansObj.suitableVentilationOfKitchen.affirmativeAns;
				if(obj.suitableVentilationOfKitchen.response.toString() == ans.toString()){
					$("#suitableVentilationOfKitchenYes").show();
				}else{
					$("#suitableVentilationOfKitchenNo").show();
				}
				if(obj.suitableVentilationOfKitchen.response == 'null'){
					$("#suitableVentilationOfKitchenYes").hide();
					$("#suitableVentilationOfKitchenNo").hide();
				}
				$("#suitableVentilationOfKitchenComments").html(obj.suitableVentilationOfKitchen.comments);
				
				if(obj.suitableLocatedWashBasin.response == 'true'){
					$("#suitableLocatedWashBasin").html('Yes');
				}else if(obj.suitableLocatedWashBasin.response == 'false'){
					$("#suitableLocatedWashBasin").html('No');
				}
				ans = ansObj.suitableLocatedWashBasin.affirmativeAns;
				if(obj.suitableLocatedWashBasin.response.toString() == ans.toString()){
					$("#suitableLocatedWashBasinYes").show();
				}else{
					$("#suitableLocatedWashBasinNo").show();
				}
				if(obj.suitableLocatedWashBasin.response == 'null'){
					$("#suitableLocatedWashBasinYes").hide();
					$("#suitableLocatedWashBasinNo").hide();
				}
				$("#suitableLocatedWashBasinComments").html(obj.suitableLocatedWashBasin.comments);
				
				if(obj.drainageOfFoulWater.response == 'true'){
					$("#drainageOfFoulWater").html('Yes');
				}else if(obj.drainageOfFoulWater.response == 'false'){
					$("#drainageOfFoulWater").html('No');
				}
				ans = ansObj.drainageOfFoulWater.affirmativeAns;
				if(obj.drainageOfFoulWater.response.toString() == ans.toString()){
					$("#drainageOfFoulWaterYes").show();
				}else{
					$("#drainageOfFoulWaterNo").show();
				}
				if(obj.drainageOfFoulWater.response == 'null'){
					$("#drainageOfFoulWaterYes").hide();
					$("#drainageOfFoulWaterNo").hide();
				}
				$("#drainageOfFoulWaterComments").html(obj.drainageOfFoulWater.comments);
				
				if(obj.appropriatelyLocatedBathroom.response == 'true'){
					$("#appropriatelyLocatedBathroom").html('Yes');
				}else if(obj.appropriatelyLocatedBathroom.response == 'false'){
					$("#appropriatelyLocatedBathroom").html('No');
				}
				ans = ansObj.appropriatelyLocatedBathroom.affirmativeAns;
				if(obj.appropriatelyLocatedBathroom.response.toString() == ans.toString()){
					$("#appropriatelyLocatedBathroomYes").show();
				}else{
					$("#appropriatelyLocatedBathroomNo").show();
				}
				if(obj.appropriatelyLocatedBathroom.response == 'null'){
					$("#appropriatelyLocatedBathroomYes").hide();
					$("#appropriatelyLocatedBathroomNo").hide();
				}
				$("#appropriatelyLocatedBathroomComments").html(obj.appropriatelyLocatedBathroom.comments);
				
				if(obj.drinkingWater.response == 'true'){
					$("#drinkingWater").html('Yes');
				}else if(obj.drinkingWater.response == 'false'){
					$("#drinkingWater").html('No');
				}
				ans = ansObj.drinkingWater.affirmativeAns;
				if(obj.drinkingWater.response.toString() == ans.toString()){
					$("#drinkingWaterYes").show();
				}else{
					$("#drinkingWaterNo").show();
				}
				if(obj.drinkingWater.response == 'null'){
					$("#drinkingWaterYes").hide();
					$("#drinkingWaterNo").hide();
				}
				$("#drinkingWaterComments").html(obj.drinkingWater.comments);
				
				if(obj.refuseStorage.response == 'true'){
					$("#refuseStorage").html('Yes');
				}else if(obj.refuseStorage.response == 'false'){
					$("#refuseStorage").html('No');
				}
				ans = ansObj.refuseStorage.affirmativeAns;
				if(obj.refuseStorage.response.toString() == ans.toString()){
					$("#refuseStorageYes").show();
				}else{
					$("#refuseStorageNo").show();
				}
				if(obj.refuseStorage.response == 'null'){
					$("#refuseStorageYes").hide();
					$("#refuseStorageNo").hide();
				}
				$("#refuseStorageComments").html(obj.refuseStorage.comments);
			}
	}
	
	function setCriteriaD(obj, ansObj){
			if(obj){
				if(obj.riskOfFall.response == 'true'){
					$("#riskOfFall").html('Yes');
				}else if(obj.riskOfFall.response == 'false'){
					$("#riskOfFall").html('No');
				}
				ans = ansObj.riskOfFall.affirmativeAns;
				if(obj.riskOfFall.response.toString() == ans.toString()){
					$("#riskOfFallYes").show();
				}else{
					$("#riskOfFallNo").show();
				}
				if(obj.riskOfFall.response == 'null'){
					$("#riskOfFallYes").hide();
					$("#riskOfFallNo").hide();
				}
				$("#riskOfFallComments").html(obj.riskOfFall.comments);
				
				if(obj.adequateNaturalLightening.response == 'true'){
					$("#adequateNaturalLightening").html('Yes');
				}else if(obj.adequateNaturalLightening.response == 'false'){
					$("#adequateNaturalLightening").html('No');
				}
				ans = ansObj.adequateNaturalLightening.affirmativeAns;
				if(obj.adequateNaturalLightening.response.toString() == ans.toString()){
					$("#adequateNaturalLighteningYes").show();
				}else{
					$("#adequateNaturalLighteningNo").show();
				}
				if(obj.adequateNaturalLightening.response == 'null'){
					$("#adequateNaturalLighteningYes").hide();
					$("#adequateNaturalLighteningNo").hide();
				}
				$("#adequateNaturalLighteningComments").html(obj.adequateNaturalLightening.comments);

				if(obj.securedStepsAndRamps.response == 'true'){
					$("#securedStepsAndRamps").html('Yes');
				}else if(obj.securedStepsAndRamps.response == 'false'){
					$("#securedStepsAndRamps").html('No');
				}
				ans = ansObj.securedStepsAndRamps.affirmativeAns;
				if(obj.securedStepsAndRamps.response.toString() == ans.toString()){
					$("#securedStepsAndRampsYes").show();
				}else{
					$("#securedStepsAndRampsNo").show();
				}
				if(obj.securedStepsAndRamps.response == 'null'){
					$("#securedStepsAndRampsYes").hide();
					$("#securedStepsAndRampsNo").hide();
				}
				$("#securedStepsAndRampsComments").html(obj.securedStepsAndRamps.comments);
				
				if(obj.doorsDirection.response == 'true'){
					$("#doorsDirection").html('Yes');
					
				}else if(obj.doorsDirection.response == 'false'){
					$("#doorsDirection").html('No');
				}
				ans = ansObj.doorsDirection.affirmativeAns;
				if(obj.doorsDirection.response.toString() == ans.toString()){
					$("#doorsDirectionYes").show();
				}else{
					$("#doorsDirectionNo").show();
				}
				if(obj.doorsDirection.response == 'null'){
					$("#doorsDirectionYes").hide();
					$("#doorsDirectionNo").hide();
				}
				$("#doorsDirectionComments").html(obj.doorsDirection.comments);
				
				if(obj.moreThanOneFlightOfStairs.response == 'true'){
					$("#moreThanOneFlightOfStairs").html('Yes');
					
				}else if(obj.moreThanOneFlightOfStairs.response == 'false'){
					$("#moreThanOneFlightOfStairs").html('No');
					
				}
				ans = ansObj.moreThanOneFlightOfStairs.affirmativeAns;
				if(obj.moreThanOneFlightOfStairs.response.toString() == ans.toString()){
					$("#moreThanOneFlightOfStairsYes").show();
				}else{
					$("#moreThanOneFlightOfStairsNo").show();
				}
				if(obj.moreThanOneFlightOfStairs.response == 'null'){
					$("#moreThanOneFlightOfStairsYes").hide();
					$("#moreThanOneFlightOfStairsNo").hide();
				}
				$("#moreThanOneFlightOfStairsComments").html(obj.moreThanOneFlightOfStairs.comments);
				
				if(obj.buildingRegulation.response == 'true'){
					$("#buildingRegulation").html('Yes');
					$("#buildingRegulationDateDivision").show();
					$("#buildingRegulationDate").html(obj.buildingRegulationDate.comments);
					
				}else if(obj.buildingRegulation.response == 'false'){
					$("#buildingRegulation").html('No');
				}
				ans = ansObj.buildingRegulation.affirmativeAns;
				if(obj.buildingRegulation.response.toString() == ans.toString()){
					$("#buildingRegulationYes").show();
				}else{
					$("#buildingRegulationNo").show();
				}
				if(obj.buildingRegulation.response == 'null'){
					$("#buildingRegulationYes").hide();
					$("#buildingRegulationNo").hide();
				}
				$("#buildingRegulationComments").html(obj.buildingRegulation.comments);
				
				if(obj.spaceAccessedViaFlightOfStairs.response == 'null'){
					$("#spaceAccessedViaFlightOfStairsComments").html(obj.spaceAccessedViaFlightOfStairs.comments);
				}
								
				if(obj.electricalWiringStandards.response == 'true'){
					$("#electricalWiringStandards").html('Yes');
					
				}else if(obj.electricalWiringStandards.response == 'false'){
					$("#electricalWiringStandards").html('No');
					
				}
				ans = ansObj.electricalWiringStandards.affirmativeAns;
				if(obj.electricalWiringStandards.response.toString() == ans.toString()){
					$("#electricalWiringStandardsYes").show();
				}else{
					$("#electricalWiringStandardsNo").show();
				}
				if(obj.electricalWiringStandards.response == 'null'){
					$("#electricalWiringStandardsYes").hide();
					$("#electricalWiringStandardsNo").hide();
				}
				$("#electricalWiringStandardsComments").html(obj.electricalWiringStandards.comments);

				
				if(obj.trappingBodyParts.response == 'true'){
					$("#trappingBodyParts").html('Yes');
					
				}else if(obj.trappingBodyParts.response == 'false'){
					$("#trappingBodyParts").html('No');
					
				}
				ans = ansObj.trappingBodyParts.affirmativeAns;
				if(obj.trappingBodyParts.response.toString() == ans.toString()){
					$("#trappingBodyPartsYes").show();
				}else{
					$("#trappingBodyPartsNo").show();
				}
				if(obj.trappingBodyParts.response == 'null'){
					$("#trappingBodyPartsNo").hide();
					$("#trappingBodyPartsYes").hide();
				}
				$("#trappingBodyPartsComments").html(obj.trappingBodyParts.comments);
				
			}
	}