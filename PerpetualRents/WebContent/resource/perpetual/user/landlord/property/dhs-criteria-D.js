	var globalAnsObj;
	$(document).ready(function(){
		  $.getJSON(contextPath+"/property/loadDHSCriteriaD.htm",
				    function(response, textStatus, jqXHR){
			  			var obj = response.data;
			  			globalAnsObj = response.ansObj;
			  			if(obj){
			  				if(obj.riskOfFall.response == 'true'){
			  					$("#riskOfFall1").attr("checked", true);
			  					validateAnswerForYes('riskOfFall');
			  				}else if(obj.riskOfFall.response == 'false'){
			  					$("#riskOfFall2").attr("checked", true);
			  					validateAnswerForNo('riskOfFall');
			  				}
			  				else{
			  					$("#riskOfFallNo").hide();
			  					$("#riskOfFallYes").hide();
			  				}
			  				$("#riskOfFallComments").val(obj.riskOfFall.comments);
			  				
			  				if(obj.adequateNaturalLightening.response == 'true'){
			  					$("#adequateNaturalLightening1").attr("checked", true);
			  					validateAnswerForYes('adequateNaturalLightening');
			  				}else if(obj.adequateNaturalLightening.response == 'false'){
			  					$("#adequateNaturalLightening2").attr("checked", true);
			  					validateAnswerForNo('adequateNaturalLightening');
			  				}
			  				else{
			  					$("#adequateNaturalLighteningNo").hide();
			  					$("#adequateNaturalLighteningYes").hide();
			  				}
			  				$("#adequateNaturalLighteningComments").val(obj.adequateNaturalLightening.comments);
			  				
			  				if(obj.securedStepsAndRamps.response == 'true'){
			  					$("#securedStepsAndRamps1").attr("checked", true);
			  					validateAnswerForYes('securedStepsAndRamps');
			  				}else if(obj.securedStepsAndRamps.response == 'false'){
			  					$("#securedStepsAndRamps2").attr("checked", true);
			  					validateAnswerForNo('securedStepsAndRamps');
			  				}
			  				else{
			  					$("#securedStepsAndRampsNo").hide();
			  					$("#securedStepsAndRampsYes").hide();
			  				}
			  				$("#securedStepsAndRampsComments").val(obj.securedStepsAndRamps.comments);
			  				
			  				if(obj.doorsDirection.response == 'true'){
			  					$("#doorsDirection1").attr("checked", true);
			  					validateAnswerForYes('doorsDirection');
			  				}else if(obj.doorsDirection.response == 'false'){
			  					$("#doorsDirection2").attr("checked", true);
			  					validateAnswerForNo('doorsDirection');
			  				}
			  				else{
			  					$("#doorsDirectionNo").hide();
			  					$("#doorsDirectionYes").hide();
			  				}
			  				$("#doorsDirectionComments").val(obj.doorsDirection.comments);
			  				
			  				if(obj.moreThanOneFlightOfStairs.response == 'true'){
			  					$("#moreThanOneFlightOfStairs1").attr("checked", true);
			  					validateAnswerForYes('moreThanOneFlightOfStairs');
			  				}else if(obj.moreThanOneFlightOfStairs.response == 'false'){
			  					$("#moreThanOneFlightOfStairs2").attr("checked", true);
			  					validateAnswerForNo('moreThanOneFlightOfStairs');
			  				}
			  				else{
			  					$("#moreThanOneFlightOfStairsNo").hide();
			  					$("#moreThanOneFlightOfStairsYes").hide();
			  				}
			  				$("#moreThanOneFlightOfStairsComments").val(obj.moreThanOneFlightOfStairs.comments);
			  				
			  				if(obj.spaceAccessedViaFlightOfStairs){
			  					$("#spaceAccessedViaFlightOfStairsComments").val(obj.spaceAccessedViaFlightOfStairs.comments);
			  				}
			  				
			  				
			  				if(obj.buildingRegulation.response == 'true'){
			  					$("#buildingRegulation1").attr("checked", true);
			  					validateAnswerForYes('buildingRegulation');
			  				}else if(obj.buildingRegulation.response == 'false'){
			  					$("#buildingRegulation2").attr("checked", true);
			  					validateAnswerForNo('buildingRegulation');
			  				}
			  				else{
			  					$("#buildingRegulationNo").hide();
			  					$("#buildingRegulationYes").hide();
			  				}
			  				
			  				if(obj.buildingRegulationDate){
			  					if(obj.buildingRegulationDate.comments){
			  						$('#buildingRegulationDate').val(obj.buildingRegulationDate.comments);
			  						validateAnswerForYes('buildingRegulationDate');
			  					}
			  				}
			  				
			  				$("#buildingRegulationComments").val(obj.buildingRegulation.comments);
			  				
			  				if(obj.electricalWiringStandards.response == 'true'){
			  					$("#electricalWiringStandards1").attr("checked", true);
			  					validateAnswerForYes('electricalWiringStandards');
			  				}else if(obj.electricalWiringStandards.response == 'false'){
			  					$("#electricalWiringStandards2").attr("checked", true);
			  					validateAnswerForNo('electricalWiringStandards');
			  				}
			  				else{
			  					$("#electricalWiringStandardsNo").hide();
			  					$("#electricalWiringStandardsYes").hide();
			  				}
			  				$("#electricalWiringStandardsComments").val(obj.electricalWiringStandards.comments);
			  				
			  				if(obj.trappingBodyParts.response == 'true'){
			  					$("#trappingBodyParts1").attr("checked", true);
			  					validateAnswerForYes('trappingBodyParts');
			  				}else if(obj.trappingBodyParts.response == 'false'){
			  					$("#trappingBodyParts2	").attr("checked", true);
			  					validateAnswerForNo('trappingBodyParts2');
			  				}
			  				else{
			  					$("#trappingBodyPartsNo").hide();
			  					$("#trappingBodyPartsYes").hide();
			  				}
			  				$("#trappingBodyPartsComments").val(obj.trappingBodyParts.comments);
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
			  
			  new JsDatePick({
					useMode:2,
					target:"buildingRegulationDate",
					dateFormat:"%d-%M-%Y",
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
		if(id == 'buildingRegulation'){
			$("#spaceAccessedDivId").hide();
			$("#buildingRegulationYes").show();
			$("#buildingRegulationDateDivision").hide();
			
		/*	$("#buildingRegulationDateDivision").show();
		
			var buildingRegulationDate = $("#buildingRegulationDate").val();
			if(buildingRegulationDate == null || buildingRegulationDate.length <= 0){
				$("#buildingRegulationNo").show();
				$("#buildingRegulationYes").hide();
				$("#buildingRegulationDateSpanId").hide();
			}else{
				$("#buildingRegulationDateDivision").show();
				$("#buildingRegulationDateSpanId").show();
				$("#buildingRegulationNo").hide();
				$("#buildingRegulationYes").show();
			}
			bindBuildingRegulationDate();*/
			
		}else if(id == 'buildingRegulationDate'){
			var buildingRegulationDate = $("#buildingRegulationDate").val();
			if(buildingRegulationDate == null || buildingRegulationDate.length <= 0){
				$("#buildingRegulationNo").show();
				$("#buildingRegulationYes").hide();
				$("#buildingRegulationDateSpanId").show();
			}else{
				$("#buildingRegulationDateDivision").show();
				$("#buildingRegulationDateSpanId").hide();
				$("#buildingRegulationNo").hide();
				$("#buildingRegulationYes").show();
			}
		}
	}
	
	function bindBuildingRegulationDate(){
		$(".boxMain").bind( "click", function() {
			var value = $("#buildingRegulationDate").val();
			if(value.length > 1){
				$("#buildingRegulationDateSpanId").hide();
				$("#buildingRegulationNo").show();
				$("#buildingRegulationYes").hide();
			}else{
				$("#buildingRegulationDateSpanId").show();
				$("#buildingRegulationYes").hide();
				$("#buildingRegulationNo").show();
			}
		});
	}
	
	function validateAnswerForNo(id){
		console.log('hello : ' + id);
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
		if(id == 'buildingRegulation'){
			$("#spaceAccessedDivId").show();
			$("#buildingRegulationDateDivision").show();
			$("#buildingRegulationDate").val("");
			$("#buildingRegulationDateDivision").show();
			
			var buildingRegulationDate = $("#buildingRegulationDate").val();
			if(buildingRegulationDate == null || buildingRegulationDate.length <= 0){
				$("#buildingRegulationNo").show();
				$("#buildingRegulationYes").hide();
				$("#buildingRegulationDateSpanId").hide();
			}else{
				$("#buildingRegulationDateDivision").show();
				$("#buildingRegulationDateSpanId").show();
				$("#buildingRegulationNo").hide();
				$("#buildingRegulationYes").show();
			}
			bindBuildingRegulationDate();
			
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
