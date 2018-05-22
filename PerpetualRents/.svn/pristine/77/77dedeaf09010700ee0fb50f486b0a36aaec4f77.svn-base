$(document).ready(function(){
	
	$("#aboutUsId").click(function(){
		$("#homeliId").removeClass("active");
		$("#contactUsliId").removeClass("active");
		$("#aboutUsliId").addClass("active");
		  $.ajax({
		      url: contextPath+"/register/aboutUs.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#contactUsId").click(function(){
		$("#homeliId").removeClass("active");
		$("#aboutUsliId").removeClass("active");
		$("#contactUsliId").addClass("active");
		  $.ajax({
			  url: contextPath+"/register/contactUs.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	});
	
	$("#homeId").click(function(){
		$("#contactUsliId").removeClass("active");
		$("#aboutUsliId").removeClass("active");
		$("#homeliId").addClass("active");
	});
	
	$("#cookiesImgId").click(function(){
		 $("#cookiesDivisionId").slideUp(500);
	});
	
	$("#cookiesAgreeId").click(function(){
		 $("#cookiesDivisionId").slideUp(500);
	});
	
	$("#readCookiesId").click(function(){
		  $.ajax({
		      url: contextPath+"/register/cookies.htm",
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