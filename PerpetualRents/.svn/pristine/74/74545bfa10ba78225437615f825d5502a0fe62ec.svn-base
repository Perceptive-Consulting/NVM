	$(document).ready(function (){
		$("#writtenHealthPolicy1").click(function(){
			$("#writtenHealthPolicyYes").show();
			$("#writtenHealthPolicyNo").hide();
			
		});
		$("#writtenHealthPolicy2").click(function(){
			$("#writtenHealthPolicyNo").show();
			$("#writtenHealthPolicyYes").hide();
		});
		
		$("#competentHealthAndSafetyAdvice1").click(function(){
			$("#competentHealthAndSafetyAdviceYes").show();
		});
		$("#competentHealthAndSafetyAdvice2").click(function(){
			$("#competentHealthAndSafetyAdviceYes").hide();
		});
		
		$("#receivedHealthAndSafety1").click(function(){
			$("#receivedHealthAndSafetyYes").show();
		});
		$("#receivedHealthAndSafety2").click(function(){
			$("#receivedHealthAndSafetyYes").hide();
		});
		
		$("#enforcementNoticeforHealthSafety1").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").show();
		});
		$("#enforcementNoticeforHealthSafety2").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").hide();
		});
		
		$("#enforcementNoticeforHealthSafety1").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").show();
		});
		$("#enforcementNoticeforHealthSafety2").click(function(){
			$("#enforcementNoticeforHealthSafetyYes").hide();
		});
		
		$("#safetyAccreditation1").click(function(){
			$("#safetyAccreditationYes").show();
		});
		$("#safetyAccreditation2").click(function(){
			$("#safetyAccreditationYes").hide();
		});
		
		$("#equalityPolicy1").click(function(){
			$("#equalityPolicyYes").show();
			$("#equalityPolicyNo").hide();
		});
		$("#equalityPolicy2").click(function(){
			$("#equalityPolicyYes").hide();
			$("#equalityPolicyNo").show();
		});
		
		$("#safetyAccreditation1").click(function(){
			$("#safetyAccreditationYes").show();
			$("#safetyAccreditationNo").hide();
		});
		$("#safetyAccreditation2").click(function(){
			$("#safetyAccreditationYes").hide();
			$("#safetyAccreditationNo").show();
		});
		
		$("#anyunlawfulDiscrimination1").click(function(){
			$("#anyunlawfulDiscriminationYes").show();
		});
		$("#anyunlawfulDiscrimination2").click(function(){
			$("#anyunlawfulDiscriminationYes").hide();
		});
		
		$("#subjectOfFormalInvestigation1").click(function(){
			$("#subjectOfFormalInvestigationYes").show();
		});
		$("#subjectOfFormalInvestigation2").click(function(){
			$("#subjectOfFormalInvestigationYes").hide();
		});
		
		$("#accidentReports1").click(function(){
			$("#accidentReportYes").show();
		});
		$("#accidentReports2").click(function(){
			$("#accidentReportYes").hide();
		});
		$("#priceScheduleEditBtn").click(function(){
			$("#priceScheduleEditDivision").show();
			$("#updatePriceBtn").show();
		});
		$("#schedulePriceCancelBtn").click(function(){
			$("#priceScheduleEditDivision").hide();
			$("#updatePriceBtn").hide();
		});
		$("#addCostEditId").click(function(){
			$("#additionalInformationOfCostDivision").show();
			$("#updatePriceBtn").hide();
		});
		$("#addCostCancelBtn").click(function(){
			$("#additionalInformationOfCostDivision").hide();
		});
		
		 $("#contractorInfoNextStep3Btn").click(function(){
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
	 	 
	 	 $("#contractorInfoPreviousStep3Btn").click(function(){
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
		 
		 
		 $("#writtenHealthPolicyFileBtn").click(function(event){
			 var file = $('#writtenHealthPolicyFile').val();
			 console.log(file);
			 if(file == "" ){
				 $("#writtenHealthPolicyFileIDLbl").show();
				 $("#writtenHealthPolicyFileIDLbl").html("Please select a file.");
				 return false;
			 }else{
					$("#writtenHealthPolicyFileIDLbl").hide();
				}
	  		    
			 var maxSize = 10000000;
	  		    var fsize = $('#writtenHealthPolicyFile')[0].files[0].size;
				 if((fsize > maxSize) == 'true' || (fsize > maxSize) == true){
					$("#writtenHealthPolicyFileIDLbl").show();
					$("#writtenHealthPolicyFileIDLbl").html("Max size is 10Mb");
					$('#writtenHealthPolicyFile').val(null);
					return false;
				}else{
					$("#writtenHealthPolicyFileIDLbl").hide();
				}
			 
			 $( "#writtenHealthPolicyFileUpdate" ).submit(); 
		 });
		 
		 $("#writtenHealthPolicyFileUpdate").submit(function(event){
	  			var formObj = $(this);
	  		    var formURL = formObj.attr("action");
	  		    var formData = new FormData(this);
	  		    var postData = JSON.stringify(formData, null, '\t');
	  		    $.ajax({
	  		    	beforeSend: function(){
						$(".loader").css('height', $(document).height());
						$(".loader").css('display', 'block');				    
					},
	  			    url: formURL,
	  			    type: 'POST',
	  			    data:  formData,
	  			    mimeType:"multipart/form-data",
	  			    dataType : "json",
	  			    contentType: false ,
	  			    contentTransferEncoding: "base64",
	  		        cache: false,
	  		        processData:false,
	  		        success: function(response, textStatus, jqXHR){
	  		        	$(".loader").css('display', 'none');
	  		 			if(response.success == true || response.success == 'true'){
	  		 				$("#writtenHealthPolicyDivision").fadeOut();
	  		 					setContractorData();
	  		 			}
	  		        },
	  			    error: function(jqXHR, textStatus, errorThrown){
	  			    	 
	  			     }          
	  		    });
	  		    event.preventDefault(); //Prevent Default action.
	  		    event.stopImmediatePropagation();
		});
		 
		 $("#equalityPolicyFileBtn").click(function(event){
			 var file = $('#equalityPolicyFile').val();
			 if(file == "" ){
				 $("#equalityPolicyFileIDLbl").show();
				 $("#equalityPolicyFileIDLbl").html("Please select a file.");
				 return false;
			 }else{
					$("#equalityPolicyFileIDLbl").hide();
				}
			 
			 var maxSize = 10000000;
	  		    var fsize = $('#equalityPolicyFile')[0].files[0].size;
				 if((fsize > maxSize) == 'true' || (fsize > maxSize) == true){
					$("#equalityPolicyFileIDLbl").show();
					 $("#equalityPolicyFileIDLbl").html("Max size is 10 Mb");
					$('#equalityPolicyFile').val(null);
					return false;
				}else{
					$("#equalityPolicyFileFileIDLbl").hide();
				}
			 $( "#equalityPolicyFileUpdate" ).submit(); 
		 });
		 
		 $("#equalityPolicyFileUpdate").submit(function(event){
	  			var formObj = $(this);
	  		    var formURL = formObj.attr("action");
	  		    var formData = new FormData(this);
	  		    var postData = JSON.stringify(formData, null, '\t');
	  		    $.ajax({
	  		    	beforeSend: function(){
						$(".loader").css('height', $(document).height());
						$(".loader").css('display', 'block');				    
					},
	  			    url: formURL,
	  			    type: 'POST',
	  			    data:  formData,
	  			    mimeType:"multipart/form-data",
	  			    dataType : "json",
	  			    contentType: false ,
	  			    contentTransferEncoding: "base64",
	  		        cache: false,
	  		        processData:false,
	  		        success: function(response, textStatus, jqXHR){
	  		        	$(".loader").css('display', 'none');
	  		 			if(response.success == true || response.success == 'true'){
	  		 				$("#equalityPolicyDivision").fadeOut();
	  		 					setContractorData();
	  		 			}
	  		        },
	  			    error: function(jqXHR, textStatus, errorThrown){
	  			    	 
	  			     }          
	  		    });
	  		    event.preventDefault(); //Prevent Default action.
	  		    event.stopImmediatePropagation();
		});
		 
		 $("#writtenHealthPolicyFile").on("change", function(){
			 console.log('called...');
		 });
		 
		 $("#schedulePriceUpdateBtn" ).click(function(event) {
			 var formData = $("#priceScheduleEditDivision").toObject({skipEmpty:true});
			 
			 var postData = JSON.stringify(formData);
	  	    		$.ajax({
	  	    		    url : contextPath+"/contractor/updatefunctionalityCostMatrix.htm",
	  	    		    type: "POST",
	  	    		    data : postData,
	  	    		    dataType : "json",
	  	    		    contentType: 'application/json',
	  	    		    success:function(data, textStatus, jqXHR){
	  	    		       if(data.success == true){
	  	    		    	 $("#priceScheduleEditDivision").fadeOut();
	  			    		  var p = $("#priceScheduleEditDivision").offset().top;
	  						  var topMargin = p - 40;
	  						  showContractorSuccessMessage("Successfully Updated.!", topMargin);
	  	    		    	   $("#priceScheduleEditDivision").hide();
	  	    		    	   $("#updatePriceBtn").hide();
	  	    		    	 setContractorData();
	  	    		       }
	  	    		    },
	  	    		    error: function(jqXHR, textStatus, errorThrown){
	  	    		        alert("fail");  
	  	    		    }
	  	    		});
	  	    		event.stopImmediatePropagation();
	  	});
	  	
		 setContractorData();
		 validate();
	});
	
	
	function  formatViewFunctionalityTable(key, value){
		var htmlStr = '<tr>'
					+ '<td class="new-2">'+value.functionalityStr+'</td>'
					+ '<td class="new-2">'+value.callOutMonToFri+'</td>'
					+ '<td class="new-2">'+value.callOutWeekends+'</td>'
                    + '<td class="new-2">'+value.hourlyRate+'</td>'
                    + '<td class="new-2">'+value.hourlyRateWeekends+'</td>'
                    + '</tr>';
                    
		return htmlStr;
	}
	
	function formatViewFirstRow(){
		var htmlStr = '<tr>'
					+'<td class="new-2"><strong>Trade</strong></td>'
					+'<td class="new-2"><strong>Call out charge (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Call out charge (weekends & bank holidays)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (weekends & bank holidays)</strong></td>'
					+'</tr>';
		return htmlStr;
			}
	
	
	function formatViewLastHtml(comments){
		var htmlStr = '<tr>'
					+ '<td class="new-2" colspan="5">If you would like to provide any additional information about your price schedule, please give details below.'
					+'<div class="">'
                    +'<strong style="width:100%;float:left; color:#e33a0c;" id="">'+comments+'</strong>'
                    +'</div></td>'
					+ '</tr>';
		
		return htmlStr;
	}
	
	function setContractorData(){
		 $.getJSON(contextPath+"/contractor/loadContractorStep3Info.htm", function(response) {
			 if(response.data){
				 var cPath = contextPath+"/";
				 var con = response.data.contractor;
				 var costsheet = response.data.costsheet;
				 var expertise = response.data.expertise;
				 if(con){
					 $("#writtenHealthPolicyCommentsStr").html(con.writtenHealthPolicyComments);
					 $("#writtenHealthPolicyFileNameStr").html(con.writtenPolicyFileName);
					 $("#writtenHealthPolicyFileNameStr").attr("href",cPath+"download/uploadedDocuments.htm?fileId="+con.writtenHealthPolicyFileId);
					 
					 if(con.writtenHealthPolicy == 'true'){
						 $("#writtenHealthPolicyResStr").html("Yes");
						 $("#writtenHealthPolicyFileNameDiv").show();
						 $("#writtenHealthPolicy1").attr("checked", true); 
						 $("#writtenHealthPolicyYes").show();
					 }else if(con.writtenHealthPolicy == 'false'){
						 $("#writtenHealthPolicyResStr").html("No");
						 $("#writtenHealthPolicyFileNameDiv").hide();
						 $("#writtenHealthPolicyComments").val(con.writtenHealthPolicyComments);
						 $("#writtenHealthPolicy2").attr("checked", true);
						 $("#writtenHealthPolicyNo").show();
					 }
					 
					 
					 if(con.competentHealthAndSafetyAdvice == 'true'){
						 $("#competentHealthAndSafetyAdviceResStr").html("Yes");
						 $("#competentHealthAndSafetyAdvice1").attr("checked", true); 
					 }else if(con.competentHealthAndSafetyAdvice == 'false'){
						 $("#competentHealthAndSafetyAdviceResStr").html("No");
						 $("#competentHealthAndSafetyAdvice2").attr("checked", true);
					 }
					 $("#competentHealthAndSafetyAdviceCommentsStr").html(con.competentHealthAndSafetyAdviceComments);
					 $("#competentHealthAndSafetyAdviceComments").val(con.competentHealthAndSafetyAdviceComments);
					
					 if(con.receivedHealthAndSafety == 'true'){
						 $("#receivedHealthAndSafetyResStr").html("Yes");
						 $("#receivedHealthAndSafety1").attr("checked", true); 
					 }else if(con.receivedHealthAndSafety == 'false'){
						 $("#receivedHealthAndSafetyResStr").html("No");
						 $("#receivedHealthAndSafety2").attr("checked", true);
					 }
					 $("#receivedHealthAndSafetyCommentsStr").html(con.receivedHealthAndSafetyComments);
					 $("#receivedHealthAndSafetyComments").val(con.receivedHealthAndSafetyComments);
					 
					 $("#yearEnding1Str").html(con.yearEnding1);
					 $("#fatalAccidents1Str").html(con.fatalAccidents1);
					 $("#reportableInjuries1Str").html(con.reportableInjuries1);
					 $("#accidentRate1Str").html(con.accidentRate1);
					 $("#nonReportableInjuries1Str").html(con.nonReportableInjuries1);
					 
					 $("#yearEnding1").val(con.yearEnding1);
					 $("#fatalAccidents1").val(con.fatalAccidents1);
					 $("#reportableInjuries1").val(con.reportableInjuries1);
					 $("#accidentRate1").val(con.accidentRate1);
					 $("#nonReportableInjuries1").val(con.nonReportableInjuries1);
					 
					 $("#yearEnding2Str").html(con.yearEnding2);
					 $("#fatalAccidents2Str").html(con.fatalAccidents2);
					 $("#reportableInjuries2Str").html(con.reportableInjuries2);
					 $("#accidentRate2Str").html(con.accidentRate2);
					 $("#nonReportableInjuries2Str").html(con.nonReportableInjuries2);
					 
					 $("#yearEnding2").val(con.yearEnding2);
					 $("#fatalAccidents2").val(con.fatalAccidents2);
					 $("#reportableInjuries2").val(con.reportableInjuries2);
					 $("#accidentRate2").val(con.accidentRate2);
					 $("#nonReportableInjuries2").val(con.nonReportableInjuries2);
					 
					 if(con.enforcementNoticeforHealthSafety == 'true'){
						 $("#enforcementNoticeforHealthSafetyStr").html("Yes");
						 $("#enforcementNoticeforHealthSafety1").attr("checked", true);
						 $("#enforcementNoticeforHealthSafetyYes").show();
					 }else if(con.enforcementNoticeforHealthSafety == 'false'){
						 $("#enforcementNoticeforHealthSafetyStr").html("No");
						 $("#enforcementNoticeforHealthSafety2").attr("checked", true);
						 $("#enforcementNoticeforHealthSafetyYes").hide();
					 }
					 $("#enforcementNoticeforHealthSafetyCommentsStr").html(con.enforcementNoticeforHealthSafetyComments);
					 $("#enforcementNoticeforHealthSafetyComments").val(con.enforcementNoticeforHealthSafetyComments);
					 
					 
					 if(con.safetyAccreditation == 'true'){
						 $("#safetyAccreditationResStr").html("Yes");
						 $("#safetyAccreditation1").attr("checked", true); 
						 $("#safetyAccreditationYes").show(); 
					 }else if(con.safetyAccreditation == 'false'){
						 $("#safetyAccreditationResStr").html("No");
						 $("#safetyAccreditation2").attr("checked", true);
						 $("#safetyAccreditationYes").hide(); 
					 }
					 $("#safetyAccreditationCommentsStr").html(con.safetyAccreditationComments);
					 $("#safetyAccreditationComments").val(con.safetyAccreditationComments);
					 
					 
					 $("#equalityPolicyCommentsStr").html(con.equalityPolicyComments);
					 $("#equalityPolicyFileName").html(con.equalityPolicyFileName);
					 $("#equalityPolicyFileName").attr("href",cPath+"download/uploadedDocuments?fileId="+con.equalityPolicyFileId);
					 
					 if(con.equalityPolicy == 'true'){
						 $("#equalityPolicyResStr").html("Yes");
						 $("#equalityPolicyFileNameDiv").show();
						 $("#equalityPolicy1").attr("checked", true);
						 $("#equalityPolicyYes").show();
						 $("#equalityPolicyNo").hide();
					 }else if(con.equalityPolicy == 'false'){
						 $("#equalityPolicyResStr").html("No");
						 $("#equalityPolicyFileNameDiv").hide();
						 $("#equalityPolicy2").attr("checked", true);
						 $("#equalityPolicyNo").show();
						 $("#equalityPolicyYes").hide();
					 }
					 
					 
					 if(con.anyunlawfulDiscrimination == 'true'){
						 $("#anyunlawfulDiscriminationStr").html("Yes");
						 $("#anyunlawfulDiscrimination1").attr("checked", true); 
					 }else if(con.anyunlawfulDiscrimination == 'false'){
						 $("#anyunlawfulDiscriminationStr").html("No");
						 $("#anyunlawfulDiscrimination2").attr("checked", true);
					 }
					 $("#anyunlawfulDiscriminationCommentsStr").html(con.anyunlawfulDiscriminationComments);
					 $("#anyunlawfulDiscriminationComments").val(con.anyunlawfulDiscriminationComments);
					 
					 
					 if(con.subjectOfFormalInvestigation == 'true'){
						 $("#subjectOfFormalInvestigationResStr").html("Yes");
						 $("#subjectOfFormalInvestigation1").attr("checked", true); 
					 }else if(con.subjectOfFormalInvestigation == 'false'){
						 $("#subjectOfFormalInvestigationResStr").html("No");
						 $("#subjectOfFormalInvestigation2").attr("checked", true);
					 }
					 $("#subjectOfFormalInvestigationCommentsStr").html(con.subjectOfFormalInvestigationComments);
					 $("#subjectOfFormalInvestigationComments").val(con.subjectOfFormalInvestigationComments);
					 
					 if(con.willingToAbideByCharities == 'true'){
						 $("#willingToAbideByCharitiesResStr").html("Yes");
						 $("#willingToAbideByCharities1").attr("checked", true); 
					 }else if(con.willingToAbideByCharities == 'false'){
						 $("#willingToAbideByCharitiesResStr").html("No");
						 $("#willingToAbideByCharities2").attr("checked", true);
					 }
					 
					 $("#additionalInformationOfCostStr").html(con.additionalInformationOfCost);
					 $("#additionalInformationOfCost").val(con.additionalInformationOfCost);
				 }
				 if(costsheet){
			  	    	var htmlStr = formatViewFirstRow();
			  	          $.each(costsheet, function(id, value) {
			  	        	  htmlStr += formatViewFunctionalityTable(id, value);
			  	          });
			  	          $("#priceScheduleIdStr").empty().html(htmlStr);
			  	      }
				 if(costsheet.length >= 1){
			  	    	var htmlStr = formatEditFirstRow();
			  	          $.each(costsheet, function(id, value) {
			  	        	  htmlStr += formatEditFunctionalityTable(id, value);
			  	          });
			  	          $("#priceScheduleEditIdStr").empty().html(htmlStr);
			  	      }else{
				  	    	var htmlStr = formatEditFirstRow();
				  	          $.each(expertise, function(key, value) {
				  	        	  htmlStr += formatCreateFunctionalityTable(key, value); //save new records
				  	          });
				  	          $("#priceScheduleEditIdStr").empty().html(htmlStr);
				  	      }
			 }
		 });
	}
	
	
	function formatEditFirstRow(){
		var htmlStr = '<tr>'
					+'<td class="new-2"><strong>Trade</strong></td>'
					+'<td class="new-2"><strong>Call out charge (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Call out charge (weekends & bank holidays)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (Mon to Fri)</strong></td>'
					+'<td class="new-2"><strong>Hourly rate (weekends & bank holidays)</strong></td>'
					+'</tr>';
		return htmlStr;
			}
	
	function formatEditFunctionalityTable(key, value){
		var htmlStr = '<tr>'
					+ '<td class="new-2td" style="display:none;" ><input type="hidden" value = "'+value.contractorId+'" name = "costSheet['+key+'].contractorId"></td>'
					+ '<td class="new-2td" style="display:none;" ><input type="hidden" value = "'+value.objectId+'" name = "costSheet['+key+'].objectId"></td>'
			        + '<td class="new-2td" ><input type="hidden" value = "'+value.functionalityId+'" name = "costSheet['+key+'].functionalityId">'+value.functionalityStr+'</td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].callOutMonToFri" type="text" class="effect" maxlength="100" value="'+value.callOutMonToFri+'"/></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].callOutWeekends" type="text" class="effect" maxlength="100" value="'+value.callOutWeekends+'"/></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].hourlyRate" type="text" class="effect" maxlength="100" value="'+value.hourlyRate+'"/></td>'
			        + '<td class="new-2td"><input name="costSheet['+key+'].hourlyRateWeekends" type="text" class="effect" maxlength="100" value="'+value.hourlyRateWeekends+'"/></td>'
			        + '</tr>';
		return htmlStr;
				}
	
	
	function formatCreateFunctionalityTable(id, obj){
		var htmlStr = '<tr>'
					/*+ '<td class="new-2td" style="display:none;" ><input type="hidden" value = "'+key+'" name = "costSheet['+key+'].contractorId"></td>'*/
					/*+ '<td class="new-2td" style="display:none;" ><input type="hidden" value = "'+value.objectId+'" name = "costSheet['+key+'].objectId"></td>'*/
			        + '<td class="new-2td" ><input type="hidden" value = "'+obj.id+'" name = "costSheet['+id+'].functionalityId">'+obj.value+'</td>'
			        + '<td class="new-2td"><input name="costSheet['+id+'].callOutMonToFri" type="text" class="effect" maxlength="100" value=""/></td>'
			        + '<td class="new-2td"><input name="costSheet['+id+'].callOutWeekends" type="text" class="effect" maxlength="100" value=""/></td>'
			        + '<td class="new-2td"><input name="costSheet['+id+'].hourlyRate" type="text" class="effect" maxlength="100" value=""/></td>'
			        + '<td class="new-2td"><input name="costSheet['+id+'].hourlyRateWeekends" type="text" class="effect" maxlength="100" value=""/></td>'
			        + '</tr>';
		return htmlStr;
		}
	
	
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
		      data: {page : 'page3', fieldName : fieldNameArray, value : fieldData},
		      dataType : "json",
		      contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		      success: function(response){
		    	  if(response.success == true){
		    		  $("#"+divisionId).fadeOut();
		    		  var p = $("#"+divisionId).offset().top;
					  var topMargin = p - 40;
					  showContractorSuccessMessage("Successfully Updated.!", topMargin);
		    		  $("#"+divisionId).fadeOut();
		    		  setContractorData();
		    	  }
		      }
		  });
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
	    $("#fContractorRegStep2").validate({
	        rules: {
	            "officeAddObj.addressLine1": "required",
	            "officeAddObj.city": "required",
	            "officeAddObj.county": "required",
	            "officeAddObj.postCode": "required",
	            "officeAddObj.phoneNumber": "required",
	            "correspondenceAddObj.addressLine1": "required",
	            "correspondenceAddObj.city": "required",
	            "correspondenceAddObj.county": "required",
	            "correspondenceAddObj.postCode": "required",
	            "correspondenceAddObj.phoneNumber": "required",
	            "registeredWithTradeBodies": "required",
	            "qualityMarks": "required",
	            "registeredWithConstructionLine": "required",
	            "qualityMarks": "required",
	            "employeesCount": "required",
	            "employeesTrade": "required",
	            "employSubcontractors": "required",
	            "taxOfficeAddress": "required",
	            "taxReferenceNumber": "required",
	            "insurerNameandAddress": "required",
	            "policyNumber": "required",
	            "employersLiability": "required",
	            "publicLiability": "required",
	            "proffessionalIndemnity": "required",
	            "insauranceCoverExpiryDate": "required"
	    },
	    messages: {
	    	"officeAddObj.addressLine1": {
		         required: "Please enter addressLine1.",
		        },
	        "officeAddObj.city": {
		         required: "Please enter name of city.",
		     },
	    	"officeAddObj.county": {
	    		required: "Please enter name of county.",
	        },
	        "officeAddObj.postCode": {
		         required: "Please enter postcode.",
		     },
		    "officeAddObj.phoneNumber": {
			      required: "Please enter your Phone Number.",
			 },
			 "correspondenceAddObj.addressLine1": {
				 required: "Please enter addressLine1.",
			 },
			 "correspondenceAddObj.city": {
				 required: "Please enter name of city.",
			 },
			 "correspondenceAddObj.county": {
				 required: "Please enter name of county.",
			 }, 
			 "correspondenceAddObj.postCode": {
				 required: "Please enter postcode.",
			 }, 
			 "correspondenceAddObj.phoneNumber": {
				 required: "Please enter your Phone Number.",
			 }, 
			 "registeredWithTradeBodies": {
		         required: "Please Select YES/NO.",
		     },
		     "qualityMarks": {
		         required: "Please Select YES/NO.",
		     },
		     "registeredWithConstructionLine": {
		         required: "Please Select YES/NO.",
		     },
		     "employSubcontractors": {
		         required: "Please Select YES/NO.",
		     },
		     
	        "employeesCount": {
		         required: "Please Enter Employee Count.",
		     },
		    "employeesTrade": {
		    	required: "Please Enter Employee Trade.",
			 },
			 "employSubcontractors": {
				 required: "Please Select YES/NO.",
				 },
			 "taxOfficeAddress": {
				 required: "Please Enter tax Office Address.",
			 },
			 "taxReferenceNumber": {
				 required: "Please Enter Tax Referecne Number.",
			 },
			 "insurerNameandAddress": {
				 required: "Please Enter Insurer Name & Address.",
			 }, 
			 "policyNumber": {
				 required: "Please enter Policy Number.",
			 }, 
			 "employersLiability": {
				 required: "Please Enter Employer's Liability.",
			 }, 
			 
			 "publicLiability": {
				 required: "Please Enter Public Liability.",
			 },
			 "proffessionalIndemnity": {
				 required: "Please enter name of county.",
			 }, 
			 "insauranceCoverExpiryDate": {
				 required: "Please enter Insurance Cover Expiry Date.",
			 }
	       }
	    });
	}
