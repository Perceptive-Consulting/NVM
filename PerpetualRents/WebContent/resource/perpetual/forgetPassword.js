

 
$(document).ready(function(){

$("#submitemailId").click(function(){
	var emailId=document.getElementById("emailId").value;
	
	$.ajax({
		
		  url:"forgetPasswordEmailId.htm?emaildID="+emailId,
		  type: "post",
	      dataType : "json",
		  contentType: 'application/json',
		 
		  success:function(response){
			  if(response.success == true || response.success == 'true') {
				  alert(response.message);
				 
				  
				  return;
			  }
			  else
				  {
				  alert(response.message);
				  if(response.redirectURL)
					  window.location.href = response.redirectURL;
				  }
			
		  },
	      error:function(){
	    	  alert("Enter Valid Email Id");	
	      }
		});	
	  });

});