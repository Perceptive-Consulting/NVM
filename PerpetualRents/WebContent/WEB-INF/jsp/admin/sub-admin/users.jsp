	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script  src="<%=request.getContextPath()%>/resource/js/jquery.colorbox.js"></script>
    <script  src="<%=request.getContextPath()%>/resource/perpetual/admin/user/user-support.js"></script>
    <script  src="<%=request.getContextPath()%>/resource/perpetual/admin/user/user-validation.js"></script>
    
    <style>
    	.SlectBox, .SlectBoxa {
 		   padding: 5px;
    	   width: 470px!important;
		}
		.SumoSelect > .CaptionCont > label {
		right: -13px!important;
		}
    </style>
    
<div class="container">
  <sections class="contant-area">
          <div class="button">
      <button id="createButtonIdAdmin">Create</button>
      <button id="viewButtonIdAdmin">View</button>
      <button id="editButtonIdAdmin">Edit</button>
    </div>
    <div id="alertErrorId" class="alert alert-block alert-error fade in" style="display: none;">
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in"  style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId">You got an error!</h4>
        </div>
	<table id="dataTableId1" class="table display table-bordered"
		cellspacing="0">
		<thead>
			<tr>
				<th>S.No.</th>
				<th>Created On</th>
				<th>Name</th>
				<th>Reference</th>
				<th>Status</th>
				<th>UserName</th>
			</tr>
		</thead>
	</table>
	<div class="clearfix"></div>
  </sections>
</div>

<div style="display:none; height: 100px; weight: 100px">

  
   <div id='createAdmin'>
    <form id="createPopupFormIdAdmin" >
      <h1>Create Admin</h1>
      <div id="createErrorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="createErrorMessageId">You got an error!</h4>
        </div>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>First Name:</label>
            <input type="text" value="" class="" name="firstName" /></td>
            <td width="25%"><label>Last Name:</label>
            <input type="text" value="" class="" name="lastName" /></td>
          </tr>
          <tr>
            <td><label>User Name:</label>
            	<input type="text" value="" class="" name="loginObj.username" id="userName" />
            	<label id="lbl" style="float: right; color:red;"></label></td>
           
          </tr>
          <tr>
          <td><label>Address Line 1:</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" /></td>
            <td><label>Address Line 2:</label>
            <input type="text" value="" class="" name="addressObj.addressLine2" /></td>
          </tr>
          <tr>
          <td><label>City:</label>
            <input type="text" value="" class="" name="addressObj.city" /></td>
            <td><label>Post Code:</label>
            <input type="text" value="" class="" name="addressObj.postCode" style="text-transform: uppercase;" /></td>
          </tr>
          <tr>
          <td><label>County:</label>
            <input type="text" value="" class="" name="addressObj.county" /></td>
            <td><label>Landmark:</label>
            <input type="text" value="" class="" name="addressObj.landmark" /></td>
          </tr>
          <tr>
            <td><label>Email Id:</label>
            <input type="text" value="" class="" name="contactDetailsObj.emailId" /></td>
            <td><label>Phone Number:</label>
            <input type="text" value="" class="" name="contactDetailsObj.phoneNumber" /></td>
          </tr>             
                  
        </table>
      </div>
      <div id="delete_footer"><input type="button" id="createAdminButton" style="background-color:#E33A0C" value="Create" /></div>
    </form>
  </div>
  
      <div id='editAdmin'>
    <form id="editPopupFormIdAdmin" >
      <h1>Edit Admin</h1>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>First Name:</label>
            <input type="text" value="" class="" name="firstName" id="firstName"/></td>
            <td width="25%"><label>Last Name:</label>
            <input type="text" value="" class="" name="lastName" id="lastName"/></td>
          </tr>
          <tr>
            <td><label>Address Line 1:</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" id="addressLine1"/></td>
            <td><label>Address Line 2:</label>
            <input type="text" value="" class="" name="addressObj.addressLine2" id="addressLine2"/></td>
          </tr>
          <tr>
            <td><label>City:</label>
            <input type="text" value="" class="" name="addressObj.city" id="city_"/></td>
             <td><label>Post Code:</label>
            <input type="text" value="" class="" name="addressObj.postCode" id="postCode" style="text-transform: uppercase;"/></td>
          </tr>
          <tr>
            <td><label>County:</label>
            <input type="text" value="" class="" name="addressObj.county" id="county"/></td>
            <td><label>LandMark</label>
            <input type="text" value="" class="" name="addressObj.landmark" id="landmark"/></td>
          </tr>
          <tr>
            <td><label>Email Id:</label>
            <input type="text" value="" class="" name="contactDetailsObj.emailId" id="emailId" style="background-color: #E0E0E0" readonly="readonly"/></td>
            <td><label>Phone Number:</label>
            <input type="text" value="" class="" name="contactDetailsObj.phoneNumber" id="phoneNumber"/></td>
          </tr>            
                  
        </table>
      </div>
      <div id="delete_footer"><input type="button" id="updateAdminButton" style="background-color:#E33A0C" value="Update" /></div>
    </form>
  </div>
    <div id='deleteAdmin'>
    <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Disable Admin</h1>
      <div class="form-element">

      </div>
      <div id="delete_footer"><input id="delete_yesAdmin" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_noAdmin" type="button" value="No" /></div>
    </form>
  </div>
  </div>