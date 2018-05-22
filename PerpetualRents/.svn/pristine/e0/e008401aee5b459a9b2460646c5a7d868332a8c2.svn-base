  var table;
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable(  {
			        	dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/listContractor.htm",
			            "type": "POST",
			            "dataType": "json"
			        	},tableTools: {
			                "aButtons ": [
			                          ]
			        	},
			        	columns: [
				            	{ data: null, defaultContent: '<input type="checkbox" />', orderable: false },
				            	{ data: "createdOn" },
				            	{ data: "companyName" },
				            	{ data: "companyTypeStr" },
				            	{ data: "status" },
				            	{ data: "tradingCommencementDate" },
				            	{ data: "vatNo" }
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
			
			
			
			$("#viewButtonId").click(function() {
				var aData = table.row('.selected').data();
		        if(aData!=null){
		          $.ajax({
		        		url:contextPath+"/admin/viewcontractor.htm",
		        		data: aData,
		        		method: "Post",
		        		contentType: "application/json",															
		        		success:function(data){
		        				$("#containerId").html(data);
		        				addContractorDetails(aData.id);
		        	  },
		        	  error: function(error){
	        				console.log(error);
	        				alert(error);
	        	  }});
		          }
		          else{
		        	  $("#commonMessageErrorId").html("Please select a row to view");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(fade);
						}, fade);
					}
		        });
			
			$( "#editButtonId" ).click(function() {
				var aData = table.row('.selected').data();
				console.log(JSON.stringify(aData));
				if(aData != null){
					 validateAOP("#editPopupFormId");
				$('#contact_person').val(aData.contactPerson);
			    $('#company_name').val(aData.companyName);
			    $('#unique_reference').val(aData.uniqueReference);
			    var addressObj = aData.addressObj;
			    if(addressObj){
			    	$('#address_line1').val(addressObj.addressLine1);
				    $('#address_line2').val(addressObj.addressLine2);
				    $('#city').val(addressObj.city);
				    $('#postCode').val(addressObj.postCode);
				    $('#county').val(addressObj.county);	
			    }
			    $('#vat_no').val(aData.vatNo);
			    $("#editButtonId").colorbox({width:"580px", inline:true, href:"#edit"});
				}
				else{
					$("#commonMessageErrorId").html("Please select a row to edit");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(fade);
					}, fade);
				}
			});
			
			  $( "#createButtonId" ).click(function() {
				  validateAOP("#createPopupFormId");
		          $("#createButtonId").colorbox({width:"950px", inline:true, href:"#create"});
		        }); 
			  
			$( "#deleteButtonId" ).click(function() {
				var aData = table.row('.selected').data();
		          if(aData != null)
		          $("#deleteButtonId").colorbox({width:"580px", inline:true, href:"#delete"});
		          else{
						alert("Please select a row to delete");
					}
		        });   
			    
			$('#delete_yes').click(function(){
				var jObj = table.row('.selected').data();
				var contId = jObj.id;
				if(jObj!=null){
				$.ajax({
						url:contextPath+"/admin/deleteContractor.htm?contractorId="+contId,
				  		method: "GET",
				  		dataType: "json",
				  		contentType: "application/json",															
						success:function(result){
							if(result.success==true){
								$.colorbox.close();
								table.ajax.reload();
								$("#commonMessageSuccessId").html("Successfully deleted");
								$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(fade);
								}, fade);
							}
					    	  else{
					    		  $.colorbox.close();
									table.ajax.reload();
									$("#commonMessageErrorId").html("Error while deleting");
									$("#commonMessageErrorId").fadeIn();
									setTimeout(function(){
										$("#commonMessageErrorId").fadeOut(fade);
									}, fade);
								}
					  }});
				}
				
			});

			$('#delete_no').click(function(){
				$.colorbox.close();
			});   	
  });

  function editPopupForm(){
	  	var formData = form2object('editPopupFormId', '.', true,
	  			function(node)
	  			{
	  				if (node.id && node.id.match(/callbackTest/))
	  				{
	  					return { name: node.id, value: node.innerHTML };
	  				}
	  			});
	  	var aData = table.row('.selected').data();
	  	formData.id = aData.id;
	  	var jObj = JSON.stringify(formData, null, '\t');
	  	$.ajax({
	  		url:contextPath+"/admin/updateContractor.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$.colorbox.close();
	  				table.ajax.reload();
	  				$("#commonMessageSuccessId").html("Successfully updated");
	  				$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(fade);
					}, fade);
	  			}
	  			else{
		    		  $.colorbox.close();
						table.ajax.reload();
						$("#commonMessageErrorId").html("Error while updating");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(fade);
						}, fade);
					}
	  	  }});
	  	$.colorbox.remove();
	  }
  function createPopupForm(){
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
	  		url:contextPath+"/admin/addContractor.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$.colorbox.close();
	  				table.ajax.reload();
	  				$("#commonMessageSuccessId").html("Successful Creation");
					$("#commonMessageSuccessId").fadeIn();
					setTimeout(function(){
						$("#commonMessageSuccessId").fadeOut(fade);
					}, fade);
	  			}
		    	  else{
		    		  $.colorbox.close();
						table.ajax.reload();
						$("#commonMessageErrorId").html("Error while creation");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(fade);
						}, fade);
					}
	  	  }});
	  }