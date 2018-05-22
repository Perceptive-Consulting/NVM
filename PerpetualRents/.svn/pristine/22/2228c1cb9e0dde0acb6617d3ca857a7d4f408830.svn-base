var pdId;
pdProperty = new function() {

	this.Add = function(id) {
		if(!id)
			return;
		pdId = id;
		globalPropertyId = id;

		$.getJSON(
				contextPath + "/admin/viewPDPropertyDetails.htm?PDId=" + id,
				function(response, textStatus, jqXHR) {
					//alert(response.data);
					var propObj = response.data.propObj;
					var addressObj = response.data.addressObj;
					var propertyDeveloperObj = response.data.propertyDeveloper;
					
					
					//alert(propertyDeveloperObj.LoginObj.Username);
					
					$("#contactPerson").html(propObj.contactPerson);
					$("#address").html(
							addressObj.addressLine1 + " "
									+ addressObj.addressLine2);
					$("#city").html(addressObj.city);
					$("#county").html(addressObj.county);
					$("#postCode").html(addressObj.postCode);

					$("#createdOn").html(propObj.createdOn);
					$("#createdBy").html(propObj.createdBy);
					$("#modifiedOn").html(propObj.modifiedOn);
					$("#modifiedBy").html(propObj.modifiedBy);

					$("#status").html(propObj.statusStr);
					if (propObj.statusStr == 'Approved') {
						$("#disApprovePropertyId").show();
						$("#approvePropertyId").hide();
					} else {
						$("#approvePropertyId").show();
						$("#disApprovePropertyId").hide();
					}
					 
					if (propertyDeveloperObj) {
						//alert(propertyDeveloerObj.LoginObj().Username());
						$("#pdName").html(propertyDeveloperObj.firstName + " "+ propertyDeveloperObj.lastName);
						$("#pdReference").html(propertyDeveloperObj.uniqueReference);
						var pdAddObj = propertyDeveloperObj.address;
						var pdloginObj =propertyDeveloperObj.loginObj;
						//alert(pdloginObj.username);
						//alert(pdloginObj.password);
						if (pdAddObj) {
							$("#pdAddress").html(pdAddObj.addressLine1 + " " + pdAddObj.addressLine2);
							$("#pdPostCode").html(pdAddObj.postCode);
							$("#pdCity").html(pdAddObj.city);
							$("#pdCounty").html(pdAddObj.county);
						}
						$("#pdPrimaryPhoneNumber").html(
								propertyDeveloperObj.primaryPhoneNumber);
						$("#pdSecondaryPhoneNumber").html(
								propertyDeveloperObj.secondaryPhoneNumber);
						$("#pdPrimaryEmailId").html(propertyDeveloperObj.primaryEmailId);
						$("#pdSecondaryEmailId").html(
								propertyDeveloperObj.secondaryEmailId);
						$("#pdSecondaryEmailId").html(
								propertyDeveloperObj.secondaryEmailId);
						$("#pdSecondaryEmailId").html(
								propertyDeveloperObj.secondaryEmailId);
						$("#pdUserName").html(pdloginObj.username);
						$("#pdPassword").html(pdloginObj.password);
					}
					setProgress(propObj);
				}).fail(function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		});
	};
	this.loadPdDocuments = function(pdId) {
		 $.ajax({
		    	url:contextPath+"/admin/viewPDAdminUploadedDocuments.htm?pdId="+pdId,
		  		method: "Post",
		  		contentType: "application/json",															
		  		success:function(data){
						$("#containerId").html(data);
						$(".loader").css('display', 'none');	
					},
		  	  error: function(error){}
		    });
	}
};

$(document).ready(function() {
	
	$('#viewPDConversationId').click(function(){
		  $.ajax({
		      url: contextPath+"/admin/loadPmcConversationByPDProperty.htm?pdId="+pdId,
		      type: "post",
		      dataType:'json',
		      success: function(response){
		    	  if(response.success == true){
			    	  $.ajax({
					      url: contextPath+"/admin/redirectPDPropertyConversation.htm",
					      type: "post",
					      success: function(data){
					    	  $("#containerId").html(data);
					      },
					      error:function(){
					          $("#containerId").html('There is error while submit');
					      }
					  });
			      
		    	  }else{
		    		  $("#commonMessageErrorId").html("There is no conversation Yet.");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
		    	  }
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
		});
					$("#disApprovePropertyId").click(function() {
										$
												.getJSON(contextPath+ "/admin/disapprovePDProperty.htm?propertyId=" + pdId,
														function(response, textStatus, jqXHR) {
															if (response.success == true) {
																$(
																		"#disApprovePropertyId")
																		.hide();
																$(
																		"#approvePropertyId")
																		.show();
																$(
																		"#commonMessageSuccessId")
																		.html(
																				"Dis-Approved Successfully!");
																$(
																		"#commonMessageSuccessId")
																		.fadeIn();
																setTimeout(
																		function() {
																			$(
																					"#commonMessageSuccessId")
																					.fadeOut(
																							4000);
																		}, 4000);
																pdProperty.Add(pdId);
															} else {
																$(
																		"#commonMessageErrorId")
																		.html(
																				"Error while updating");
																$(
																		"#commonMessageErrorId")
																		.fadeIn();
																setTimeout(
																		function() {
																			$(
																					"#commonMessageErrorId")
																					.fadeOut(
																							4000);
																		}, 4000);
															}
														})
												.fail(
														function(jqXHR,
																textStatus,
																errorThrown) {
															console
																	.log(errorThrown);
														});
									});

					$("#approvePropertyId")
							.click(
									function() {
										$
												.getJSON(
														contextPath
																+ "/admin/approvePDProperty.htm?propertyId="
																+ pdId,
														function(response,
																textStatus,
																jqXHR) {
															if (response.success == true) {
																$(
																		"#disApprovePropertyId")
																		.show();
																$(
																		"#approvePropertyId")
																		.hide();
																pdProperty.Add(pdId);
																$(
																		"#commonMessageSuccessId")
																		.html(
																				"Approved Successfully!");
																$(
																		"#commonMessageSuccessId")
																		.fadeIn();
																setTimeout(
																		function() {
																			$(
																					"#commonMessageSuccessId")
																					.fadeOut(
																							4000);
																		}, 4000);
															} else {
																$(
																		"#commonMessageErrorId")
																		.html(
																				"Error while updating");
																$(
																		"#commonMessageErrorId")
																		.fadeIn();
																setTimeout(
																		function() {
																			$(
																					"#commonMessageErrorId")
																					.fadeOut(
																							4000);
																		}, 4000);
															}
														})
												.fail(
														function(jqXHR,
																textStatus,
																errorThrown) {
															console
																	.log(errorThrown);
														});
									});

				

$('#allPDPropertiesId').click(function() {
	$.ajax({
		url : contextPath + "/admin/allPDProperty.htm",
		type : "post",
		success : function(data) {
			$("#containerId").html(data);
		},
		error : function() {
			$("#containerId").html('There is error while submit');
		}
	});
});

/*function pdAdminUploadBackId(pdId){
	
	 $.ajax({
   		url:contextPath+"/admin/viewPropertyDeveloper.htm?pdId=" +pdId,
   		//data: table.row('.selected').data(),
   		method: "Post",
   		contentType: "application/json",															
   		success:function(data){
   		//	alert(data);
				$("#containerId").html(data);
				 pdProperty.Add(pdId);
			},
   	  error: function(error){}
     });
}*/

$('#viewDocumentsId').click(function() {
	$.ajax({
		url : contextPath + "/admin/viewPDDocuments.htm?pdId=" + pdId,
		method : "Post",
		success : function(result) {
			$("#containerId").html(result);
		},
		error : function() {
			$("#containerId").html('There is error while submit');
		}
	});
});

//SAHOO
/*$('#uploadDocumentsId').click(function() {
	window.location.href = contextPath+"/admin/viewPDAdminUploadedDocuments.htm?pdId=" + pdId;
});*/

$('#uploadDocumentsId').click(function() {
	$("#containerId").html("<iframe id=\"uploadDocumentsFrame1\" style=\"height: 100%;position: absolute; width: 100%;\" frameborder=0 src=\'" + contextPath + "/admin/viewPDAdminUploadedDocuments.htm?pdId=" + pdId + "\'/>");
});

/*$('#backToDetailsPage').click(function() {
	var pdId = $('#selectedPDIdForDocumentUplaod').val();
	$.ajax({
   		url:contextPath+"/admin/viewPropertyDeveloper.htm?pdId=" +pdId,
   		method: "Post",
   		contentType: "application/json",															
   		success:function(data){
   			$("#containerId").html(data);
		},
   	  	error: function(error){}
     });
});*/

/*============================================ admin upload document========================*/   






$( "#backFromDocumentViewId" ).click(function() {
	//alert(table.row('.selected').data())
    $.ajax({
    	url:contextPath+"/admin/viewPropertyDeveloper.htm",
  		data: table.row('.selected').data(),
  		method: "Post",
  		contentType: "application/json",															
  		success:function(data){
				$("#containerId").html(data);
				pdProperty.Add(pdId);
			},
  	  error: function(error){}
    });
 });


$("#downloadPropertyFormId").click(function(event){
	 window.location.href = contextPath+"/download/proposedPropertyPDF.htm?pdId="+pdId;
});

$("#viewPdPropertyMapId").click(function(event){
	var add;
	$.ajax({
		url:contextPath+"/admin/viewPdPropertyMap.htm?pdId="+pdId,
		method:"post",
		dataType:'json',
		success:function(data){
		var locAddress = data.address;
	     // alert('show map for :' + locAddress);
		
		$.ajax({
			type:'GET',
			url:"http://maps.google.com/maps/api/geocode/json?address="+locAddress+"&sensor=false",
			success: function(jsonData){
				var lat = jsonData.results[0].geometry.location.lat;
				var long = jsonData.results[0].geometry.location.lng;
				//var dataarr={'lat':lat,'long':long,'locAddress':locAddress};
				//var jsondata = JSON.stringify(dataarr)
				var srcFile = contextPath+"/resource/map/viewPdPropertyMap.html?address="+locAddress+"&lat="+lat+"&longs="+long+"&pdId="+pdId;
				//var srcFile = contextPath+"/resource/map/viewPdPropertyMap.html?address="+locAddress+"&lat="+lat+"&longs="+long+"&pdId="+pdId;
				
				/*$("#containerId").html('<div class="container" ></div>');
				$(".container").html('<iframe width="900px" height="500px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="'+srcFile+'"></iframe>');*/
				
				window.open(srcFile, '_blank', 'location=no,height=400,width=600,scrollbars=no,status=no');
		   },	
		   });
		}
	});
 });
});



//Remove Admin  Upload Documents 
 function removeDocument(docId) {
		$.ajax({
				beforeSend: function(){
					$(".loader").css('height', $(document).height());
					$(".loader").css('display', 'block');				    
				},
			    url:contextPath+"/admin/removeDocuments.htm?docId=" + docId + "&pdId=" +pdId,
		  		method: "Post",
		  		contentType: "application/json",															
		  		success:function(data){
						$("#containerId").html(data);
						$(".loader").css('display', 'none');	
					},
		  	  error: function(error){}
		    });
	 }
 
/* 
 $(".uploadFiles").click(function(){
		
	  var contaierId = $(this).attr('name');
	  var form = $(this).parent('form');  
	  var file = $(this).parent().children(":file").val(); 
	  alert('file : ' + file);
	  if(file == "" ){
		  alert('lebel ');
		 $(this).prev('label').html("Please select a file.").show(); return false;	 
	  }else{
		  $(this).prev('label').empty().hide();
		  
		   var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none"></iframe>'); 
		   $(this).parent().append(iframe);
        
        form.attr("action", form.attr('action')+'&pdId='+pdId);
		 //form.attr('action')+'&pdId='+pdId;
        form.attr("method", "post");
        form.attr("encoding", "multipart/form-data");
        form.attr("enctype", "multipart/form-data");
        form.attr("target", "postiframe");
        form.attr("file", $('#uploadADPL1File').val());
        form.submit();
        
        $(".loader").css('height', $(document).height());
    	$(".loader").css('display', 'block');	
        
		 //  $("#commonMessageErrorId").text('Please wait....').show();
        $("#postiframe").load(function () {
     	  
         if ($("#postiframe").contents().find('pre').length){
             var preresponse = $("#postiframe").contents().find('pre').text();
			} else{
				var preresponse = $("#postiframe").contents().find('body').text();
			}
         alert('preresponse ' + preresponse);
	        	var jsonvar =  JSON.stringify(eval("("+preresponse+")")); 
	        	var response = JSON.parse(jsonvar); 
	        	$(".loader").css('display', 'none');
	 			if(response.success == true || response.success == 'true'){
	 			    $("#"+contaierId).hide();
	 			   pdProperty.loadPdDocuments(pdId);
	 				$("#commonMessageErrorId").empty().hide();
					$("#commonMessageSuccessId").show();
				    $("#commonMessageSuccessId").fadeOut(4000);
	 			}
	 			else if(response.sizeError == false || response.sizeError == 'false'){
	 				$("#"+contaierId).show();
	 				pdProperty.loadPdDocuments(pdId);
	 				showErrorMessage("Max size is 5Mb", "55px");
	 			}
        });
	  }
});*/

