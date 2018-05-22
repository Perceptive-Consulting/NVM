  var table;
  var globalDataArr = [];
  $(document).ready(function(){
		$.fn.dataTable.TableTools.defaults.aButtons = [];
		$.fn.dataTableExt.sErrMode = 'console';
		 table = $('#dataTableId').DataTable({
		        dom: 'Tfrtip',"ajax": {
		            "url": contextPath+"/admin/listPDProperty.htm",
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
		            { data: "addressObj.postCode" }
		        ],
		        "pageLength": 15,
		        fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("td:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            }
		    });	 
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
	  		    
  
  $( "#viewPDButtonId" ).click(function() {
      if(aData!=null){
      $.ajax({
    		url:contextPath+"/pmc/viewPropertyDeveloper.htm",
    		data: table.row('.selected').data(),
    		method: "Post",
    		contentType: "application/json",															
    		success:function(data){
    				$("#containerId").html(data);
    				pdProperty.Add(aData.id);
    				aData=null;
    	  },
    	  error: function(error){
				console.log(error);
				
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
  }); 