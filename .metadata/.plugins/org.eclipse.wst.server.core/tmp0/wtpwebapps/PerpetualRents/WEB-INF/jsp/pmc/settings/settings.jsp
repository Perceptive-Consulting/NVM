 
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
    <div class="button">
    	<button id="updatePMC">Edit</button>
    	<button id="updateCredentials">Update Credentials</button>
    </div>
    <div class="rg-p innew">
          <ul>
            <li><strong>Authorized Person</strong><samp>:</samp><span id="authorisedPerson"></span></li>
            <li><strong>Company Name</strong><samp>:</samp><span id="companyName"></span></li>
            <li><strong>Reference</strong><samp>:</samp><span id="reference"></span></li>
            <li><strong>Username</strong><samp>:</samp><span id="username"></span></li>   
            <li><strong>Password</strong><samp>:</samp><span id="password"></span></li>
            <li><strong>Web Url</strong><samp>:</samp><span id="weburl"></span></li>
            <li><strong>Address Line 1</strong><samp>:</samp><span id="addressLine1"></span></li>
            <li><strong>Address Line 2</strong><samp>:</samp><span id="addressLine2"></span></li>
            <li><strong>City</strong><samp>:</samp><span id="city"></span></li>
            <li><strong>County</strong><samp>:</samp><span id="county"></span></li>
            <li><strong>Post Code</strong><samp>:</samp><span id="postcode"></span></li>
            <li><strong>Email Id</strong><samp>:</samp><span id="emailId"></span></li>
            <li><strong>Phone Number</strong><samp>:</samp><span id="phoneNumber"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div>    
  </section>
  <div style="display:none;">
  <div id='edit'>
    <form id="editPopupFormId" action="javascript:editPopupForm()">
      <h1>Edit PMC Details</h1>
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"><label>Authorized Person:</label></td>
            <td width="60%"><input type="text" value="" class="" name="authorisedPerson" id="authorised_Person"/></td>
          </tr>
          <tr style="display: none;">
            <td width="60%"><input type="hidden" value="" class="" name="companyName" id="company_Name"/></td>
          </tr>         
          <tr>
            <td><label>Email Id:</label></td>
            <td><input type="text" value="" class="" name="contactDetailsObj.emailId" id="email_Id" readonly="readonly" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td><label>Web Url:</label></td>
            <td><input type="text" value="" class="" name="weburl" id="web_url"/></td>
          </tr>
          <tr>
            <td><label>Address Line 1:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine1" id="address_Line1"/></td>
          </tr>
          <tr>
            <td><label>Address Line 2:</label></td>
            <td><input type="text" value="" class="" name="addressObj.addressLine2" id="address_Line2"/></td>
          </tr>
          <tr>
            <td><label>City:</label></td>
            <td><input type="text" value="" class="" name="addressObj.city" id="address_city"/></td>
          </tr>
          <tr>
            <td><label>County:</label></td>
            <td><input type="text" value="" class="" name="addressObj.county" id="address_county"/></td>
          </tr>
          <tr>
            <td><label>Post Code:</label></td>
            <td><input type="text" value="" class="" name="addressObj.postCode" id="address_postCode"/></td>
          </tr>
          <tr>
            <td><label>Phone Number:</label></td>
            <td><input type="text" value="" class="" name="contactDetailsObj.phoneNumber" id="address_phoneNumber"/></td>
          </tr>
        </table>
      </div>
      <div id="edit_footer"><input type="submit" value="Update" /></div>
    </form>
  </div>
  <div class="form-class" id='updateCredentialsDiv'>
    <form id="fChangePassword">
      <h1>Edit Credentials</h1>
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><label>Current Password:</label></td>
            <td><input type="password" value="" class="" name="currentPassword" id="currentPassword" /></td>
          </tr>
          <tr>
            <td><label>New Password:</label></td>
            <td><input type="password" value="" class="" name="newPassword" id="newPassword" /></td>
          </tr>
          <tr>
            <td><label>Confirm Password:</label></td>
            <td><input type="password" value="" class="" name="confirmPassword" id="confirmPassword" /></td>
          </tr>
        </table>
      </div>
      <div id="create_footer"><input type="button" value="Update" id="updateCredentialsBtn" /></div>
    </form>
  </div>
  </div>
  </div>
  <script>
  
  var id ;
  $(document).ready(function(){  
		  $( "#updatePMC" ).click(function() {
			  validateAOP("#editPopupFormId");
					  $("#authorised_Person").val($("#authorisedPerson").text());
					  $("#company_Name").val($("#companyName").text());
					  $("#web_url").val($("#weburl").text());
					  $("#email_Id").val($("#emailId").text());
					  $("#address_Line1").val($("#addressLine1").text());
					  $("#address_Line2").val($("#addressLine2").text());
					  $("#address_city").val($("#city").text());
					  $("#address_county").val($("#county").text());
					  $("#address_postCode").val($("#postcode").text());
					  $("#address_phoneNumber").val($("#phoneNumber").text());
			  });
		  
			    $("#updatePMC").colorbox({width:"580px", inline:true, href:"#edit"});
			    $( "#updateCredentials" ).click(function() {
		    	 	validateAOP("#fChangePassword");
		    	 	 $("#user_name").val($("#username").text());
		          $("#updateCredentials").colorbox({width:"580px", inline:true, href:"#updateCredentialsDiv"});
		     });
			    
			    $("#updateCredentialsBtn").click(function(event){
				  	  var postData = JSON.stringify($('#fChangePassword').serializeObject());
				  	  event.preventDefault();
				  		$.ajax({
				  		    url : contextPath+"/pmc/updatePassword.htm",
				  		    type: "POST",
				  		    data : postData,
				  		    dataType : "json",
				  		    contentType: 'application/json',
				  		    success:function(response, textStatus, jqXHR){	
				  		    	if(response.success == true){
				  		    		$.colorbox.close();
				  		    		addPMCDetails();
					  				$("#commonMessageSuccessId").html("Successfully Updated");
					  				$("#commonMessageSuccessId").fadeIn();
									setTimeout(function(){
										$("#commonMessageSuccessId").fadeOut(4000);
									}, 2000);
				  		    	}else{
				  		    		$("#commonMessageErrorId").html(response.message);
									$("#commonMessageErrorId").fadeIn();
									setTimeout(function(){
										$("#commonMessageErrorId").fadeOut(4000);
										}, 2000);
				  		    		 
				  		    	}
				  		    },
				  		    error: function(jqXHR, textStatus, errorThrown){
				  		        alert("fail");  
				  		    }
				  		});
				  		event.stopImmediatePropagation();
				    });
	  });
  
  function addPMCDetails(){
	  $.getJSON(contextPath+"/pmc/viewProfile.htm",
			    function(response, textStatus, jqXHR){
		  		var loginObj = response.data.loginObj;
		  		var addressObj = response.data.addressObj;
		  		var charityObj = response.data.charityObj;
		  		var detailsObj = response.data.detailsObj;
		  	if(charityObj != null){	
			  $("#authorisedPerson").html(charityObj.authorisedPerson);
			  $("#companyName").html(charityObj.companyName);
			  $("#reference").html(charityObj.uniqueReference);
			  $("#weburl").html(charityObj.weburl);
		  	}
		  	if(loginObj != null){	
				  $("#username").html(loginObj.username);
				  $("#password").html(loginObj.password);
			  	}
		  	if(addressObj != null){	
				  $("#addressLine1").html(addressObj.addressLine1);
				  $("#addressLine2").html(addressObj.addressLine2);
				  $("#city").html(addressObj.city);
				  $("#county").html(addressObj.county);
				  $("#postcode").html(addressObj.postCode);
			  	}
		  	if(detailsObj != null){	
				  $("#emailId").html(detailsObj.emailId);
				  $("#phoneNumber").html(detailsObj.phoneNumber);
			  	}
		  	id = charityObj.id;
	  });
  }
  $(function() {
	    $("#editPopupFormId").validate({
	    	rules: {
	        	"authorisedPerson": "required",
	        	"companyName": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.postCode"  : "required",
	        	"detailsObj.phoneNumber": "required"
	        }
	    });
	  });
  function editPopupForm(){
	  if($("#editPopupFormId").valid() == true){
	  	var formData = form2object('editPopupFormId', '.', true,
	  			function(node){
	  				if (node.id && node.id.match(/callbackTest/)){
	  					return { name: node.id, value: node.innerHTML };
	  				}
	  			});
	  	formData.id = id;
	  	var jObj = JSON.stringify(formData, null, '\t');																				
	  	$.ajax({
	  		
	  		url:contextPath+"/pmc/updatePMCUser.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$.colorbox.close();
	  				addPMCDetails();
	  				$("#commonMessageSuccessId").html("Successfully updated");
	  				$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(4000);
					}, 2000);
	  			}
	  			else{
		    		  $.colorbox.close();
						table.ajax.reload();
						$("#commonMessageErrorId").html("Error while updating");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 2000);
					}
	  	  }});
	  }
	  }
  function validateAOP(formId){
	  $(formId)[0].reset();
	  var validator = $(formId).validate();
	  validator.resetForm();
	  $("label.error").remove();
	  $(".error").removeClass();
}
  
// ---------------------- Common Function -----------------------
  
  $.fn.serializeObject = function()
  {
      var o = {};
      var a = this.serializeArray();
      $.each(a, function() {
          if (o[this.name] !== undefined) {
              if (!o[this.name].push) {
                  o[this.name] = [o[this.name]];
              }
              o[this.name].push(this.value || '');
          } else {
              o[this.name] = this.value || '';
          }
      });
      return o;
  	};
  </script>