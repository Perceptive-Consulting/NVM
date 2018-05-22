 <style>
 	.heading{
		text-transform: uppercase;
		text-decoration: underline;
		font-size: 20px!important;
	}
 </style>
 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/pdProperty/pdPropertyDetails.js"></script>
 <script src="<%=request.getContextPath()%>/resource/perpetual/admin/property/property-validation.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/property/property.js"></script>

 
<script type="text/javascript" >
	$(document).ready(function(){
		//alert('${pdId}');
		pdProperty.Add('${pdId}');
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
    <div class="button"><button id="allPDPropertiesId">Back</button>
    <span>&nbsp;&nbsp;&nbsp;</span><button id="viewDocumentsId">View Documents</button>
    <button id="approvePropertyId">Approve</button>
    <span>&nbsp;&nbsp;&nbsp;</span><button id="disApprovePropertyId" style="display: none;">Dis-Approve</button>
    <button id="viewPDConversationId">View Conversation</button>
    <button id="uploadDocumentsId">Upload Documents</button>
    <button id="viewPdPropertyMapId">View Map</button>
    <button id="downloadPropertyFormId">Download PropertyDetail as PDF</button>
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
            <li><strong>UserName</strong><samp>:</samp><span id="pdUserName"></span></li>
            <li><strong>Password</strong><samp>:</samp><span id="pdPassword"></span></li>
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