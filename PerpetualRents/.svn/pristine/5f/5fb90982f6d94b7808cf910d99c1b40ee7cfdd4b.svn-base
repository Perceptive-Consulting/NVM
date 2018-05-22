
$(document).ready(function(){
  $("#regLandlord").click(function(){
	  $.ajax({
	      url: contextPath+"/register/redirectLandlordRegisteration.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
  });
  
  $("#regLandlordhref").click(function(){
	  $.ajax({
		  url: contextPath+"/register/redirectLandlordRegisteration.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
  });
  
  $("#landlordSubmitId").click(function(event){
	  if($("#registerLandlordId").valid() == true){
	  var formData = form2object('registerLandlordId', '.', true,function(node) {
            if (node.id && node.id.match(/callbackTest/))
                 return { name: node.id, value: node.innerHTML };
                
        });
	  
	  console.log(postData);
	  
	  var postData = JSON.stringify(formData, null, '\t');
		$.ajax({
		    url : contextPath+"/register/createLandlord.htm",
		    type: "POST",
		    data : postData,
		    dataType : "json",
		    contentType: 'application/json',
		    success:function(response, textStatus, jqXHR){	
		    	if(response.success == true || response.success == 'true'){
		    		 $.get(contextPath+"/landlord/success.htm", function(data) {
			    		 $("#containerId").html(data);
			    	 });
		    	}else{
		    		console.log('response.message : ' + response.message);
		    		$("#commonMessageErrorId").show();
		    		$("#commonMessageErrorId").html(response.message);
		    		setTimeout(function(){
		    			$("#commonMessageErrorId").fadeOut(4000);
		    		}, 1000);
		    	}
		    }
		});
		event.stopImmediatePropagation();
	  }
	 
  });
  
  $("#landlordUpdate").click(function(event){
	  if($("#fUpdateLandlord").valid() == true){
	  event.preventDefault();	  
	  var formData = form2object('fUpdateLandlord', '.', true,function(node)
	          {
	                if (node.id && node.id.match(/callbackTest/))
	                {
	                        return { name: node.id, value: node.innerHTML };
	                }
	        });
	  var postData = JSON.stringify(formData, null, '\t');
		$.ajax({
		    url : contextPath+"/landlord/updateProfile.htm",
		    type: "POST",
		    data : postData,
		    dataType : "json",
		    contentType: 'application/json',
		    success:function(data, textStatus, jqXHR) 
		    {
		    	 if(data.success == true){
			    	   $.get(contextPath+"/landlord/redirectLandlordProfile.htm", function(data) {
				    		 $("#containerId").html(data);
				    		 $('#alertSuccessId').show(200);
				    		 $("#successMessageId").html("Your Profile has been successfully updated.");
				    		 setTimeout(function() {   
				    			 $('#alertSuccessId').hide(100);
				    		 }, 2500);
				    	 });
			      }
		    },
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        alert("fail");  
		    }
		});
		event.stopImmediatePropagation();
		 //STOP default action
	  }
	  
  });
  
  $("#updatePassword").click(function(event){
	  var postData = JSON.stringify($('#fChangePassword').serializeObject());
	  event.preventDefault();
		$.ajax(
		{
		    url : contextPath+"/landlord/updatePassword.htm",
		    type: "POST",
		    data : postData,
		    dataType : "json",
		    contentType: 'application/json',
		    success:function(response, textStatus, jqXHR) 
		    {	
		    	$('#alertSuccessId').hide();
		    	 $('#alertSuccessId').hide();
		    	 $('#alertErrorId').hide();
		    	if(response.success == true){
		    		 $.get(contextPath+"/landlord/redirectLandlordProfile.htm", function(data) {
			    		 $("#containerId").html(data);
			    		 $('#alertSuccessId').show(200);
			    		 $("#successMessageId").html("Your Profile has been successfully updated.");
			    		 setTimeout(function() {   
			    			 $('#alertSuccessId').hide(100);
			    		 }, 2500);
			    	 });
		    		 $('#fChangePassword').trigger("reset");
		    	}else{
		    		 $('#alertErrorId').show(200);
		    		 $("#errorMessageId").html(response.message);
		    		 $('#fChangePassword').trigger("reset");
		    	}
		    },
		    error: function(jqXHR, textStatus, errorThrown) 
		    {
		        alert("fail");  
		    }
		});
		event.stopImmediatePropagation();
  });
  
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
	

// ---------------------- Common Function -----------------------

	//----------- Page Redirection Only --------------
	$("#landlordProfile").click(function(){
	  $.ajax({
	      url: contextPath+"/landlord/redirectLandlordProfile.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});

	$("#editLandlord").click(function(){
	  $.ajax({
	      url: contextPath+"/landlord/redirectEditProfile.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});

	$("#changeLandlordPassword").click(function(){
	  $.ajax({
	      url: contextPath+"/landlord/redirectEditPassword.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});
	
	$("#myProperty").click(function(){
		  $.ajax({
		      url: contextPath+"/landlord/redirectProperties.htm",
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


