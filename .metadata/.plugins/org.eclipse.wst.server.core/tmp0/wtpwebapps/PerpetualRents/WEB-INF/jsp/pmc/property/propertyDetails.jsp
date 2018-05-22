 <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
 <style>
 	.heading{
		text-transform: uppercase;
		text-decoration: underline;
		font-size: 20px!important;
	}
 </style>
 <div class="container-ar">
  <section class="contant-area">
  		<div id="alertErrorId" class="alert alert-block alert-error fade in" style="display: none; margin-left: 23%; width: 45%;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorMessageId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none; margin-left: 23%; width: 45%;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
      </div>
    <div class="button">
    	<button id="allPropertiesId">Back</button><span>&nbsp;&nbsp;&nbsp;</span>
    	<button id="viewADPL">View ADPL2</button><span>&nbsp;&nbsp;&nbsp;</span>
    	<button id="startConversation">Start Conversation</button><span>&nbsp;&nbsp;&nbsp;</span>
    	<button id="viewConversation" style="display:none">View Conversation</button>
    </div>
    <br>
    <div class="index-blog" style="display:none; width:80%">
            <textarea placeholder="Type your message" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});" id="body" name="body" style="width:90%; min-height: 30px; margin: 0 15px 15px 0; padding: 8px 5px;"></textarea>
            <input type="button" class="regis-co" id="sendButtonId" value="Send" />
            <div class="clearfix"></div>
          </div>
        <div class="rgpinnew">
          <ul>
            <li><strong class="heading">Property Information</strong></li>
            <li><strong>Progress</strong><samp>:</samp><span id="statusId"></span></li>
            <li><strong>Contact Person</strong><samp>:</samp><span id="contactPerson"></span></li>
            <li><strong>Address</strong><samp>:</samp><span id="address"></span></li>
            <li><strong>City</strong><samp>:</samp><span id="city"></span></li>
            <li><strong>County</strong><samp>:</samp><span id="county"></span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id="postCode"></span></li>
            <li><strong>Status</strong><samp>:</samp><span id="status"></span></li>
            
            <li><strong>Created On</strong><samp>:</samp><span id="createdOn"></span></li>
            <li><strong>Created By</strong><samp>:</samp><span id="createdBy"></span></li>
            <li><strong>Modified On</strong><samp>:</samp><span id="modifiedOn"></span></li>
            <li><strong>Modified By</strong><samp>:</samp><span id="modifiedBy"></span></li>
            
            <li><strong>Agents name</strong><samp>:</samp><span id="agentsName"></span></li>
            <li><strong>Agent's Address</strong><samp>:</samp><span id="agentsAddress"></span></li>
            <li><strong>Agent's Phone Number</strong><samp>:</samp><span id="agentsPhoneNumber"></span></li>
          </ul>
          <input type="hidden" id=propertyId></input>
          <div class="clearfix"></div>
        </div> 
  </section>
  </div>
  <script>
  var propertyId; 
  var gConversationId;
  var id ;
  $(document).ready(function(){
		  $(".close").click(function(){
			  $("#alertSuccessId").hide();
			  $("#alertErrorId").hide();
		  });
	});
  
  function addPropertyDetails(id){
	  propertyId = id;
	  $.getJSON(contextPath+"/pmc/viewPropertyDetails.htm?propertyId="+propertyId,
			    function(response, textStatus, jqXHR){
					var propObj = response.data.propObj;
		  			var addressObj = response.data.addressObj;
		  			var landlordObj = response.data.landlord;
		  			var htmlStr = '<div style="width: 25%; margin-top: 14px !important;" id="progressBar'+propObj.id+'" class="round-pink1" ><div></div></div>';
		  			  $("#statusId").html(htmlStr);
		  			  $("#contactPerson").html(propObj.contactPerson);
		  			  $("#address").html(addressObj.addressLine1 + " " + addressObj.addressLine2);
		  			  $("#city").html(addressObj.city);
		  			  $("#county").html(addressObj.county);
		  			  $("#postCode").html(addressObj.postCode);
		  			  
		  			  $("#createdOn").html(propObj.createdOn);
		  			  $("#createdBy").html(propObj.createdBy);
		  			  $("#modifiedOn").html(propObj.modifiedOn);
		  			  $("#modifiedBy").html(propObj.modifiedBy);
		  			  
		  			  $("#agentsName").html(propObj.agentName);
		  			  $("#agentsAddress").html(propObj.agentAddressLine);
		  			  $("#agentsPhoneNumber").html(propObj.agentContactNumber);
		  			  $("#status").html(propObj.statusStr);
		  			  if(propObj.statusStr == 'Approved'){
		  				  $("#disApprovePropertyId").show();
		  					$("#approvePropertyId").hide();
		  			  }else{
		  				  $("#approvePropertyId").show();
		  				  $("#disApprovePropertyId").hide();
		  			  }
		  			  
		  			 if(response.data.convObj){
		  				  $("#viewConversation").css("display", "inline");
		  				  $("#startConversation").css("display", "none");
		  			  }
		  			  
		  			setProgress(propObj);
			    }).fail(function(jqXHR, textStatus, errorThrown)
			{
			 console.log(errorThrown);
		}); 
	  
  }
  
  function setProgress(propObj){
	      progressBar(propObj.statusPercentage, $('#progressBar'+propObj.id));
	}
  
  $('#viewADPL').click(function(){
	  var propId = $("#propertyId").text();
		console.log(propId);
		$.ajax({
			url : contextPath+"/pmc/redirectADPL2.htm",
	  		method: "Post",
			success:function(result){
				$("#containerId").html(result);
				add(propertyId);
		  },
		  error:function(){
	          $("#containerId").html('There is error while submit');
	      }});
	});
  
  $('#allPropertiesId').click(function(){
	  $.ajax({
	      url: contextPath+"/pmc/redirectProperty.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});  
 
  $('#startConversation').click(function(){
	  $(".index-blog").css("display", "block");
	});
  
  $('#sendButtonId').click(function(){
	  var jObj = {};
	  
	  var mailBody = $("#body").val();
	  if(mailBody.length == 0){
			$("#commonMessageErrorId").html("Cannot send Empty Message...");
			$("#commonMessageErrorId").fadeIn();
			setTimeout(function(){
				$("#commonMessageErrorId").fadeOut(4000);
			}, 2000);
			return false;
	  }
	  jObj["mailBody"] = mailBody;
  $.ajax({
	  beforeSend: function(){
			$(".loader").css('height', $(document).height());
			$(".loader").css('display', 'block');				    
	  },
      url: contextPath+"/pmc/startLandlordConversation.htm?propertyId="+propertyId,
      type: "post",
      data: JSON.stringify(jObj),
      dataType: "json",
      contentType: "application/json",
      success: function(response){
    	 $(".loader").css('display', 'none');
    	  if(response.success == true){
    		  gConversationId = response.data;
    		  $("#commonMessageSuccessId").html("Message has been sent successfully.");
				$("#commonMessageSuccessId").fadeIn();
				setTimeout(function(){
					$("#commonMessageSuccessId").fadeOut(4000);
				}, 2000);
    		  $("#viewConversation").css("display", "inline");
				$("#startConversation").css("display", "none");
    		  $(".index-blog").css("display", "none");
    		  $("#body").val("");
    		  
    		  //$('#emailId')[0].reset();
    	  }
      },
      error:function(){
          $("#containerId").html('There is error while submit');
      }
  });
  });
  
  $('#viewConversation').click(function(){
	  $.ajax({
		  url: contextPath+"/pmc/redirectConversation.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	    	  setConversationId(gConversationId, propertyId, 1);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  	});
	  });
  
  </script>