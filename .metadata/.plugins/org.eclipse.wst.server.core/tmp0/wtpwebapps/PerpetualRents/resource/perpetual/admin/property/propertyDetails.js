  var propertyId; 
  var id ;
  $(document).ready(function(){
		  $("#disApprovePropertyId").click(function(){
			  $.getJSON(contextPath+"/admin/disapproveProperty.htm?propertyId="+propertyId,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disApprovePropertyId").hide();
				  				$("#approvePropertyId").show();
				  				$("#commonMessageSuccessId").html("Dis-Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  				addPropertyDetails(propertyId);
				  			}else{
				  				$("#commonMessageErrorId").html("Error while updating");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				}); 
		  });
		  
		  $("#approvePropertyId").click(function(){
			  $.getJSON(contextPath+"/admin/approveProperty.htm?propertyId="+propertyId,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disApprovePropertyId").show();
				  				$("#approvePropertyId").hide();
				  				addPropertyDetails(propertyId);
				  				$("#commonMessageSuccessId").html("Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  			}else{
				  				$("#commonMessageErrorId").html("Error while updating");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				}); 
		  });
		  $('#viewConversationId').click(function(){
			  $.ajax({
			      url: contextPath+"/admin/redirectPropertyConversation.htm",
			      type: "post",
			      success: function(data){
			    	  $.getJSON(contextPath+"/admin/loadContractorConversationByProperty.htm?propertyId="+propertyId,
							    function(response2, textStatus, jqXHR){
						 if(response2.success == true){
							 contractorFound = true;
							 $("#containerId").html(data);
							 $("#cChatLiId").show();

							 $.getJSON(contextPath+"/admin/loadPmcConversationByProperty.htm?propertyId="+globalPropertyId,
									    function(response3, textStatus, jqXHR){
								 if(response3.success == true){
									 $("#pmcChatliID").show();
								 }
							 });
						 
						 }else{
							 $.getJSON(contextPath+"/admin/loadPmcConversationByProperty.htm?propertyId="+globalPropertyId,
									    function(response4, textStatus, jqXHR){
								 if(response4.success == true){
									 $("#containerId").html(data);
									 $("#pmcChatliID").show();
									 $("#cChatLiId").hide();
									 $("#contractorChatliID").removeClass("selected");
									 $("#pmcChatliID").addClass("selected");
									 $('#pmcChatHREFId').click();
								 }else{
									 $("#commonMessageErrorId").html("There is no conversation Yet.");
										$("#commonMessageErrorId").fadeIn();
										setTimeout(function(){
											$("#commonMessageErrorId").fadeOut(4000);
										}, 4000);
								 }
							 });
						 }
					 });
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
			});
	  });
  
  function addPropertyDetails(id){
	 
	  if(id == '' || id == null || id == 'undefined' )
		  return;
	  
	  propertyId = id;
	  globalPropertyId = id;
	  $.getJSON(contextPath+"/admin/viewPropertyDetails.htm?propertyId="+propertyId,
			    function(response, textStatus, jqXHR){
			 			var propObj = response.data.propObj;
			  			var addressObj = response.data.addressObj;
			  			var landlordObj = response.data.landlord;
			  			var lAddObj = response.data.address;
			  			var htmlStr = '<div style="width: 25%; margin-top: 14px !important;" id="progressBar'+propObj.id+'" class="round-pink1" ><div></div></div>';
			  			//alert(htmlStr);
			  			  $("#statusId").html(htmlStr);
			  			  $("#contactPerson").html(propObj.contactPerson);
			  			  $("#address").html(addressObj.addressLine1 + " " + addressObj.addressLine2);
			  			  $("#city").html(addressObj.city);
			  			  $("#county").html(addressObj.county);
			  			  $("#postCode").html(addressObj.postCode);
			  			  
			  			  $("#createdOn").html(propObj.createdOn);
			  			  $("#createdBy").html(propObj.createdBy);
			  			  $("#modifiedOn").html(propObj.modifiedOn);
			  			  $("#modifiedBy").html(propObj.modifiedBy);
			  			  
			  			  $("#agentsName").html(propObj.agentName);
			  			  $("#agentsAddress").html(propObj.agentAddressLine);
			  			  $("#agentsPhoneNumber").html(propObj.agentContactNumber);
			  			  $("#status").html(propObj.statusStr);
			  			  if(propObj.statusStr == 'Approved'){
			  				  $("#disApprovePropertyId").show();
			  					$("#approvePropertyId").hide();
			  			  }else{
			  				  $("#approvePropertyId").show();
			  				  $("#disApprovePropertyId").hide();
			  			  }
			  			  
			  			  if(landlordObj){
			  				  $("#lName").html(landlordObj.firstName + " " + landlordObj.lastName);
				  			  $("#lReference").html(landlordObj.uniqueReference);
				  			  //var lAddObj = landlordObj.address;
				  			  if(lAddObj){
				  				 $("#lAddress").html(lAddObj.addressLine1 + " " + lAddObj.addressLine2);
					  			 $("#lPostCode").html(lAddObj.postCode);
					  			 $("#lCity").html(lAddObj.city);
					  			 $("#lCounty").html(lAddObj.county); 
				  			  }
				  			  
				  			  $("#lPrimaryPhoneNumber").html(landlordObj.primaryPhoneNumber);
				  			  $("#lSecondaryPhoneNumber").html(landlordObj.secondaryPhoneNumber);
				  			  $("#lPrimaryEmailId").html(landlordObj.primaryEmailId);
				  			  $("#lSecondaryEmailId").html(landlordObj.secondaryEmailId);
			  			  }
			  			  
			  			setProgress(propObj);
			    }).fail(function(jqXHR, textStatus, errorThrown)
			{
			 console.log(errorThrown);
		}); 
	  
  }
  
  function setProgress(propObj){
	  //alert(propObj.statusPercentage);
	      progressBar(propObj.statusPercentage, $('#progressBar'+propObj.id));
	}
  
  $('#buttonDetails1Id').click(function(){
		if(/* jObj!=null */true){
			var propId = $("#propertyId").text();
		$.ajax({
				url:contextPath+"/admin/viewADPL2.htm?id="+propertyId,
		  		method: "Post",														
				success:function(result){
					if(/* result.success==true */true){
						$("#containerId").html(result);
						add(propertyId);
					}
			  },
			  error:function(){
		          $("#containerId").html('There is error while submit');
		      }});
		}
	});
  
  $('#allPropertiesId').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/allProperty.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});
  
  
  $( "#BackButtonId" ).click(function() {
		var aData = table.row('.selected').data();
      if(aData!=null){
      $.ajax({
    		url:contextPath+"/admin/viewProperty.htm",
    		data: aData,
    		method: "Post",
    		contentType: "application/json",															
    		success:function(data){
    				$("#containerId").html(data);
    				addPropertyDetails(aData.id);
    	  },
    	  error: function(error){
				console.log(error);
				alert(error);
	  }});
      }
	
	});
  
  
  $('#uploadDocumentsId').click(function() {
		$("#containerId").html("<iframe id=\"uploadDocumentsFrame1\" style=\"height: 100%;position: absolute; width: 100%;\" frameborder=0 src=\'" + contextPath + "/admin/viewPropertyAdminUploadedDocuments.htm?propertyId=" + propertyId + "\'/>");
	});

  
  

 
