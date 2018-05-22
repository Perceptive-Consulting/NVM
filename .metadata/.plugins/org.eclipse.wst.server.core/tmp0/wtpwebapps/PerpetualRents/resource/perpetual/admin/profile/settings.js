  var id ;
  $(document).ready(function(){  
		  $( "#updateAdmin" ).click(function() {
			  validateAOP("#editPopupFormId");
					  $("#first_Name").val($("#firstName").text());
					  $("#last_Name").val($("#lastName").text());
					  $("#enabless").val($("#enable").text());
					  $("#address_Line1").val($("#addressLine1").text());
					  $("#address_Line2").val($("#addressLine2").text());
					  $("#address_city").val($("#city").text());
					  $("#address_county").val($("#county").text());
					  $("#address_postCode").val($("#postcode").text());
					  $("#address_phoneNumber").val($("#phoneNumber").text());
					  $("#email_Id").val($("#emailId").text());
			  });
		  		
			    $("#updateAdmin").colorbox({width:"580px", inline:true, href:"#edit"});
			    $( "#updateCredentials" ).click(function() {
			    	 	validateAOP("#fChangePassword");
			    	 	 $("#user_name").val($("#username").text());
			          $("#updateCredentials").colorbox({width:"580px", inline:true, href:"#updateCredentialsDiv"});
			     });
			    
			    $("#updateCredentialsBtn").click(function(event){
			  	  var postData = JSON.stringify($('#fChangePassword').serializeObject());
			  	  event.preventDefault();
			  		$.ajax({
			  		    url : contextPath+"/admin/updatePassword.htm",
			  		    type: "POST",
			  		    data : postData,
			  		    dataType : "json",
			  		    contentType: 'application/json',
			  		    success:function(response, textStatus, jqXHR){	
			  		    	if(response.success == true){
			  		    		$.colorbox.close();
				  				addAdminDetails();
				  				$("#commonMessageSuccessId").html("Successfully Updated");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
			  		    	}else{
			  		    		$("#commonMessageErrorId").html(response.message);
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
									}, 4000);
			  		    		 
			  		    	}
			  		    },
			  		    error: function(jqXHR, textStatus, errorThrown){
			  		        alert("fail");  
			  		    }
			  		});
			  		event.stopImmediatePropagation();
			    });
	  });
  
  function addAdminDetails(){
	  $.getJSON(contextPath+"/admin/adminSettings.htm",
			    function(response, textStatus, jqXHR){
		  		var loginObj = response.data.loginObj;
		  		var addressObj = response.data.addressObj;
		  		var adminObj = response.data.adminObj;
		  		var detailsObj = response.data.detailsObj;
		  	if(adminObj != null){	
			  $("#firstName").html(adminObj.firstName);
			  $("#lastName").html(adminObj.lastName);
			  $("#reference").html(adminObj.uniqueReference);
			  $("#cities").html(adminObj.citiesAlloted);
			  $("#enable").html(adminObj.enable);
			  if(adminObj.userLoginId == 1){
				  $("#citiesallotedliId").hide();
				  $("#emailIdTr").show();
			  }else{
				  $("#emailIdTr").hide();
				  $("#userNameTrId").hide();
			  }
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
		  	id = adminObj.id;
	  });
  }
  $(function() {
	    $("#editPopupFormId").validate({
	    	rules: {
	        	"firstName": "required",
	        	"companyName": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.postCode"  : "required",
	        	"addressObj.city"  : "required",
	        	"contactDetailsObj.phoneNumber": {
	        		required: true,
	        		minlength: 10,
	        		maxlength: 15
	        		
	        	},
			    "contactDetailsObj.emailId": {
			    	required: true,
	                email: true
		    		
		    	}
	        }
	    });
	  });
  
  function editPopupForm(){
	  if($("#editPopupFormId").valid() == true){
	  	var formData = form2object('editPopupFormId', '.', true,
	  			function(node)
	  			{
	  				if (node.id && node.id.match(/callbackTest/))
	  				{
	  					return { name: node.id, value: node.innerHTML };
	  				}
	  			});
	  	formData.id = id;
	  	var jObj = JSON.stringify(formData, null, '\t');
	  	$.ajax({
	  		url:contextPath+"/admin/updateAdmin.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$.colorbox.close();
	  				addAdminDetails();
	  				$("#commonMessageSuccessId").html("Successfully Updated");
	  				$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(4000);
					}, 4000);
	  			}else {
						$("#commonMessageErrorId").html("Error while updating");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
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