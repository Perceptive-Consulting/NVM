var propertyIdd;
var globalResponse;
var imgs=[];
var cPath = contextPath+"/";
function add(propertyId){
	$(".FileView").fancybox({helpers: { title : { type : 'float' }}});
	propertyIdd = propertyId;
	pageOne();
}

$("#accordion > li").click(function(){
	if(false == $(this).next().is(':visible')) {
		$('#accordion > ul').slideUp(1000);
	}
	$(this).next().slideToggle(1000);
});
$('#accordion > ul:eq(0)').show();
pageOne();
$('#pageOne').click(function(){
	pageOne();
});

function pageOne(){
	$.ajax({
	      url: contextPath+"/admin/displayAdpl2.htm?adpl2Id=2&id="+propertyId,
	      type: "post",
	      dataType: "json",
	      success: function(result){
	    	  var obj = result.data;
	    	  globalResponse = obj;
	      if(obj.hmoLicence){
	    	  if(obj.hmoLicence.response == 'true')
	    	  $("#hmoLicence").html('Yes');
	    	  else if(obj.hmoLicence.response == 'false')
		    	  $("#hmoLicence").html('No');
	    	  else if(obj.hmoLicence.response == 'equalToTrue')
		    	  $("#hmoLicence").html('Not Applicable');
	      }
	      if(obj.licenceNumber){
	    	  	$("#HMOLicenceNumberID").html(obj.licenceNumber.comments);
	      }
	      if(obj.electricalInstallation){
				if(obj.electricalInstallation.response == 'true'){
					 $("#electricalInstallation").html('Yes');
	 				if(obj.electricalInstallation.fileName){
	 					$("#electricalInstallation1").attr("checked", true);
	 					$("#electricalInstallationFileDisplay").show();
		 				$("#electricalInstallationFileName").html(obj.electricalInstallation.fileName);
		 				if(obj.electricalInstallation.isImage == 'true' || obj.electricalInstallation.isImage == true){
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
				 $("#electricalInstallationComments").html(""+obj.electricalInstallation.comments);
			}
	      
	      if(obj.electricalTest){
				if(obj.electricalTest.response == 'true'){
					 $("#electricalTest").html('Yes');
	 				if(obj.electricalTest.fileName){
	 					$("#electricalTestFileDisplay").show();
		 				$("#electricalTestFileName").html(obj.electricalTest.fileName);
		 				if(obj.electricalTest.isImage == 'true' || obj.electricalTest.isImage == true){
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
				 $("#electricalTestComments").html(""+obj.electricalTest.comments);
			}
	      
	      if(obj.gasCertificate){
				if(obj.gasCertificate.response == 'true'){
					 $("#gasCertificate").html('Yes');
	 				if(obj.gasCertificate.fileName){
	 					$("#gasCertificateFileDisplay").show();
		 				$("#gasCertificateFileName").html(obj.gasCertificate.fileName);
		 				if(obj.gasCertificate.isImage == 'true' || obj.gasCertificate.isImage == true){
		 					var path = obj.gasCertificate.filePath;
		 					$("#gasCertificateFileView").show();
		 					$("#gasCertificateFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.gasCertificate.response == 'false'){
					 $("#gasCertificate").html('No');
				}else if(obj.gasCertificate.response == 'later'){
					 $("#gasCertificate").html('Yes, But Certificate is not uploaded');
				}
				 $("#gasCertificateComments").html(""+obj.gasCertificate.comments);
			}
	      
	      if(obj.energyPerformance){
				if(obj.energyPerformance.response == 'true'){
					 $("#energyPerformance").html('Yes');
	 				if(obj.energyPerformance.fileName){
	 					$("#energyPerformanceFileDisplay").show();
		 				$("#energyPerformanceFileName").html(obj.gasCertificate.fileName);
		 				if(obj.energyPerformance.isImage == 'true' || obj.energyPerformance.isImage == true){
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
				 $("#energyPerformanceComments").html(""+obj.energyPerformance.comments);
			}
	      
	      if(obj.centralHeatingSystem){
				if(obj.centralHeatingSystem.response == 'true'){
					 $("#centralHeatingSystem").html('Yes');
	 				if(obj.centralHeatingSystem.fileName){
	 					$("#centralHeatingSystemFileDisplay").show();
		 				$("#centralHeatingSystemFileName").html(obj.centralHeatingSystem.fileName);
		 				if(obj.centralHeatingSystem.isImage == 'true' || obj.centralHeatingSystem.isImage == true){
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
					 $("#energyPerformance").html('Not Applicable');
				}
				 $("#centralHeatingSystemComments").html(""+obj.centralHeatingSystem.comments);
			}
	      
	      if(obj.buildingInsaurance){
				if(obj.buildingInsaurance.response == 'true'){
					 $("#buildingInsaurance").html('Yes');
	 				if(obj.centralHeatingSystem.fileName){
	 					$("#buildingInsauranceFileDisplay").show();
		 				$("#buildingInsauranceFileName").html(obj.buildingInsaurance.fileName);
		 				if(obj.buildingInsaurance.isImage == 'true' || obj.buildingInsaurance.isImage == true){
		 					var path = obj.buildingInsaurance.filePath;
		 					$("#buildingInsauranceFileView").show();
		 					$("#buildingInsauranceFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.buildingInsaurance.response == 'false'){
					 $("#buildingInsaurance").html('No');
				}else if(obj.buildingInsaurance.response == 'later'){
					 $("#buildingInsaurance").html('Yes, But Certificate is not uploaded');
				}
				 $("#buildingInsauranceComments").html(""+obj.buildingInsaurance.comments);
			}
	      
	      if(obj.asbestosSurvey){
				if(obj.asbestosSurvey.response == 'true'){
					 $("#asbestosSurvey").html('Yes');
	 				if(obj.asbestosSurvey.fileName){
	 					$("#asbestosSurveyFileDisplay").show();
		 				$("#asbestosSurveyFileName").html(obj.asbestosSurvey.fileName);
		 				if(obj.asbestosSurvey.isImage == 'true' || obj.asbestosSurvey.isImage == true){
		 					var path = obj.asbestosSurvey.filePath;
		 					$("#asbestosSurveyFileView").show();
		 					$("#asbestosSurveyFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.asbestosSurvey.response == 'false'){
					 $("#asbestosSurvey").html('No');
				}else if(obj.asbestosSurvey.response == 'later'){
					 $("#asbestosSurvey").html('Yes, But Certificate is not uploaded');
				}
				 $("#asbestosSurveyComments").html(""+obj.asbestosSurvey.comments);
			}
	      
	      if(obj.periodicInspectionOfWaterSupply){
				if(obj.periodicInspectionOfWaterSupply.response == 'true'){
					 $("#periodicInspectionOfWaterSupply").html('Yes');
	 				if(obj.periodicInspectionOfWaterSupply.fileName){
	 					$("#periodicInspectionOfWaterSupplyFileDisplay").show();
		 				$("#periodicInspectionOfWaterSupplyFileName").html(obj.periodicInspectionOfWaterSupply.fileName);
		 				if(obj.periodicInspectionOfWaterSupply.isImage == 'true' || obj.periodicInspectionOfWaterSupply.isImage == true){
		 					var path = obj.periodicInspectionOfWaterSupply.filePath;
		 					$("#periodicInspectionOfWaterSupplyFileView").show();
		 					$("#periodicInspectionOfWaterSupplyFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.periodicInspectionOfWaterSupply.response == 'false'){
					 $("#periodicInspectionOfWaterSupply").html('No');
				}else if(obj.periodicInspectionOfWaterSupply.response == 'later'){
					 $("#periodicInspectionOfWaterSupply").html('Yes, But Certificate is not uploaded');
				}
				 $("#periodicInspectionOfWaterSupplyComments").html(""+obj.periodicInspectionOfWaterSupply.comments);
			}

	      if(obj.keySet){
	    	  if(obj.keySet.response == 'true')
	    	  	$("#keySet").html('Yes');
	    	  else if(obj.keySet.response == 'false')
		    	  	$("#keySet").html('No');
	      }
	      
	      if(obj.landTitleRegisteryDocument){
				if(obj.landTitleRegisteryDocument.response == 'true'){
					 $("#landTitleRegisteryDocument").html('Yes');
	 				if(obj.landTitleRegisteryDocument.fileName){
	 					$("#landTitleRegisteryDocumentFileDisplay").show();
		 				$("#landTitleRegisteryDocumentFileName").html(obj.landTitleRegisteryDocument.fileName);
		 				if(obj.landTitleRegisteryDocument.isImage == 'true' || obj.landTitleRegisteryDocument.isImage == true){
		 					var path = obj.landTitleRegisteryDocument.filePath;
		 					$("#landTitleRegisteryDocumentFileView").show();
		 					$("#landTitleRegisteryDocumentFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.landTitleRegisteryDocument.response == 'false'){
					 $("#landTitleRegisteryDocument").html('No');
				}else if(obj.landTitleRegisteryDocument.response == 'later'){
					 $("#landTitleRegisteryDocument").html('Yes, But Certificate is not uploaded');
				}
				 $("#landTitleRegisteryDocumentComments").html(""+obj.landTitleRegisteryDocument.comments);
			}
	      
	      if(obj.inventoryForProperty){
				if(obj.inventoryForProperty.response == 'true'){
					 $("#inventoryForProperty").html('Yes');
	 				if(obj.inventoryForProperty.fileName){
	 					$("#inventoryForPropertyFileDisplay").show();
		 				$("#inventoryForPropertyFileName").html(obj.inventoryForProperty.fileName);
		 				if(obj.inventoryForProperty.isImage == 'true' || obj.inventoryForProperty.isImage == true){
		 					var path = obj.inventoryForProperty.filePath;
		 					$("#inventoryForPropertyFileView").show();
		 					$("#inventoryForPropertyFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.inventoryForProperty.response == 'false'){
					 $("#inventoryForProperty").html('No');
				}else if(obj.inventoryForProperty.response == 'later'){
					 $("#inventoryForProperty").html('Yes, But Certificate is not uploaded');
				}
				 $("#inventoryForPropertyComments").html(""+obj.inventoryForProperty.comments);
			}
	      
	      if(obj.landlordInsauranceForContent){
				if(obj.landlordInsauranceForContent.response == 'true'){
					 $("#landlordInsauranceForContent").html('Yes');
	 				if(obj.landlordInsauranceForContent.fileName){
	 					$("#landlordInsauranceForContentFileDisplay").show();
		 				$("#landlordInsauranceForContentFileName").html(obj.landlordInsauranceForContent.fileName);
		 				if(obj.landlordInsauranceForContent.isImage == 'true' || obj.landlordInsauranceForContent.isImage == true){
		 					var path = obj.landlordInsauranceForContent.filePath;
		 					$("#landlordInsauranceForContentFileView").show();
		 					$("#landlordInsauranceForContentFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.landlordInsauranceForContent.response == 'false'){
					 $("#landlordInsauranceForContent").html('No');
				}else if(obj.landlordInsauranceForContent.response == 'later'){
					 $("#landlordInsauranceForContent").html('Yes, But Certificate is not uploaded');
				}
				 $("#landlordInsauranceForContentComments").html(""+obj.landlordInsauranceForContent.comments);
			}
	      
	      if(obj.windowAndDoorWarrantee){
				if(obj.windowAndDoorWarrantee.response == 'true'){
					 $("#windowAndDoorWarrantee").html('Yes');
	 				if(obj.windowAndDoorWarrantee.fileName){
	 					$("#windowAndDoorWarranteeFileDisplay").show();
		 				$("#windowAndDoorWarranteeFileName").html(obj.windowAndDoorWarrantee.fileName);
		 				if(obj.windowAndDoorWarrantee.isImage == 'true' || obj.windowAndDoorWarrantee.isImage == true){
		 					var path = obj.windowAndDoorWarrantee.filePath;
		 					$("#windowAndDoorWarranteeFileView").show();
		 					$("#windowAndDoorWarranteeFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.windowAndDoorWarrantee.response == 'false'){
					 $("#windowAndDoorWarrantee").html('No');
				}else if(obj.windowAndDoorWarrantee.response == 'later'){
					 $("#windowAndDoorWarrantee").html('Yes, But Certificate is not uploaded');
				}
				 $("#windowAndDoorWarranteeComments").html(""+obj.windowAndDoorWarrantee.comments);
			}
	      
	      if(obj.dampPoofcourse){
				if(obj.dampPoofcourse.response == 'true'){
					 $("#dampPoofcourse").html('Yes');
	 				if(obj.dampPoofcourse.fileName){
	 					$("#dampPoofcourseFileDisplay").show();
		 				$("#dampPoofcourseFileName").html(obj.dampPoofcourse.fileName);
		 				if(obj.dampPoofcourse.isImage == 'true' || obj.dampPoofcourse.isImage == true){
		 					var path = obj.dampPoofcourse.filePath;
		 					$("#dampPoofcourseFileView").show();
		 					$("#dampPoofcourseFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.dampPoofcourse.response == 'false'){
					 $("#dampPoofcourse").html('No');
				}else if(obj.dampPoofcourse.response == 'later'){
					 $("#dampPoofcourse").html('Yes, But Certificate is not uploaded');
				}
				 $("#dampPoofcourseComments").html(""+obj.dampPoofcourse.comments);
			}
	      
	      if(obj.fittedHobAndOven){
				if(obj.fittedHobAndOven.response == 'true'){
					 $("#fittedHobAndOven").html('Yes');
	 				if(obj.fittedHobAndOven.fileName){
	 					$("#fittedHobAndOvenFileDisplay").show();
		 				$("#fittedHobAndOvenFileName").html(obj.fittedHobAndOven.fileName);
		 				if(obj.fittedHobAndOven.isImage == 'true' || obj.fittedHobAndOven.isImage == true){
		 					var path = obj.fittedHobAndOven.filePath;
		 					$("#fittedHobAndOvenFileView").show();
		 					$("#fittedHobAndOvenFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.fittedHobAndOven.response == 'false'){
					 $("#fittedHobAndOven").html('No');
				}else if(obj.fittedHobAndOven.response == 'later'){
					 $("#fittedHobAndOven").html('Yes, But Certificate is not uploaded');
				}
				 $("#fittedHobAndOvenComments").html(""+obj.fittedHobAndOven.comments);
			}
	      

	      if(obj.electricShower){
				if(obj.electricShower.response == 'true'){
					 $("#electricShower").html('Yes');
	 				if(obj.electricShower.fileName){
	 					$("#electricShowerFileDisplay").show();
		 				$("#electricShowerFileName").html(obj.electricShower.fileName);
		 				if(obj.electricShower.isImage == 'true' || obj.electricShower.isImage == true){
		 					var path = obj.electricShower.filePath;
		 					$("#electricShowerFileView").show();
		 					$("#electricShowerFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.electricShower.response == 'false'){
					 $("#electricShower").html('No');
				}else if(obj.electricShower.response == 'later'){
					 $("#electricShower").html('Yes, But Certificate is not uploaded');
				}
				 $("#electricShowerComments").html(""+obj.electricShower.comments);
			}
	      
	      if(obj.electricFires){
				if(obj.electricFires.response == 'true'){
					 $("#electricFires").html('Yes');
	 				if(obj.electricFires.fileName){
	 					$("#electricFiresFileDisplay").show();
		 				$("#electricFiresFileName").html(obj.electricFires.fileName);
		 				if(obj.electricFires.isImage == 'true' || obj.electricFires.isImage == true){
		 					var path = obj.electricFires.filePath;
		 					$("#electricFiresFileView").show();
		 					$("#electricFiresFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.electricFires.response == 'false'){
					 $("#electricFires").html('No');
				}else if(obj.electricFires.response == 'later'){
					 $("#electricFires").html('Yes, But Certificate is not uploaded');
				}
				 $("#electricFiresComments").html(""+obj.electricFires.comments);
			}
	      
	      if(obj.manualForCentralHeating){
				if(obj.manualForCentralHeating.response == 'true'){
					 $("#manualForCentralHeating").html('Yes');
	 				if(obj.manualForCentralHeating.fileName){
	 					$("#manualForCentralHeatingFileDisplay").show();
		 				$("#manualForCentralHeatingFileName").html(obj.manualForCentralHeating.fileName);
		 				if(obj.manualForCentralHeating.isImage == 'true' || obj.manualForCentralHeating.isImage == true){
		 					var path = obj.manualForCentralHeating.filePath;
		 					$("#manualForCentralHeatingFileView").show();
		 					$("#manualForCentralHeatingFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.manualForCentralHeating.response == 'false'){
					 $("#manualForCentralHeating").html('No');
				}else if(obj.manualForCentralHeating.response == 'later'){
					 $("#manualForCentralHeating").html('Yes, But Certificate is not uploaded');
				}
				 $("#manualForCentralHeatingComments").html(""+obj.manualForCentralHeating.comments);
			}
	      
	      if(obj.timerForCentralHeating){
				if(obj.timerForCentralHeating.response == 'true'){
					 $("#timerForCentralHeating").html('Yes');
	 				if(obj.timerForCentralHeating.fileName){
	 					$("#timerForCentralHeatingFileDisplay").show();
		 				$("#timerForCentralHeatingFileName").html(obj.timerForCentralHeating.fileName);
		 				if(obj.timerForCentralHeating.isImage == 'true' || obj.timerForCentralHeating.isImage == true){
		 					var path = obj.timerForCentralHeating.filePath;
		 					$("#timerForCentralHeatingFileView").show();
		 					$("#timerForCentralHeatingFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.timerForCentralHeating.response == 'false'){
					 $("#timerForCentralHeating").html('No');
				}else if(obj.timerForCentralHeating.response == 'later'){
					 $("#timerForCentralHeating").html('Yes, But Certificate is not uploaded');
				}
				 $("#timerForCentralHeatingComments").html(""+obj.timerForCentralHeating.comments);
			}
	      
	      if(obj.manualForBoiler){
				if(obj.manualForBoiler.response == 'true'){
					 $("#manualForBoiler").html('Yes');
	 				if(obj.manualForBoiler.fileName){
	 					$("#manualForBoilerFileDisplay").show();
		 				$("#manualForBoilerFileName").html(obj.manualForBoiler.fileName);
		 				if(obj.manualForBoiler.isImage == 'true' || obj.manualForBoiler.isImage == true){
		 					var path = obj.manualForBoiler.filePath;
		 					$("#manualForBoilerFileView").show();
		 					$("#manualForBoilerFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.manualForBoiler.response == 'false'){
					 $("#manualForBoiler").html('No');
				}else if(obj.manualForBoiler.response == 'later'){
					 $("#manualForBoiler").html('Yes, But Certificate is not uploaded');
				}
				 $("#manualForBoilerComments").html(""+obj.manualForBoiler.comments);
			}
	      
	      if(obj.manualForFittedOven){
				if(obj.manualForFittedOven.response == 'true'){
					 $("#manualForFittedOven").html('Yes');
	 				if(obj.manualForFittedOven.fileName){
	 					$("#manualForFittedOvenFileDisplay").show();
		 				$("#manualForFittedOvenFileName").html(obj.manualForFittedOven.fileName);
		 				if(obj.manualForFittedOven.isImage == 'true' || obj.manualForFittedOven.isImage == true){
		 					var path = obj.manualForFittedOven.filePath;
		 					$("#manualForFittedOvenFileView").show();
		 					$("#manualForFittedOvenFileView").attr("href", cPath + path );
		 				}
	 				}
				}else if(obj.manualForFittedOven.response == 'false'){
					 $("#manualForFittedOven").html('No');
				}else if(obj.manualForFittedOven.response == 'later'){
					 $("#manualForFittedOven").html('Yes, But Certificate is not uploaded');
				}
				 $("#manualForFittedOvenComments").html(""+obj.manualForFittedOven.comments);
			}
	      
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
}



	$('#pageTwo').click(function(){
		$.ajax({
		      url: contextPath+"/admin/displayAdpl2.htm?adpl2Id=3&id="+propertyIdd,
		      type: "post",
		      dataType: "json",
		      success: function(response){
			  		if(response.fieldArr){
			  			$.each(response.fieldArr, function(index, value){
				         	var obj = response.data;
				         	if(obj){
				         		var mainObj = obj[value];
				         		if(typeof mainObj != 'undefined'){
				         			if(mainObj.response == 'true'){
					         			var oneVarId = "#"+value+"";
					  					$(oneVarId).html("Yes");
					  				}else if(mainObj.response == 'false'){
					  					var twoVarId = "#"+value+"";
					  					$(twoVarId).html("No");
					  				}
					  				else{
					  					
					  				}
					         		var commentsId = "#"+value+"Comments";
					  				$(commentsId).html(mainObj.comments);
					  				
					  				if(mainObj.fileName){
					  					var fileDisplayId = "#"+value+"FileDisplay";
					  					var fileNameId = "#"+value+"FileName";
					 					$(fileDisplayId).show();
						 				$(fileNameId).html(mainObj.fileName);
						 				if(mainObj.isImage == 'true' || mainObj.isImage == true){
						 					var path = mainObj.filePath;
						 					var fileViewId  = "#"+value+"FileView";
						 					$(fileViewId).show();
						 					$(fileViewId).attr("href", cPath + path );
						 				}
					 				}
				         		}
				         	}
				         }); 
			  			}
				    },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});

$('#pageThree').click(function(){
	$.ajax({
	      url: contextPath+"/admin/displayAdpl2.htm?adpl2Id=4&id="+propertyIdd,
	      type: "post",
	      dataType: "json",
	      success: function(response){
		  		if(response.fieldArr){
		  			$.each(response.fieldArr, function(index, value){
			         	var obj = response.data;
			         	if(obj){
			         		var mainObj = obj[value];
			         		if(typeof mainObj != 'undefined'){
			         			if(mainObj.response == 'true'){
				         			var oneVarId = "#"+value+"";
				  					$(oneVarId).html("Yes");
				  				}else if(mainObj.response == 'false'){
				  					var twoVarId = "#"+value+"";
				  					$(twoVarId).html("No");
				  				}
				  				else{
				  					
				  				}
				         		var commentsId = "#"+value+"Comments";
				  				$(commentsId).html(mainObj.comments);
				  				
				  				if(mainObj.fileName){
				  					var fileDisplayId = "#"+value+"FileDisplay";
				  					var fileNameId = "#"+value+"FileName";
				 					$(fileDisplayId).show();
					 				$(fileNameId).html(mainObj.fileName);
					 				if(mainObj.isImage == 'true' || mainObj.isImage == true){
					 					var path = mainObj.filePath;
					 					var fileViewId  = "#"+value+"FileView";
					 					$(fileViewId).show();
					 					$(fileViewId).attr("href", cPath + path );
					 				}
				 				}
			         		}
			         	}
			         }); 
		  			}
			    },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
});
$('#pageFour').click(function(){
	$.ajax({
	      url: contextPath+"/admin/displayAdpl2.htm?adpl2Id=5&id="+propertyIdd,
	      type: "post",
	      dataType: "json",
	      success: function(response){
		  		if(response.fieldArr){
		  			$.each(response.fieldArr, function(index, value){
			         	var obj = response.data;
			         	if(obj){
			         		var mainObj = obj[value];
			         		if(typeof mainObj != 'undefined'){
			         			if(mainObj.response == 'true'){
				         			var oneVarId = "#"+value+"";
				  					$(oneVarId).html("Yes");
				  				}else if(mainObj.response == 'false'){
				  					var twoVarId = "#"+value+"";
				  					$(twoVarId).html("No");
				  				}
				  				else{
				  					
				  				}
				         		var commentsId = "#"+value+"Comments";
				  				$(commentsId).html(mainObj.comments);
				  				
				  				if(mainObj.fileName){
				  					var fileDisplayId = "#"+value+"FileDisplay";
				  					var fileNameId = "#"+value+"FileName";
				 					$(fileDisplayId).show();
					 				$(fileNameId).html(mainObj.fileName);
					 				if(mainObj.isImage == 'true' || mainObj.isImage == true){
					 					var path = mainObj.filePath;
					 					var fileViewId  = "#"+value+"FileView";
					 					$(fileViewId).show();
					 					$(fileViewId).attr("href", cPath + path );
					 				}
				 				}
			         		}
			         	}
			         }); 
		  			}
			    },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
});

	$('#pageFive').click(function(){
		$.ajax({
		      url: contextPath+"/admin/displayAdpl2.htm?adpl2Id=6&id="+propertyIdd,
		      type: "post",
		      dataType: "json",
		      success: function(response){
			  		if(response.fieldArr){
			  			$.each(response.fieldArr, function(index, value){
				         	var obj = response.data;
				         	if(obj){
				         		var mainObj = obj[value];
				         		if(typeof mainObj != 'undefined'){
				         			if(mainObj.response == 'true'){
					         			var oneVarId = "#"+value+"";
					  					$(oneVarId).html("Yes");
					  				}else if(mainObj.response == 'false'){
					  					var twoVarId = "#"+value+"";
					  					$(twoVarId).html("No");
					  				}
					  				else if(mainObj.response == 'null'){
					  				}
					  				else{
					  					
					  				}
					         		var commentsId = "#"+value+"Comments";
					  				$(commentsId).html(mainObj.comments);
					  				
					  				if(mainObj.fileName){
					  					var fileDisplayId = "#"+value+"FileDisplay";
					  					var fileNameId = "#"+value+"FileName";
					 					$(fileDisplayId).show();
						 				$(fileNameId).html(mainObj.fileName);
						 				if(mainObj.isImage == 'true' || mainObj.isImage == true){
						 					var path = mainObj.filePath;
						 					var fileViewId  = "#"+value+"FileView";
						 					$(fileViewId).show();
						 					$(fileViewId).attr("href", cPath + path );
						 				}
					 				}
				         		}
				         	}
				         }); 
			  			}
				    },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$('#pageSix').click(function(){
		$.ajax({
		      url: contextPath+"/admin/displayAdpl2Info.htm?id="+propertyIdd,
		      type: "post",
		      dataType: "json",
		      success: function(result){
		    	  var resp = result.data;
		    	  if(resp){
			    	  $("#availability").html(""+resp.availability);
			    	  $("#rentAmount").html(resp.rentAmount);
			    	  $("#propertyType").html(""+resp.propertyType);
			    	  $("#rentPeriod").html(""+resp.rentPeriod);
			    	  $("#bedroomCount").html(""+resp.bedroomCount);
			    	  $("#bathroomCount").html(""+resp.bathroomCount);
			    	  $("#seprateWC").html(""+resp.seprateWC);
			    	  if(resp.furnished == 'true' || resp.furnished == true){
			    		  $("#furnished").html("Yes");
			    	  }else if(resp.furnished == 'false' || resp.furnished == false){
			    		  $("#furnished").html("No");
			    	  }
			    	  
			    	  if(resp.flooring == 'true' || resp.flooring == true){
			    		  $("#flooring").html("Yes");
			    	  }else if(resp.flooring == 'false' || resp.flooring == false){
			    		  $("#flooring").html("No");
			    	  }
			    	  $("#flooringComments").html(resp.flooringComments);
			    	  
			    	  if(resp.curtains == 'true' || resp.curtains == true){
			    		  $("#curtains").html("Yes");
			    	  }else if(resp.curtains == 'false' || resp.curtains == false){
			    		  $("#curtains").html("No");
			    	  }
			    	  $("#curtainsComments").html(resp.curtainsComments);
			    	  
			    	  if(resp.frontGarden == 'true' || resp.frontGarden == true){
			    		  $("#frontGarden").html("Yes");
			    	  }else if(resp.frontGarden == 'false' || resp.frontGarden == false){
			    		  $("#frontGarden").html("No");
			    	  }
			    	  $("#frontGardenComments").html(resp.frontGardenComments);
			    	  
			    	  if(resp.rearGarden == 'true' || resp.rearGarden == true){
			    		  $("#rearGarden").html("Yes");
			    	  }else if(resp.rearGarden == 'false' || resp.rearGarden == false){
			    		  $("#rearGarden").html("No");
			    	  }
			    	  $("#rearGardenComments").html(resp.rearGardenComments);
			    	  
			    	  if(resp.wheelChairAccess == 'true' || resp.wheelChairAccess == true){
			    		  $("#wheelChairAccess").html("Yes");
			    	  }else if(resp.wheelChairAccess == 'false' || resp.wheelChairAccess == false){
			    		  $("#wheelChairAccess").html("No");
			    	  }
			    	  $("#wheelChairAccessComments").html(resp.wheelChairAccessComments);
			    	  
			    	  if(resp.extraStairs == 'true' || resp.extraStairs == true){
			    		  $("#extraStairs").html("Yes");
			    	  }else if(resp.extraStairs == 'false' || resp.extraStairs == false){
			    		  $("#extraStairs").html("No");
			    	  }
			    	  $("#extraStairsComments").html(resp.extraStairsComments);
			    	  
			    	  var fileList = resp.files;
			    	  $("#imageGalary").empty();
		  				if (fileList.length > 0) {
		  					$("#imagesTrId").show();
		  					 var i = 0;
		  					 var html = "";
				            $.each(fileList, function(index, fileObj){
				            		html += format(this.fileObj);
				            	i++;
				            });
				            $("#imageGalary").empty().html(html); 
				            imageSlider();
				        }else{
				        	$("#imagesTrId").hide();
				        }
		    	  }
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	function format(fileObj){
  		var html = '<li>'
  				+ '<a class="FileView" rel="gallery1" href="'+ cPath + fileObj.filePath+'" >'
  				+ '<img src="'+cPath + fileObj.filePath +'" alt="" ></img>'
  				+ '</a>'
	  			+ '</li>';

	  			return html;
		  }
	
	function imageSlider() {
		console.log('done');
  		$('#imageGalary').carouFredSel({
			prev: '#prev2',
			next: '#next2',
			pagination: "#pager2",
			auto: false
		});
  	}
$('#propertyBackId').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/fetchPropertyDetail.htm?propertyId="+propertyIdd,
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});