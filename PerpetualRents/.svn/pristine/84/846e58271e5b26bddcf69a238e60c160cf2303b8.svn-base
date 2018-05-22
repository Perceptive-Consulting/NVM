 <script src="<%=request.getContextPath()%>/resource/perpetual/pmc/proposedDevelpment/pdDetail.js"></script>
<script type="text/javascript">
var gConversationId;
 $(document).ready(function() {
	//Default Action
	$(".tab_content1").hide(); //Hide all content
	$(".tabs li:first").addClass("selected").show(); //Activate first tab
	$(".tab_content1:first").show(); //Show first tab content
	//On Click Event
	$(".tabs li").click(function() {
		$(".tabs li").removeClass("selected"); //Remove any "active" class
		$(this).addClass("selected"); //Add "active" class to selected tab
		$(".tab_content1").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});
	 
	$("#sendMailBtnId").click(function(){
		var jObj = {};
		var mailBody = $("#mailBody").val();
		if(mailBody.length == 0){
			$("#commonMessageErrorId").html("Cannot send Empty Message.");
			$("#commonMessageErrorId").fadeIn();
			setTimeout(function(){
				$("#commonMessageErrorId").fadeOut(4000);
			}, 2000);
			return false;
		  }
		var conversationId = $('#conversationId').val();
		jObj["mailBody"] = mailBody;
		jObj["conversationId"] = conversationId;
	  $.ajax({
		  beforeSend: function(){
				$(".loader").css('height', $(document).height());
				$(".loader").css('display', 'block');				    
		  },
	      url: contextPath+"/conversation/mailSendByPMC.htm",
	      type: "POST",
	      data: JSON.stringify(jObj),
	      dataType: "json",
	      contentType: "application/json",
	      success: function(response){
	    	 $(".loader").css('display', 'none');
	    	  if(response.success == true){
	    		  $("#commonMessageSuccessId").html("Message has been sent successfully..");
					$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(4000);
					}, 2000);
	    		  $('#mailFormId')[0].reset();
	    		  setMailData(gConversationId);
	    		  
	    	  }
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	}); 
});
 
 
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
	 
	function setConversationId(convId, propId, propertyTypeId){
	 $.getJSON(contextPath+"/conversation/loadPMCConversationByProperty.htm?propertyTypeId="+propertyTypeId+"&propertyId="+propId,
	 		    function(response, textStatus, jqXHR){
	 	 if(response.success == true){
	 		gConversationId = response.data.id;
			$("#conversationId").val(gConversationId);
			setMailData(gConversationId);
	 	 }
	 	 
	 });
	}
</script>
<div class="container-ar cont-new">
  <section class="contant-area">
    <div class="email-area" >
      <!-- <div class="left-inbox">	
      </div> -->
      <div style="margin:15px 0;" class="button">
      <button  id="backFromPMCDocumentViewId">Back</button>
    </div>
      <div class="right-index" style="border: 1px solid #CCCCCC; padding: 15px;width: 100%!important; left: 150px!important;">
        <div class="tab_content1" id="tab1">
          <h1 class="heading4 margin-top15" id="subjectId"></h1>
          <div class="index-blog">
          <form action="" id="mailFormId">
          	<input type="hidden" name="conversationId" id="conversationId" value="" >
            <textarea placeholder="Type your message" name="mailBody" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});" id="mailBody"></textarea>
            <input type="button" class="regis-co" value="Send" id="sendMailBtnId"/>
            </form>
            <div class="clearfix"></div>
          </div>
          
          <div class="content" id="mailContentId"></div>
          
        </div>
      </div>
    </div>
  </section>
  </div>
