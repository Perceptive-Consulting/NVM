  <script type="text/javascript">
  	$('.close').click(function () {
  	    $('#alertSuccessId').hide(200);
  	  	$('#alertErrorId').hide(200);
    }); 
  </script>
<div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15">Edit Password</h1>
        <div id="alertErrorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorMessageId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="rg-p">
          <form  name="fChangePassword" id="fChangePassword">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
	            <tr>
	              <td><label>Current Password</label>
	                <input type="password" value="" placeholder="Enter current password" class="" name="currentPassword" id="currentPassword" /></td>
	            </tr>
	            <tr>
	              <td><label>New Password</label>
	                <input type="password" value="" placeholder="Enter new Passowrd" class="" name="newPassword" id="newPassword" /></td>
	            </tr>
	             <tr>
	              <td><label>Confirm Password</label>
	                <input type="password" value="" placeholder="Confirm Password" class="" name="confirmPassword" id="confirmPassword" /></td>
	            </tr>
              <tr>
              <td><input type="button" id="updatePassword" style="margin:0;" value="Update Password" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>