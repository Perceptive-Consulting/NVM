	var globalId;
$(document).ready(function(){
	setPMCMails();
	 
	$('.close').click(function () {
  	    $('#alertErrorId').hide(200);
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId1').hide(200);
  	    $('#alertSuccessId1').hide(200);
  	    $('#alertErrorId2').hide(200);
    }); 
	
	
	 $("#pmcSendEmail").click(function(event){
		 var mailBody = $("#pmcMailBody").val();
		 if(mailBody == 'undefined' || mailBody == '' || mailBody.length == 0){
			 showErrorMessage("Cannot send empty message.", "215px");
			 return false;
		 }else{
			 $("#alertErrorId1").hide();
		 }
		  var postData = JSON.stringify($('#pmcEmailId').serializeObject());
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/conversation/mailSendByPropertyDeveloper.htm",
			    type: "POST",
			    data : postData,
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');
			    	if(response.success == true){
			    		$('#pmcEmailId')[0].reset();
			    		showSuccessMessage("Sent Successfully", "215px");
			    		var conversationId = $("#pmcConversationId").val();
			    		setMailData(conversationId);
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
	});

	function setPMCMails(){
		 $.getJSON(contextPath+"/propertyDeveloper/loadPMCConversationByProperty.htm",
				    function(response, textStatus, jqXHR){	
			 if(response.success == true){
				 var conversationList = response.data; 
				 var htmlStr = "";
				 	$.each(conversationList, function(conversationObj){
				 		htmlStr += formatPMCListHTML(this.conversationObj);
			         }); 
				 	$("#pmcListId").html(htmlStr);
				 	var firstConversationId = conversationList[0].conversationObj.id;
				 	setMailData(firstConversationId);
			 }
		 });
	}

	function formatPMCListHTML(conversationObj){
		var htmlStr =  '<li> <a class="hyperlink-cls" id="charity'+conversationObj.id+'" href="javascript:setMailData('+conversationObj.id+')">'+conversationObj.actorOneDetailsStr+'</a></li>';
		return htmlStr;
	}
	
	function setMailData(conversationId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var charityHrefId = "#charity"+conversationId+"";
		$(charityHrefId).addClass('hyperlink-selected');
		
		$('#pmcEmailId')[0].reset();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation.htm?conversationId="+conversationId,
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			 var htmlStr = "";
			 	$.each(response.data, function(mail){
			 		htmlStr += formatEmailHTML(this.mail);
		         }); 
			 $("#charitymailContentId").html(htmlStr);
		 }else{
			
		 }
	 });
	}

	function formatEmailHTML(mail){
		$("#pmcSubjectId").html(mail.subject);
		globalConversationId = mail.conversationId;
		$("#pmcConversationId").val(mail.conversationId);
		
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
	
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};
