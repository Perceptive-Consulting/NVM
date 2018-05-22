
pdProperty = new function() {

	this.Add = function(id) {
		pdId = id;

		$.getJSON(
				contextPath + "/pmc/viewPDPropertyDetailsInPMC.htm?PDId=" + id,
				function(response, textStatus, jqXHR) {
					var propObj = response.data.propObj;
					var addressObj = response.data.addressObj;
					var propertyDeveloperObj = response.data.propertyDeveloper;
					var convObj = response.data.convObj;
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
					
					if (propertyDeveloperObj) {
						$("#pdName").html(propertyDeveloperObj.firstName + " "+ propertyDeveloperObj.lastName);
						$("#pdReference").html(propertyDeveloperObj.uniqueReference);
						var pdAddObj = propertyDeveloperObj.address;
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
					}
					if(convObj){
						$("#startPDConversation").hide();
						$("#viewPDConversation").show();
					}else{
						$("#viewPDConversation").hide();
						$("#startPDConversation").show();
					}
					
				}).fail(function(jqXHR, textStatus, errorThrown) {
			console.log(errorThrown);
		});
	};
};

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

$( "#backFromPMCDocumentViewId" ).click(function() {
    $.ajax({
    	url:contextPath+"/pmc/viewPropertyDeveloper.htm",
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

	$("#back2AllPDPropertiesId").click(function(){
		$(".remodal-overlay:hidden").remove();
		  $.ajax({
		      url: contextPath+"/pmc/redirectProposedDevelopment.htm",
		      type: "post",
		      success: function(data){
		    	  $("#containerId").html(data);
		    	
		      },
		      error:function(){
		          $("#containerId").html('There is error while submit');
		      }
		  });
	
	});
$(document).ready(function() {

$('#viewDocumentsByPmcId').click(function() {
	$.ajax({
		url : contextPath + "/pmc/viewPDDocuments.htm?pdId=" + pdId,
		method : "Post",
		success : function(result) {
			$("#containerId").html(result);
		},
		error : function() {
			$("#containerId").html('There is error while submit');
		}
	});
  });

});


