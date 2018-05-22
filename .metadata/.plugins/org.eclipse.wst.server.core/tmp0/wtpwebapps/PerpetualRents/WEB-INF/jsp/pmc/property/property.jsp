<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
<div class="container">
  <sections class="contant-area">
    <div class="button">
    <button id="viewButtonId">View</button>
      <button id="editButtonId" style="display: none;">Edit</button>
      <button id="createButtonId" style="display: none;">Create</button>
      <button id="deleteButtonId" style="display: none;">Delete</button>
    </div><!-- table  --><!--  -->
    
        <table id="dataTableId" class="table display table-bordered"  cellspacing="0">
    <thead>
        <tr>
            <th>S.No.</th>
            <th>Created On</th>
            <th>Contact Person</th>
            <th>City</th>
            <th>Address</th>
            <th>Reference</th>
            <th>Post Code</th>
            <th width="250px">Status</th>
        </tr>
    </thead>
</table>
  </sections>
</div>



<div style="display:none;">
  <div id='edit'>
    <form id="editPopupForm" action="javascript:editPopupForm()">
      <h1>Edit Property Details</h1>
      <div class="form-element">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40%"><label>Contact Person:</label></td>
            <td width="60%"><input type="text" value="" class="" name="contactPerson" id="contactPerson"/></td>
          </tr>         
          <tr>
            <td><label>Agent Name:</label></td>
            <td><input type="text" value="" class="" name="agentName" id="agentName"/></td>
          </tr>
          <tr>
            <td><label>Agent Contact Number:</label></td>
            <td><input type="text" value="" class="" name="agentContactNumber" id="agentContactNumber"/></td>
          </tr>
          <tr>
            <td><label>Agent Address:</label></td>
            <td><input type="text" value="" class="" name="agentAddressLine" id="agentAddressLine"/></td>
          </tr>
        </table>
      </div>
      <div id="edit_footer"><input type="submit" value="Update" /></div>
    </form>
  </div>
   <div id='create'>
    <form id="createPopupFormId" action="javascript:createPopupForm()">
      <h1>Register Property</h1>
      <div class="form-element1">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="25%"><label>City:</label>
            <input type="text" value="" class="" name="addressObj.city" /></td>
            <td width="25%"><label>PostCode:</label>
            <input type="text" value="" class="" name="addressObj.postCode" /></td>
          </tr>
          <tr>
            <td><label>First Name:</label>
            <input type="text" value="" class="" name="firstName" /></td>
            <td><label>Last Name:</label>
            <input type="text" value="" class="" name="lastName" /></td>
          </tr>
          <tr>
            <td><label>Primary Email Id:</label>
            <input type="text" value="" class="" name="primaryEmailId" /></td>
            <td><label>Secondary Email Id:</label>
            <input type="text" value="" class="" name="secondaryEmailId" /></td>
          </tr>
          <tr>
            <td><label>Primary Contact Number:</label>
            <input type="text" value="" class="" name="primaryPhoneNumber" /></td>
            <td><label>Secondary Contact Number:</label>
            <input type="text" value="" class="" name="secondaryPhoneNumber" /></td>
          </tr>
          <tr>
            <td><label>User Name:</label>
            <input type="text" value="" class="" name="loginObj.username" /></td>
            <td><label>Password:</label>
            <input type="text" value="" class="" name="loginObj.password" /></td>
          </tr>
          <tr>
            <td><label>Address Line 1:</label>
            <input type="text" value="" class="" name="addressObj.addressLine1" /></td>
            <td><label>Address line 2:</label>
            <input type="text" value="" class="" name="addressObj.addressLine2" /></td>
          </tr>
        </table>
      </div>
      <div id="create_footer"><input type="submit" value="Create" /></div>
    </form>
  </div>
  
     <div id='delete'>
    <form id="deletePopupFormId" action="javascript:editPopupForm()">
      <h1>Delete Property</h1>
      <div class="form-element">

      </div>
      <div id="delete_footer"><input id="delete_yes" type="button" value="Yes" style="background-color:#E33A0C"/>&nbsp&nbsp<input id="delete_no" type="button" value="No" /></div>
    </form>
  </div> 
  
  
  
  <script type="text/javascript">
  var table;
  var globalDataArr = [];
  $(document).ready(function(){
	  	
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable( {
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath +"/pmc/loadAllProperties.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			        columns: [
			            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            { data: "createdOn"},
			            { data: "contactPerson" },
			            { data: "addressObj.city" },
			            { data: "addressObj.addressLine1" },
			            { data: "uniqueReference" },
			            { data: "addressObj.postCode" },
			            { data: "statusPercentage" },
			        ],
			        "pageLength": 15,
			        
			        "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
			        	globalDataArr.push(aData);
			        	var propertyId =  aData.id;
			        	var htmlStr = '<div id="progressBar'+propertyId+'" class="round-pink1" ><div></div></div>';
				           $('td:eq(7)', nRow).html(htmlStr);
				          
		              	  $("td:first", nRow).html(iDisplayIndex +1);
			               return nRow;
				     }
			       
			    } );

			 $('#dataTableId').on('page.dt',function(){setTimeout(function(){setProgress(globalDataArr);},100);}).dataTable();
			 $('#dataTableId').on('draw.dt', function () {	setTimeout(function() { setProgress(globalDataArr);}, 100); });
			   
			$('#dataTableId tbody').on( 'click', 'tr', function () {
				progressBar(10, $('#progressBar'));
			    if ($(this).hasClass('selected')) {
			        $(this).removeClass('selected');
			        $.colorbox.remove();
			    }else {
			        table.$('tr.selected').removeClass('selected');
			        $(this).addClass('selected');
			    }
			} );
			$( "#viewButtonId" ).click(function() {
				var aData = table.row('.selected').data();
		          if(aData!=null){
		          $.ajax({
		        		url : contextPath+"/pmc/redirectPropertyDetails.htm",
		        		data: aData,
		        		method: "Post",
		        		contentType: "application/json",															
		        		success:function(data){
		        				$("#containerId").html(data);
		        				addPropertyDetails(aData.id);
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
						}, 2000);
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
					}, 2000);
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
			  

			$('#delete_no').click(function(){
				$.colorbox.close();
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
  
  
  function editPopupForm(){
	var aData = table.row('.selected').data();
  	var formData = form2object('editPopupForm', '.', true, function(node){
  				if (node.id && node.id.match(/callbackTest/)){
  					return { name: node.id, value: node.innerHTML };
  				}
  			});
  	formData.id = aData.id;
  	var jObj = JSON.stringify(formData, null, '\t');
  	$.ajax({
  		url: contextPath+"/pmc/updateProperty.htm",
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
  
  function createPopupForm(){
   var formData = form2object('createPopupFormId', '.', true, function(node){
  				if (node.id && node.id.match(/callbackTest/)){
  					return { name: node.id, value: node.innerHTML };
  				}
  			});
  	var jObj = JSON.stringify(formData, null, '\t');																				
  	console.log(jObj);
  	$.ajax({
  		
  		url:"pmc.htm?action=1&param=LANDLORD",
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
	
  $(function() {
	    $("#editPopupForm").validate({
	        rules: {
	        	"contactPerson": "required",
	        	"agentName": "required",
	        	"agentContactNumber" : {
	                required: true,
	                digits: true,
	                minlength :10
	            },
	        	"agentAddressLine"  : "required",
	        }
	    });
	  });

	$(function() {
	    $("#createPopupFormId").validate({
	        rules: {
	        	"firstName": "required",
	        	"lastName": "required",
	        	"primaryEmailId": {
	                required: true,
	                email: true
	            },
	        	"secondaryEmailId": {
	                required: true,
	                email: true
	            },
	        	"primaryPhoneNumber" : {
	                required: true,
	                digits: true,
	                minlength :10
	            },
	        	"secondaryPhoneNumber": {
	                required: true,
	                digits: true,
	                minlength :10
	            },
	        	"loginObj.username": "required",
	        	"loginObj.password": "required",
	        	"addressObj.addressLine1" : "required",
	        	"addressObj.addressLine2" : "required",
	        	"addressObj.postCode" : "required",
	        	"addressObj.city" : "required"
	        }
	    });
	  });
	
	function validateAOP(formId){
		  $(formId)[0].reset();
		  var validator = $(formId).validate();
		  validator.resetForm();
		  $("label.error").remove();
		  $(".error").removeClass();
} 
  </script>
</div>