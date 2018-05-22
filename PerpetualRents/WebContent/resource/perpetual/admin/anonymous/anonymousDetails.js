  var id ;
  $(document).ready(function(){
		  $("#disapproveContractor").click(function(){
			  $.getJSON(contextPath +"/admin/disapproveContractor.htm?contractorId="+id,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disapproveContractor").hide();
				  				$("#approveContractor").show();
				  				$("#commonMessageSuccessId").html("Dis-Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  				addContractorDetails(id);
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
		  
		  $("#approveContractor").click(function(){
			  $.getJSON(contextPath+"/admin/approveContractor.htm?contractorId="+id,
					    function(response, textStatus, jqXHR){
				  			if(response.success == true){
				  				$("#disapproveContractor").show();
				  				$("#approveContractor").hide();
				  				$("#commonMessageSuccessId").html("Approved Successfully!");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  				addContractorDetails(id);
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
	  });
  
  function addLeadDetails(leadId){
	  id = leadId;
	  $.getJSON(contextPath+"/admin/viewLeadDetails.htm?leadId="+id,
			    function(response, textStatus, jqXHR){
		  
		  		var leadObj = response.data;
				  $("#name").html(leadObj.name);
				  $("#address").html(leadObj.address);
				  $("#email").html(leadObj.email);
				  $("#contactNumber").html(leadObj.contactNumber);
				  $("#message").html(leadObj.message);
	  });
  }
  
  $('#allLeads').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/allLeads.htm",
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
	      url: contextPath+"/admin/changeContractorPassword.htm?id="+id,
	      type: "post",
	      dataType: "json",
	      success: function(data){
	    	  if(data.success == true){
	    	  $("#password").html(data.password);
	    	  $("#commonMessageSuccessId").html("Password Successfully Reset");
	    	  $("#commonMessageSuccessId").fadeIn();
				setTimeout(function(){
					$("#commonMessageSuccessId").fadeOut(4000);
				}, 4000);
	    	  }
	    	  else{
					$("#commonMessageErrorId").html("Password could not be reset");
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