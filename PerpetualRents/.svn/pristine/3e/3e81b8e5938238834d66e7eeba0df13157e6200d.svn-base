  function add(data){
	  
	  $("#name").html(data.firstName+" "+data.lastName);
	  $("#userName").html(data.loginObj.username);
	  $("#password").html(data.loginObj.password);
	  $("#propertyCount").html(data.propertyCount);
	  $("#address").html(data.addressObj.addressLine1 + " " +data.addressObj.addressLine2);
	  $("#zipCode").html(data.addressObj.postCode);
	  $("#city").html(data.addressObj.city);
	  $("#county").html(data.addressObj.county);
	  $("#phone").html(data.primaryPhoneNumber);
	  $("#otherPhone").html(data.secondaryPhoneNumber);
	  $("#email").html(data.primaryEmailId);
	  $("#reference").html(data.uniqueReference);
	  
	  $("#createdOn").html(data.createdOn);
	  $("#createdBy").html(data.createdBy);
	  $("#modifiedOn").html(data.modifiedOn);
	  $("#modifiedBy").html(data.modifiedBy);
  }
  
  $('#allLandLordsId').click(function(){
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