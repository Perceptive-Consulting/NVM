 
  var globalFiles;
  $(document).ready(function(){
	  console.log("Executed....");
	  $(".FileView").fancybox({helpers: { title : { type : 'float' }}});
		  $.getJSON(contextPath+"/property/loadMarketingInformation.htm",
				    function(response, textStatus, jqXHR){
			  
			  			var obj = response.data;
			  			if(obj){
			  				var info = obj.info;
			  				$("#availability").val(info.availability);
			  				$("#rentAmount").val(info.rentAmount);
			  				$("#propertyType").val(info.propertyType);
			  				if(info.propertyType == 2){
			  					$("#otherPropertyTypeId").show();
			  					$("#propertyOtherType").val(info.propertyOtherType);
								$("#labelId").html("Which Floor");
			  				}else if(info.propertyType == 4){
								$("#otherPropertyTypeId").show();
								$("#labelId").html("Which Type");
								$("#propertyOtherType").val(info.propertyOtherType);
							}else if(info.propertyType == 11){
								$("#otherPropertyTypeId").show();
								$("#labelId").html("Give Details");
								$("#propertyOtherType").val(info.propertyOtherType);
							}else{
								$("#otherPropertyTypeId").hide();
							}
			  				
			  				$("#rentPeriod").val(info.rentPeriod);	
			  				
			  				if(info.rentPeriod == 1){
			  					$("#lessRentReasonCommentTypeId").show();
			  					$("#rentReasonLabelId").html("If you can not commit to six months then please state why ?");
			  					$("#rentReasonComment").val(info.rentReasonComment);
			  				}
			  					
			  				$("#bedroomCount").val(info.bedroomCount);
			  				$("#bathroomCount").val(info.bathroomCount);
			  				$("#seprateWC").val(info.seprateWC);
			  				if(info.furnished == 'true' || info.furnished == true)
			  					$("#furnished1").attr("checked", true);
			  				else if(info.furnished == 'false' || info.furnished == false)
			  					$("#furnished2").attr("checked", true);
			  				
			  				if(obj.furnished)
			  					$("#furnishedPropertyLabel").show();
			  				else
			  					$("#furnishedPropertyLabel").hide();
			  				
			  				if(info.flooring == 'true' || info.flooring == true){
			  					$("#flooring1").attr("checked", true);
			  				}else if(info.flooring == 'false' || info.flooring == false){
			  					$("#flooring2").attr("checked", true);
			  				}
			  				$("#flooringComments").val(info.flooringComments);
			  				
			  				if(info.curtains == 'true' || info.curtains == true){
			  					$("#curtains1").attr("checked", true);
			  				}else if(info.curtains == 'false' || info.curtains == false){
			  					$("#curtains2").attr("checked", true);
			  				}
			  				$("#curtainsComments").val(info.curtainsComments);
			  				
			  				if(info.frontGarden == 'true' || info.frontGarden == true){
			  					$("#frontGarden1").attr("checked", true);
			  				}else if(info.frontGarden == 'false' || info.frontGarden == false){
			  					$("#frontGarden2").attr("checked", true);
			  				}
			  				$("#frontGardenComments").val(info.frontGardenComments);
			  				
			  				if(info.rearGarden == 'true' || info.rearGarden == true){
			  					$("#rearGarden1").attr("checked", true);
			  				}else if(info.rearGarden == 'false' || info.rearGarden == false){
			  					$("#rearGarden2").attr("checked", true);
			  				}
			  				$("#rearGardenComments").val(info.rearGardenComments);
			  				
			  				if(info.wheelChairAccess == 'true' || info.wheelChairAccess == true){
			  					$("#wheelChairAccess1").attr("checked", true);
			  				}else if(info.wheelChairAccess == 'false' || info.wheelChairAccess == false){
			  					$("#wheelChairAccess2").attr("checked", true);
			  				}
			  				$("#wheelChairAccessComments").val(info.wheelChairAccessComments);
			  				
			  				if(info.extraStairs == 'true' || info.extraStairs == true){
			  					$("#extraStairs1").attr("checked", true);
			  				}else if(info.extraStairs == 'false' || info.extraStairs == false){
			  					$("#extraStairs2").attr("checked", true);
			  				}
			  				$("#extraStairsComments").val(info.extraStairsComments);
			  				
			  				var fileList = obj.files;
			  				globalFiles = fileList;
			  				 $("#imageGalary").empty();
			  				if (fileList) {
			  					$("#imageDisplaytd").show();
			  					 var i = 0;
			  					 var html = "";
					            $.each(fileList, function(fileObj){
					            		html += format(this.fileObj);
					            	i++;
					            });
					            		            
					            $("#imageGalary").empty().html(html); 
					            imageSlider();
					        }else{
					        	$("imageDisplaytd").hide(150);
					        }
			  			}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			}); 
	
		  $.getJSON(contextPath+"/property/propertyStatus.htm",
				    function(response, textStatus, jqXHR){
		  				if(response){
		  					progressBar(response.status, $('#progressBar'));								
		  				}
				    }).fail(function(jqXHR, textStatus, errorThrown)
				{
				 console.log(errorThrown);
			});
		  
			$("#propertyType").on('change',function(){
			 var id = $(this).find('option:selected').attr('value');
				if(id == 2){
					$("#otherPropertyTypeId").show();
					$("#labelId").html("Which Floor");
				}else if(id == 4){
					$("#otherPropertyTypeId").show();
					$("#labelId").html("Which Type");
				}else if(id == 11){
					$("#otherPropertyTypeId").show();
					$("#labelId").html("Give Details");
				}else{
					$("#otherPropertyTypeId").hide();
				}
			});
			
			$("#rentPeriod").on('change',function(){
			 var id = $(this).find('option:selected').attr('value');
			   if(id == 1){
				   $("#lessRentReasonCommentTypeId").show();
 					$("#rentReasonLabelId").html("If you can not commit to six months then please state why ?");
			     }	
			   else{
				   $("#lessRentReasonCommentTypeId").hide();
			   }
			   
			});
			
			new JsDatePick({
				useMode:2,
				target:"availability",
				dateFormat:"%d-%M-%Y",
			 });
			
  	});
  
  	function format(fileObj){
  		var cPath = contextPath+"/";
  		var html = '<li>'
  				+ '<a class="FileView" rel="gallery1" href="'+ cPath + fileObj.filePath+'" >'
  				+ '<img src="'+cPath + fileObj.filePath +'" alt="" ></img>'
  				+ '</a>'
	  			+ '<a href="javascript:removeFile('+fileObj.id+')"><div class="cls">X</div></a>' 
	  			+ '</li>';

	  			return html;
		  	}
  	
  	
  	function removeFile(fileId){
  		 $.ajax({
			 type: "GET",
			url:contextPath+"/property/removeMarketingInfoImage.htm?fileId="+fileId,
			dataType : "json",
			contentType: 'application/json',
			success: function(response){
				if(response.success == 'true' || response.success == true){
					 $.getJSON(contextPath+"/property/loadMarketingInformation.htm",
							    function(response, textStatus, jqXHR){
						  			var obj = response.data;
						  			if(obj){
						  				var fileList = obj.files;
						  				globalFiles = fileList;
						  				$("#imageGalary").empty();
						  				if (fileList) {
						  					$("imageDisplaytd").show(150);
						  					 var i = 0;
						  					 var html = "";
								            $.each(fileList, function(fileObj){
								            		html += format(this.fileObj);
								            	i++;
								            });
								            		            
								            $("#imageGalary").empty().html(html); 
								            imageSlider();
								        }else{
								        	$("#imageDisplaytd").hide(150);
								        }
						  				
						  			}
							    }).fail(function(jqXHR, textStatus, errorThrown)
								{
								 console.log(errorThrown);
							}); 
					}
				} 
			});
  	}
  	
  	function imageSlider() {
  		$('#imageGalary').carouFredSel({
			prev: '#prev2',
			next: '#next2',
			pagination: "#pager2",
			auto: false
		});
  	}
  
  function showData(id){
		$(id).show(150);
	};
	
	function hideLabel(id){
		$(id).hide(150);
	};
  
	$(function() {
	    $("#fMarketingInfo").validate({
	        rules: {
	        	"rentAmount": {
	        		required: true,
	                digits: true
	        	},
	        	"availability" : "required",
	        	"rentReasonComment" : {
	        		required: true
	        	},
	        	"bedroomCount": {
	        		required: true,
	                digits: true
	        	},
	        	"bathroomCount": {
	        		required: true,
	                digits: true
	        	},
	        	"seprateWC": {
	        		required: true,
	                digits: true
	        	}
	        }
	    });
	  });
	
	 function fetchHMOLicenceDetails(){
		 $.getJSON(contextPath+"/property/questionData.htm?page=2" , function(response) {
			 if(response.success == true || response.success == 'true' ){
				 var data = response.data;
					 $("#hmoLicenseTotalQuestion").html(data.totalQuestion);
					 $("#hmoLicenseUnattemptedQues").html(data.unattempted);
					 $("#hmoLicenseWrongQues").html(data.wrongAnswers);
			 }
    	 });
	 }
	 
	 
	 function fetchCriteriaADetails(){
		 $.getJSON(contextPath+"/property/questionData.htm?page=3" , function(response) {
			 if(response.success == true || response.success == 'true' ){
				 var data = response.data;
					 $("#criteriaATotalQuestion").html(data.totalQuestion);
					 $("#criteriaAUnattemptedQues").html(data.unattempted);
					 $("#criteriaAWrongQues").html(data.wrongAnswers);
			 }
    	 });
	 }
	 
	 function fetchCriteriaBDetails(){
		 $.getJSON(contextPath+"/property/questionData.htm?page=4" , function(response) {
			 if(response.success == true || response.success == 'true' ){
				 var data = response.data;
					 $("#criteriaBTotalQuestion").html(data.totalQuestion);
					 $("#criteriaBUnattemptedQues").html(data.unattempted);
					 $("#criteriaBWrongQues").html(data.wrongAnswers);
			 }
    	 });
	 }
	 
	 function fetchCriteriaCDetails(){
		 $.getJSON(contextPath+"/property/questionData.htm?page=5" , function(response) {
			 if(response.success == true || response.success == 'true' ){
				 var data = response.data;
					 $("#criteriaCTotalQuestion").html(data.totalQuestion);
					 $("#criteriaCUnattemptedQues").html(data.unattempted);
					 $("#criteriaCWrongQues").html(data.wrongAnswers);
			 }
    	 });
	 }
	 
	 
	 function fetchCriteriaDDetails(){
		 $.getJSON(contextPath+"/property/questionData.htm?page=6" , function(response) {
			 if(response.success == true || response.success == 'true' ){
				 var data = response.data;
					 $("#criteriaDTotalQuestion").html(data.totalQuestion);
					 $("#criteriaDUnattemptedQues").html(data.unattempted);
					 $("#criteriaDWrongQues").html(data.wrongAnswers);
			 }
    	 });
	 }
