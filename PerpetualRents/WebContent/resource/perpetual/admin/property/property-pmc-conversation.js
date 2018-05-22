	var globalFunctionalityId;
	
function callPmc(){
		  $.getJSON(contextPath+"/admin/loadPmcConversationByProperty?propertyId="+globalPropertyId,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 var htmlStr = '<ul class="menu">';
				 	$.each(response.data, function(index, value){
				 		htmlStr += formatCharityListHTML(index, value);
			         }); 
				 	htmlStr += "</ul>";
				 	$("#charityList").empty().html(htmlStr);
				 	var list = response.data;
				 	var conversationId = list[0].conversation.id;
				 	setPMCMailData(conversationId);
			 }
		 });
	}

	function formatCharityListHTML(index, value){
		var conversation = value.conversation;
		var charity = value.charity;
		var htmlStr =  '<li> <a class="hyperlink-cls" id="charity'+conversation.id+'" href="javascript:setPMCMailData('+conversation.id+')"><i class="icon fa fa-fw fa-angle-right"></i>'+charity.companyName+'</a></li>';
		return htmlStr;
	}
	
	function setPMCMailData(conversationId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var charityHrefId = "#charity"+conversationId+"";
		$(charityHrefId).addClass('hyperlink-selected');
		
		$("#charityPieChartdivisionId").hide();
		$("#charityMailDivisionId").show();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation?conversationId="+conversationId,
			function(response, textStatus, jqXHR){
				 if(response.success == true){
					 var htmlStr = "";
					 	$.each(response.data, function(mail){
					 		htmlStr += formatContractorsHTML(this.mail);
				         }); 
					 $("#charityMailContentId").html(htmlStr);
				 }else{
					 $("#alertErrorId").show();
				 }
			 });
	}
	
	function formatContractorsHTML(mail){
		$("#charitySubjectId").html(mail.subject);
		globalConversationId = mail.conversationId;
		
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
	
	function setJobsData(functionalityId){
		alert('hello' + functionalityId);
	}
