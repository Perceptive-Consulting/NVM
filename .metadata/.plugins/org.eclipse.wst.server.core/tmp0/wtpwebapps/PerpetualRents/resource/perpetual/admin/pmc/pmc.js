  var table;
  var globalId;
  
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable({
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/listPMC.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			        columns: [
			            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            { data: "pmc.createdOn" },
			            { data: "pmc.companyName" },
			            { data: "pmc.authorisedPerson" },
			            { data: "loginObj.enabled" },
			            { data: "detailsObj.emailId" },
			            { data: "detailsObj.phoneNumber" }
			        ],
			        "pageLength": 15,
			        fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("td:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            }
			    } );
			 
			$('#dataTableId tbody').on( 'click', 'tr', function () {
			    if ($(this).hasClass('selected')) {
			        $(this).removeClass('selected');
			        $.colorbox.remove();
			    }
			    else {
			        table.$('tr.selected').removeClass('selected');
			        $(this).addClass('selected');
			    }
			} );
			
			$( "#viewButtonId").click(function() {
				try{
					var pmcId = table.row('.selected').data().pmc.id;
				}catch (e) {
					$("#commonMessageErrorId").html("Please select a row to view");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
					return false;
				}
		          $.ajax({
		        		url:contextPath+"/admin/viewPMC.htm",
		        		method: "Post",
		        		contentType: "application/json",															
		        		success:function(response){
		        				$("#containerId").html(response);
		        				addPMCDetails(pmcId);
		        				
		        	  },
		        	  error: function(error){
	        				console.log(error);
	        	  }});
		        });
			
			$( "#editButtonId").click(function() {
				 try{
					var pmcId = table.row('.selected').data().pmc.id;
					globalId = pmcId;
				}catch (e) {
					$("#commonMessageErrorId").html("Please select a row to edit");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
					return false;
				} 
				
				validateAOP("#editPopupForm");
				 $.getJSON(contextPath+"/admin/viewPMCDetails.htm?pmcId="+pmcId,
						    function(response, textStatus, jqXHR){
					 
					  			if(response.success == true || response.success == 'true'){
					  				var detailsObj = response.data.detailsObj;
					  				var pmcObj = response.data.pmc;
					  				var addressObj = response.data.addressObj;
					  				
					  				$("#authorisedPerson").val(pmcObj.authorisedPerson);
					  				$("#companyName").val(pmcObj.companyName);
					  				$("#emailId").val(detailsObj.emailId);
					  				$("#phoneNumber").val(detailsObj.phoneNumber);
					  				$("#citiesCovered").val(pmcObj.citiesCovered);
					  				$("#addressLine1").val(addressObj.addressLine1);
					  				$("#addressLine2").val(addressObj.addressLine2);
					  				$("#postCode").val(addressObj.postCode);
					  				$("#city").val(addressObj.city);
					  				$("#county").val(addressObj.county);
					  				$("#editButtonId").colorbox({width:"580px", inline:true, href:"#edit"});
					  			}
						    }).fail(function(jqXHR, textStatus, errorThrown)
						{
						 console.log(errorThrown);
					}); 
			});
			
			
		   $("#editButtonId").colorbox({width:"580px", inline:true, href:"#edit"});
		   $("#createButtonId").colorbox({width:"950px", inline:true, href:"#create"});
		   $("#deleteButtonId").colorbox({width:"580px", inline:true, href:"#delete"}); 
		   
		   
		   $("#createButtonId").click(function(){
			   validateAOP("#createPopupFormId");
			   $("#userName").val("");
		   });
		   
			$('#delete_yes').click(function(){
				var jObj = table.row('.selected').data();
				delete jObj.modifiedOn;
				var jObj1 = JSON.stringify(jObj);
				if(jObj!=null){
				$.ajax({
						url:contextPath+"/admin/deletePMC.htm",
				  		data: jObj1,
				  		method: "Post",
				  		dataType: "json",
				  		contentType: "application/json",														
						success:function(result){
							if(result.success==true){
								$.colorbox.close();
								table.ajax.reload();
							}
					  }});
				}
			});

			$('#delete_no').click(function(){
				$.colorbox.close();
			});
			 
       	   
       	    $(".close").click(function(){
       	    	$("#createErrorId").hide();
       	    });
       	    
       	 $("#createPmcBtnId").click(function(){
       		
       		var name = $("#userName").val();
       		if(name != null && $.trim(name) != ""){
       			userExists();
       			if(status == "false"){
       				$("#userErrorDivId").show();
       				return false;
       			}
       		 }
       		 if($("#createPopupFormId").valid()){
       			 var formData = form2object('createPopupFormId', '.', true,
              			function(node)
              			{
              				if (node.id && node.id.match(/callbackTest/))
              				{
              					return { name: node.id, value: node.innerHTML };
              				}
              			});
              	var jObj = JSON.stringify(formData, null, '\t');
              	 
              	$.ajax({
              		url:contextPath+"/admin/addPMC.htm",
              		data: jObj,
              		method: "Post",
              		dataType: "json",
              		contentType: "application/json",															
              		success:function(result){
              			if(result.success == true || result.success == 'true'){
              				$("#commonMessageSuccessId").html("Successfully Created");
              				$("#commonMessageSuccessId").show();
            				setTimeout(function(){
            					$("#commonMessageSuccessId").fadeOut(4000);
            				}, 4000);
              				$.colorbox.close();
              				table.ajax.reload();
              			}else{
              				$("#commonMessageErrorId").html(result.message);
            				$("#commonMessageErrorId").show();
            				setTimeout(function(){
            					$("#commonMessageErrorId").fadeOut(4000);
            				}, 4000);
              			}
              	  }});
       		 }
  	});
       	 
       	 $("#updateBtnId").click(function(){
      		if($("#editPopupForm").valid()){
       		var formData = form2object('editPopupForm', '.', true,
       	  			function(node)
       	  			{
       	  				if (node.id && node.id.match(/callbackTest/))
       	  				{
       	  					return { name: node.id, value: node.innerHTML };
       	  				}
       	  			});
       	  	formData.id = globalId;
       	  	var jObj = JSON.stringify(formData, null, '\t');
       	  	$.ajax({
       	  		url:contextPath+"/admin/updatePMC.htm",
       	  		data: jObj,
       	  		method: "Post",
       	  		dataType: "json",
       	  		contentType: "application/json",															
       	  		success:function(result){
       	  			if(result.success==true){
       	  				$.colorbox.close();
       	  				table.ajax.reload();
       	  			$("#commonMessageSuccessId").html("Successfully Updated");
      				$("#commonMessageSuccessId").fadeIn();
    				setTimeout(function(){
    					$("#commonMessageSuccessId").fadeOut(4000);
    				}, 4000);
       	  				
       	  			}else{ 
       	  			$("#commonMessageErrorId").html("Error while updating");
    				$("#commonMessageErrorId").fadeIn();
    				setTimeout(function(){
    					$("#commonMessageErrorId").fadeOut(4000);
    				}, 4000);
       	  			}
       	  	  }}); 
      		}
       	 });
       	 
       	$( "#viewPMCUsersButtonId").click(function() {
			try{
				var pmcId = table.row('.selected').data().pmc.id;
			}catch (e) {
				$("#commonMessageErrorId").html("Please select a row to view");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
				return false;
			}
	          $.ajax({
	        		url:contextPath+"/admin/viewPMCUsers.htm?pmcId="+pmcId,
	        		method: "Post",
	        		dataType : 'json',
	        		contentType: "application/json",															
	        		success:function(response){
	        			if(response.success == 'true' || response.success == true){
	        				 $.ajax({
	     		        		url:contextPath+"/admin/subPMCTable.htm",
	     		        		method: "Post",
	     		        		contentType: "application/json",															
	     		        		success:function(response){
	     		        				$("#containerId").html(response);
	     		        				setPMCUsers(pmcId);
	     		        			},
	     		        	  error: function(error){
	     	        				console.log(error);
	     	        	  }});
	        				}else{
	        					console.log('responseMsg' + response.message);
	        					$("#commonMessageErrorId").html(response.message);
	        					$("#commonMessageErrorId").fadeIn();
	        					setTimeout(function(){
	        						$("#commonMessageErrorId").fadeOut(4000);
	        					}, 4000);
	        					
	        				}
	        			},
	        	  error: function(error){
        				console.log(error);
        	  }});
	        });
  });
  	
  	function validateCity(){
  		$("#cityErrorId").hide();
  		$("#cityErrorDivId").hide();
  	}		
  
	  function formatHTML(key, value){
	  	var html = '<option value='+ key +'>'+ value +'</option>';
	  	return html;
	  }
  	
	  function formatEdiHTML(key, value, selectedArr1 ){
		  var selectedStr = JSON.stringify(selectedArr1);
		  	var html = '<option ';
			  	if( selectedStr.indexOf(value) != -1){
			  		html += 'selected="selected"';
			  	}
		  		html += ' value='+ key +'>'+ value +'</option>';
		  	return html;
		  }
	
	$('.close').click(function () {
	    $('#alertSuccessId').hide(200);
	    $('#alertErrorId').hide(200);
	    $('#mainsuccessId').hide(200);
  	}); 	
	
 function userExists(){
	 var name = $("#userName").val();
	 if($.trim(name) != ""){
	 $.ajax({
	  		url:contextPath+"/pmc/userNameAllowed.htm?name="+name,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  			status = "true";
	  			$("#userErrorDivId").hide();
	  			}else{ 
	  				$("#userErrorDivId").show();
		  			$("#commonMessageErrorId").html("Username Not Available.");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
					status = "false";
	  			}
	  	  }});
	 }
 }
 
 