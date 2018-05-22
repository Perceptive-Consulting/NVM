
$(document).ready(function(){
	
	$('.close').click(function () {
  	    $('#alertSuccessId1').hide(200);
  	    $('#alertSuccessId2').hide(200);
  	    $('#alertErrorId1').hide(200);
  	    $('#alertErrorId2').hide(200);
  	    $("#alertSuccessId3").hide(200);
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
			// 
			if(activeTab == '#conversation'){
				fetchConversationData();
				$("#conversation").show();
				
			}else if(activeTab == '#details'){
				if(flag){
					$("#mainDiv").show();
					$("#acceptJob").show();
					$("#rejectJob").show();
				}
			}
			if(activeTab == '#documents'){
				$(".assignModelId").val(globalAssignModelId);
				$("#documents").show();
				setContractorDocuments(globalAssignModelId);
				$("#uploadCertificatesBtn").show();
				$("#uploadInvoiceBtn").show();
			}else{
				$("#uploadCertificatesBtn").hide();
				$("#uploadInvoiceBtn").hide();
			}
			$(activeTab).fadeIn(); //Fade in the active content
			return false;
		});
	
	 $("#sendEmail").click(function(event){
		 var mailBody = $("#mailBody").val();
		 if(mailBody == 'undefined' || mailBody == '' || mailBody.length == 0){
			 showErrorMessage("Can not send empty message.", "245px");
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
			    		showSuccessMessage("Sent Successfully", "245px");
			    		var conversationId = $("#conversationId").val();
			    		setMailData(conversationId);
			    	}else{
			    		
			    		
			    	}
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("fail");  
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#acceptJob").click(function(event){
			$.ajax({	
			beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/contractor/updateStatus.htm",
			    type: "GET",
			    data: {status : '10', assignModelId : globalAssignModelId },
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	setTimeout(function() {
				    	$(".loader").css('display', 'none');
				    	if(response.success == true){
				    		$("#successMessageId2").html("Accepted Successfully");
				    		$("#alertSuccessId2").show();
				    		$("#acceptJob").hide();
				    		$("#rejectJob").hide();
				    		 var dropdown = $('#contractorStatus');
				     	      dropdown.empty();
				     	      if (response.data) {
				     	    	  var opts = response.data;
				     	          $.each(opts, function(id, value) {
				     	        	  dropdown.append($('<option/>').val(this.id).text(this.value));
				     	          });
				     	      }
				     	     setData(globalAssignModelId); 
				    		setTimeout(function(){
				    			$("#alertSuccessId").hide();
				    		}, 500);
				    	}else{
				    		
				    	}
					}, 500);
			    	
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("fail");  
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 $("#rejectOk").click(function(event){
		  var propertyId = globalVariable;
		  var remarks = $("#remarks").val();
		  if(remarks.length == 0){
			  $("#rejectionErrorMessageId").html("Please enter a valid reason.");
			  $("#rejectionErrorMessageId").show();
			  setTimeout(function(){
					 $("#rejectionErrorMessageId").fadeOut(4000);
				 }, 4000);
			  return false;
		  }
			$.ajax({	
			beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url : contextPath+"/contractor/updateStatus.htm",
			    type: "GET",
			    data: {remarks : remarks, status : '9', assignModelId : globalAssignModelId },
			    dataType : "json",
			    contentType: 'application/json',
			    success:function(response, textStatus, jqXHR){
			    	setTimeout(function() {
				    	$(".loader").css('display', 'none');
				    	if(response.success == true){
				    		showErrorMessage("Rejected Successfully", "250px");
				    		var obj = document.getElementById("rejectPopUp"); 
				    			obj.style.display='none'; 
				    			setData(globalAssignModelId); 
				    		setTimeout(function(){
				    			$("#alertSuccessId").hide();
				    		}, 500);
				    	}else{
				    		
				    	}
					}, 500);
			    	
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("fail");  
			    }
			});
			event.preventDefault();
			event.stopImmediatePropagation();
	  });
	 
	 
});


	function fetchConversationData(){
		$.getJSON(contextPath+"/contractor/loadConversationIdByAssignModel.htm?assignModelId="+globalAssignModelId,
			    function(response, textStatus, jqXHR){
				 if(response.success == true){
					 if(response.data)
						 setMailData(response.data);
				 }else{
				 }
			 });
		}

	function setMailData(conversationId){
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation.htm?conversationId="+conversationId,
			    function(response, textStatus, jqXHR){
		 if(response.success == true){
			 var htmlStr = "";
			 	$.each(response.data, function(mail){
			 		htmlStr += formatEmailHTML(this.mail);
		         }); 
			 $("#mailContentId").html(htmlStr);
		 }else{
			 var html = $("#alertErrorId").html();
			 $("#dataId").html(html);
		 }
	 });
}

	function formatEmailHTML(mail){
			$("#subjectId").html(mail.subject);
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

	
