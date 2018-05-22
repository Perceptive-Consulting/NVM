   <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>
   
    <script type="text/javascript">
  	$('.close').click(function () {
  	    $('#alertId').hide(200);
    }); 
  </script>
    <div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15">Contractor Registration</h1>
        <div id="errorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="rg-p">
          <form name="fAddExpertise" id="fAddExpertise">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
              <tr>
              <td><label>Cities Serviced</label>
                  <input type="text" value="panipat" placeholder="Type City Service" class="" name="expertiseObj.city" id="" /></td>
                <td><label>Qualification</label>
                  <input type="text" value="b.tech" placeholder="Your qualification" class="" name="qualification" id="" /></td>
              </tr>
              <tr>
              <td><label>Place of traning</label>
                  <input type="text" value="panipat" placeholder="Traning Place" class="" name="etrainingPlace" id="" /></td>
               <td><label>Year of experience</label>
                  <select name="expertiseObj.experienceYears">
                    <option>Total experience</option>
                    <option value="0.6+">6 Month+</option>
                    <option value="1+" >1 Year+</option>
                    <option value="2+">2 Year+</option>
                  </select></td>
              </tr>
               <tr>
               <td><label>Functionality</label>
                  <select name="functionality" id="functionality">
	                  </select></td>
              </tr>
              <tr>
                <td style=" width:100%;" colspan="2"><label>References</label>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><label style="color:#e33a0c;">Reference - 1</label></td>
                      <td><label>Property Owner Name</label>
                        <input type="text" value="referenceOwnerName1" placeholder="Property Owner Name" class="" name="referenceOwnerName1" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Property Owner Contact No.</label>
                        <input type="text" value="referenceOwnercontact1" placeholder="Contact No" class="" name="referenceOwnercontact1" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Job Completion Date</label>
                        <input type="text" value="referenceCompletionDate1" placeholder="Pick Date" class="" name="referenceCompletionDate1" id="" /></td>
                    </tr>
                  </table></td>
                <td style=" width:100%;" colspan="2"><label>&nbsp;</label>
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><label style="color:#e33a0c;">Reference - 2</label></td>
                      <td><label>Property Owner Name</label>
                        <input type="text" value="referenceOwnerName2" placeholder="Property Owner Name" class="" name="referenceOwnerName2" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Property Owner Contact No.</label>
                        <input type="text" value="referenceOwnercontact2" placeholder="Contact No" class="" name="referenceOwnercontact2" id="" /></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td><label>Job Completion Date</label>
                        <input type="text" value="referenceCompletionDate2" placeholder="Pick Date" class="" name="referenceCompletionDate2" id="" /></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><input type="button" id="expertiseSubmitId" style="margin:0;" value="Register Now" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
