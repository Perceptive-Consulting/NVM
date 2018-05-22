  var table;
  var globalDataArr = [];
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable( {
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/listProperty.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			        columns: [
			            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            { data: "createdOn" },
			            { data: "contactPerson" },
			            { data: "addressObj.city" },
			            { data: "uniqueReference" },	
			            { data: "statusStr" },
			            { data: "addressObj.addressLine1" },
			            { data: "addressObj.postCode" },
			            { data: "statusPercentage" },
			        ],
			        "pageLength": 15,
			        
			        "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
			        	globalDataArr.push(aData);
			        	var propertyId =  aData.id;
			        	var htmlStr = '<div id="progressBar'+propertyId+'" class="round-pink1" ><div></div></div>';
				           $('td:eq(8)', nRow).html(htmlStr);
				          var dataCount = this.fnSettings().fnRecordsTotal();
				          /*if((iDisplayIndex + 1) ==  dataCount){
				        	  setTimeout(function() {
				        		  	setProgress(globalDataArr);
				        		}, 100);
				        	  
				          }*/
				          /*if((iDisplayIndex + 1) ==  15){
				        	  console.log("Display Index "+iDisplayIndex);
				        	  console.log("Display Index Full "+iDisplayIndexFull);
				        	  setTimeout(function() {
				        		  	setProgress(globalDataArr);
				        		}, 100);
				        	  
				          }*/
				          $("td:first", nRow).html(iDisplayIndex +1);
			               return nRow;
				     }
			       
			    } );

			 $('#dataTableId').on('page.dt',function(){setTimeout(function(){setProgress(globalDataArr);},100);}).dataTable();
			   
			$('#dataTableId tbody').on( 'click', 'tr', function () {
			    if ($(this).hasClass('selected')) {
			        $(this).removeClass('selected');
			        aData = null;
			        $.colorbox.remove();
			    }else {
			        table.$('tr.selected').removeClass('selected');
			        $(this).addClass('selected');
			        aData = table.row( this ).data();
			    }
			});
			
			$( "#viewButtonId" ).click(function() {
				//var aData = table.row('.selected').data();
		          if(aData != null){
			          $.ajax({
			        		url:contextPath+"/admin/viewProperty.htm?propertyId=" + aData.id,
			        		data: aData,
			        		method: "Post",
			        		contentType: "application/json",															
			        		success:function(data){
			        				$("#containerId").html(data);
			        				//addPropertyDetails(aData.id);
			        				aData=null;
			        	  },
			        	  error: function(error){
		        				console.log(error);
		        				alert(error);
		        	  }});
		          } else {
		        	  $("#commonMessageErrorId").html("Please select a row to view");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
		          }
		      });
			
			
			
			$( "#editButtonId" ).click(function() {
				var aData = table.row('.selected').data();
				if(aData != null){
					validateAOP("#editPopupForm");
				$('#contactPerson').val(aData.contactPerson);
			    $('#agentName').val(aData.agentName);
			    $('#agentContactNumber').val(aData.agentContactNumber);
			    $('#agentAddressLine').val(aData.agentAddressLine);
			    $("#editButtonId").colorbox({width:"580px", inline:true, href:"#edit"});
				}
				else{
					$("#commonMessageErrorId").html("Please select a row to edit");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
				}
			});
			
			  $( "#createButtonId" ).click(function() {
				  var aData = table.row('.selected').data();
				  validateAOP("#createPopupFormId");
		          $("#createButtonId").colorbox({width:"950px", inline:true, href:"#create"});
		        });
			  
			    $( "#deleteButtonId" ).click(function() {
			    	var aData = table.row('.selected').data();
			          console.log(aData);
			          if(aData != null)
			          $("#deleteButtonId").colorbox({width:"580px", inline:true, href:"#delete"});
			          else{
							alert("Please select a row to delete");
						}
			    });
			  
			$('#delete_yes').click(function(){
				var aData = table.row('.selected').data();
				delete aData.modifiedOn;
				var jObj = JSON.stringify(aData);
				console.log(jObj);
				if(jObj!=null){
				$.ajax({
						url:contextPath+"/admin/deleteProperty.htm?propertyId="+aData.id,
				  		data: jObj,
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
			
			$('#dataTableId').on( 'draw.dt', function () {
				setTimeout(function() {
        		  	setProgress(globalDataArr);
        		}, 100);
			});
  });
  
function setProgress(globalDataArr){
  	if (globalDataArr.length > 0) {
  		$.each(globalDataArr, function(key, value) {
  		    progressBar(value.statusPercentage, $('#progressBar'+value.id));
          });
    }
  	progressBar(10, $('#progressBar'));
}
  
  
  function editPopupForm()
  {
	var aData = table.row('.selected').data();
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

  					
  	$.ajax({
  		url:contextPath+"/admin/updateProperty.htm",
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
  	$.colorbox.remove();
  }
  
  function createPopupForm()
  {
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
  		
  		url:contextPath+"/admin/addProperty.htm",
  		data: jObj,
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