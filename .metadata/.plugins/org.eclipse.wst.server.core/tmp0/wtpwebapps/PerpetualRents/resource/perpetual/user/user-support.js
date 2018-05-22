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
		            { data: "firstName" },
		            { data: "lastName" },
		            { data: "uniqueReference" },
		            { data: "enable" },
		            { data: "loginObj.username" },
		            { data: "citiesAlloted" },
		            
		        ],
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
        				//console.log(error);
        				//alert(error);
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
	          //alert("Button Clicked");
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
			console.log(aData);
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
		    console.log(aData.citiesAlloted);
		    var selectedIdArr = aData.citiesAlloted.split(',');
		    console.log(selectedIdArr);
				if(selectedIdArr.length > 0){
					$.getJSON(contextPath+"/admin/adminCityList.htm", function(options) {
		       	        if (options) {
		       	      	  var opts = options.data;
		       	      	  var htmlStr = "";
		       	      	  htmlStr += ' <select name="cityAllotedList" id="editCityAllotedList"  multiple="multiple" placeholder="Select City" class="SelectBox">';
		       	            $.each(opts, function(key, value) {
		       	          	  htmlStr += formatEdiHTML(this.id, this.city, selectedIdArr);
		       	            });
		       	            htmlStr += '</select>'; 
		       	            $("#multipleCityEditId").html(htmlStr);
		       	         
		       	    	    window.asd = $('.SelectBox').SumoSelect({ csvDispCount: 3 });
		       	        }
		       	    });
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
			//console.log("Button is clicked");
			var jObj = table1.row('.selected').data();
			if(jObj!=null){
				$.ajax({
				      url: "admin.htm?action=7&param=ADMIN&adminId="+jObj.id,
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
		
		
		$.getJSON("admin.htm?action=4&param=ADMIN&task=CITY", function(options) {
   	        if (options) {
   	      	  var opts = options.data;
   	      	  var htmlStr = "";
   	      	  htmlStr += ' <select name="cityAllotedList" id="createCityAllotedList"  multiple="multiple" placeholder="Select City" class="SelectBox">';
   	            $.each(opts, function(key, value) {
   	          	  htmlStr += formatHTML(this.id, this.city);
   	            });
   	            htmlStr += '</select>'; 
   	         	$("#multipleCityCreateId").html(htmlStr);
   	         
   	    	    window.asd = $('.SelectBox').SumoSelect({ csvDispCount: 3 });
   	        }
   	    });
		
		$("#createAdminButton").click(function(){
			
			var citiesAlloted = $("#createCityAllotedList").val();
			if(citiesAlloted == null){
				$("#cityErrorDivId1").show();
				return false;
			}
			if($("#createPopupFormIdAdmin").valid() == true){
				 var formData = form2object('createPopupFormIdAdmin', '.', true,
				  			function(node)
				  			{
				  				if (node.id && node.id.match(/callbackTest/))
				  				{
				  					return { name: node.id, value: node.innerHTML };
				  				}
				  			});
				   console.log(formData);
				  	var jObj = JSON.stringify(formData, null, '\t');																				
				  	//console.log(jObj);
				  	$.ajax({
				  		url:"admin.htm?action=1&param=ADMIN",
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
				  				$.colorbox.close();
								table1.ajax.reload();
				  				$("#commonMessageErrorId").html("Error while Creation");
								$("#commonMessageErrorId").fadeIn();
								setTimeout(function(){
									$("#commonMessageErrorId").fadeOut(4000);
								}, 4000);
				  			}
				  	  }});
				  
			}
		});
		
		$("#updateAdminButton").click(function(){
			var citiesAlloted = $("#editCityAllotedList").val();
			if(citiesAlloted == null){
				$("#cityErrorDivIdEdit").show();
				return false;
			}
			
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
			  	//console.log(jObj);
			  	console.log('formData ' + jObj);
			  	$.ajax({
			  		url:"admin.htm?action=3&param=ADMIN",
			  		data: jObj,
			  		method: "Post",
			  		dataType: "json",
			  		contentType: "application/json",															
			  		success:function(result){
			  			if(result.success==true){
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
  
  function validateCityError(){
	  $("#cityErrorDivId1").hide();
	  $("#cityErrorDivIdEdit").hide();
	  
  }
  
  function formatHTML(key, value){
	  	var html = '<option value='+ key +'>'+ value +'</option>';
	  	return html;
	  }
  function formatEdiHTML(key, value, selectedArr ){
	  var selectedStr = JSON.stringify(selectedArr);
	  	var html = '<option ';
		  	if( selectedStr.indexOf(value) != -1){
		  		html += 'selected="selected"';
		  	}
	  		html += ' value='+ key +'>'+ value +'</option>';
	  	return html;
	  }
