<style>
label.error{
	color: #FF0000;
	float: right;
}
</style>
  <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
  <script>

  $(function() {
    $("#fUpdatePropertyDeveloper").validate({
        rules: {
            "firstName": "required",
            "lastName": "required",
            "primaryEmailId": {
                required: true,
                email: true
            },
	        "primaryPhoneNumber": {
	        	required: true,
	        	minlength: 10,
	        	maxlength : 15
	        },
	        "loginObj.username": {
	        	required: true,
	        	minlength: 3
	        },
	        "loginObj.password": {
	        	required: true,
	        	minlength: 3
	        },
	        "addressObj.addressLine1": "required",
	        "addressObj.postCode": "required",
	        "addressObj.county": "required",
	    }
    });

  });
  
  </script>
  
  <script type="text/javascript">
  var city = "";
  
	$(document).ready(function(){
		
		 $.getJSON(contextPath+"/register/loadCitiesForLandlord.htm", function(options) {
    	      var dropdown = $('#landlordCity');
    	      dropdown.empty();
    	      if (options) {
    	    	  var opts = options.data;
    	          $.each(opts, function(id, city) {
    	        	  dropdown.append($('<option/>').val(this.id).text(this.city));
    	          });
    	          setLandlordData();
    	      }
    	 });
		
	  $(document).ready(function(){
	    	
	    	    $("#userName").blur(function(){
	    	    	console.log(validateUser());
	    	    });
	    });
	  
 });
	
	function setLandlordData(){
		  $.getJSON(contextPath+"/propertyDeveloper/loadProfile.htm",
				    function(response, textStatus, jqXHR)  {
			  		var propertyDeveloper = response.data.propertyDeveloper;
	  					var address = response.data.address;
	  			
			  			$("#postcode").val(address.postCode);
			 			$("#firstName").val(propertyDeveloper.firstName);
			 			$("#lastName").val(propertyDeveloper.lastName);
			 			$("#primaryEmailId").val(propertyDeveloper.primaryEmailId);
			 			$("#secondaryEmailId").val(propertyDeveloper.secondaryEmailId);
			 			$("#primaryPhoneNumber").val(propertyDeveloper.primaryPhoneNumber);
			 			$("#secondaryPhoneNumber").val(propertyDeveloper.secondaryPhoneNumber);
			 			$("#addressLine1").val(address.addressLine1);
			 			$("#addressLine2").val(address.addressLine2);
			 			$("#landmark").val(address.landmark);
			 			$("#county").val(address.county);
			 			var globalCity = address.city;
			 			 $('select option:contains("'+globalCity+'")').attr('selected',true);
			 			
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			});
	}
 </script>
  
<div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15">Update Your Details</h1>
        <div class="rg-p">
          <form  name="fUpdatePropertyDeveloper" id="fUpdatePropertyDeveloper">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
            	<tr>
	              <td><label>First Name</label>
	                <input type="text" value="" placeholder="Enter your firstname" class="" name="firstName" id="firstName" /></td>
	              <td><label>Last Name</label>
	                 <input type="text" value="" placeholder="Enter your lastname" class="" name="lastName" id="lastName" /></td>
	            </tr>
	             <tr>
	             <td><label>Address Line1</label>
	            	 <input type="text" value=" " placeholder="Type your address line 1"  class="" name="addressObj.addressLine1" id="addressLine1" /></td>
	              <td><label>Address Line2</label>
	              	  <input type="text" value="" placeholder="Type your address line 1"  class="" name="addressObj.addressLine2" id="addressLine2" /></td>
	         	   </tr>
	             <tr>
	          		 <td>
	          			<label>Choose City</label>
	          			<select name="addressObj.city" id="landlordCity">
	                 
	                	</select></td>
	              <td><label>PostCode</label>
	                <input type="text" value="" placeholder="PostCode" class="" name="addressObj.postCode" id="postcode" style="text-transform: uppercase;"/></td>
	           	 </tr>
	            
	            <tr>
                <td><label>Land Mark(optional)</label>
            	 <input type="text" value="" placeholder="Any Landmark"  class="" name="addressObj.landmark" id="landmark" /></td>
              	 <td><label>County</label>
            	 <input type="text" value="" placeholder="Any County"  class="" name="addressObj.county" id="county" /></td>
              </tr>
	            
	            <tr>
	              <td><label>Primary Email Id</label>
	                <input type="text" value="" placeholder="Enter your email id" class="" name="primaryEmailId" id="primaryEmailId" readonly="readonly" style="background-color: #E0E0E0" /></td>
	              <td><label>Secondary Email Id</label>
	                <input type="text" value="" placeholder="Enter your email id" class="" name="secondaryEmailId" id="secondaryEmailId" /></td>
	            </tr>
	             <tr>
	              <td><label>Primary Contact Number</label>
	                <input type="text" value="" placeholder="primaryPhoneNumber" class="" name="primaryPhoneNumber" id="primaryPhoneNumber" /></td>
	              <td><label>Secondary Contact Number</label>
	                <input type="text" value="" placeholder="secondaryPhoneNumber" class="" name="secondaryPhoneNumber" id="secondaryPhoneNumber" /></td>
	            </tr>
              
              <tr>
                <td style="height: 80px;"><input type="button" id="propertyDeveloperUpdate" style="margin:30px 188px 0 0;" value="Update" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>