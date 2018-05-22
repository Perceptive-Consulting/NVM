  var globalid ;
  $(document).ready(function(){
	  $("#enableAdminButtonId").click(function(){
		  $.getJSON(contextPath+"/admin/enableAdmin.htm?adminId="+globalid,
				    function(response, textStatus, jqXHR){
			  			if(response.success == true){
			  				$("#disableAdminButtonId").show();
			  				$("#enableAdminButtonId").hide();
			  				$("#commonMessageSuccessId").html("User successfully enabled");
				    		  $("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
			  				addUserDetails(globalid);
			  			}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{$("#commonMessageErrorId").html("Error while enabling");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
				 console.log(errorThrown);
			}); 
	  });
	  
	  
	  $('#disableAdminButtonId').click(function(){
				$.ajax({
				      url: contextPath+"/admin/disableAdmin.htm?adminId="+globalid,
				      type: "post",
				      contentType: "application/json",
				      dataType: "json",
				      success: function(data){
				    	  var status = data.success;
				    	  if(status == true){
				    		  $("#disableAdminButtonId").hide();
				  			  $("#enableAdminButtonId").show();
				    		  //$.colorbox.close();
				    		  addUserDetails(globalid);
				    		  $("#commonMessageSuccessId").html("User successfully disabled");
				    		  $("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				    	  }
				    	  else{
				    		  $("#commonMessageErrorId").html("Error while disabling");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				    	  }
				      },
				      error:function(){
				    	  $("errorId").show();
				      }
				  });
			
		});
	  
	  $("#allUsersId").click(function(){
			$("#headingId").html("Users");
			$(".remodal-overlay:hidden").remove();
			  $.ajax({
			      url: contextPath+"/admin/adminUsers.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
	  
	  $('#resetPassword').click(function(){
		  $.ajax({
		      url: contextPath+"/admin/changeAdminPassword.htm?id="+globalid,
		      type: "post",
		      dataType: "json",
		      success: function(data){
		    	  $("#password").html(data.password);
		    	  if(data.success == true){
		    	  $("#commonMessageSuccessId").html("Password reset");
	    		  $("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(4000);
					}, 4000);
		    	  }else{
		    		  $("#commonMessageErrorId").html("Error while reset");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
		    	  }
		      },
		      error:function(){
		          alert("Error");
		      }
		  });
		});
  });
  
  function addUserDetails(id){
	  globalid = id;
	  $.getJSON(contextPath+"/admin/viewAdmin.htm?userId="+id,
			    function(response, textStatus, jqXHR){
		  
		  		//var loginObj = response.data.loginObj;
		  		var addressObj = response.data.addressObj;
		  		var adminObj = response.data.adminObj;
		  		var detailsObj = response.data.detailsObj;
		  		var loginObj = response.data.loginObj;
		  		
			  $("#firstName").html(adminObj.firstName);
			  $("#lastName").html(adminObj.lastName);
			  $("#citiesAlloted").html(adminObj.citiesAlloted);
			  $("#enable").html(loginObj.enabled);
			  $("#userName").html(loginObj.username);
			  $("#password").html(loginObj.password);
			  $("#referenceNumber").html(adminObj.uniqueReference);
			  $("#modifiedOn").html(adminObj.modifiedOn);
			  $("#createdOn").html(adminObj.createdOn);
			  $("#modifiedBy").html(adminObj.modifiedBy);
			  $("#createdBy").html(adminObj.createdBy);
			  if(addressObj){
				  $("#address").html(addressObj.addressLine1 + " " + addressObj.addressLine2);
				  	$("#city").html(addressObj.city);
				  	$("#postCode").html(addressObj.postCode);
				  	$("#county").html(addressObj.county);
				  	$("#landmark").html(addressObj.landmark);
			  }
			  if(detailsObj){
				  $("#emailId").html(detailsObj.emailId);
				  $("#phoneNumber").html(detailsObj.phoneNumber);
			  }
			  if(loginObj.enabled == 'Enabled'){
				  $("#enableAdminButtonId").hide();
				  $("#disableAdminButtonId").show();
			  }
			  else if(loginObj.enabled == 'Disabled'){
				  $("#disableAdminButtonId").hide();
				  $("#enableAdminButtonId").show();
			  }
	  });
  }