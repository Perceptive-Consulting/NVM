 <style>
 	.heading{
		text-transform: uppercase;
		text-decoration: underline;
		font-size: 20px!important;
	}
 </style>
 <script src="<%=request.getContextPath()%>/resource/perpetual/pmc/proposedDevelpment/pdDetail.js"></script>
 <div class="container-ar">
  <section class="contant-area">
  		<div id="errorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
      </div>
    <div class="button"><button id="back2AllPDPropertiesId">Back</button>
    <span>&nbsp;&nbsp;&nbsp;</span><button id="viewDocumentsByPmcId">View Documents</button>
     <button id="startPDConversation">Start Conversation</button><span>&nbsp;&nbsp;&nbsp;</span>
     <button id="viewPDConversation" style="display:none">View Conversation</button>
    </div>
    <br>
    <div class="index-blog" style="display:none; width:80%">
            <textarea placeholder="Type your message" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});" id="pdbody" name="pdbody" style="width:90%; min-height: 30px; margin: 0 15px 15px 0; padding: 8px 5px;"></textarea>
            <input type="button" class="regis-co" id="sendPDMessageButtonId" value="Send" />
            <div class="clearfix"></div>
          </div>
    <div class="rgpinnew">
          <ul>
            <li><strong class="heading">Property Information</strong></li>
            <li><strong>Contact Person</strong><samp>:</samp><span id="contactPerson"></span></li>
            <li><strong>Address</strong><samp>:</samp><span id="address"></span></li>
            <li><strong>City</strong><samp>:</samp><span id="city"></span></li>
            <li><strong>County</strong><samp>:</samp><span id="county"></span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id=postCode></span></li>
            <li><strong>Status</strong><samp>:</samp><span id=status></span></li>
            
            <li><strong>Created On</strong><samp>:</samp><span id="createdOn"></span></li>
            <li><strong>Created By</strong><samp>:</samp><span id="createdBy"></span></li>
            <li><strong>Modified On</strong><samp>:</samp><span id="modifiedOn"></span></li>
            <li><strong>Modified By</strong><samp>:</samp><span id="modifiedBy"></span></li>
            
          </ul>
          <input type="hidden" id=propertyId></input>
          <div class="clearfix"></div>
        </div> 
        
        <div class="rgpinnew">
          <ul>
            <li><strong class="heading">Property Developer Information</strong></li>
            <li><strong>Name </strong><samp>:</samp><span id="pdName"></span></li>
            <li><strong>Reference</strong><samp>:</samp><span id="pdReference"></span></li>
            <li><strong>Address</strong><samp>:</samp><span id="pdAddress"></span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id="pdPostCode"></span></li>
            <li><strong>City</strong><samp>:</samp><span id=pdCity></span></li>
            <li><strong>County</strong><samp>:</samp><span id="pdCounty"></span></li>
            <li><strong>Primary Phone Number</strong><samp>:</samp><span id="pdPrimaryPhoneNumber"></span></li>
            <li><strong>Secondary Phone Number</strong><samp>:</samp><span id="pdSecondaryPhoneNumber"></span></li>
            <li><strong>Primary Email Id</strong><samp>:</samp><span id="pdPrimaryEmailId"></span></li>
            <li><strong>Secondary Email Id</strong><samp>:</samp><span id="pdSecondaryEmailId"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div> 
  </section>
  </div>
  
  <script type="text/javascript">
  var pdId;
  var gConversationId;
  var id ;
  	$('#startPDConversation').click(function(){
	  $(".index-blog").css("display", "block");
	});
  	
  	$('#sendPDMessageButtonId').click(function(){
  	  var jObj = {};
  	  
  	  var mailBody = $("#pdbody").val();
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
        url: contextPath+"/propertyDeveloper/startPropertyDeveloperConversation.htm?PDId=" + pdId,
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
      		  $("#viewPDConversation").css("display", "inline");
  				$("#startPDConversation").css("display", "none");
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
  	
  	$('#viewPDConversation').click(function(){
  	  $.ajax({
  		  url: contextPath+"/pmc/redirectConversation.htm",
  	      type: "post",
  	      success: function(data){
  	    	  $("#containerId").html(data);
  	    	  setConversationId(gConversationId, pdId, 2);
  	      },
  	      error:function(){
  	          $("#containerId").html('There is error while submit');
  	      }
  	  	});
  	  });
  
  </script>