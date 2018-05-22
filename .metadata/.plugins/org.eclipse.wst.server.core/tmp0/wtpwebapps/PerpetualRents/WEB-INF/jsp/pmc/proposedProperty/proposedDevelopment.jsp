<%--  <script src="<%=request.getContextPath()%>/resource/perpetual/pmc/proposedDevelpment/proposedProperty.js"></script>  --%>
<div class="container">
  <sections class="contant-area">
    <div class="button">
    <button id="viewPDButtonId">View</button>
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
        </tr>
    </thead>
   </table>
  </sections>
</div>

  <div>
  <script type="text/javascript">
  var table;
  var globalDataArr = [];
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable( {
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath +"/pmc/loadAllpdProperties.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			        columns: [
			            { data: null, orderable: false },
			            { data: "createdOn"},
			            { data: "contactPerson" },
			            { data: "addressObj.city" },
			            { data: "addressObj.addressLine1" },
			            { data: "uniqueReference" },
			            { data: "addressObj.postCode" },
			        ],
			        "pageLength": 15,
			        
			        "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {

		              	  $("td:first", nRow).html(iDisplayIndex +1);
			               return nRow;
				     }
			    } );
   
			$('#dataTableId tbody').on( 'click', 'tr', function () {
			    if ($(this).hasClass('selected')) {
			        $(this).removeClass('selected');
			        $.colorbox.remove();
			    }else {
			        table.$('tr.selected').removeClass('selected');
			        $(this).addClass('selected');
			    }
			} );
  }); 
  

  $( "#viewPDButtonId").click(function() {
		try{ 
			var pmcId = table.row('.selected').data().id;
		}catch (e) {
			$("#commonMessageErrorId").html("Please select a row to view");
			$("#commonMessageErrorId").fadeIn();
			setTimeout(function(){
				$("#commonMessageErrorId").fadeOut(4000);
			}, 2000);
			return false;
		}
        $.ajax({
      		url : contextPath+"/pmc/viewPropertyDeveloper.htm",
      		method: "Post",
      		contentType: "application/json",															
      		success:function(response){
      				$("#containerId").html(response);
      				pdProperty.Add(pmcId);
      				
      	  },
      	  error: function(error){
  				console.log(error);
  				alert(error);
  	  }});
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