	var globalId;
$(document).ready(function(){
	$('.close').click(function () {
  	    $('#alertErrorId').hide(200);
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId1').hide(200);
  	    $('#alertSuccessId1').hide(200);
  	    $('#alertErrorId2').hide(200);
    }); 
  		
	 $.getJSON(contextPath+"/conversation/loadContractorJobsDetails.htm",
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			 	$.each(response.data, function(landlordName, landlordProperty){
			 		console.log('landlord name : ' + this.landlordName);
			 		var landlordHtml = formatLandlordListHTML(this.landlordName, this.landlordProperty);
		         	$("#landlordListId").append($('<li/>').html(landlordHtml));
		        }); 
			 	initDropDown(false);
		 }
	 });
  	
	 $("#sendEmail").click(function(event){
		 var mailBody = $("#mailBody").val();
		 if(mailBody == 'undefined' || mailBody == '' || mailBody.length == 0){
			 showErrorMessage("Can not send empty message.", "250px");
			 return false;
		 }
		 
		  var postData = JSON.stringify($('#emailId').serializeObject());
			$.ajax({	
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/conversation/mailSendBycontractor.htm",
			    type: "POST",
			    data : postData,
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	$(".loader").css('display', 'none');
			    	if(response.success == true){
			    		$('#emailId')[0].reset();
			    		showSuccessMessage("Sent Successfully", "250px");
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
	 
	});

	function formatLandlordListHTML(landlordName, landlordProperty){
		var htmlStr = '<li> <a id="landlord'+landlordName+'" href="">'+landlordName+'</a>';
			htmlStr += '<ul>';
			$.each(landlordProperty, function(index, value){
				htmlStr += formatPropertyListHTML(value.propertyReference, value.functionality);
	         }); 
			htmlStr += '</ul>';
			htmlStr += '</li>';
			return htmlStr;
	}
	
	function formatPropertyListHTML(propertyReference, propertyFunctionality){
		var htmlStr = '<li> <a href="" >'+propertyReference+'</a>';
			htmlStr += '<ul>';
			$.each(propertyFunctionality, function(conversation){
				htmlStr += formatFunctionalityListHtml(this.conversation);
	         }); 
			htmlStr += '</ul>';
			htmlStr += '</li>';
			return htmlStr;
	}
	
	function formatFunctionalityListHtml(funConversation){
			var htmlStr = '<li><a class="hyperlink-cls" id="conversation'+funConversation.id+'" href="javascript:setMailData('+funConversation.id+')">'+ funConversation.functionalityString +'</a></li>';
			return htmlStr;
	}
	
	function setMailData(conversationId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var conversationHrefId = "#conversation"+conversationId+"";
		$(conversationHrefId).addClass('hyperlink-selected');
		
		$('#emailId').show();
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
			
		 }
	 });
	}
	
	function formatEmailHTML(mail){
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
