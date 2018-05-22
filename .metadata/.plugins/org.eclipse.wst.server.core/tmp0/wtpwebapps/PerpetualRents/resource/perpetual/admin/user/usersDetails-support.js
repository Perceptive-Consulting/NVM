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
			      url: contextPath+"/admin/usersTable.htm",
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
	  
	  $('#userCityCancelBtn').click(function(){
		  $('#editUserCityDiv').hide();
	  });
	  
  });
  
  function addUserDetails(id){
	  globalid = id;
	  $.getJSON(contextPath+"/admin/viewAdminDetails.htm?userId="+id,
		  function(response, textStatus, jqXHR){
		  
		  		//var loginObj = response.data.loginObj;
		  		var addressObj = response.data.addressObj;
		  		var adminObj = response.data.adminObj;
		  		var detailsObj = response.data.detailsObj;
		  		var loginObj = response.data.loginObj;
		  		
			  $("#firstName").html(adminObj.firstName);
			  $("#lastName").html(adminObj.lastName);
			  $("#citiesAlloted").html(adminObj.citiesAlloted);
			  
			  var cityAllotedIdStr = "null";
			  if(adminObj.cityAllotedId){
				  cityAllotedIdStr = adminObj.cityAllotedId;
				  $('#editUserCity').val('Edit');
			  }else
				  $('#editUserCity').val('Add City');
			  
			  $("#userCityAllotedIdStr").html(cityAllotedIdStr);
				  
			  $("#editUserCity").click(function(event){
				  $("#editUserCityDiv").show();
				  loadUserCities();
				  editUserCities();
			  event.preventDefault();
			  event.stopImmediatePropagation();
		  });
			  
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

  function loadUserCities(){
	  
	  	   var citiesStr = $("#userCityAllotedIdStr").html();
	  
		   var arr = citiesStr.split(",");
		   var cityArr = [];
		   $(arr).each(function( index , value) {
			   cityArr.push(value);
		   });
		   
		   $.getJSON(contextPath+"/admin/adminCityList.htm", function(options) {
		        if (options) {
		      	  var opts = options.data;
		      	var htmlStr = '<option value=""></option>';
		            $.each(opts, function(key, value) {
		          	  htmlStr += formatDropDown(this.id, this.city);
		            });
		            $("#userCityId").empty().html(htmlStr);
		            readyUserCityChosen();
	        	}
	        });
			
		   function formatDropDown(key, value){
				  var htmlStr = "";
				  	if(cityArr.contains(key)){
				  		htmlStr = '<option selected value="'+key+'">'+value+'</option>';
				  	}else{
				  		htmlStr = '<option value="'+key+'">'+value+'</option>';
				  	}
			      return htmlStr;
				}
		   
		   function readyUserCityChosen(){
		 		 var config = {
		 	              '.chosen-select-user-city'  : {},
		 	              '.chosen-select-deselect'  : {allow_single_deselect:true},
		 	              '.chosen-select-no-single' : {disable_search_threshold:10},
		 	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
		 	              '.chosen-select-width'     : {width:"100%"}
		 	            };
		 	            for (var selector in config) {
		 	              $(selector).chosen(config[selector]);
		 	              
		 	          }
		 		}
		   
	   	}
  
  function editUserCities(){
	   
	   $("#userCityUpdateBtn").click(function(event){
		   var citiesStr = $("#userCityId").val();
		   console.log()
		   if(citiesStr == null || citiesStr == 'null'){
			   $("#cityLabel").show();
			   return false;
		   }
		   $.ajax({
			      url: contextPath+"/admin/updateCities.htm",
			      type: "post",
			      dataType : "json",
			      data: {citiesStr : citiesStr, id : globalid, extraParam : 'Admin'},
			      success: function(response){
			    	  if(response.success == true || response.success == 'true'){
			    		  addUserDetails(globalid);
			    		  $("#editUserCityDiv").hide();
			    		  $("#commonMessageSuccessId").html("Cities successfully updated !");
			  				$("#commonMessageSuccessId").fadeIn();
							setTimeout(function(){
								$("#commonMessageSuccessId").fadeOut(4000);
							}, 4000);
							cityUpdated = false;
			    	  }else{
			  				$("#commonMessageErrorId").html("Error while updating");
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);
			    	  }
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		    event.preventDefault();
			event.stopImmediatePropagation();
	   });
  }
  
  Array.prototype.contains = function ( needle ) {
	   
	   for (i in this) {
	       if (this[i] == needle) return true;
	   }
	   return false;
	};
 