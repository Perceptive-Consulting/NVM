
var id ;
  $(document).ready(function(){
	  $("#disableId").click(function(){
		  $.getJSON(contextPath+"/admin/disablePMC.htm?pmcId="+id,
				    function(response, textStatus, jqXHR){
			  			if(response.success == true){
			  				$("#disableId").hide();
			  				$("#enableId").show();
			  				addSubPMCDetails(id);
			  				$("#commonMessageSuccessId").html("Successfully Disabled");
			  	    	    $("#commonMessageSuccessId").fadeIn();
			  				setTimeout(function(){
			  					$("#commonMessageSuccessId").fadeOut(4000);
			  				}, 4000);
			  			}
			  			else{
			  				$("#commonMessageErrorId").html("Error while disabling");
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			}); 
	  });
	  
	  $("#enableId").click(function(){
		  $.getJSON(contextPath+"/admin/enablePMC.htm?pmcId="+id,
				    function(response, textStatus, jqXHR){
			  			if(response.success == true){
			  				$("#disableId").show();
			  				$("#enableId").hide();
			  				addSubPMCDetails(id);
			  				$("#commonMessageSuccessId").html("Successfully Enabled");
			  	    	    $("#commonMessageSuccessId").fadeIn();
			  				setTimeout(function(){
			  					$("#commonMessageSuccessId").fadeOut(4000);
			  				}, 4000);
			  			}
			  			else{
			  				$("#commonMessageErrorId").html("Error while enabling");
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			}); 
	  });
	  
	  function readySubPMCCityChosen(){
		  var config = {
	              '.chosen-select-sub-pmc-city'  : {},
	              '.chosen-select-deselect'  : {allow_single_deselect:true},
	              '.chosen-select-no-single' : {disable_search_threshold:10},
	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
	              '.chosen-select-width'     : {width:"100%"}
	            };
	            for (var selector in config) {
	              $(selector).chosen(config[selector]);
	       }
	  }
	  
  });
  
  function addSubPMCDetails(pmcId){
	  id = pmcId;
	  $.getJSON(contextPath+"/admin/viewPMCDetails.htm?pmcId="+pmcId,
			    function(response, textStatus, jqXHR){
		  
		 			var pmcObj = response.data.pmc;
		  			var detailsObj = response.data.detailsObj;
		  			
		  			var addressObj = response.data.addressObj;
		  			var loginObj = response.data.loginObj;
		  			
		  			if(response.data.flag){
		  				//$("#createdById").hide();
		  				//$("#modifiedById").hide();
		  			}
		  			if(loginObj){
	  					if(loginObj.enabled == 'Enabled'){
	  						$("#enableId").hide();
	  						$("#disableId").show();
	  					}else{
	  						$("#enableId").show();
	  						$("#disableId").hide();
	  					}
	  				}
		  			$("#companyName").html(pmcObj.companyName);
		  			$("#authorisedPerson").html(pmcObj.authorisedPerson);
		  			$("#referenceNumber").html(pmcObj.uniqueReference);
		  			$("#webURL").html(pmcObj.weburl);
		  			$("#subPMCCitiesCovered").html(pmcObj.citiesCovered);
		  			
		  			var cityAllotedIdStr = null;
		  			$('#editSubPMCCity').val('Add City');
					if(pmcObj.cityCoveredId){
						cityAllotedIdStr = pmcObj.cityCoveredId;
						$('#editSubPMCCity').val('Edit');
					}
					  
					$("#subPMCCitiesCoveredIdStr").html(cityAllotedIdStr);
						  
					$("#editSubPMCCity").click(function(event){
						  $("#editSubPMCCityDiv").show();
						  loadSubPMCCities(pmcObj.id);
						  editSubPMCCities();
						  event.preventDefault();
						  event.stopImmediatePropagation();
					});
					  
					$("#subPMCCityCancelBtn").click(function(event){
						  $("#editSubPMCCityDiv").hide();
						  event.preventDefault();
						  event.stopImmediatePropagation();
					});
					
		  			$("#enabled").html(loginObj.enabled);
		  			$("#userName").html(loginObj.username);
		  			$("#password").html(loginObj.password);
		  			
		  			$("#createdOn").html(pmcObj.createdOn);
		  			$("#createdBy").html(pmcObj.createdBy);
		  			$("#modifiedOn").html(pmcObj.modifiedOn);
		  			$("#modifiedBy").html(pmcObj.modifiedBy);
		  			  
		  			$("#emailId").html(detailsObj.emailId);
		  			$("#phoneNumber").html(detailsObj.phoneNumber);
		 			
		  			$("#addressLine1").html(addressObj.addressLine1);
		  			$("#addressLine2").html(addressObj.addressLine2);
		  			$("#city").html(addressObj.city);
		  			$("#county").html(addressObj.county);
		  			$("#postCode").html(addressObj.postCode);
		  			$("#landmark").html(addressObj.landmark);
		  			  
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
  }  

  
  $('#subPMCDetailsBackBtn').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/subPMCTable.htm",
	      type: "post",
	      success: function(data){
	    	  $("#containerId").html(data);
	    	  setPMCUsers(globalSuperPMCId);
	      },
	      error:function(){
	          $("#containerId").html('There is error while submit');
	      }
	  });
	});
  
  $('#resetPassword').click(function(){
	  $.ajax({
	      url: contextPath+"/admin/changePMCPassword.htm?id="+id,
	      type: "post",
	      dataType: "json",
	      success: function(data){
	    	  if(data.success == true){
	    	  $("#password").html(data.password);
	    	  $("#commonMessageSuccessId").html("Password reset");
	    	  $("#commonMessageSuccessId").fadeIn();
				setTimeout(function(){
					$("#commonMessageSuccessId").fadeOut(4000);
				}, 4000);
	    	  }
	    	  else{
					$("#commonMessageErrorId").html("Error while reset");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
				}
	      },
	      error:function(){
	          alert("Error");
	      }
	  });
	});
 
/*----------------- load city---------------------------*/
  
  function loadSubPMCCities(pmcId){
	  
	  var citiesStr = $("#subPMCCitiesCoveredIdStr").html();
	  
	  var arr = citiesStr.split(",");
	  var cityArr = [];
	  $(arr).each(function(index , value) {
		  if(value)
			  cityArr.push(value);
	  });
	  
	  $.getJSON(contextPath+"/admin/listPMCCities.htm", function(options) {
	        if (options) {
		      	var opts = options.data;
		      	var htmlStr = '<option value=""></option>';
	            $.each(opts, function(index, cityObj) {
	            	htmlStr += formatDropDown(cityObj.id, cityObj.city);
	            });
	            $("#subPMCCityId").empty().html(htmlStr);
	            readySUBPMCCityChosen();
	        }
      });
	  
	  function formatDropDown(key, value){
		  	if(cityArr.contains(key))
		  		return '<option selected value="'+key+'">'+value+'</option>';

		  	return '<option value="'+key+'">'+value+'</option>';
	  }
	  
	  function readySUBPMCCityChosen(){
	 		 var config = {
	 			  '.chosen-select-sub-pmc-city'  : {},
	              '.chosen-select-deselect'  : {allow_single_deselect:true},
	              '.chosen-select-no-single' : {disable_search_threshold:10},
	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
	              '.chosen-select-width'     : {width:"100%"}
 	         };
 	         for (var selector in config) {
 	              $(selector).chosen(config[selector]);
 	         }
	 }
 }
  
  /*----------------- update on button city---------------------------*/
 function editSubPMCCities(){
	 
	 $("#subPMCCUpdateBtn").click(function(event){
		   var pmcCityStr = $("#subPMCCityId").val();
		   if(pmcCityStr == null || pmcCityStr == 'null'){
			   $("#subPMCCityLabel").show();
			   return false;
		   }
		   $.ajax({
			      url: contextPath+"/admin/updateCities.htm",
			      type: "post",
			      dataType : "json",
			      data: {citiesStr : pmcCityStr, id : id, extraParam : 'PMC'},
			      success: function(response){
			    	  if(response.success == true || response.success == 'true'){
			    		  addSubPMCDetails(id);
			    		  $("#editSubPMCCityDiv").hide();
			    		  $("#commonMessageSuccessId").html("Cities successfully updated !");
			  				$("#commonMessageSuccessId").fadeIn();
							setTimeout(function(){
								$("#commonMessageSuccessId").fadeOut(4000);
							}, 4000);
							cityUpdated = false;
			    	  }else{
			  				$("#commonMessageErrorId").html("Error while updating");
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
		    event.preventDefault();
			event.stopImmediatePropagation();
	   });
 }
 
 Array.prototype.contains = function ( needle ) {
	   
	   for (i in this) {
	       if (this[i] == needle) return true;
	   }
	   return false;
	};