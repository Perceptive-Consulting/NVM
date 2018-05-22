	var globalFunctionalityId;
	
$(document).ready(function(){
		  $.getJSON(contextPath+"/admin/loadContractorConversationByProperty.htm?propertyId="+globalPropertyId,
				    function(response, textStatus, jqXHR){
			 if(response.success == true){
				 var htmlStr = '<ul class="menu">';
				 	$.each(response.data, function(functionality, contractors){
				 		htmlStr += formatContractorJobsListHTML(this.functionality, this.contractors);
			         }); 
				 	htmlStr += "</ul>";
				 	
				 	$("#contractorJobs").empty().html(htmlStr);
				 	var list = response.data;
				 	var functionalityId = list[0].functionalityId;
				 	globalFunctionalityId = functionalityId;
				 	initMenu();
			 }
		 });
	});

	function formatContractorJobsListHTML(functionality, contractors){
		var htmlStr = '<li> <a href="javascript:setJobsData('+contractors[0].conversationObj.functionalityId+')" value = "'+contractors[0].conversationObj.functionalityId+'">'+functionality+'</a>';
			htmlStr += '<ul>';
			$.each(contractors, function(conversationObj, contractorObj){
				htmlStr += formatContractorListHTML(this.conversationObj, this.contractorObj);
	         }); 
			htmlStr += '</ul>';
			htmlStr += '</li>';
			return htmlStr;
	}
	
	function formatContractorListHTML(conversationObj, contractorObj){
		var htmlStr =  '<li> <a class="hyperlink-cls" id="conversation'+conversationObj.id+'" href="javascript:setContractorMailData('+conversationObj.id+','+conversationObj.functionalityId+')"><i class="icon fa fa-fw fa-angle-right"></i>'+contractorObj.companyName+'</a></li>';
		return htmlStr;
	}
	
	function setContractorMailData(conversationId, functionalityId){
		
		$(".hyperlink-cls").removeClass('hyperlink-selected');
		var conversationHrefId = "#conversation"+conversationId+"";
		$(conversationHrefId).addClass('hyperlink-selected');
		
		$("#contractorPieChartdivisionId").hide();
		$("#contractorMailDivisionId").show();
		$.getJSON(contextPath+"/conversation/loadAllMailsByConversation.htm?conversationId="+conversationId,
			function(response, textStatus, jqXHR){
				 if(response.success == true){
					 var htmlStr = "";
					 	$.each(response.data, function(mail){
					 		htmlStr += formatContractorsHTML(this.mail);
				         }); 
					 	
					 $("#contractorMailContentId").html(htmlStr);
				 }else{
					 $("#alertErrorId").show();
				 }
			 });
	}
	
	function formatContractorsHTML(mail){
		$("#contractorSubjectId").html(mail.subject);
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
		
	}
	
	 function initMenu() {
		  $('.menu ul').hide();
		  $('.menu ul:first').hide();
		  $('.menu li a').click(
		    function() {
		      var checkElement = $(this).next();
			  
		      if((checkElement.is('ul')) && (checkElement.is(':visible'))) { 
			    $(this).children('ul:visible').slideDown('normal');
		          checkElement.slideUp('normal');
		          return false;
			    }
		      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) { 
		       // $('.menu ul:visible').slideUp('normal');
			   $(this).children('ul:visible').slideUp('normal');
		        checkElement.slideDown('normal');
		        return false;
		        }
		      }
		    );
		  }