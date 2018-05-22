<link rel="stylesheet"  href="<%=request.getContextPath()%>/resource/css/popelements.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractor-conversation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/pop-up.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractor-document.js"></script>

<script type="text/javascript">
	
	 $(document).ready(function(){
		 var assignId = ${assignModelId};
		 globalAssignModelId = assignId;
			 setData(globalAssignModelId);
		 
			  	$('.close').click(function () {
			  	    $('#alertSuccessId').hide(200);
			  	    $('#alertErrorId').hide(200);
			    }); 
			  	
			  	$('#alertSuccessId').hide(1000);
				$('#alertErrorId').hide(1000);
				
				$("#uploadCertificatesBtn").click(function(){
					$("#certificateDivision").show();
					$("#invoiceDivision").hide();
					$("#alertErrorId3").hide();
					$("#alertSuccessId3").hide();
					$("#uploadCertificate").val(null);
					
				});
			
				$("#uploadInvoiceBtn").click(function(){
					$("#certificateDivision").hide();
					$("#invoiceDivision").show();
					$("#alertErrorId3").hide();
					$("#alertSuccessId3").hide();
					$("#uploadInvoice").val(null);
				});
			
			$( "#contractorStatus").change(function() {
				var statusId = $("#contractorStatus").val();
				$.ajax({	
					beforeSend: function(){
							$(".loader").css('height', $(document).height());
							$(".loader").css('display', 'block');				    
						},
					    url : contextPath+"/contractor/updateStatus.htm",
					    type: "GET",
					    data : {status : statusId, assignModelId : globalAssignModelId},
					    dataType : "json",
					    contentType: 'application/json',
					    success:function(response, textStatus, jqXHR){
					    	setTimeout(function() {
						    	$(".loader").css('display', 'none');
						    	if(statusId == 4){
						    		$("#successMessageId3").html("Your status has been changed successfully, Please upload Invoice & Certificates.");	
					 				$("#alertSuccessId3").show();
						    	}else{
						    		$("#successMessageId3").html("Your status has been changed successfully.");
					 				$("#alertSuccessId3").show();
					 				setTimeout(function() {
							    		$("#alertSuccessId3").hide();
							    	},1000);
						    	}
						    	setData(globalAssignModelId);
							}, 500);
					    }
					});
				});
				
	 }); 
	 
	function setData(assignModelId){
		globalAssignModelId = assignModelId;
		var islistNeeded = false;
		 $.getJSON(contextPath+"/contractor/loadJobDetails.htm?assignModelId="+assignModelId,
				    function(response, textStatus, jqXHR){	
			  			var propObj = response.data.property;
			  			var addObj = response.data.address;
			  			var assignModel = response.data.assignModel;
			  			$("#contactPerson").html(propObj.contactPerson);
			  			$("#uniqueReference").html(propObj.uniqueReference);
			 			$("#status").html(assignModel.statusStr);
			 			flag = false;
			 			if(assignModel.statusId == '7'){
			 				flag = true;
			 				$("#mainDiv").show();
							$("#acceptJob").show();
							$("#rejectJob").show();
			 			}else if(assignModel.statusId == '4'){
			 				$("#statusLiId").hide();
			 				$("#documentLiId").show();
			 			}else if(assignModel.statusId == '9'){
			 				$("#statusLiId").hide();
			 			}else{
			 				islistNeeded = true;
			 				$("#statusLiId").show();
			 			}
			 			if(!flag){
			 				$("#mainDiv").hide();
							$("#acceptJob").hide();
							$("#rejectJob").hide();
			 			}
			 			
			 			$("#contractorStatus").val("Complete");
			 			
			 			$("#addressLine1").html(addObj.addressLine1);
			 			$("#addressLine2").html(addObj.addressLine2);
			 			$("#city").html(addObj.city);
			 			$("#county").html(addObj.county);
			 			$("#postCode").html(addObj.postCode);
			 			$("#landmark").html(addObj.landmark);
			 			$("#jobsDetails").html(assignModel.jobName);
			 			$("#estimatedCost").html(assignModel.estimatedCost);
			 			$("#estimatedDate").html(assignModel.estimatedCompletionDate);
			 			$("#jobsDescription").html(assignModel.jobDescription);
			 			
			 			if(islistNeeded){
			 				var dropdown = $('#contractorStatus');
				     	      dropdown.empty();
				     	      if (response.data) {
				     	    	  var opts = response.data.status;
				     	          $.each(opts, function(id, value) {
				     	        	  dropdown.append($('<option/>').val(this.id).text(this.value));
				     	          });
				     	      }
			 			}
			 			 
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			});
		}	
		//$("#certificateForm").submit(); 
 
 </script>
<div class="row">
      <div class="span10">
        <h1 class="heading4 margin-top15"><span id="uniqueReference">Not Set</span></h1>
         <div class="tab-menu">
     	 <ul>
      	 	 <li class="selected"><a href="#details" style="color: #E33A0C;">Details</a></li>
       	 	<li><a href="#conversation" style="color: #E33A0C;">Conversation</a></li>
       	 	<li id="documentLiId" style="display: none;"><a href="#documents" style="color: #E33A0C;">Documents</a></li>
     	 </ul>
  		</div>
        <div class="clearfix"></div>
       
        <div id="details" class="tab_content1 rgpinnew" style="padding: 5px 11px!important; margin-top: 41px;">
          <ul>
          	<li id="statusLiId" style="display: none;"><strong>Change Status</strong><samp>:</samp><select style="margin-top: 9px;" name="status" id="contractorStatus"></select></li>
          	<li><strong>Contact Person </strong><samp>:</samp><span id="contactPerson">Not Set</span></li>
            <li><strong>Status</strong><samp>:</samp><span id="status">Not Set</span></li>
            <li><strong>Address Line1</strong><samp>:</samp><span id="addressLine1">Not Set</span></li>
            <li><strong>Address Line2</strong><samp>:</samp><span id="addressLine2">Not Set</span></li>
            <li><strong>City</strong><samp>:</samp><span id="city">Not Set</span></li>
            <li><strong>County</strong><samp>:</samp><span id="county">Not Set</span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id="postCode">Not Set</span></li>
            <li><strong>Landmark</strong><samp>:</samp><span id="landmark">Not Set</span></li>
            <li><strong>Jobs Details</strong><samp>:</samp><span id="jobsDetails">Not Set</span></li>
            <li><strong>Estimated Cost Given By Landlord</strong><samp>:</samp><span id="estimatedCost">Not Set</span></li>
            <li><strong>Completion Date Given By Landlord</strong><samp>:</samp><span id="estimatedDate">Not Set</span></li>
            <li><strong>Description Of Job</strong><samp>:</samp><span id="jobsDescription">Not Set</span></li>
          </ul>
          <div class="clearfix"></div>
           <div id="alertSuccessId3" class="alert alert-block alert-success fade in" style="width: 900px!important;margin-bottom:0px; display: none;">
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true" id="successMessageId3"></h4>
	        </div>
          <div id="mainDiv" style="display: none;">
       	 <div id="alertSuccessId2" class="alert alert-block alert-success fade in" style="width: 900px!important;margin-bottom:0px; display: none;">
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true" id="successMessageId2">Accepted successfully</h4>
	        </div>
	        <div id="alertErrorId2" class="alert alert-block alert-error fade in" style="width: 918px!important; display: none;" >
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true"  id="errorMessageId2">Error ! Please try again later.</h4>
            </div>
       <input type="button" id="acceptJob" class="regis-co" value="Accept Job" style="margin-right: 20px; display: none;"  />
       <input type="button" id="rejectJob" class="regis-co" value="Reject Job" style="margin-right: 20px; display: none;" onclick ="div_show('rejectJob','rejectPopUp')" />
       </div>
        </div>
          <div class="tab_content1 email-area" style="background: #F8F8F8; border: 1px solid #E8E8E8; margin-bottom: 65px;" id="conversation">
          <div class="right-index" style="width: 100%;">
            <h1 class="heading4 margin-top15" id="subjectId"></h1>
            <div class="index-blog">
              <div id="alertSuccessId1" class="alert alert-block alert-success fade in" style="width: 860px!important; display: none;">
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true" id="successMessageId1">Successfully Sent</h4>
	        </div>
	        <div id="alertErrorId1" class="alert alert-block alert-error fade in" style="width: 860px!important; display: none;" >
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true"  id="errorMessageId1">Not Sent</h4>
            </div>
            <form name="fEmail" id="emailId">
            	<input type="hidden" name="conversationId" id="conversationId"/>
              <textarea placeholder="Type your message" name="mailBody" id="mailBody" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});"></textarea>
        		<input type="button" id="sendEmail" class="regis-co" value="Send" />     
             </form>
            </div>
            <div class="clearfix"></div>
           	<div id="mailContentId" style="float: left; width:100%;">
           	</div>
           </div>
           <div>
        </div>
        </div>
         <div id="documents" class="tab_content1 rg-p innew tabs-file" style="padding: 18px 11px!important; margin-top: 41px!important;">
		  <div id="alertSuccessId4" class="alert alert-block alert-success fade in" style="width: 887px!important; display: none;">
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true" id="successMessageId4"></h4>
	        </div>
		  <h1> Documents</h1>
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="documentId"> 
		  
		  </table>
		   
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
	     <div id="alertErrorId3" class="alert alert-block alert-error fade in" style="width: 918px!important; display: none;" >
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true"  id="errorMessageId3"></h4>
            </div>
        <div class="rg-p innew" id="certificateDivision" style="display: none;">
        <form action="${contextPath}/contractor/uploadCertificates.htm" id="certificateForm" enctype="multipart/form-data">
        	<h1 style="margin-top: 10px!important;">Upload Certificate</h1>
        	<input type="hidden" value="" name="assignModelId" class = "assignModelId">
        	<input type="file" style="float: inherit!important; margin-left: 195px!important; margin-top: -21px!important;" name="uploadCertificate" id="uploadCertificate">
        	<input type="submit" id="certificatebtn" class="regis-co" value="Upload" style="margin-top: -12px;" />
        </form>
        </div>
        
        <div class="rg-p innew" id="invoiceDivision" style="display: none;">
        <form action="${contextPath}/contractor/uploadInvoice.htm" id="invoiceForm" enctype="multipart/form-data">
        	<h1 style="margin-top: 10px!important;">Upload Invoice</h1>
        	<input type="hidden" value="" name="assignModelId" class = "assignModelId">
        	<input type="file" style="float: inherit!important; margin-left: 195px!important; margin-top: -21px!important;" name="uploadInvoice" id="uploadInvoice">
        	 <input type="submit" id="invoicebtn" class="regis-co" value="Upload" style="margin-top: -12px;" />
        </form>
        </div>
         <input type="button" id="uploadCertificatesBtn" class="regis-co" value="Upload Certificates" style="display: none;" /> 
         <input type="button" id="uploadInvoiceBtn" class="regis-co" value="Upload Invoice" style="display: none;" /> 
        <div class="clearfix"></div>
        
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
    
	<div class="popup" id="rejectPopUp" onclick = "checkEvent(event)">
	<div id="maskLoader" class="loader" ></div>
	  <div class="pop_up">
	      <img src="resource/images/3.png" id="closeIcon" class="closeIcon" style="display: none;" />
	      <div class="popup_h2" style=" padding:15px 35px;">
	      </div>
	      <div class="tab-area">
				<div class="clearfix"></div>
				<h1 style="margin-top: 50px; color: black;">Are You sure you want to reject the job ?</h1>
				<label style="margin:25px 0 12px;" >Reason : </label>
				<textarea rows="2" cols="15" style="width: 630px;" id="remarks" name="remarks" maxlength="200"></textarea>
				
	      </div>
	      	<span id="rejectionErrorMessageId" style="display: none; position: absolute; top:18%; margin: 0 auto; height: 35px; border-radius:6px; width: 50%; border:1px solid #ccc; left:0; right:0; line-height: 35px;
  			background:#FFD6D6 url('resource/images/not-ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center;"></span>
	      <button type="button" id="closeButton" class=" button-file close">Cancel</button>
	      <button type="button" id="rejectOk" class="button-file">OK</button>
	      </div>
	  </div>
