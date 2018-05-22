
	var globalAnsObj = null;
	var globalDataObj = null;
	$(document).ready(function(){
		$('.propDivision').hide();
		 new JsDatePick({
				useMode:2,
				target:"workCompletedBy",
				dateFormat:"%d-%M-%Y",
				backDate : true
		 });
		
		$(".FileView").fancybox({helpers: { title : { type : 'float' }}});  //to view image by fancybox
		
		  $.getJSON(contextPath+"/property/loadDHSCriteriaA.htm",
				    function(response, textStatus, jqXHR) {
		  		if(response.fieldArr){
		  			$.each(response.fieldArr, function(index, value){
			         	var obj = response.data;
			         	globalAnsObj = response.ansObj;
			         	globalDataObj = obj;
			         	if(obj){
			         		var mainObj = obj[value];
			         		if(typeof mainObj != 'undefined'){ 
			         			if(mainObj.response== 'true'){
				         			var yesRadioBtn = "#"+value+"1";
				  					$(yesRadioBtn).attr("checked", true);
				  					validateAnswerForYes(value);
				  				}else if(mainObj.response == 'false'){
				  					var noRadioBtn = "#"+value+"2";
				  					$(noRadioBtn).attr("checked", true);
				  					validateAnswerForNo(value);
				  				}else if(mainObj.response == 'later'){
				  					var laterRadioBtn = "#"+value+"3";
				  					$(laterRadioBtn).attr("checked", true);
				  					uploadLater(value);
				  				}
				  				else{
				  					var yesVarId = "#"+value+"Yes";
				  					var noVarId = "#"+value+"No";
				  					$(noVarId).hide();
				  					$(yesVarId).hide();
				  				}
				         		var commentsId = "#"+value+"Comments";
				  				$(commentsId).val(mainObj.comments);
			         		}
			         	}
			         }); 
		  			var obj1 = response.data;
		  			if(obj1){
		  				var readTerms = obj1['readAndUnderstandTerms'];
			  			if(readTerms){
			  				if(readTerms.response == 'true' || readTerms.response == true){
				  				$("#acceptDivId").hide();
				  				$("#acceptedDivId").show();
				  				$("#menu").show();
				  				$("#readAndUnderstandTerms").val('true');
				  			}
			  			}
			  			var boilerAge = obj1['boilerAge'];
			  			if(boilerAge){
			  				$('select option:eq("'+boilerAge.comments+'")').attr('selected',true);  // for dropdown only
			  				validateBoilerAge(boilerAge.comments);
			  			}
			  			var installationDate = obj1['installationDate'];
			  			if(installationDate){
			  				$("#installationDate").val(installationDate.comments);
			  				bindInstallationDateBy();
			  			}
			  			var needRadonRiskReport = obj1['needRadonRiskReport'];
			  			if(needRadonRiskReport){
			  				if(typeof needRadonRiskReport.fileName != 'undefined'){
			  					if(needRadonRiskReport.fileName.length > 0){
				  					var cPath = contextPath+"/";
				  					$("#needRadonRiskReportFileDisplay").show();
				  					$("#needRadonRiskReportFileName").html(needRadonRiskReport.fileName);
				  					if(needRadonRiskReport.isImage == true || needRadonRiskReport.isImage == 'true'){           // check for image
				  						var path = needRadonRiskReport.filePath;
				  						$("#needRadonRiskReportFileView").show();
				  						$("#needRadonRiskReportFileView").attr("href", cPath + path );                            // setting value to view  href
				  					}
				  					var downloadLink = cPath+"download/uploadedDocuments.htm?fileId="+needRadonRiskReport.documentId;
				  					$("#needRadonRiskReportFileDownload").attr("href", downloadLink);
			  					}
			  				}
			  			}
			  			var whereITFails = obj1['whereITFails'];
			  			if(whereITFails){
			  				if(whereITFails.comments.length > 0){
			  					$("#propertyMeetStandardsLabel").hide();
			  				}
			  				$("#whereITFails").val(whereITFails.comments);
			  			}
			  			
			  			var workCompletedBy = obj1['workCompletedBy'];
			  			if(workCompletedBy){
			  				$("#workCompletedBy").val(workCompletedBy.comments);
			  				validateAnswerForYes('workCompletedBy');
			  			}
		  			  }
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
		  
		  $("#readAndUnderstandTerms").click(function(){
				if($("#readAndUnderstandTerms").is(':checked')){
					$("#menu").show();
					$("#acceptDivId").hide();
					$("#acceptedDivId").show();
				} else{
					$("#menu").hide();
				}
			});
		  
		  new JsDatePick({
				useMode:2,
				target:"installationDate",
				dateFormat:"%d-%M-%Y",
				limitToToday : true
		  		});
		  
	 });
	
	function validateAnswerForYes(name){
		var rslt = globalAnsObj[name];
		var ans = rslt.affirmativeAns;
		var noIconVar = "#"+name+"No";
		var yesIconVar = "#"+name+"Yes";
		if(ans == 'true' || ans == true){
			$(noIconVar).hide();
			$(yesIconVar).show();
		}else{
			$(noIconVar).show();
			$(yesIconVar).hide();
		}
		if(name == 'readAndUnderstandTerms'){
			var rslt1 = globalAnsObj[name];
		}else if(name == 'adequateHeating'){
			$("#boilerAgeDivId").show();
			$(yesIconVar).hide();
			$(noIconVar).show();
		}else if(name == 'insulation270mm'){
			$("#installationDateDivId").show();
			$(yesIconVar).hide();
			$(noIconVar).show();
			bindInstallationDateBy();
		}else if(name == "needRadonRiskReport"){
		
			$("#needRadonRiskReportFileDiv").show();
			 var needRadonRiskReportObj = globalDataObj['needRadonRiskReport'];
			 var reportFileName = needRadonRiskReportObj['fileName'];
			
			 if(typeof  reportFileName === undefined || typeof  reportFileName === 'undefined'){
				 $(yesIconVar).hide();
				 $(noIconVar).show();
			 }else{
				 $(noIconVar).hide();
				 $(yesIconVar).show();
			 }
		}else if(name == 'propertyMeetStandards'){
			$(".propDivision").hide();
		}else if(name == 'upgradeProperty'){
			$("#workCompletedByLabel").show();
			var workCompletedBy = $("#workCompletedBy").val();
			if(workCompletedBy == null || workCompletedBy.length <= 0){
				$("#upgradePropertyNo").show();
				$("#upgradePropertyYes").hide();
			}else{
				$("#upgradePropertyNo").hide();
				$("#upgradePropertyYes").show();
			}
			bindWorkCompletedBy();
		}else if(name == 'workCompletedBy'){
			
			var workCompletedBy = $("#workCompletedBy").val();
			if(workCompletedBy == null || workCompletedBy.length <= 0){
				$("#upgradePropertyNo").show();
				$("#upgradePropertyYes").hide();
			}else{
				$("#workCompletedByLabel").show();
				$("#upgradePropertyNo").hide();
				$("#upgradePropertyYes").show();
			}
			bindWorkCompletedBy();
		}
		
	}
	
	function bindWorkCompletedBy(){
		$(".boxMain").bind( "click", function() {
			var value = $("#workCompletedBy").val();
			if(value.length > 1){
				$("#workCompletedBySpanId").hide();
				$("#upgradePropertyNo").hide();
				$("#upgradePropertyYes").show();
			}else{
				$("#workCompletedBySpanId").show();
				$("#upgradePropertyYes").hide();
				$("#upgradePropertyNo").show();
			}
		});
	}
	
	function validateAnswerForNo(name){
		var rslt = globalAnsObj[name];
		var ans = rslt.affirmativeAns;
		var noIconVar = "#"+name+"No";
		var yesIconVar = "#"+name+"Yes";
		if(ans == 'false' || ans == false){
			$(noIconVar).hide();
			$(yesIconVar).show(150);
		}else{
			$(noIconVar).show(150);
			$(yesIconVar).hide();
		}
		
		if(name == 'adequateHeating'){
			$("#boilerAge").val("");
			$("#boilerAgeDivId").hide();
		}else if(name == 'insulation270mm'){
				$("#installationDateDivId").hide();
				$("#installationDate").val("");
			bindInstallationDateBy();

		}else if(name == "needRadonRiskReport"){
			$("#needRadonRiskReportFileLbl").hide();
			$("#needRadonRiskReportFileDiv").hide();
			$('#needRadonRiskReportFile').val(null);
		}else if(name == 'propertyMeetStandards'){
			$(".propDivision").show();
			$("#whereITFails").val("");
			bindWorkCompletedBy();
		}else if(name == 'upgradeProperty'){
			$("#workCompletedByLabel").hide();
			$("#workCompletedBy").val("");
		}
		
	}
	
	function uploadLater(name){
		var yesIconId = "#"+name+"Yes";
		var noIconId = "#"+name+"No";
		var lblId = "#"+name+"FileLbl";
		var browseFileDivision = "#"+name+"FileDiv";
			$(yesIconId).hide();
			$(noIconId).show();
			$(browseFileDivision).hide();
			$(lblId).show();
			$(lblId).html("Mandatory Attachment is pending.");
			$(lblId).css("color", "seagreen");
			$('#needRadonRiskReportFile').val(null);
	}
	
	function bindInstallationDateBy(){
		$(".boxMain").bind( "click", function() {
			var dateValue = $("#installationDate").val();
			if(dateValue.length > 1){
				$("#installationDateLabel").hide();
				$("#insulation270mmYes").show();
				$("#insulation270mmNo").hide();
			}else{
				$("#installationDateLabel").show();
				$("#insulation270mmNo").show();
				$("#insulation270mmYes").hide();
			}
		});

		 dateValue = $("#installationDate").val();
			if(dateValue.length > 1){
				$("#installationDateLabel").hide();
				$("#insulation270mmYes").show();
				$("#insulation270mmNo").hide();
			}else{
				$("#installationDateLabel").show();
				$("#insulation270mmNo").show();
				$("#insulation270mmYes").hide();
			}
			if($('#insulation270mm2').is(':checked')){
				$("#installationDate").val("");
				$("#insulation270mmNo").show();
				$("#insulation270mmYes").hide();
			}
	
	}
	
	function validateBoilerAge(value){
		if(value == ""){
			$("#boilerAgeLabel").show();
			$("#adequateHeatingYes").hide();
			$("#adequateHeatingNo").show();
		}else{
			$("#boilerAgeLabel").hide();
			$("#adequateHeatingNo").hide();
			$("#adequateHeatingYes").show();
		}
		if($('#adequateHeating2').is(':checked')){
			$("#boilerAge").val("");
			$("#adequateHeatingNo").show();
			$("#adequateHeatingYes").hide();
		}
	}
	
	function validateFile(id){
		
		var maxSize = 10000000;
		 var fsize = $('#needRadonRiskReportFile')[0].files[0].size;
		if(fsize > maxSize){
			$("#needRadonRiskReportMaxFileLbl").show();
			$("#needRadonRiskReportMaxFileLbl").html("Max size is 10Mb");
			$("#needRadonRiskReportMaxFileLbl").css("color", "red");
		}else if(fsize <= maxSize){
			$("#needRadonRiskReportFileLbl").hide();
			$("#needRadonRiskReportYes").show();
			$("#needRadonRiskReportNo").hide();
		}else{
			$("#needRadonRiskReportMaxFileLbl").hide();
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
	
	