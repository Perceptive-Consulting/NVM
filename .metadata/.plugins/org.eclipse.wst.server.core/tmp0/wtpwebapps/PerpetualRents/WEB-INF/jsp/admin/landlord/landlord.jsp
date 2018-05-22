<link href="<%=request.getContextPath()%>/resource/css/sumoselect.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resource/js/jquery.sumoselect.min.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/landlord/landlord.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/landlord/landlord-validation.js"></script>
<style>
.regis { width:96.8%; padding:8px 2px; border:2px solid #E7E1E1; border-radius:3px; margin-bottom:5px; color:#333; height:38px;background-color:#fff}</style>
<div class="container">
  <sections class="contant-area">
    <div class="button">
    <button id="viewButtonId">View</button>
      <button id="editButtonId">Edit</button>
      <button id="createButtonId" style="display:none;">Create</button>
      <button id="deleteButtonId" style="display: none;">Delete</button>
    </div><!-- table  --><!--  -->
    
   <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>Created On</th>
            <th>Name</th>
            <th>Contact Number</th>
             <th width="10%">Property Registered</th>
            <th>Reference</th>
            <th width="18%">Address</th>
            <th>Primary Email Id</th>
        </tr>
    </thead>
</table>
  </sections>
</div>

<div style="display:none;">
  <div id='edit'>
    <form id="editPopupForm" action="javascript:editPopupForm()">
      <h1>Edit Landlord Details</h1>
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"><label>First Name:</label></td>
            <td width="60%"><input type="text" value="" class="" name="firstName" id="first_name"/></td>
          </tr>         
          <tr>
            <td><label>Last Name:</label></td>
            <td><input type="text" value="" class="" name="lastName" id="last_name"/></td>
          </tr>
          <tr>
            <td><label>Address Line1:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine1" id="address_line1"/></td>
          </tr>
          <tr>
            <td><label>Address Line2:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine2" id="address_line2"/></td>
          </tr>
          
          <tr>
            <td><label>City:</label></td>
            <td><select class="regis" name="addressObj.city" id="landlordCity"></select></td>
          </tr>
          <tr>
            <td><label>Post Code:</label></td>
            <td><input type="text" value="" class="" name="addressObj.postCode" id="post_code" style="text-transform: uppercase;"/></td>
          </tr>
          <tr>
            <td><label>County:</label></td>
            <td><input type="text" value="" class="" name="addressObj.county" id="county"/></td>
          </tr>
          <tr>
            <td><label>Primary Email Id:</label></td>
            <td><input type="text" value="" class="" name="primaryEmailId" id="email_id" style="background-color: #E0E0E0" readonly="readonly"/></td>
          </tr>
          <tr>
            <td><label>Primary Contact Number:</label></td>
            <td><input type="text" value="" class="" name="primaryPhoneNumber" id="phone_number"/></td>
          </tr>
        </table>
      </div>
      <div id="edit_footer"><input type="submit" value="Update" /></div>
    </form>
  </div>
   <div id='create'>
    <form id="createPopupFormId" action="javascript:createPopupForm()">
      <h1>Register LandLord</h1>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>City:</label>
            <input type="text" value="" class="" name="addressObj.city" /></td>
            <td width="25%"><label>PostCode:</label>
            <input type="text" value="" class="" name="addressObj.postCode" /></td>
          </tr>
          <tr>
            <td><label>First Name:</label>
            <input type="text" value="" class="" name="firstName" /></td>
            <td><label>Last Name:</label>
            <input type="text" value="" class="" name="lastName" /></td>
          </tr>
          <tr>
            <td><label>Primary Email Id:</label>
            <input type="text" value="" class="" name="primaryEmailId" /></td>
            <td><label>Secondary Email Id:</label>
            <input type="text" value="" class="" name="secondaryEmailId" /></td>
          </tr>
          <tr>
            <td><label>Primary Contact Number:</label>
            <input type="text" value="" class="" name="primaryPhoneNumber" /></td>
            <td><label>Secondary Contact Number:</label>
            <input type="text" value="" class="" name="secondaryPhoneNumber" /></td>
          </tr>
          <tr>
            <td><label>User Name:</label>
            <input type="text" value="" class="" name="loginObj.username" /></td>
            <td><label>Password:</label>
            <input type="text" value="" class="" name="loginObj.password" /></td>
          </tr>
          <tr>
            <td><label>Address Line 1:</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" /></td>
            <td><label>Address line 2:</label>
            <input type="text" value="" class="" name="addressObj.addressLine2" /></td>
          </tr>
        </table>
      </div>
      <div id="create_footer"><input type="submit" value="Create" /></div>
    </form>
  </div>
     <div id='delete'>
    <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Delete Landlord</h1>
      <div class="form-element">
      </div>
      <div id="delete_footer"><input id="delete_yes" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_no" type="button" value="No" /></div>
    </form>
  </div>   
</div>