<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".FileView").fancybox({helpers: { title : { type : 'float' }}});
		// $("#documentsHREFId").hide();
	  $.getJSON(contextPath+"/propertyDeveloper/loadAllProperty",
			    function(response, textStatus, jqXHR){
		       $('#propertyList').empty();
		  		var propertyList = $('#propertyList');
		  		if (response.success == true) {
		  			//$.each(response.data, function(property,viewAdminDocs ,address, files){
		            $.each(response.data, function(index,value){
		            //	propertyList.append($('<section/>').html(format(this.property,this.viewAdminDocs, this.address, this.files)));
                    propertyList.append($('<section/>').html(format(value.property,value.viewAdminDocs, value.address, value.files)));
		            	//if (typeof value.viewAdminDocs === "undefined") {	
		            	//}else
		            	//	$("#documentsHREFId").show();
		             });
		        }else{
		        	 $('#alertErrorId').show(200);
		    		 $("#errorMessageId").html("There is no property registered yet.");
		        }
		  		
			   }).fail(function(jqXHR, textStatus, errorThrown)	{
			 console.log(errorThrown);
		}); 
	  
	  
	function format(property, viewAdminDocs, address, fileList) {
			var html = '<section class="proj-box">';
					
					if(typeof fileList === "undefined"){
							html +=  '<img src="<%=request.getContextPath()%>/resource/images/contracter.jpg" width="595" height="347" />';
					}else{
						//html += '<img alt="Embedded Image" width="595" height="347" src="'+fPath+'" />';
						var fPath = contextPath + "/" + fileList[0];
						html += '<a class="FileView" rel="gallery1" href="'+fPath+'" >'
						+ '<img alt="Embedded Image" width="595" height="347" src="'+fPath+'" />';
		  				+ '</a>';
		  				html += imagesGalary(fileList);
		  				
					}
				
	          html += '<div class="proj-disc">' +
	            	'<h2>' + property.uniqueReference + '</h2>'   +
	            	'<div class="clearfix"></div>' +
	            	'<ul>' +
	              	'<li>Address </li>' +
	              	'<li>' + address.addressLine1 + '</li>' +
	              	'<li></li>' +
	              	'<li>Contact Person</li>' +
	              	'<li>' + property.contactPerson + '</li>' +
	              	'<li></li>' +
		            '<li>City</li>' +
					'<li>' + address.city  + '</li>' +
	              	'<li>PostCode</li>' +
	              	'<li>' + address.postCode  + '</li>' +
	              	/* '<li><a href = "property.htm?action=2&param=FETCH-PROPERTY-DETAIL&propertyId='+property.id+'">View</a></li>' + */
	              	/* '<li><input type="checkbox" style="float: left;" name="disable" id="disableId" value="disable" onclick="disableProperty('+property.id+')"> Disable</a> <a style="float: right;" href = #'+property.id+' onclick="fetchProperty('+property.id+')">View</a> </li>' + */
	              	'<li> ' +
	              	//' <div class="tooltop"> Click to Edit Property </div>' +
	              	'<a class="labelClass" style="float:left; " href = #'+property.id+' onclick="fetchPDProperty('+property.id+')">Edit Property</a> </li>' +
	              	'<li> <a class="labelClass" style="float:left;" href="#" onclick="viewConversation('+property.id+')">Conversation</a> </li>';// +
	              	
	              	if(viewAdminDocs == 'true' || viewAdminDocs == true){
	              		html += '<li> <a class="labelClass" style="float: left;" id="documentsHREFId" href="#" onclick="viewDocuments('+property.id+')">Documents</a> </li>';	
	              	}
	            /*   	"viewDocuments('+property.id+','+fileList+')" */
	              	
	              	html += '</ul>' +
	            	'</div>' +
	          		'<div class="clearfix"></div>' +
	          		/*'<div class="progress">' +
	          		 ' <div class="prog-cap sm-cp">Form Completion Status</div>'+
	           		'<section class="work work-n">'+
	            	'<div id="progressBar'+property.id+'" class="round-pink1" > <div></div></div>'+
	                '</section>'+
	            	'</div>'+ */
	          		'</section>';
    	          		
		    return html;
	}
	
	function imagesGalary(fileList){
		var html = '';
		fileList = fileList.slice(1, fileList.length);
			$.each(fileList, function(index, value){
				var fPath = contextPath + "/" + value;
				html += '<a class="FileView" rel="gallery1" href="'+fPath+'" >'
  					+ '</a>';
           	 });
		return html;
	}
	
	$('.close').click(function () {
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId').hide(200);
    }); 
  	
  	$('#alertSuccessId').hide(200);
	$('#alertErrorId').hide(200);
	
});
	
	
	function viewConversation(propertyId){
		
		 $.getJSON(contextPath+"/propertyDeveloper/loadPMCConversationByProperty.htm?PDId="+propertyId,
				    function(response, textStatus, jqXHR){	
			 if(response.success == true){
				 $('#charityHREFId').click();
				 window.location.href = contextPath + "/propertyDeveloper/redirectConversation.htm?PDId="+propertyId;
			 }else{
				 showErrorMessage("There is no Conversation Yet", '250px');
			 }
		 });
	}
	
	function viewDocuments(propertyId){
		var p = $("#documentsHREFId");
		var position = p.position();
		var topMargin = position.top ;
	/* 	$.ajax({
			url : contextPath + "/propertyDeveloper/viewAdminUploadedDocs.htm?propertyId="+propertyId,
		    type : post,
		    success : function(response){alert('ssssssssssssss');
		    	$("#containerId").html('There is error while submit');
		    }
		}); */
		  window.location.href = contextPath + "/propertyDeveloper/viewAdminUploadedDocs.htm?propertyId="+propertyId;
		  
		}
			
	
	
		function fetchPDProperty(propertyId){
			globalPropertyId = propertyId;
			$.get(contextPath + "/property.htm?action=600", function(response) {       // older methodology 
	    		 $("#containerId").html(response);

	    		  $.getJSON(contextPath + "/propertyDeveloper/fetchProperty.htm?propertyId="+propertyId , 
	    				  function(response, textStatus, jqXHR){
	 		  				if(response){
	 		  					var prop = response.data.property;
	 				  			var address = response.data.address;
	 				  			var flag = response.flag;
	 				  			
	 				  			$("#propId").val(propertyId);
	 		  					$("#contactPerson").val(prop.contactPerson);
	 							$("#addressLine1").val(address.addressLine1);
	 				 			$("#addressLine2").val(address.addressLine2);
	 				 			$("#cityId").val(address.city);
	 							$("#county").val(address.county);
	 				 			$("#postCode").val(address.postCode);
	 				 			$("#agentName").val(prop.agentName);
	 							$("#agentAddressLine").val(prop.agentAddressLine);
	 				 			$("#agentContactNumber").val(prop.agentContactNumber);
	 				 			
	 				 			$("#typeOfProposedPropID").val(prop.typeOfProposedProp);
	 				 			$("#noOfUnitsID").val(prop.noOfUnits);
	 				 			$("#energySavingFeaturesID").val(prop.energySavingFeatures);
	 							$("#estimatedStartDateID").val(prop.estimatedStartDate);
	 				 			$("#timeToCompleteScemeID").val(prop.timeToCompleteSceme);
	 				 			$("#descriptionID").val(prop.description);
	 				 			
	 				 			if(flag){
	 				 				$("#addressLine1").prop("readonly",true);
	 				 				$("#addressLine1").css("background-color","#E0E0E0");
	 				 				$("#cityId").show();
	 				 				$("#cityDropdown").hide();
	 				 				$("#cityId").prop("readonly",true);
	 				 				$("#cityId").css("background-color","#E0E0E0");
	 				 				$("#county").prop("readonly",true);
	 				 				$("#county").css("background-color","#E0E0E0");
	 				 				$("#postCode").prop("readonly",true);
	 				 				$("#postCode").css("background-color","#E0E0E0");
	 				 				
	 				 				$("#statusBarId").show();
	 				 				$("#savePropertyDetails").hide();
	 				 				$("#UpdatePDProperty").show();
	 				 				$("#savePDPropertyDetails").hide();
	 				 				
	 				 			}else{
	 				 				$("#cityDropdown").show();
	 				 				$("#cityId").hide();
	 				 				$("#savePropertyDetails").show();
	 				 			}
	 		  				}
	 			 		//	$("#electricalInstallation").val(obj.electricalInstallation.response);
	 				    }).fail(function(jqXHR, textStatus, errorThrown)
	 				{
	 				 console.log(errorThrown);
	 			});
	    	 });
		}	
	
 </script>
 <a style="float: left:;"></a>
    <div class="row">
      <div class="span10">
        <h1 class="heading4 margin-top15">Properties</h1>
        <div id="alertErrorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true"  id="errorMessageId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="clearfix"></div>
        <div id="propertyList"></div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
<div class="clearfix"></div>