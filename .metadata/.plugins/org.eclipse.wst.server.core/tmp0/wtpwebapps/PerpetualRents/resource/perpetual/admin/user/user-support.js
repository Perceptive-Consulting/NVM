  var id ;
  $(document).ready(function(){
		$.fn.dataTable.TableTools.defaults.aButtons = [];
		$.fn.dataTableExt.sErrMode = 'console';
		 table1 = $('#dataTableId1').DataTable(  {
		        dom: 'Tfrtip',"ajax": {
		            "url": contextPath+"/admin/listAdmin.htm",
		            "type": "POST",
		            "dataType": "json"
		        },tableTools: {
		                "aButtons ": [
		                          ]
		        },
		        columns: [
		            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
		            { data: "createdOn" },
		            { data: "fullName" },
		            { data: "uniqueReference" },
		            { data: "loginObj.enabled" },
		            { data: "loginObj.username" },
		        ],
		        "pageLength": 15,
		        fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("td:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            }
		    });
		$('#dataTableId1 tbody').on( 'click', 'tr', function () {
		    if ($(this).hasClass('selected')) {
		        $(this).removeClass('selected');
		        aData = null;
		        $.colorbox.remove();
		    }
		    else {
		        table1.$('tr.selected').removeClass('selected');
		        $(this).addClass('selected');
		        aData = table1.row( this ).data();
		    }
		} );
		
		
		$( "#viewButtonIdAdmin" ).click(function() {
			var aData = table1.row('.selected').data();
	        if(aData!=null){
	          $.ajax({
	        		url:contextPath+"/admin/viewAdmin.htm",
	        		data: aData,
	        		method: "Post",
	        		contentType: "application/json",															
	        		success:function(data){
	        				$("#containerId").html(data);
	        				addUserDetails(aData.id);
	        	  },
	        	  error: function(error){
        	  }});
	          }
	          else{
	        	  $("#commonMessageErrorId").html("Please select a row to view");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
				}
	        });
		
		$( "#editAdminButton" ).click(function() {
			if($("#editPopupFormIdAdmin").valid() == true)
				$("#editPopupFormIdAdmin").submit();
	        });
		$( "#createButtonId" ).click(function() {
	          $("#createButtonId").colorbox({width:"400px", inline:true, href:"#create"});
	        });
		
		$( "#createButtonIdAdmin" ).click(function() {
	          $("#createButtonIdAdmin").colorbox({width:"900px", inline:true, href:"#createAdmin"});
	        });
		
		$( "#deleteButtonId" ).click(function() {
			var jObj = table.row('.selected').data();
			if(jObj){
	          $("#deleteButtonId").colorbox({width:"400px", inline:true, href:"#delete"});
			}
			else{
				alert("Please select the city");
			}
	        });
		
		$( "#editButtonIdAdmin" ).click(function() {
			try{
			var aData = table1.row('.selected').data();
			$('#firstName').val(aData.firstName);
		    $('#lastName').val(aData.lastName);
		    var addressObj = aData.addressObj;
		    if(addressObj){
		    	$('#addressLine1').val(addressObj.addressLine1);
			    $('#addressLine2').val(addressObj.addressLine2);
			    $('#city_').val(addressObj.city);
			    $('#postCode').val(addressObj.postCode);
			    $('#county').val(addressObj.county);
			    $('#landmark').val(addressObj.landmark);
		    }
		    var detailsObj = aData.detailsObj;
		    if(detailsObj){
		    	$('#emailId').val(detailsObj.emailId);
		    	$('#phoneNumber').val(detailsObj.phoneNumber);
		    }
		   
		    $("#editButtonIdAdmin").colorbox({width:"580px", inline:true, href:"#editAdmin"});
			}
			catch(e){
				$("#commonMessageErrorId").html("Please select a row to edit");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
				return false;
			}
		});
		
		
		$( "#deleteButtonIdAdmin" ).click(function() {
			var jObj = table1.row('.selected').data();
			if(jObj){
	          $("#deleteButtonIdAdmin").colorbox({width:"400px", inline:true, href:"#deleteAdmin"});
			}
			else{
				alert("Please select the Admin Row");
			}
	      });
		
		

		$('#delete_no').click(function(){
			$.colorbox.close();
		});
		
		$('#delete_yesAdmin').click(function(){
			var jObj = table1.row('.selected').data();
			if(jObj!=null){
				$.ajax({
				      url: contextPath+"/admin.htm?action=7&param=ADMIN&adminId="+jObj.id,
				      type: "post",
				      contentType: "application/json",
				      dataType: "json",
				      success: function(data){
				    	  var status = data.success;
				    	  if(status == true){
				    		  //alert("Success");
				    		  $.colorbox.close();
								table1.ajax.reload();
				    	  }
				    	  else{
				    		  //alert("Failure");
				    	  }
				      },
				      error:function(){
				    	  $("errorId").show();
				      }
				  });
			}
			
		});
		
		
		
		$("#createAdminButton").click(function(){
		
			if($("#createPopupFormIdAdmin").valid() == true){
				 var formData = form2object('createPopupFormIdAdmin', '.', true,
				  			function(node)
				  			{
				  				if (node.id && node.id.match(/callbackTest/))
				  				{
				  					return { name: node.id, value: node.innerHTML };
				  				}
				  			});
				  	var jObj = JSON.stringify(formData, null, '\t');																				
				  	$.ajax({
				  		url : contextPath+"/admin/addUsers.htm",
				  		data: jObj,
				  		method: "Post",
				  		dataType: "json",
				  		contentType: "application/json",															
				  		success:function(result){
				  			if(result.success==true){
				  				$.colorbox.close();
				  				table1.ajax.reload();
				  				$("#commonMessageSuccessId").html("Successfully Created");
				  				$("#commonMessageSuccessId").fadeIn();
								setTimeout(function(){
									$("#commonMessageSuccessId").fadeOut(4000);
								}, 4000);
				  			}else{
				  				$("#commonMessageErrorId").html(result.message);
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
				  	  }});
				  
			}
		});
		
		$("#updateAdminButton").click(function(){
			if($("#editPopupFormIdAdmin").valid() == true){
			  	var formData = form2object('editPopupFormIdAdmin', '.', true,
			  			function(node)
			  			{
			  				if (node.id && node.id.match(/callbackTest/))
			  				{
			  					return { name: node.id, value: node.innerHTML };
			  				}
			  			});
			  	var aData = table1.row('.selected').data();
			  	formData.id = aData.id;
			  	
			  	var jObj = JSON.stringify(formData, null, '\t');
			  	$.ajax({
			  		url:contextPath+"/admin/updateUsers.htm",
			  		data: jObj,
			  		method: "Post",
			  		dataType: "json",
			  		contentType: "application/json",															
			  		success:function(result){
			  			if(result.success == true){
			  				$.colorbox.close();
			  				table1.ajax.reload();
			  				$("#commonMessageSuccessId").html("Successfully Updated");
			  				$("#commonMessageSuccessId").fadeIn();
							setTimeout(function(){
								$("#commonMessageSuccessId").fadeOut(4000);
							}, 4000);
			  			}
			  			else{
			  				$("#commonMessageErrorId").html("Error while updating");
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);
			  			}
			  	  }});
			}
		});
  });
