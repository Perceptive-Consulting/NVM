	var globalId;
	var globalFunctionalityId;
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
		if(activeTab == '#charity'){
			setPMCMails();
		}else if(activeTab == '#assignedJobs'){
			getAssignedJobs();
			$("#slidedivision").show();
		}
		$(activeTab).show(); //Fade in the active content
		
		return false;
	});
	
	 
	
	 $.getJSON(contextPath+"/landlord/loadFunctionalityByProperty.htm",function(response, textStatus, jqXHR){
		 var isContractorVisible = true;
		 if(response.success == true){
			 $("#contractorLiId").show();
			 $("#functionalityListId").empty().html("");
			 var htmlStr = "";
			 	$.each(response.data, function(functionality, contractors){
			 		htmlStr += formatLandlordJobsListHTML(this.functionality, this.contractors);
		         }); 
			 	$("#functionalityListId").empty().html(htmlStr);
			 	var list = response.data;
			 	var functionalityId = list[0].functionalityId;
			 	globalFunctionalityId = functionalityId;
			 	setPieChartData(functionalityId);
			 	initDropDown(true);
		 }else{
			 isContractorVisible = false;
		 }
		 checkTabsData(isContractorVisible);
	 });
  	
	 $("#sendEmail").click(function(event){
		 var mailBody = $("#mailBody").val();
		 if(mailBody == 'undefined' || mailBody == '' || mailBody.length == 0){
			 $("#errorMessageId1").html("Can not send empty message.");
			 $("#alertErrorId1").show();
			 return false;
		 }else{
			 $("#alertErrorId1").hide();
		 }
		 
		  var postData = JSON.stringify($('#emailId').serializeObject());
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/conversation/mailSendByLandlord.htm",
			    type: "POST",
			    data : postData,
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');
			    	if(response.success == true){
			    		$('#emailId')[0].reset();
			    		$("#alertSuccessId").show();
			    		var conversationId = $("#conversationId").val();
			    		setLandlordContractorMailData(conversationId, globalFunctionalityId);
			    		setTimeout(function(){
			    			$("#alertSuccessId").hide();
			    		}, 500);
			    	}else{
			    	}
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        console.log(errorThrown); 
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#assignProperty").click(function(event){
		 var conversationId = $("#conversationId").val();
		 var completionDate = $("#estimatedCompletionDate").val();
		 var jobDescription = $("#jobDescription").val(); 
		 var estimatedCost = $("#estimatedCost").val();
		 if(completionDate == null || completionDate.length == 0){
			 showErrorMessage("Please enter Estimated Completion Date", "220px");
			 return false;
		 }
		 if(estimatedCost == null || estimatedCost.length == 0){
			 showErrorMessage("Please enter Estimated Cost", "220px");
			 return false;
		 }
		 if(jobDescription == null || jobDescription.length == 0){
			 showErrorMessage("Please add some description about job", "220px");
			 return false;
		 }
			$.ajax({
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/assign/assignPropertyToContractor.htm?conversationId="+conversationId,
			    type: "POST",
			    dataType : "json",
			    data: {completionDate : completionDate, estimatedCost : estimatedCost, jobDescription : jobDescription},
			    success:function(response, textStatus, jqXHR){
			    	setTimeout(function(){
			    		$(".loader").css('display', 'none');
			    	if(response.success == true){
			    		checkTabsData();
			    		$("#estimatedCompletionDate").val('');
			    		$("#estimatedCost").val('');
			    		$("#jobDescription").val('');
			    		$("#infoBtnId").hide();
						 $("#informationId").hide();
			    		showSuccessMessage("Job has been successfully assigned to " + response.data, "220px");
			    	}else{
			    		showErrorMessage(response.message, "220px");
			    	}
			    	}, 1000);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("fail");  
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	});

	function checkTabsData(isContractorVisible){
		
		$.getJSON(contextPath+"/landlord/loadAssignedJobsByProperty.htm",function(response, textStatus, jqXHR){
		 if(response.success == true){
			 $("#assignedJobsLiId").show();
		 }
		});
		$.getJSON(contextPath+"/landlord/loadPMCConversationByProperty.htm",function(response, textStatus, jqXHR){	
		 if(response.success == true){
			$("#charityLiId").show();
			 if(isContractorVisible == false || isContractorVisible == 'false'){
				 $('#charityLiId').click();
			 }
		 	}
		});
		
	}
	
	function formatLandlordJobsListHTML(functionality, contractors){
		var functionalityId = contractors[0].conversationObj.functionalityId;
		var htmlStr = '<li> <a  class="hyperlink-cls" id="functionality'+functionalityId+'" href="javascript:setPieChartData('+contractors[0].conversationObj.functionalityId+')" value = "'+contractors[0].conversationObj.functionalityId+'">'+functionality+'</a>';
		//var htmlStr = '<li> <a href="javascript:setPieData();" value = "chintan">'+functionality+'</a>';
			htmlStr += '<ul>';
			$.each(contractors, function(conversationObj, contractorObj){
				htmlStr += formatLandlordContractorListHTML(this.conversationObj, this.contractorObj);
	         }); 
			htmlStr += '</ul>';
			htmlStr += '</li>';
			return htmlStr;
	}
	
	function formatLandlordContractorListHTML(conversationObj, contractorObj){
		var htmlStr =  '<li> <a class="hyperlink-cls" id="conversation'+conversationObj.id+'" href="javascript:setLandlordContractorMailData('+conversationObj.id+','+conversationObj.functionalityId+')">'+contractorObj.companyName+'</a></li>';
		return htmlStr;
	}
	
	function setLandlordContractorMailData(conversationId, functionalityId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var conversationHrefId = "#conversation"+conversationId+"";
		$(conversationHrefId).addClass('hyperlink-selected');
		
		$("#pieChartdivisionId").hide();
		$("#mailDivisionId").show();
		$("#conversationId").val(conversationId);
		$("#estimatedCompletionDate").val('');
		$("#estimatedCost").val('');
		$("#jobDescription").val('');
		$('#emailId')[0].reset();
		$("#alertSuccessId").hide();
		$("#informationId").hide();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation.htm?conversationId="+conversationId,
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			 var htmlStr = "";
			 	$.each(response.data, function(mail){
			 		htmlStr += formatContractorsHTML(this.mail);
		         }); 
			 $("#mailContentId").html(htmlStr);
			 $("#alertSuccessId1").hide();
	    	 $("#assignProperty").show();
	    	 $("#errorMessageId2").empty();
	    	  $("#alertErrorId2").hide();
		 }else{
			 $("#alertErrorId").show();
		 }
	 });
		setAssignWindow(functionalityId);
	}
	
	function formatContractorsHTML(mail){
			$("#subjectId").html(mail.subject);
			globalConversationId = mail.conversationId;
			$("#conversationId").val(mail.conversationId);
			
		var htmlStr = '<div class="blog-sec">'
			        + '<div class="blog-left" id="senderId">' + mail.senderUserName +'</div>'
			        + '<div class="blog-right">'
			        + '<div class="intro-h"></div>';
			        if(mail.age == null || mail.age == 'null'){
			        	htmlStr +=  '<div class="date-tim" id="receivedDateId">' + mail.receivedDate +'<span>' + mail.receivedTime +'</span></div>';
			        }else{
			        	htmlStr += '<div class="date-tim" id="">' + mail.age + '<span></span></div>';
			        }
		    htmlStr += '<div class="clearfix"></div>'
			        + ' <article>'
			        + '<p id="dataId">'+mail.mailBody+'</p>'
			        + '</article>'
			        +' </div>'
			        +'<div class="clearfix"></div>'
			        +'</div>';
		    
		return htmlStr;
	}
	
	function setAssignWindow(functionalityId){
		if(functionalityId != undefined && functionalityId != 'undefined'){
			$.getJSON(contextPath+"/assign/isJobAssigned.htm?functionalityId="+functionalityId,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 $("#infoBtnId").hide();
				 $("#informationId").hide();
			 }else{
				 $("#infoBtnId").show();
			 }
		 });
		}
	}
	
	function setPieChartData(functionalityId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var functionalityHrefId = "#functionality"+functionalityId+"";
		$(functionalityHrefId).addClass('hyperlink-selected');
		
		
		if(functionalityId != undefined && functionalityId != 'undefined'){
			$.getJSON(contextPath+"/landlord/loadJobsDetailsByProperty.htm?functionalityId="+functionalityId,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				var obj = response.data;
				$("#jobName").html(obj.jobName);
				$("#invitationCount").html(obj.invitationCount);
				$("#jobsDescription").html(obj.jobsDescription);
				$("#jobStatus").html(obj.jobStatus);
				
			 }else{
				
			 }
		 });
		}
		$("#pieChartdivisionId").show();
		$("#mailDivisionId").hide();
	}
