
$(document).ready(function () {
	
		$.getJSON(contextPath+"/register/loadContractorFunctionality.htm", function(options) {
  	      if (options) {
  	    	  var opts = options.data;
  	    	var htmlStr = '<option value=""></option>';
  	          $.each(opts, function(key, value) {
  	        	  htmlStr += formatDropDown(this.key, this.value);
  	          });
  	          $("#functionalityId").empty().html(htmlStr);
  	      }
  	  	});
		
		 $.getJSON(contextPath+"/register/loadCitiesForContractor.htm", function(options) {
 	        if (options) {
 	      	  var opts = options.data;
 	      	var htmlStr = '<option value=""></option>';
 	            $.each(opts, function(key, value) {
 	          	  htmlStr += formatDropDown(this.id, this.city);
 	            });
 	            $("#citiesId").empty().html(htmlStr);
 	           readyChosen();
 	        	}
 	       
 	        });

		 validate();		 
	});

	function formatDropDown(key, value){
		var htmlStr = '<option value="'+key+'">'+value+'</option>';
        return htmlStr;
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
			 }
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
	}
	*/
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
	
