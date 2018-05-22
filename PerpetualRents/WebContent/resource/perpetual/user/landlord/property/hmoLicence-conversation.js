	var globalId;
	var functionality;
$(document).ready(function(){
	$('.close').click(function () {
  	    $('#alertErrorId').hide(200);
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId1').hide(200);
  	    $('#alertSuccessId1').hide(200);
  	    $('#alertErrorId2').hide(200);
    }); 
  		
	 $("#sendEmail").click(function(event){
		 var mailBody = $("#mailBody").val();
		 if(mailBody == 'undefined' || mailBody == '' || mailBody.length == 0){
			 $("#errorMsgId1").css("top", "95px");
			 $("#errorMsgId1").html("Can not send empty message.");
			 $("#errorMsgId1").show();
			 setTimeout(function(){
				 $("#errorMsgId1").fadeOut(4000);
			 }, 4000);
			 return false;
		 }else{
			 $("#alertErrorId1").hide();
		 }
		 
		  var postData = JSON.stringify($('#emailId').serializeObject());
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', '100%');
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
			    		 $("#successMsgId1").css("top", "95px");
			    		 $("#successMsgId1").html("Sent Successfully");
			    		 $("#successMsgId1").show();
			    		 setTimeout(function(){
			    			 $("#successMsgId1").fadeOut(4000);
			    		 }, 4000);
			    		var conversationId = $("#conversationId").val();
			    		setMailData(conversationId);
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
			$.ajax({
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/assign/assignPropertyToContractor.htm?conversationId="+conversationId,
			    type: "POST",
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	setTimeout(function(){
			    	$(".loader").css('display', 'none');
			    	if(response.success == true){
			    		$("#alertSuccessId1").show();
			    		$("#assignProperty").hide();
			    	}else{
			    		$("#errorMessageId2").html(response.message);
			    		$("#alertErrorId2").show();
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
	
	function viewConversation(fieldName){
		$("#contractorListId").empty();
		div_show('bodyId','emailPopUpId');
		 $.getJSON(contextPath+"/conversation/conversationByFieldName.htm?fieldName=" + fieldName,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 	$.each(response.data, function(contractor, conversation){
			         	$("#contractorListId").append($('<li/>').html(formatContractorListHTML(this.contractor, this.conversation)));
			         }); 
				 	var firstData = response.data[0];
				 	if(firstData){
				 		globalId  = firstData.conversation.id;
				 		setMailData(firstData.conversation.id);
				 	}
			 }
		 });
	}

	function formatContractorListHTML(contractor, conversation){
			var htmlStr = '<li><a class="hyperlink-cls" id="contractorName'+conversation.id+'" href="javascript:setMailData('+conversation.id+')">'+ contractor.companyName +'</a></li>';
			
			return htmlStr;
	}
	
	function formatEmailHTML(mail){
			$("#subjectId").empty().html(mail.subject);
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

	function setMailData(conversationId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var contractorHrefId = "#contractorName"+conversationId+"";
		$(contractorHrefId).addClass('hyperlink-selected');
		
		$("#alertSuccessId").hide();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation.htm?conversationId="+conversationId,
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			 var htmlStr = "";
			 	$.each(response.data, function(mail){
			 		htmlStr += formatEmailHTML(this.mail);
		         }); 
			 $("#mailContentId").empty().html(htmlStr);
			 $("#alertSuccessId1").hide();
	    	 $("#assignProperty").show();
	    	 $("#errorMessageId2").empty();
	    	  $("#alertErrorId2").hide();
		 }else{
			 $("#alertErrorId").show();
		 }
	 });
	}
