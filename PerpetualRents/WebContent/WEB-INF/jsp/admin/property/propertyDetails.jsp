 <style>
 	.heading{
		text-transform: uppercase;
		text-decoration: underline;
		font-size: 20px!important;
	}
 </style>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/property/propertyDetails.js"></script>
 
 
<script type="text/javascript" >
	$(document).ready(function(){
		addPropertyDetails('${propertyId}');
	});
</script> 
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
    <div class="button"><button id="allPropertiesId">Back</button><span>&nbsp;&nbsp;&nbsp;</span><button id="buttonDetails1Id">View ADPL2</button>
    <button id="approvePropertyId">Approve</button>
    <span>&nbsp;&nbsp;&nbsp;</span><button id="disApprovePropertyId" style="display: none;">Dis-Approve</button>
    <button id="viewConversationId">View Conversation</button>
    <button id="uploadDocumentsId">Upload Documents</button>
   
    </div>
    <div class="rgpinnew">
          <ul>
            <li><strong class="heading">Property Information</strong></li>
            <li><strong>Progress</strong><samp>:</samp><span id="statusId"></span></li>
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
            
            <li><strong>Agents name</strong><samp>:</samp><span id="agentsName"></span></li>
            <li><strong>Agent's Address</strong><samp>:</samp><span id="agentsAddress"></span></li>
            <li><strong>Agent's Phone Number</strong><samp>:</samp><span id="agentsPhoneNumber"></span></li>
          </ul>
          <input type="hidden" id=propertyId></input>
          <div class="clearfix"></div>
        </div> 
        
        <div class="rgpinnew">
          <ul>
            <li><strong class="heading">Landlord Information</strong></li>
            <li><strong>Name </strong><samp>:</samp><span id="lName"></span></li>
            <li><strong>Reference</strong><samp>:</samp><span id="lReference"></span></li>
            <li><strong>Address</strong><samp>:</samp><span id="lAddress"></span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id="lPostCode"></span></li>
            <li><strong>City</strong><samp>:</samp><span id=lCity></span></li>
            <li><strong>County</strong><samp>:</samp><span id="lCounty"></span></li>
            <li><strong>Primary Phone Number</strong><samp>:</samp><span id="lPrimaryPhoneNumber"></span></li>
            <li><strong>Secondary Phone Number</strong><samp>:</samp><span id="lSecondaryPhoneNumber"></span></li>
            <li><strong>Primary Email Id</strong><samp>:</samp><span id="lPrimaryEmailId"></span></li>
            <li><strong>Secondary Email Id</strong><samp>:</samp><span id="lSecondaryEmailId"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div> 
  </section>
  </div>