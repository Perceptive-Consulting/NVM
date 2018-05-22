 <script  src="<%=request.getContextPath()%>/resource/perpetual/admin/user/usersDetails-support.js"></script>

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
</style>

<div class="container-ar">
  <section class="contant-area">
    <div class="button"><button id="allUsersId">Back</button><span>&nbsp;&nbsp;&nbsp;</span>
    <button id="enableAdminButtonId" style="display: none;">Enable</button>
    <button id="disableAdminButtonId" style="display: none;">Disable</button><span>&nbsp;&nbsp;&nbsp;</span>
    <button id="resetPassword">Reset Password</button>
    </div>
    <div class="rgpinnew">
          <ul>
            <li><strong>Firstname</strong><samp>:</samp><span id="firstName">Not Set</span></li>
            <li><strong>Lastname</strong><samp>:</samp><span id="lastName">Not Set</span></li>
            <li><strong>Cities Alloted</strong><samp>:</samp><span id="citiesAlloted">Not Set</span><span style="display: none;" id="userCityAllotedIdStr"></span>

				<h4><input type="button" id="editUserCity" name="edit" value="Edit" class="edit" style="height: 20px;" /></h4>
            	<div id="editUserCityDiv" class="edit-prof" style="display: none;">
            		<select data-placeholder="Choose Cities..." name="userCity" class="chosen-select-user-city" multiple style="width:350px;" tabindex="4" id="userCityId"></select>
					<label id="cityLabel" style="color:red; display: none;margin-top: 3%">Please Select Cities.</label>
					<div>
						<input id="userCityUpdateBtn" type="button" value="Update" class="btn-class" />
						<input id="userCityCancelBtn" type="button" value="Cancel" class="btn-class" />
					</div>
            	</div>
            
            </li>
            <li><strong>Enable</strong><samp>:</samp><span id="enable">Not Set</span></li>
            <li><strong>UserName</strong><samp>:</samp><span id="userName">Not Set</span></li>
            <li><strong>Password</strong><samp>:</samp><span id="password">Not Set</span></li>
            <li><strong>Reference Number</strong><samp>:</samp><span id="referenceNumber">Not Set</span></li>
            <li><strong>Email</strong><samp>:</samp><span id="emailId">Not Set</span></li>
            <li><strong>Phone Number</strong><samp>:</samp><span id="phoneNumber">Not Set</span></li>
            <li><strong>Address</strong><samp>:</samp><span id="address">Not Set</span></li>
            <li><strong>City</strong><samp>:</samp><span id="city">Not Set</span></li>
            <li><strong>County</strong><samp>:</samp><span id="county">Not Set</span></li>
            <li><strong>PostCode</strong><samp>:</samp><span id="postCode">Not Set</span></li>
            <li><strong>Landmark</strong><samp>:</samp><span id="landmark">Not Set</span></li>
            <li><strong>Created On</strong><samp>:</samp><span id="createdOn">Not Set</span></li>
            <li id="createdById"><strong>Created By</strong><samp>:</samp><span id="createdBy">Not Set</span></li>
            <li><strong>Modified On</strong><samp>:</samp><span id="modifiedOn">Not Set</span></li>
            <li id="modifiedById"><strong>Modified By</strong><samp>:</samp><span id="modifiedBy">Not Set</span></li>
          </ul>
          
          <div class="clearfix"></div>
        </div>    
  </section>
  </div>