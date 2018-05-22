 <script type="text/javascript">
 $(document).ready(function(){
	  $.getJSON(contextPath+"/landlord/loadProfile.htm",
			    function(response, textStatus, jqXHR)
			    {
		  			var landlord = response.data.landlord;
		  			var address = response.data.address;
		  			var login = response.data.login;
		  			
		  			$("#welocomeName").html(landlord.firstName + " " + landlord.lastName);
		 			$("#name").html(landlord.firstName + " " + landlord.lastName);
		 			$("#primaryPhoneNumber").html(landlord.primaryPhoneNumber);
		 			$("#primaryEmailId").html(landlord.primaryEmailId);
		 			$("#secondaryPhoneNumber").html(landlord.secondaryPhoneNumber);
		 			$("#secondaryEmailId").html(landlord.secondaryEmailId);
		 			$("#addressLine1").html(address.addressLine1);
		 			$("#addressLine2").html(address.addressLine2);
		 			$("#city").html(address.city);
		 			$("#county").html(address.county);
		 			$("#postcode").html(address.postCode);
		 			$("#landmark").html(address.landmark);
		 			$("#country").html(address.countryName);
		 			$("#userName").html(login.username);
		 			$("#password").html(login.password);
			    }).fail(function(jqXHR, textStatus, errorThrown)
			{
			 console.log(errorThrown);
		}); 
	  
		$('.close').click(function () {
	  	    $('#alertSuccessId').hide(200);
	  	    $('#alertErrorId').hide(200);
	    }); 
	  	
	  	$('#alertSuccessId').hide(1000);
		$('#alertErrorId').hide(1000);
 });
	 
		 
 </script>
 
 <div class="row">
      <div class="span10">
        <h1 class="heading4 margin-top15">Welcome <span id="welocomeName"></span></h1>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="clearfix"></div>
        <div class="rgpinnew">
          <ul>
            <li><strong>Name</strong><samp>:</samp><span id="name"></span></li>
            <li><strong>Phone No.</strong><samp>:</samp><span id="primaryPhoneNumber"></span></li>
            <li><strong>Email Id</strong><samp>:</samp><span id="primaryEmailId"></span></li>
            <li><strong>Alternate Phone No.</strong><samp>:</samp><span id="secondaryPhoneNumber"></span></li>
            <li><strong>Alternate Email Id</strong><samp>:</samp><span id="secondaryEmailId"></span></li>
            <li><strong>Address Line1</strong><samp>:</samp><span id="addressLine1"></span></li>
            <li><strong>Address Line2</strong><samp>:</samp><span id="addressLine2"></span></li>
            <li><strong>City</strong><samp>:</samp><span id="city"></span></li>
            <li><strong>County</strong><samp>:</samp><span id="county"></span></li>
            <li><strong>PostCode</strong><samp>:</samp><span id="postcode"></span></li>
            <li><strong>LandMark</strong><samp>:</samp><span id="landmark"></span></li>
            <li><strong>User Name</strong><samp>:</samp><span id="userName"></span></li>
            <li><strong>Password</strong><samp>:</samp><span id="password"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
 </div>