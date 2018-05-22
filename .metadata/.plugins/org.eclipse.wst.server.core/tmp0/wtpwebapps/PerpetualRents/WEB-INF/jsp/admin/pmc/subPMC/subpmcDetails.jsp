<script src="<%=request.getContextPath()%>/resource/perpetual/admin/pmc/subPMC/subpmcDetails.js"></script> 
 <style>
	.chosen-container-multi .chosen-choices {
		width: 100% !important;
	}
	.chosen-choices .search-choice {
		font-size: 13px;
		width: auto;
	}
	.chosen-choices .search-choice span {
		float: left;
		width: 100%;
	}
	.chosen-container {
	    width: 100% !important;
	}
</style>
<div class="container-ar">
	<section class="contant-area">
    <div class="button"><button id="subPMCDetailsBackBtn">Back</button><span>&nbsp;&nbsp;&nbsp;</span><button id="enableId">Enable</button>
    <button id="disableId" style="display: none;">Disable</button><span>&nbsp;&nbsp;&nbsp;</span><button id="resetPassword">Reset Password</button></div>
    <div class="rgpinnew">
          <ul>
            <li><strong>Company Name</strong><samp>:</samp><span id="companyName"></span></li>
            <li><strong>Authorised Person</strong><samp>:</samp><span id="authorisedPerson"></span></li>
            <li><strong>Reference Number</strong><samp>:</samp><span id="referenceNumber"></span></li>
            <li><strong>Web URL</strong><samp>:</samp><span id="webURL"></span></li>
            <li><strong>Enabled</strong><samp>:</samp><span id="enabled"></span></li>
            <li>
            	<strong>Cities Covered</strong><samp>:</samp><span id="subPMCCitiesCovered"></span><span style="display: none;" id="subPMCCitiesCoveredIdStr"></span>
	            <h4><input type="button" id="editSubPMCCity" name="edit" value="Edit" class="edit" style="height: 20px;" /> </h4>
	           	<div id="editSubPMCCityDiv" class="edit-prof" style="display: none;">
	           		<select data-placeholder="Choose Cities..." name="subPMCCity" class="chosen-select-sub-pmc-city" multiple style="width:auto;" tabindex="4" id="subPMCCityId"></select>
					<label id="subPMCCityLabel" style="color:red; display: none;margin-top: 3%">Please Select Cities.</label>
					<div>
						<input id="subPMCCUpdateBtn" type="button" value="Update" class="btn-class" />
						<input id="subPMCCityCancelBtn" type="button" value="Cancel" class="btn-class" />
					</div>
	           	</div>
            </li>
            <li><strong>Username</strong><samp>:</samp><span id="userName"></span></li>
            <li><strong>Password</strong><samp>:</samp><span id="password"></span></li>
            <li><strong>EmailId</strong><samp>:</samp><span id="emailId"></span></li>
            <li><strong>Phone Number</strong><samp>:</samp><span id="phoneNumber"></span></li>
            <li><strong>Address Line1</strong><samp>:</samp><span id="addressLine1"></span></li>
            <li><strong>Address Line2</strong><samp>:</samp><span id="addressLine2"></span></li>
            <li><strong>County</strong><samp>:</samp><span id="county"></span></li>
            <li><strong>Postcode</strong><samp>:</samp><span id="postCode"></span></li>
            <li><strong>Landmark</strong><samp>:</samp><span id="landmark"></span></li>
            <li><strong>Created On</strong><samp>:</samp><span id="createdOn"></span></li>
            <li id="createdById"><strong>Created By</strong><samp>:</samp><span id="createdBy"></span></li>
            <li><strong>Modified On</strong><samp>:</samp><span id="modifiedOn"></span></li>
            <li id="modifiedById"><strong>Modified By</strong><samp>:</samp><span id="modifiedBy"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div>    
	</section>
</div>