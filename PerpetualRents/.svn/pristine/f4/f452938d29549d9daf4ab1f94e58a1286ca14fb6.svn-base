	var globalAnsObj = null;
	$(document).ready(function(){
		
			$(".FileView").fancybox({helpers: { title : { type : 'float' }}});  //to view image by fancybox
		
		  $.getJSON(contextPath+"/property/loadDHSCriteriaB.htm",
				    function(response, textStatus, jqXHR){
			  			globalAnsObj = response.ansObj;
			  			var obj = response.data;
			  			if(obj){
			  				$("#adequateSizeandLayout").prop("checked", false);
			  				if(obj.adequateSizeandLayout.response == 'true'){
			  					$("#adequateSizeandLayout1").attr("checked", true);
			  					validateAnswerForYes('adequateSizeandLayout');
			  				}else if(obj.adequateSizeandLayout.response == 'false'){
			  					$("#adequateSizeandLayout2").attr("checked", true);
			  					validateAnswerForNo('adequateSizeandLayout');
			  				}
			  				else{
			  					$("#adequateSizeandLayoutNo").hide();
			  					$("#adequateSizeandLayoutYes").hide();
			  				}
			  				$("#adequateSizeandLayoutComments").val(obj.adequateSizeandLayout.comments);
			  				
			  				if(obj.safeAgainstUnauthorizedEntry.response == 'true'){
			  					$("#safeAgainstUnauthorizedEntry1").attr("checked", true);
			  					validateAnswerForYes('safeAgainstUnauthorizedEntry');
			  				}else if(obj.safeAgainstUnauthorizedEntry.response == 'false'){
			  					$("#safeAgainstUnauthorizedEntry2").attr("checked", true);
			  					validateAnswerForNo('safeAgainstUnauthorizedEntry');
			  				}
			  				else{
			  					$("#safeAgainstUnauthorizedEntryNo").hide();
			  					$("#safeAgainstUnauthorizedEntryYes").hide();
			  				}
			  				$("#safeAgainstUnauthorizedEntryComments").val(obj.safeAgainstUnauthorizedEntry.comments);
			  				
			  				if(obj.careTaker.response == 'true'){
			  					$("#careTaker1").attr("checked", true);
			  					validateAnswerForYes('careTaker');
			  				}else if(obj.careTaker.response == 'false'){
			  					$("#careTaker2").attr("checked", true);
			  					validateAnswerForNo('careTaker');
			  				}
			  				else{
			  					$("#careTakerNo").hide();
			  					$("#careTakerYes").hide();
			  				}
			  				$("#careTakerComments").val(obj.careTaker.comments);
			  				
			  				if(obj.burglarAlarmSystem.response == 'true'){
			  					$("#burglarAlarmSystem1").attr("checked", true);
			  					validateAnswerForYes('burglarAlarmSystem');
			  				}else if(obj.burglarAlarmSystem.response == 'false'){
			  					$("#burglarAlarmSystem2").attr("checked", true);
			  					validateAnswerForNo('burglarAlarmSystem');
			  				}else{
			  					$("#burglarAlarmSystemNo").hide();
			  					$("#burglarAlarmSystemYes").hide();
			  				}
			  				
			  				if(typeof obj.burglarAlarmSystem.fileName != 'undefined'){
			  					var cPath = contextPath+"/";
			  					$("#burglarAlarmSystemFileDisplay").show();
			  					$("#burglarAlarmSystemFileName").html(obj.burglarAlarmSystem.fileName);
			  					if(obj.burglarAlarmSystem.isImage == true || obj.burglarAlarmSystem.isImage == 'true'){
			  						var path = obj.burglarAlarmSystem.filePath;
			  						$("#burglarAlarmSystemFileView").show();
			  						$("#burglarAlarmSystemFileView").attr("href", cPath + path );
			  					}
			  					var downloadLink = cPath+"download/uploadedDocuments.htm?fileId="+obj.burglarAlarmSystem.documentId;
			  					$("#burglarAlarmSystemFileDownload").attr("href", downloadLink);
			  					
			  				}
			  				$("#burglarAlarmSystemComments").val(obj.burglarAlarmSystem.comments);
			  				
			  				if(obj.allWindowsHaveKeys.response == 'true'){
			  					$("#allWindowsHaveKeys1").attr("checked", true);
			  					validateAnswerForYes('allWindowsHaveKeys');
			  				}else if(obj.allWindowsHaveKeys.response == 'false'){
			  					$("#allWindowsHaveKeys2").attr("checked", true);
			  					validateAnswerForNo('allWindowsHaveKeys');
			  				}
			  				else{
			  					$("#allWindowsHaveKeysNo").hide();
			  					$("#allWindowsHaveKeysYes").hide();
			  				}
			  				$("#allWindowsHaveKeysComments").val(obj.allWindowsHaveKeys.comments);
			  				
			  				if(obj.adequateLightening.response == 'true'){
			  					$("#adequateLightening1").attr("checked", true);
			  					validateAnswerForYes('adequateLightening');
			  				}else if(obj.adequateLightening.response == 'false'){
			  					$("#adequateLightening2").attr("checked", true);
			  					validateAnswerForNo('adequateLightening');
			  				}
			  				else{
			  					$("#adequateLighteningNo").hide();
			  					$("#adequateLighteningYes").hide();
			  				}
			  				$("#adequateLighteningComments").val(obj.adequateLightening.comments);
			  				
			  				if(obj.adequateSecurityLightening.response == 'true'){
			  					$("#adequateSecurityLightening1").attr("checked", true);
			  					validateAnswerForYes('adequateSecurityLightening');
			  				}else if(obj.adequateSecurityLightening.response == 'false'){
			  					$("#adequateSecurityLightening2").attr("checked", true);
			  					validateAnswerForNo('adequateSecurityLightening');
			  				}
			  				else{
			  					$("#adequateSecurityLighteningNo").hide();
			  					$("#adequateSecurityLighteningYes").hide();
			  				}
			  				$("#adequateSecurityLighteningComments").val(obj.adequateSecurityLightening.comments);
			  				
			  				if(obj.externalLighteningAtNight.response == 'true'){
			  					$("#externalLighteningAtNight1").attr("checked", true);
			  					validateAnswerForYes('externalLighteningAtNight');
			  				}else if(obj.externalLighteningAtNight.response == 'false'){
			  					$("#externalLighteningAtNight2").attr("checked", true);
			  					validateAnswerForNo('externalLighteningAtNight');
			  				}
			  				else{
			  					$("#externalLighteningAtNightNo").hide();
			  					$("#externalLighteningAtNightYes").hide();
			  				}
			  				$("#externalLighteningAtNightComments").val(obj.externalLighteningAtNight.comments);
			  				
			  				if(obj.complaintsAgainstNoise.response == 'true'){
			  					$("#complaintsAgainstNoise1").attr("checked", true);
			  					validateAnswerForYes('complaintsAgainstNoise');
			  				}else if(obj.complaintsAgainstNoise.response == 'false'){
			  					$("#complaintsAgainstNoise2").attr("checked", true);
			  					validateAnswerForNo('complaintsAgainstNoise');
			  				}
			  				else{
			  					$("#complaintsAgainstNoiseNo").hide();
			  					$("#complaintsAgainstNoiseYes").hide();
			  				}
			  				$("#complaintsAgainstNoiseComments").val(obj.complaintsAgainstNoise.comments);
			  				
			  				if(obj.safeBarriersAgainstFire.response == 'true'){
			  					$("#safeBarriersAgainstFire1").attr("checked", true);
			  					validateAnswerForYes('safeBarriersAgainstFire');
			  				}else if(obj.safeBarriersAgainstFire.response == 'false'){
			  					$("#safeBarriersAgainstFire2").attr("checked", true);
			  					validateAnswerForNo('safeBarriersAgainstFire');
			  				}
			  				else{
			  					$("#safeBarriersAgainstFireNo").hide();
			  					$("#safeBarriersAgainstFireYes").hide();
			  				}
			  				$("#safeBarriersAgainstFireComments").val(obj.safeBarriersAgainstFire.comments);
			  				
			  				if(obj.adequateNoiceInsulation.response == 'true'){
			  					$("#adequateNoiceInsulation1").attr("checked", true);
			  					validateAnswerForYes('adequateNoiceInsulation');
			  				}else if(obj.adequateNoiceInsulation.response == 'false'){
			  					$("#adequateNoiceInsulation2").attr("checked", true);
			  					validateAnswerForNo('adequateNoiceInsulation');
			  				}
			  				else{
			  					$("#adequateNoiceInsulationNo").hide();
			  					$("#adequateNoiceInsulationYes").hide();
			  				}
			  				$("#adequateNoiceInsulationComments").val(obj.adequateNoiceInsulation.comments);
			  			}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
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
	 });
	
	function validateAnswerForYes(id){
		var rslt = globalAnsObj[id];
		var ans = rslt.affirmativeAns;
		var noIconVar = "#"+id+"No";
		var yesIconVar = "#"+id+"Yes";
		if(ans == 'true' || ans == true){
			$(noIconVar).hide();
			$(yesIconVar).show(150);
		}else{
			$(noIconVar).show(150);
			$(yesIconVar).hide();
		}
	}
	
	function validateAnswerForNo(id){
		var rslt = globalAnsObj[id];
		var ans = rslt.affirmativeAns;
		var noIconVar = "#"+id+"No";
		var yesIconVar = "#"+id+"Yes";
		if(ans == 'false' || ans == false){
			$(noIconVar).hide();
			$(yesIconVar).show(150);
		}else{
			$(noIconVar).show(150);
			$(yesIconVar).hide();
		}
	}
	
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
