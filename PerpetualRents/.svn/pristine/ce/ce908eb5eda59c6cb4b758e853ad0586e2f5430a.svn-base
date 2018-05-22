
$(document).ready(function () {
	
		 setContractorData();
		 
		 $("#contactInfoBtn").click(function(){
			 var phoneNumber = $("#phoneNumber").val();
			  $.ajax({
			      url: contextPath+"/contractor/updatecontactInfo.htm",
			      type: "post",
			      data: {fieldName : 'phoneNumber', value : phoneNumber},
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		  var p = $("#contactInfoDivision").offset().top;
						  var topMargin = p - 40;
						  showContractorSuccessMessage("Successfully Updated.!", topMargin);
			    		  $("#contactInfoDivision").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		 
		 $("#tradingCommencementDateBtn").click(function(){
			 var tradingCommencementDate = $("#tradingCommencementDate").val();
			  $.ajax({
			      url: contextPath+"/contractor/update.htm",
			      type: "post",
			      data: {fieldName : 'tradingCommencementDate', value : tradingCommencementDate},
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		  $("#tradingCommencementDateDivision").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		 
		 $("#companyRegisterationDateBtn").click(function(){
			 var companyRegisterationDate = $("#companyRegisterationDate").val();
			  $.ajax({
			      url: contextPath+"/contractor/update.htm",
			      type: "post",
			      data: {fieldName : 'companyRegisterationDate', value : companyRegisterationDate},
			      dataType : "json",
			      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			      success: function(response){
			    	  if(response.success == true){
			    		  $("#companyRegisterationDateDivision").fadeOut();
			    		  setContractorData();
			    	  }
			      }
			  });
			});
		 
		 $("#generalInfoBtn").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep2.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 
		 $("#generalInfo").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectProfileView.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep2").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep2.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep3").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep3.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 $("#contractorProfileStep4").click(function(){
			  $.ajax({
			      url: contextPath+"/contractor/redirectContractorProfileStep4.htm",
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		});
		 
		 validate();		 
	});

	function updateData(fieldNameString){
		var fieldNameArray = fieldNameString.split(",");
		var fieldData = [];
		var delim = "";
		var divisionId = $.trim(fieldNameArray[0])+"Division";
		$.each(fieldNameArray, function( index, value ) {
			var radioValue = jQuery("input:radio[name="+value+"]:checked").val();
			if(typeof radioValue === "undefined"){
				var valueId = "#"+$.trim(value);
				 radioValue = $(valueId).val();
			}
			fieldData.push(radioValue);
		 });
		$.ajax({
		      url: contextPath+"/contractor/update.htm",
		      type: "post",
		      data: {page : 'page1', fieldName : fieldNameArray, value : fieldData},
		      dataType : "json",
		      contentType : "application/x-www-form-urlencoded; charset=UTF-8",    // to use request.getParameter()
		      success: function(response){
		    	  if(response.success == true){
		    		  var p = $("#"+divisionId).offset().top;
					  var topMargin = p - 40;
					  showContractorSuccessMessage("Successfully Updated.!", topMargin);
		    		  $("#"+divisionId).fadeOut();
		    		  setContractorData();
		    	  }
		      }
		  })
		}
	
	function formatDropDown(key, value){
		var htmlStr = '<option value="'+key+'">'+value+'</option>';
        return htmlStr;
	}
	
	function setContractorData(){
		$.getJSON(contextPath+"/contractor/loadContractorInfo.htm", function(response) {
	  	      if (response.data) {
	  	    	  var dataObj = response.data;
	  	    	  var conObj = response.data.contractor;
	  	    	  var contactObj = response.data.contactDetails;
	  	    	  var loginObj = response.data.tLoginObj;
	  	    	  var turnoverArr = response.data.turnover;
		  	    	  $("#companyName").val(conObj.companyName);
		  	    	  $("#companyNameStr").html(conObj.companyName);
		  	    	  
		  	    	  $("#businessNature").val(conObj.businessNature);
		  	    	  $("#businessNatureStr").html(conObj.businessNature);
		  	    	 
		  	    	  if(contactObj){
		  	    		  $("#emailIdStr").html(contactObj.emailId);
			  	    	  $("#phoneNumberStr").html(contactObj.phoneNumber);
			  	    	
			  	          $("#phoneNumber").val(contactObj.phoneNumber);
		  	    	  }
		  	    	if(loginObj){
		  	    			
		  	    		  $("#usernameStr").html(loginObj.username);
			  	    	  $("#passwordStr").html(loginObj.password);
			  	    	
			  	    	  $("#passwordId").val(loginObj.id);
			  	          $("#password").val(loginObj.password);
		  	    	  }
		  	    	  
		  	    	 $("#tradingCommencementDateStr").html(conObj.tradingCommencementDate);
		  	    	 $("#companyRegisterationDateStr").html(conObj.companyRegisterationDate);
		  	    	 
		  	    	 
		  	    	var htmlStr = '<li>Financial Year</li><li>TurnOver</li>';
		  	          $.each(turnoverArr, function(key, value) {
		  	        	  htmlStr += formatTurnoverDetail(value);
		  	          });
		  	        $("#turnOverDetails").empty().html(htmlStr);
		  	          
		  	        $("#vatNoStr").html(conObj.vatNo);
		  	        $("#vatNo").val(conObj.vatNo);
		  	        
		  	        $("#functionalityStr").html(dataObj.functionalityStr);
		  	        $("#citiesStr").html(dataObj.cityStr);
	  	      }
	  	  });
	}
	
	function formatTurnoverDetail(obj){
		var htmlStr = '<li>'+obj.financialYear+'</li><li>'+obj.turnOver+'</li>'
		
		return htmlStr;
	}
	
	function showContractorSuccessMessage(message, topMargininPx){
		 $("#contractorFormMsg").css("top", topMargininPx);
		 $("#contractorFormMsg").html(message);
		 $("#contractorFormMsg").show();
		 setTimeout(function(){
			 $("#contractorFormMsg").fadeOut(4000);
		 }, 1000);
	}
	
	function validate() {
	    $("#fContractorgeneralInformationId").validate({
	        rules: {
	            "companyName": "required",
	            "businessNature": "required",
	            "contactDetailsObj.emailId": {
	                required: true,
	                email: true
	            },
	            "contactDetailsObj.phoneNumber": {
	                required: true,
	                maxlength: 15,
	                minlength: 10
	            },
		        "loginObj.username": {
		        	required: true,
		        	minlength: 3
		        },
		        "loginObj.password": {
		        	required: true,
		        	minlength: 3
		        },
	        "tradingCommencementDate" : "required",
	        "companyRegisterationDate" : "required",
	        "turnoverDetails[0].financialYear" : "required",
	        "turnoverDetails[0].turnOver" : "required",
	        "turnoverDetails[1].financialYear" : "required",
	        "turnoverDetails[1].turnOver" : "required",
	        "turnoverDetails[2].financialYear" : "required",
	        "turnoverDetails[2].turnOver" : "required",
	        "vatNo" : "required",
	        "functionality" : "required",
	        "cities" : "required",
	    },
	    messages: {
	    	"loginObj.username": {
		         required: "Please enter a valid username.",
		        },
	        "loginObj.password": {
		         required: "Please enter a valid Password.",
		     },
	    	"contactDetailsObj.emailId": {
	         required: "Please enter a valid Email Id.",
	        },
	        "contactDetailsObj.phoneNumber": {
		         required: "Please enter a valid Phone Number.",
		     },
		    "turnoverDetails[0].financialYear": {
			      required: "Please enter a financial Year.",
			 },
			 "turnoverDetails[1].financialYear": {
			      required: "Please enter a financial Year.",
			 },
			 "turnoverDetails[2].financialYear": {
			      required: "Please enter a financial Year.",
			 },
			 "turnoverDetails[0].turnOver": {
			      required: "Please enter a turn over for this year.",
			 }, 
			 "turnoverDetails[1].turnOver": {
			      required: "Please enter a turn over for this year.",
			 }, 
			 "turnoverDetails[2].turnOver": {
			      required: "Please enter a turn over for this year.",
			 }, 
			 "vatNo": {
			      required: "Please enter a valid VAT Number.",
			 },
			 
	       }
	    });
	}
	
	/*function showSuccessMessage(message, topMargininPx){
		 $("#commonMessageSuccessId").css("top", topMargininPx);
		 $("#commonMessageSuccessId").html(message);
		 $("#commonMessageSuccessId").show();
		 
		 $.fn.scrollView = function () {
			    return this.each(function () {
			        $('html, body').animate({
			            scrollTop: $("#commonMessageSuccessId").offset().top
			        }, 1000);
			    });
		 }
		 
		 setTimeout(function(){
			 $("#commonMessageSuccessId").fadeOut(2000);
		 }, 2000);
	}*/
	
	function readyChosen(){
		 var config = {
 	              '.chosen-select'           : {},
 	              '.chosen-select-deselect'  : {allow_single_deselect:true},
 	              '.chosen-select-no-single' : {disable_search_threshold:10},
 	              '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
 	              '.chosen-select-width'     : {width:"100%"}
 	            }
 	            for (var selector in config) {
 	              $(selector).chosen(config[selector]);
 	              
 	          }
	}
	
