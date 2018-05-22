<script src="<%=request.getContextPath()%>/resource/perpetual/admin/contractor/contractor.js"></script>
<script src="<%=request.getContextPath()%>/resource/perpetual/admin/contractor/contractor-validation.js"></script>
<div class="container">
  <sections class="contant-area" style="height:1500px;">
    <div class="button">
    <button id="viewButtonId">View</button>
      <button id="editButtonId" style="display: none;">Edit</button>
      <button id="createButtonId" style="display: none;">Create</button>
      <button id="deleteButtonId" style="display: none;">Delete</button>
    </div>
    
    <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>Created On</th>
            <th>Company Name</th>
             <th>Company Type</th>
            <th>Status</th>
            <th>Trading Commencement Date</th>
            <th>Vat No</th>
        </tr>
    </thead>
</table>

  </sections>

</div>
<div style="display:none;">
  <div id='edit'>
    <form id="editPopupFormId" action="javascript:editPopupForm()">
      <h1>Edit Contractor Details</h1>
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"><label>Contact Person:</label></td>
            <td width="60%"><input type="text" value="" class="" name="contactPerson" id="contact_person"/></td>
          </tr>         
          <tr>
            <td><label>Company Name:</label></td>
            <td><input type="text" value="" class="" name="companyName" id="company_name"/></td>
          </tr>
          <tr>
            <td><label>Address Line 1:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine1" id="address_line1"/></td>
          </tr>
          <tr>
            <td><label>Address Line 2:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine2" id="address_line2"/></td>
          </tr>
          <tr>
            <td><label>City:</label></td>
            <td><input type="text" value="" class="" name="addressObj.city" id="city"/></td>
          </tr>
          <tr>
            <td><label>Post Code:</label></td>
            <td><input type="text" value="" class="" name="addressObj.postCode" id="postCode"/></td>
          </tr>
          <tr>
            <td><label>County:</label></td>
            <td><input type="text" value="" class="" name="addressObj.county" id="county"/></td>
          </tr>
          <tr>
            <td><label>VAT No:</label></td>
            <td><input type="text" value="" class="" name="vatNo" id="vat_no"/></td>
          </tr>
        </table>
      </div>
      <div id="edit_footer"><input type="submit" value="Update" /></div>
    </form>
  </div>

  <div id='create'>
    <form id="createPopupFormId" action="javascript:createPopupForm()">
      <h1>Register Contractor</h1>
      <div class="form-element1" style="overflow-y:scroll; height: 600px">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>Name of Contractor:</label>
            <input type="text" value="" class="" name="contactPerson" /></td>
            <td width="25%"><label>Company Name:</label>
            <input type="text" value="" class="" name="companyName" /></td>
          </tr>
          <tr>
            <td><label>Vat Number:</label>
            <input type="text" value="" class="" name="vatNo" /></td>
            <td><label>Web Site Link:</label>
            <input type="text" value="" class="" name="weburl" /></td>
          </tr>
          <tr>
            <td><label>Post Code:</label>
            <input type="text" value="" class="" name="addressObj.postCode" /></td>
            <td><label>City:</label>
            <input type="text" value="" class="" name="addressObj.city" /></td>
          </tr>
          <tr>
            <td><label>County:</label>
            <input type="text" value="" class="" name="addressObj.county" /></td>
            <td><label>Address:</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" /></td>
          </tr>
          <tr>
            <td><label>Cities Serviced:</label>
            <input type="text" value="" class="" name="cities[0].city" /></td>
            <td><label>Qualification:</label>
            <input type="text" value="" class="" name="expertiseObj.qualification" /></td>
          </tr>
          <tr>
            <td><label>User Name:</label>
            <input type="text" value="" class="" name="loginObj.username" /></td>
            <td><label>Password:</label>
            <input type="text" value="" class="" name="loginObj.password" /></td>
          </tr>
          <tr>
            <td><label>Place of Training:</label>
            <input type="text" value="" class="" name="expertiseObj.trainingPlace" /></td>
            <td><label>Years of Experience:</label>
            <input type="text" value="" class="" name="expertiseObj.experienceYears" /></td>
          </tr>
          <td><label>Functionality</label>
                  <select name="expertiseObj.functionality" id="functionality">
                    <option value="Electrical Installation">Electrical Installation</option>
	                  </select></td>      
                
             <tr>
                <td style=" width:100%;" colspan="2"><label>References</label>
                </td></tr>
                
                <tr>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><label style="color:#e33a0c;">Reference - 1</label></td>
                      <td><label>Property Owner Name</label>
                        <input type="text" class="" name="expertiseObj.referenceOwnerName1" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Property Owner Contact No.</label>
                        <input type="text" class="" name="expertiseObj.referenceOwnercontact1" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Job Completion Date</label>
                        <input type="text" class="" name="expertiseObj.referenceCompletionDate1" id="" /></td>
                    </tr>
                  </table></tr>
                  
                  <tr>
                <td style=" width:100%;" colspan="2"><label></label>
                </td></tr>
                
                
                  <tr>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><label style="color:#e33a0c;">Reference - 2</label></td>
                      <td><label>Property Owner Name</label>
                        <input type="text" class="" name="expertiseObj.referenceOwnerName2" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Property Owner Contact No.</label>
                        <input type="text" class="" name="expertiseObj.referenceOwnercontact2" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Job Completion Date</label>
                        <input type="text" class="" name="expertiseObj.referenceCompletionDate2" id="" /></td>
                    </tr>
                  </table></tr>
        </table>
      </div>
      <div id="create_footer"><input type="submit" value="Create" /></div>
    </form>
  </div>
  
    <div id='delete'>
    <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Delete Contractor</h1>
      <div class="form-element">

      </div>
      <div id="delete_footer"><input id="delete_yes" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_no" type="button" value="No" /></div>
    </form>
  </div> 
</div>