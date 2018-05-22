<style>
label.error{
	color: #FF0000;
	float: right;
}
</style>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>
   <script type="text/javascript">
	$(document).ready(function(){
	  $.getJSON(contextPath+"/contractor/loadProfile.htm",
			    function(response, textStatus, jqXHR)
			    {
				  var conObj = response.data.contractor;
				  var addObj = response.data.address;
				  var detailsObj = response.data.contactDetails;
					$("#contactPerson").val(conObj.contactPerson);
					$("#companyName").val(conObj.companyName);
					$("#phoneNumber").val(detailsObj.phoneNumber);
					$("#emailId").val(detailsObj.emailId);
					$("#postCode").val(addObj.postCode);
					$("#city").val(addObj.city);
					$("#county").val(addObj.county);
					$("#vatNo").val(conObj.vatNo);
		 			$("#weburl").val(conObj.weburl);
					$("#addressLine1").val(addObj.addressLine1);
		 			
			    }).fail(function(jqXHR, textStatus, errorThrown)
			{
			 console.log(errorThrown);
		}); 
 });
	 
	$(function() {
	    $("#fUpdateContractor").validate({
	        rules: {
	        	"contactPerson": "required",
	        	"companyName": "required",
	        	"vatNo": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required",
	        	"addressObj.county" : "required"
	        }
	    });
	  });	 
 </script>
   
    <div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15">Edit Contractor</h1>
        <div class="rg-p">
          <form name="fUpdateContractor" id="fUpdateContractor">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis">
              <tr>
                <td><label>Name of the Contractor</label>
                  <input type="text" placeholder="Enter your name" class="" name="contactPerson" id="contactPerson" /></td>
                <td><label>Company Name</label>
                  <input type="text" value="Contractor Company Name" placeholder="Enter the field" class="" name="companyName" id="companyName"/></td>
              </tr>
              <tr>
                <td><label>Contact Number</label>
                  <input type="text" placeholder="Contact Number" class="" name="contactDetailsObj.phoneNumber" id="phoneNumber" /></td>
                <td><label>EmailId</label>
                <input type="text" placeholder="Enter your email id" class="" name="contactDetailsObj.emailId" id="emailId" readonly="readonly" style="background-color: #E0E0E0" />
                  </td>
              </tr>
              <tr>
                <td><label>Vat Number</label>
                  <input type="text" placeholder="Vat No." class="" name="vatNo" id="vatNo" /></td>
                <td><label>Web Site Link</label>
                <input type="text" placeholder="Enter Web Site" class="" name="weburl" id="weburl" />
                  </td>
              </tr>
              
              <tr>
              <td><label>Address</label>
                  <input type="text" placeholder="Type your address" class="" name="addressObj.addressLine1" id="addressLine1" /></td>
                  <td><label>City</label>
                <input type="text" placeholder="Enter city name" class="" name="addressObj.city" id="city" />
                  </td>
              </tr>
               <tr>
                <td><label>County</label>
                  <input type="text" placeholder="Enter your County" class="" name="addressObj.county" id="county" /></td>
                <td><label>Post Code</label>
                  <input type="text" placeholder="Post Code" class="" name="addressObj.postCode" id="postCode" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><input type="submit" id="contractorUpdate" style="margin:0;" value="Update" /></td>
              </tr>
            </table>
          </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
