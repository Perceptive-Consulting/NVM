
$(document).ready(function(){
	$("#property").click(function(){
		$("#headingId").html("Property");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectProperty.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#settings").click(function(){
		$("#headingId").html("Setting");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectPMCSettings.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		    	  addPMCDetails();
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#pmc_users").click(function(){
		$("#headingId").html("PMC-USERS");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectPMCUsers.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		    	
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#conversation").click(function(){
		$("#headingId").html("CONVERSATION");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectConversation.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		    	  addPMCDetails();
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#proposedDevelopment").click(function(){

		$("#headingId").html("Proposed Property Development");
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectProposedDevelopment.htm",
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
