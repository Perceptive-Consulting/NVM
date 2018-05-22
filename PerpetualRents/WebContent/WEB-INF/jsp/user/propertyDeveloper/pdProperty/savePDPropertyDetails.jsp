	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
	 <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloper.js"></script> 
	
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
	   	      		 
	   	      }
	   	 });
	  });
	  
	  new JsDatePick({
			useMode:2,
			target:"estimatedStartDateID",
			dateFormat:"%d-%M-%Y",
			limitToToday:true,
		 });
	  
	  $(function() {
		    $("#fPDPropertyDetails").validate({
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
      
        <form name="fPDPropertyDetails" id="fPDPropertyDetails">
          <h1 class="heading4 margin-top15">Property Details</h1>
          <div >
        <div class="PropertyForm new-form-stra">
            <span>    <label>Contact Person</label>
                <input type="hidden" id="propId">
                  <input type="text" placeholder="Contact Person"  class="" name="contactPerson" id="contactPerson" /></span>
              <span>  <label>Address Line 1</label>
                  <input type="text" placeholder="Enter your address" class="" name="addressObj.addressLine1" id="addressLine1" /></span>
             
              <span>  <label>Address Line 2</label>
                  <input type="text" placeholder="Enter your address" class="" name="addressObj.addressLine2" id="addressLine2" /></span>
                
            <span>    <label>City</label>
                <input type="text" value="" placeholder="Enter your city" class="required" readonly="readonly" name="addressObj.city" id="cityId" style="display: none; background-color: #E0E0E0" />
                  <select name="addressObj.city" id="cityDropdown" >
	              </select></span>
	          
              <span>  <label>County</label>
                  <input type="text" placeholder="Enter your County" class="" name="addressObj.county" id="county" />
              </span>
                  
            <span>    <label>Post Code</label>
                  <input type="text" placeholder="Enter your zip code" class="" name="addressObj.postCode" id="postCode" style="text-transform: uppercase;" /></span>
             
             
           <span>  <label> Type Of Proposed Development </label>
              <input type="text" name="typeOfProposedProp" placeholder="Property Type" value="" id="typeOfProposedPropID">
            </span>
            
           <span><label>Number Of Units </label>
              <input type="text" name="noOfUnits" placeholder="Number of Units" value="" id="noOfUnitsID">
           </span>
           
            <span>
            <label>Energy saving features</label>
              <input type="text" name="energySavingFeatures" placeholder="	Energy Saving Features" id="energySavingFeaturesID">
            </span>
            
             <span class="calenter-pick"><label>Estimated started date  </label>
              <input type="text" name="estimatedStartDate" placeholder="Estimated Start Date" id="estimatedStartDateID" readonly="readonly">
             </span>
           
             <span><label>Time to complete scheme</label>
              <input type="text" name="timeToCompleteSceme" placeholder="Time To Complete Sceme" id="timeToCompleteScemeID">
             </span>
             
             <span><label>Description  </label>
              <textarea name="description" placeholder="Additianal Description" id="descriptionID"></textarea>
             </span>
             
          </div>
          </div>
          <a href="redirectCompleteProperties.htm" class="backbtnnew">Back</a>
           <input type="button" id="UpdatePDProperty" class="regis-co" value="Update and Continue" style="display:none;">
          <input type="button" id="savePDPropertyDetails" class="regis-co" value="Submit and Continue">
        </form>
      </div>
    </div>
