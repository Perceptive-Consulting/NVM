<script>
$( "#submitLead" ).click(function() {
	console.log("-------------------------------------------");
	   var formData = form2object('registerLead', '.', true,
	  			function(node)
	  			{
	  				if (node.id && node.id.match(/callbackTest/))
	  				{
	  					return { name: node.id, value: node.innerHTML };
	  				}
	  			});
	  	var jObj = JSON.stringify(formData, null, '\t');
	  	if($("#registerLead").valid() == true){
	  	$.ajax({
	  		url:contextPath+"/register/registerLead.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$("#registerLead")[0].reset();
	  				$("#commonMessageSuccessId").html("Successful Creation");
					$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(4000);
					}, 1000);
	  			}
		    	  else{
						$("#commonMessageErrorId").html("Error while creation");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 1000);
					}
	  	  }});
	  	}
	  	else{
	  		$("#commonMessageErrorId").html("Please enter the valid details");
			$("#commonMessageErrorId").fadeIn();
			setTimeout(function(){
				$("#commonMessageErrorId").fadeOut(4000);
			}, 1000);
	  	}
	  });
	  
$(function() {
    $("#registerLead").validate({
    	rules: {
        	"name": "required",
        	"message": "required",
        	"address" : "required",
        	"email"  : {
        		required: true,
                email: true
        	},
        	"contactNumber" : {
                required: true,
                digits: true,
                minlength :10
        	},
        } ,
    	messages:{
    		"name": "",
        	"message": "",
        	"address" : "",
        	"email"  : {
        		required: "",
                email: ""
        	},
        	"contactNumber" : {
                required: "",
                digits: "",
                minlength :""
        	}, 
    	}
    });
  });
</script>
<section class="contaner-b">
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        <div class="nic-to-mit">Nice to meet you.</div>     
        <div class="nic">
        	<article><p>Praesent molestie turpis sed purus laoreet facilisis. In hac habitasse platea dictumst. Aliquam erat volutpat. Nullam ornare urna leo, quis eleifend erat dignissim sed. Phasellus quis neque lorem. Nulla facilisi. Sed justo ante, adipiscing eget eleifend ut, pharetra sed augue. </p></article>
        </div> 
        <div class="cont-map">
        <iframe width="425" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2399.094802295535!2d-2.1825391000000036!3d53.036633500000015!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487a4286027cf41f%3A0x87443854c264ec84!2sCraftsman+Works%2C+Sneyd+St%2C+Stoke-on-Trent+ST6+2NZ!5e0!3m2!1sen!2suk!4v1411632253162"></iframe>
         
        </div>
        <div class="addres-area">
        	<div class="add-head">Address</div>
            <address>
            Ashantidutch Property Letting<br />
            Unit 2 Craftsmans works <br />
            Sneyd Street <br />
            Sneydgreen <br />
            Stoke-on-Trent <br />
            Staffordshire <br />
            ST6 2NZ
            </address>
        	<div class="add-head">Phone Number</div>
            <address>
            Contact Number:  07801892817
            </address>
        	<div class="add-head">Email Id</div>
            <address>
            Web Address: info@ashantidutchpropertyletting.co.uk
            </address>
        </div>  
        <div class="enquery-area">
        <div id="commonMessageErrorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="commonMessageErrorId">You got an error!</h4>
        </div>
        <div id="commonMessageSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="commonMessageSuccessId"></h4>
        </div>
        <form id="registerLead" >
            <input type="text" class="fl" value="Name:" name="name" onblur="if(value=='') value = 'Name:'" onfocus="if(value=='Name:') value = ''"/>
            <input type="text" class="fr" value="Email ID:" name="email" onblur="if(value=='') value = 'Email ID:'" onfocus="if(value=='Email ID:') value = ''"/>
            <input type="text" class="fl" value="Contact Number:" name="contactNumber" onblur="if(value=='') value = 'Contact Number:'" onfocus="if(value=='Contact Number:') value = ''"/>
            <input type="text" class="fr" value="Address:" name="address" onblur="if(value=='') value = 'Address:'" onfocus="if(value=='Address:') value = ''"/>
            <textarea name="message" placeholder="Message.."></textarea>
            <input type="button" value="Submit" id="submitLead"/>
            </form>
        </div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
  </div>
</section>