function initMenu() {
  $('#menu ul').hide();
  $('#menu ul:first').show();
  $('#menu li a').click(
    function() {
      var checkElement = $(this).next();
      var id = $(this).attr('sequence');
      if(id == 2){
			if($('#hmoLicence1').is(':checked')){
				var licenceNumber = $("#licenceNumber").val();
				if(licenceNumber == null || licenceNumber.length == 0){
					$("#licenceNumberLabel").show();
					
					return false;
				}else{
					$("#licenceNumberLabel").hide();
				}
			}
			
		}
      
      if(id == 3){
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
 		 
 		
 		var sketchPlan = $('input[name=sketchPlan]:checked').val();
 		 var sketchPlanFile = $("#sketchPlanFileID").val();
 		 var sketchPlanFileName = $("#sketchPlanFileName").html();
 		if(sketchPlan == 'true'){
 			if( sketchPlanFile.length == 0 && sketchPlanFileName.length == 0){
 				var p = $("#sketchPlan2").offset().top;
 				var topMargin = p - 12;
 				$("#sketchPlanFileID").show();
 				$("#sketchPlanFileID").focus();
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
 		
      }
      
      if(id >= 5){
    	  if($('#insulation270mm1').is(':checked')){
    		  var value = $("#installationDate").val();
        	  if(value.length > 0){
        		  $("#installationDateLabel").hide();
        	  }else{
        		  $("#installationDateLabel").show();
        		  return false;
        	  }
    	  }
      }
      if(id >= 6){
    	  if($('#adequateHeating1').is(':checked')){
    		  var value = $("#boilerAge").val();
        	  if(value == ""){
        		  $("#boilerAgeLabel").show();
        		  return false;
        	  }else{
        		  $("#boilerAgeLabel").hide();
        	  }
    	  }
      }
      if(id == 7){ 
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
	   	  }}
      setSpan(id);
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        return false;
        }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {
	initMenu();
	
});

function setSpan(id){
	$(".spanClass").each(function() {
		var spanSeq = $(this).attr('sequence');
			if(spanSeq < id){
				$(this).html('<< Previous');
			}else if(id == spanSeq){
				$(this).empty();
			}else if(spanSeq > id ){
				$(this).html('Next >>');
			}
	});
}