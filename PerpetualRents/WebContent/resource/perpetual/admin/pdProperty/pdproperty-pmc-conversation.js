
$(document).ready(function() {
	callPmc();
});

function callPmc(){
		  $.getJSON(contextPath+"/admin/loadPmcConversationByPDProperty?pdId="+globalPropertyId,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 var htmlStr = '<ul class="menu">';
				 	$.each(response.data, function(index, value){
				 		htmlStr += formatPdCharityListHTML(index, value);
			         }); 
				 	htmlStr += "</ul>";
				 	$("#pdCharityList").empty().html(htmlStr);
				 	var list = response.data;
				 	var conversationId = list[0].conversation.id;
				 	setPDPMCMailData(conversationId);
			 }
		 });
	}

	function formatPdCharityListHTML(index, value){
		var conversation = value.conversation;
		var charity = value.charity;
		var htmlStr =  '<li> <a class="hyperlink-cls" id="charity'+conversation.id+'" href="javascript:setPDPMCMailData('+conversation.id+')"><i class="icon fa fa-fw fa-angle-right"></i>'+charity.companyName+'</a></li>';
		return htmlStr;
	}
	
	function setPDPMCMailData(conversationId){
		
		//$(".hyperlink-cls").removeClass('hyperlink-selected');
		//var charityHrefId = "#charity"+conversationId+"";
		//$(charityHrefId).addClass('hyperlink-selected');
		
		$("#pdCharityMailDivisionId").show();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation?conversationId="+conversationId,
			function(response, textStatus, jqXHR){
				 if(response.success == true){
					 var htmlStr = "";
					 	$.each(response.data, function(mail){
					 		htmlStr += formatContractorsHTML(this.mail);
				         }); 
					 $("#pdCharityMailContentId").html(htmlStr);
					 $("#pmcChatliID").show();
				 }else{
					 $("#alertErrorId").show();
					 $("#pmcChatliID").hide();
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
		//alert('hello' + functionalityId);
	}
