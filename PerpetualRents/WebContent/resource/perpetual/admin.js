
$(document).ready(function(){
	contextPath = getContextPath();
	$("#landlord").click(function(){
		$("#headingId").html("LandLord");
		$(".remodal-overlay:hidden").remove();
		//alert("Clicked");
		  $.ajax({
		      url: contextPath+"/admin/landlordTable.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	
	$("#contractor").click(function(){
		$("#headingId").html("Contractor");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/contractorTable.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#property").click(function(){
		$("#headingId").html("Property");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/propertyTable.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#users").click(function(){
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
	
	$("#pmc").click(function(){
		$("#headingId").html("Property Management Company");
		//$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/pmcTable.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#allJobs").click(function(){
		$("#headingId").html("All Assigned Jobs");
		//$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/allJobsTable.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#profile").click(function(){
		$("#headingId").html("My Profile");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/profile.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		    	  addAdminDetails();
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	$("#settings").click(function(){
		$("#headingId").html("Settings");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/admin/settings.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#anonymous").click(function(){
		$("#headingId").html("Contacts");
		$(".remodal-overlay:hidden").remove();
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
	
	/*$("#uploadFiles").click(function(){
		$("#headingId").html("");
		$(".remodal-overlay:hidden").remove();
		alert('hi');
		  $.ajax({
		      url: contextPath+"/admin/uploadNewFile.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});*/
	
	$("#uploadFiles").click(function(){
		$("#headingId").html("Upload Attachment Files");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({              
		      url: contextPath+"/admin/uploadNewFile.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	
	$("#proposedDevelopment").click(function(){
		$("#headingId").html("Proposed Property ");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({              
		      url: contextPath+"/admin/proposedDevelopment.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
});
