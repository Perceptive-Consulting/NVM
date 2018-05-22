	var gAssignModelId;
$(document).ready(function(){
	$('.close').click(function () {
  	    $('#alertErrorId').hide(200);
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId1').hide(200);
  	    $('#alertSuccessId1').hide(200);
  	    $('#alertErrorId2').hide(200);
    }); 
  	
	$(".tab_content1").hide(); //Hide all content
	$(".left-inbox li:first").addClass("selected").show(); //Activate first tab
	$(".tab_content1:first").show(); //Show first tab content
	//On Click Event
	$(".tab-menu li").click(function() {
		$(".tab-menu li").removeClass("selected"); //Remove any "active" class
		$(this).addClass("selected"); //Add "active" class to selected tab
		$(".tab_content1").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		
		$(activeTab).fadeIn(); //Fade in the active content
		
		return false;
	});
	
	 $("#infoBtnId").click(function(event){
		 $("#informationId").fadeIn();
	 });
	 
	 $("#backBtnId").click(function(event){
		 $('#slidedivision').toggle('slide', { direction: 'left' }, 700);
	 });
	 
	 $("#acceptDocumentBtnId").click(function(event){
		 var documentId = $("#documentId").val();
		 $.ajax({
				url : contextPath+"/landlord/updateDocumentStatus.htm",
			    type: "POST",
			    data : {documentId : documentId, statusId : 10},
			    dataType : "json",
			    //contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	if(response.success == true){
			    		 setLandlordsDocuments(gAssignModelId);
			    		 showSuccessMessage("Accepted Successfully", "220px");
			    		$("#acceptDocumentPopUp").hide();
			    	}
			    },
			    error: function(jqXHR, textStatus, errorThrown) 
			    {
			        alert("fail");  
			    }
			});
	 });
	 
	 
	 
	 
});
	function getAssignedJobs(){
		 $.getJSON(contextPath+"/landlord/loadAssignedJobsByProperty.htm",
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 var assignedJobs = response.data;
				 formatAssignedJobsHTML(assignedJobs);
				 }
		 });
	}
	
	
	
	function formatAssignedJobsHTML(assignedJobs){
		var html = "";
			var i = 0;
			 $.each(assignedJobs, function(key, jobObj){
				 if(i == 0){
					html += formatAssignedJobsHeaderHTML();
					html += formatAssignedJobsDataHTML(jobObj);
				 } else
					 html += formatAssignedJobsDataHTML(jobObj);
				 i++;
          });
			$("#assignedJobsId").empty().html(html);
		}

	function formatAssignedJobsHeaderHTML(){
		
	 
		var htmlStr = '<tr style="width: 100%">'
		         + '<th style="width: 14%">Job Name</th>'
	             + '<th style="width: 14%">Contractor Name</th>'
	             + '<th style="width: 14%">Assigned On</th>'
	             + '<th style="width: 14%">Status</th>'
	             + '<th style="width: 14%">View Details</th>'
	             + '</tr>';
	 
	 	return htmlStr;
	}
	
	function formatAssignedJobsDataHTML(jobObj){
		
		 var htmlStr = '<tr>'
		 			 + '<td>' + jobObj.jobName + '</td>'
		 		     + '<td>' + jobObj.contractorName + '</td>'
		 		     + '<td>' + jobObj.createdOn + '</td>'
		 		     + '<td>' + jobObj.statusStr + '</td>'
		 		     + '<td><div class="view-other"><a href="javascript:viewAssignedJobsDetails('+jobObj.id+')" >View Details</a></div></div></td>'
				     + '</tr>';
		return htmlStr;
		
	}
	
	function viewAssignedJobsDetails(assignId){
		
		$('#slidedivision').toggle('slide', { direction: 'left' }, 500);
		 $.getJSON(contextPath+"/landlord/loadJobsDetails.htm?assignModelId="+assignId ,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				var tAssignObj = response.data.assignObj;
				$("#dJobName").html(tAssignObj.jobName);
				$("#dContractorName").html(tAssignObj.contractorName);
				$("#dAssignedOn").html(tAssignObj.createdOn);
				$("#dJobStatus").html(tAssignObj.statusStr);
				$("#dEstimatedCompletionDate").html(tAssignObj.estimatedCompletionDate);
				$("#dEstimatedCost").html(tAssignObj.estimatedCost);
				$("#dJobDescription").html(tAssignObj.jobDescription);
				setLandlordsDocuments(tAssignObj.id);
			 }else{
				return false;
			 }
		 });
	}
	
	function setLandlordsDocuments(assignModelId){
		$("#documentsId").empty();
			gAssignModelId = assignModelId;
		  $.getJSON(contextPath+"/landlord/loadAllDocuments.htm?assignModelId="+assignModelId,
				    function(response, textStatus, jqXHR){
			 		if(response.success == true){
			 			var documentList = response.data;
			 			var html = "";
			 			var i = 0;
			 			 $.each(documentList, function(document){
			 				 if(i == 0){
			 					html += formatHtml1();
			 					html += formatHtml(this.document);
			 				 } else
			 					 html += formatHtml(this.document);
			 				 i++;
				          });
			 			$("#documentsId").empty().html(html);
			 		}else{
			 			showErrorMessage("No Documents Uploaded Yet.", "250px");
			 		}
			 			
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			}); 
	 }
	 
	 function formatHtml1(){
		 var htmlStr = '<tr style="width: 100%">'
			 		 + '<th >Name</th>'
	                 + '<th >Uploaded On</th>'
	                 + '<th >Document Type12</th>'
	                 + '<th >Status</th>'
	                 + '<th >Action</th>'
	                 + '</tr>';
		 
		 return htmlStr;
	 	}
	 
	 function formatHtml(document){
		 var htmlStr = '<tr>'
			 		 + '<td>' + document.fileName + '</td>'
		             + '<td>' + document.createdOn + '</td>'
		             + ' <td>' + document.documentTypeStr + '</td>'
		             + ' <td>' + document.statusStr + '</td>'
		 			 + '<td><a href="javascript:downloadFile('+document.fileId+')" style=" margin-top:20px;"><img src="'+contextPath+'/resource/images/downloadIcon.png"></a>';
		             if(document.documentTypeId == 1 && document.statusId != 10){
		            	 htmlStr += '<a class="labelClass" id="acceptBtnId1" style="height: auto; margin:10px 10px 10px 0px;  float:right; background: green;" href="javascript:openPopUp('+document.id+')" >Accept</a></td>';
		             }else{
		            	 htmlStr += ' </td>';
		             }
	       
		     htmlStr += '</tr>';
			
		     console.log('html : ' + htmlStr);
		     
		return htmlStr;
	 }
	 
	 function openPopUp(documentId){
		 $("#documentId").val(documentId);
		 div_show('approveBtnId','acceptDocumentPopUp');
	 }
	 
	 function downloadFile(fileId){
		 window.location.href = contextPath+"/download/uploadedDocuments.htm?fileId="+fileId; 
	 }
/*
function loadDocuments(){
	 $.getJSON("landlord.htm?action=4&param=ASSIGNED-JOBS-BY-PROPERTY",
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			return true;
		 }else{
			return false;
		 }
	 });
}*/
	