  var aData;
  var table;
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable(  {
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/listLandlord.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			        columns: [
			            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            { data: "createdOn" },
			            { data: "completeName" },
			            { data: "primaryPhoneNumber" },
			            { data: "propertyCount" },
			            { data: "uniqueReference" },
			            { data: "addressObj.addressLine1" },
			            { data: "primaryEmailId"}
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
			        aData = null;
			        $.colorbox.remove();
			    }
			    else {
			        table.$('tr.selected').removeClass('selected');
			        $(this).addClass('selected');
			        aData = table.row( this ).data();
			    }
			} );
			$.getJSON(contextPath+"/register/loadCitiesForLandlord.htm", function(options) {
	     	      var dropdown = $('#landlordCity');
	     	      dropdown.empty();
	     	      if (options) {
	     	    	  var opts = options.data;
	     	    	 dropdown.append($('<option/>').val('').text('Select City'));
	     	          $.each(opts, function(id, city) {
	     	        	  dropdown.append($('<option/>').val(this.id).text(this.city));
	     	          });
	     	      }
	     	 });
			
			$( "#viewButtonId" ).click(function() {
		          console.log(aData);
		          if(aData!=null){
		          $.ajax({
		        		url:contextPath+"/admin/viewLandlord.htm",
		        		data: table.row('.selected').data(),
		        		method: "Post",
		        		contentType: "application/json",															
		        		success:function(data){
		        				$("#containerId").html(data);
		        				add(aData);
		        				aData=null;
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
							$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);
					}
		        });
			
			
			
			$( "#editButtonId" ).click(function() {
				if(aData != null){
					 validateAOP("#editPopupForm");
				$('#first_name').val(aData.firstName);
			    $('#last_name').val(aData.lastName);
			    $('#address_line1').val(aData.addressObj.addressLine1);
			    $('#address_line2').val(aData.addressObj.addressLine2);
			    $('#post_code').val(aData.addressObj.postCode);
			    $('select option:contains('+aData.addressObj.city+')').prop('selected',true);
			    $('#county').val(aData.addressObj.county);
			    $('#email_id').val(aData.primaryEmailId);
			    $('#phone_number').val(aData.primaryPhoneNumber);
			    $("#editButtonId").colorbox({width:"580px", inline:true, href:"#edit"});
				}
				else{
			    	$.colorbox.close();
					table.ajax.reload();
					$("#commonMessageErrorId").html("Please select a row to edit");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
				}
			});
			
			  $( "#createButtonId" ).click(function() {
				  validateAOP("#createPopupFormId");
		          $("#createButtonId").colorbox({width:"950px", inline:true, href:"#create"});
		        });
			  
			    $( "#deleteButtonId" ).click(function() {
			          console.log(aData);
			          if(aData != null)
			          $("#deleteButtonId").colorbox({width:"580px", inline:true, href:"#delete"});
			          else{
							alert("Please select a row to delete");
						}
			        });
			  
			$('#delete_yes').click(function(){
				var jObj = table.row('.selected').data();
				delete jObj.modifiedOn;
				delete jObj.loginObj.modifiedOn;
				var jObj1 = JSON.stringify(jObj);
				console.log(jObj);
				if(jObj!=null){
				$.ajax({
						url:contextPath+"/admin/deleteLandlord.htm?landlordId="+jObj.id,
				  		data: jObj1,
				  		method: "Post",
				  		dataType: "json",
				  		contentType: "application/json",														
						success:function(result){
							if(result.success==true){
								$.colorbox.close();
								table.ajax.reload();
								aData=null;
							}
					  }});
				}
			});

			$('#delete_no').click(function(){
				$.colorbox.close();
			});			    
  });
  
  function editPopupForm(){
  	var formData = form2object('editPopupForm', '.', true,
  			function(node)
  			{
  				if (node.id && node.id.match(/callbackTest/))
  				{
  					return { name: node.id, value: node.innerHTML };
  				}
  			});
  	formData.id = aData.id;
  	var jObj = JSON.stringify(formData, null, '\t');

  																					
  	console.log(jObj);
  	$.ajax({
  		url:contextPath+"/admin/updateLandlord.htm",
  		data: jObj,
  		method: "Post",
  		dataType: "json",
  		contentType: "application/json",															
  		success:function(result){
  			if(result.success==true){
  				$.colorbox.close();
  				table.ajax.reload();
  				aData=null;
  				$("#commonMessageSuccessId").html("Successfully Updated");
  				$("#commonMessageSuccessId").fadeIn();
				setTimeout(function(){
					$("#commonMessageSuccessId").fadeOut(4000);
				}, 4000);
  			}
	    	else{
	    		  $.colorbox.close();
					table.ajax.reload();
					$("#commonMessageErrorId").html("Error while updating");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
				}
  	  }});
  	$.colorbox.remove();
  	aData=null;
  }
  
  function createPopupForm() {
   console.log("Hello");
   var formData = form2object('createPopupFormId', '.', true,
  			function(node)
  			{
  				if (node.id && node.id.match(/callbackTest/))
  				{
  					return { name: node.id, value: node.innerHTML };
  				}
  			});
  	var jObj = JSON.stringify(formData, null, '\t');																				
  	console.log(jObj);
  	$.ajax({
  		
  		url:contextPath+"/admin/addLandlord.htm",
  		data: jObj,
  		method: "Post",
  		dataType: "json",
  		contentType: "application/json",															
  		success:function(result){
  			if(result.success==true){
  				$.colorbox.close();
  				table.ajax.reload();
  				aData=null;
  			}
  	  }});
  	aData=null;
  }