<script  src="<%=request.getContextPath()%>/resource/js/jquery.colorbox.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/pmc/pmc.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/pmc/pmc-validation.js"></script>
   
<div class="container">
  <sections class="contant-area">
    <div class="button">
     <button id="createButtonId">Create</button>
     <button id="editButtonId">Edit</button>
     <button style="display: none;" id="deleteButtonId">Delete</button>
     <button id="viewButtonId">View</button>
     <button id="viewPMCUsersButtonId">View Users</button>
    </div>
   	 <div id="alertErrorId" class="alert alert-block alert-error fade in" style="display: none;">
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="mainsuccessId" class="alert alert-block alert-success fade in"  style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="mainsuccessMessageId">You got an error!</h4>
        </div>
        <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            	<th>S.No.</th>
            	<th>Created On</th>
	            <th>Company Name</th>
	            <th>Authorised Person</th>
	            <th>Enable</th>
	            <th>Email</th>
	            <th>Phone Number</th>
        </tr>
    </thead>
</table>
  </sections>
</div>

<div style="display:none;">
  <div id='edit'>
    <form id="editPopupForm">
      <h1>Edit Property Management Company Details</h1>
     
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"><label>Authorised Person:</label></td>
            <td width="60%"><input type="text" value="" class="" name="authorisedPerson" id="authorisedPerson"/></td>
          </tr>   
          <tr>
            <td width="40%"><label>Company Name:</label></td>
            <td width="60%"><input type="text" value="" class="" name="companyName" id="companyName"/></td>
          </tr>      
          <tr>
            <td><label>Email Id</label></td>
            <td><input type="text" value="" class="" name="contactDetailsObj.emailId" id="emailId" readonly="readonly" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td><label>Contact Number:</label></td>
            <td><input type="text" value="" class="" name="contactDetailsObj.phoneNumber" id="phoneNumber"/></td>
          </tr>
          <tr>
            <td><label>Address Line1:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine1" id="addressLine1"/></td>
          </tr>
          <tr>
            <td><label>Address Line2:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine2" id="addressLine2"/></td>
          </tr>
          <tr>
            <td><label>City:</label></td>
            <td><input type="text" value="" class="" name="addressObj.city" id="city"/></td>
          </tr>
           <tr>
            <td><label>Post Code:</label></td>
            <td><input type="text" value="" class="" name="addressObj.postCode" id="postCode" style="text-transform: uppercase;"/></td>
          </tr>
          <tr>
            <td><label>County:</label></td>
            <td><input type="text" value="" class="" name="addressObj.county" id="county"/></td>
          </tr>
         
        </table>
      </div>
      <div id="edit_footer"><input type="button" id="updateBtnId" value="Update" /></div>
    </form>
  </div>
 
   <div id='create'>
    <form id="createPopupFormId" >
      <h1>Register Property Management Company</h1>
       <div id="createErrorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="createErrorMessageId">You got an error!</h4>
        </div>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>Company Name:</label>
            <input type="text" value="" class="" name="companyName" /></td>
            <td width="25%"><label>Authorised Person</label>
            <input type="text" value="" class="" name="authorisedPerson" /></td>
          </tr>
          <tr>
           <td><label>Web URL</label>
            <input type="text" value="" class="" name="weburl" /></td>
            <td><label>UserName</label>
            <input type="text" value="" class="" id="userName" name="loginObj.username" onblur="userExists()"/>
            <label id="userErrorDivId" class="userError" style="color: #FF0000; float: right; display: none;">Username exists.</label></td>
          </tr>
          <tr>
            <td><label>Contact Number</label>
            <input type="text" value="" class="" name="contactDetailsObj.phoneNumber" /></td>
            <td><label>Email Id:</label>
            <input type="text" value="" class="" name="contactDetailsObj.emailId" /></td>
          </tr>
          <tr>
            <td><label>Address Line1</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" /></td>
            <td><label>Address Line2</label>
            <input type="text" value="" class="" name="addressObj.addressLine2" /></td>
          </tr>
          <tr>
          <td><label>City</label>
            <input type="text" value="" class="" name="addressObj.city" /></td>
            <td><label>Post Code</label>
            <input type="text" value="" class="" name="addressObj.postCode" style="text-transform: uppercase;" /></td>
          </tr>
          <tr>
            <td><label>County</label>
            <input type="text" value="" class="" name="addressObj.county" /></td> 
            <td><label>Landmark</label>
            <input type="text" value="" class="" name="addressObj.landmark" /></td>
          </tr>
          
        </table>
      </div>
      <div id="create_footer"><input type="button" id="createPmcBtnId" value="Create" /></div>
    </form>
  </div>
     <div id='delete'>
   	 <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Delete Landlord</h1>
      
      <div id="delete_footer"><input id="delete_yes" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_no" type="button" value="No" /></div>
    </form>
  </div> 
</div>