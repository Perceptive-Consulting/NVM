   <link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
  <style>
  
	label.error{
		color: #FF0000;
		float: right;
	}
	
</style> 
  <script type="text/javascript">
	  $(document).ready(function(){
	  	 $.getJSON(contextPath+"/register/loadLandlordCities.htm", function(options) {
	   	      var dropdown = $('#cityDropdown');
	   	      if (options) {
	   	    	  var opts = options.data;
	   	    	      dropdown.append($('<option/>').val('').text('Select City'));
	   	          $.each(opts, function(id, city) {
	   	        	  dropdown.append($('<option/>').val(this.id).text(this.city));
	   	          });
	   	      		 $(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');
		   	       setTimeout(function() {
		   	    		 setPropertyStatus();
		   	 		 }, 500);
	   	      }
	   	 });
	  });
	  
	  function setPropertyStatus(){
		  if(globalPropertyId){
			    $.getJSON(contextPath+"/property/propertyStatus.htm?propertyId="+globalPropertyId,
					    function(response, textStatus, jqXHR){
			    		$(".loader").css('display', 'none');
			  				if(response){
			  					var obj = response.status;
			  					progressBar(obj, $('#progressBar'));
			  					if(obj == 100){
			  						$("#submitProperty").show();
			  					}
			  				}
					    }).fail(function(jqXHR, textStatus, errorThrown)
					{
					 console.log(errorThrown);
				});
		}else{
			$.getJSON(contextPath+"/property/propertyStatus.htm",
			    function(response, textStatus, jqXHR){
					$(".loader").css('display', 'none');
	  				if(response){
	  					var obj = response.status;
	  					progressBar(obj, $('#progressBar'));								
	  				}
			    });
	}
	  }
	  
	  $(function() {
		    $("#fPropertyDetails").validate({
		        rules: {
		        	"contactPerson": "required",
		        	"addressObj.addressLine1" : "required",
		        	"addressObj.city" : "required",
		        	"addressObj.county" : "required",
		        	"addressObj.postCode" : "required",
    	        	/* "addressObj.city": {
    	                required: {
    	                    depends: function(element) {
    	                       if(element.value == 0){
    	                    	   $("#cityErrorId").show();
    	                    	   return false;
    	                       }
    	                    	
    	                    }
    	                }
    	            } */
    	        	
		        },
		    messages: {
		    	"addressObj.city": {
		         required: "Please Select City.",
		        },
		       }
		    });
		  });
	  
	</script>

    <div class="row">
      <div class="span10">
        <form name="fPropertyDetails" id="fPropertyDetails">
          <h1 class="heading3 margin-top15">Property Details</h1>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
              <tr>
                <td><label>Contact Person</label>
                <input type="hidden" value="" id="propId">
                  <input type="text" placeholder="Contact Person"  class="" name="contactPerson" id="contactPerson" /></td>
                <td><label>Address Line 1</label>
                  <input type="text" placeholder="Enter your address" class="" name="addressObj.addressLine1" id="addressLine1" /></td>
              </tr>
              <tr>
                <td><label>Address Line 2</label>
                  <input type="text" placeholder="Enter your address" class="" name="addressObj.addressLine2" id="addressLine2" /></td>
                <td><label>City</label>
                <input type="text" value="" placeholder="Enter your city" class="required" readonly="readonly" name="addressObj.city" id="cityId" style="display: none; background-color: #E0E0E0" />
                  <select name="addressObj.city" id="cityDropdown" >
	              </select>
	            </td>
              </tr>
              <tr>
                  <td><label>County</label>
                  <input type="text" placeholder="Enter your County" class="" name="addressObj.county" id="county" />
                  </td>
                <td><label>Post Code</label>
                  <input type="text" placeholder="Enter your zip code" class="" name="addressObj.postCode" id="postCode" style="text-transform: uppercase;" /></td>
              </tr>
            </table>
          </div>
          <div class="form-mg"></div>
          <h1 class="heading3 margin-top15">Agents Details (If Applicable)</h1>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
              <tr>
                <td><label>Agents Name</label>
                  <input type="text" placeholder="Enter your agents name" class="" name="agentName" id="agentName" /></td>
                <td><label>Agents Address</label>
                  <input type="text" placeholder="Enter your agents address" class="" name="agentAddressLine" id="agentAddressLine" /></td>
              </tr>
              <tr>
                <td><label>Agents Phone No.</label>
                  <input type="text" placeholder="Enter your agents contact no." class="" name="agentContactNumber" id="agentContactNumber" /></td>
                <td>&nbsp;</td>
              </tr>
            </table>
          </div>
          <div class="form-mg"></div>
          <h1 style="display: none;" id="statusHeadingId" class="heading3 margin-top15">Status</h1>
         
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr id="statusBarId" style="display: none;">
                <td style="width: 92%"> <div id="progressBar" class="round-pink" ><div></div></div></td>
                <td style=" width: 8%">
                	 <input style="margin:-5px -3px -23px 0 !important; float: right!important; padding: 8px 18px;" type="button" id="updatePropertyDetails" class="regis-co" value="Edit" >
        		</td>
              </tr>
            </table>
          
           <div class="form-mg"></div>
           <input type="button" id="submitProperty" class="regis-co" value="Submit and Review" style="display:none;">
          <input type="button" id="savePropertyDetails" class="regis-co" value="Submit and Continue">
        </form>
      </div>
    </div>
