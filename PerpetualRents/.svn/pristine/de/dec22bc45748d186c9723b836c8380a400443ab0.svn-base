
	var globalAnsObj;
	$(document).ready(function(){
		  $.getJSON(contextPath+"/property/loadDHSCriteriaC.htm",
				    function(response, textStatus, jqXHR){
			  		if(response.fieldArr){
			  			$.each(response.fieldArr, function(index, value){
				         	var obj = response.data;
				         	globalAnsObj = response.ansObj;
				         	if(obj){
				         		var mainObj = obj[value];
				         		if(typeof mainObj != 'undefined'){
				         			if(mainObj.response== 'true'){
					         			var oneVarId = "#"+value+"1";
					  					$(oneVarId).attr("checked", true);
					  					validateAnswerForYes(value);
					  				}else if(mainObj.response == 'false'){
					  					var twoVarId = "#"+value+"2";
					  					$(twoVarId).attr("checked", true);
					  					validateAnswerForNo(value);
					  				}
					  				else{
					  					var yesVarId = "#"+value+"No";
					  					var noVarId = "#"+value+"Yes";
					  					$(noVarId).hide();
					  					$(yesVarId).hide();
					  				}
					         		var commentsId = "#"+value+"Comments";
					  				$(commentsId).val(mainObj.comments);
				         		}
				         	}
				         }); 
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
	
	