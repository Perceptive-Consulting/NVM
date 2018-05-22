  var aData;
  var table;
  $(document).ready(function(){
			$.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable(  {
			        dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/loadAllJobDetails.htm",
			            "type": "POST",
			            "dataType": "json"
			        },tableTools: {
			                "aButtons ": [
			                          ]
			        },
			       
			        columns: [
			            { data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            { data: "landlord.completeName"},
			            { data: "contractor.companyName" },
			            { data: "assignModel.jobName" },
			            { data: "assignModel.createdOn" },
			            { data: "assignModel.estimatedCompletionDate" },
			            { data: "assignModel.statusStr" },
			        ],
			        fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("td:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            }
			    } );	 
			$('#dataTableId tbody').on( 'click', 'tr', function (){
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
			
			
			$("#viewButtonId").click(function() {
		          if(aData != null){
			          var assignModelId = aData.assignModel.id;
			          globalPropertyId = assignModelId;
		          $.ajax({
		        		url:contextPath+"/admin/viewJobDetails.htm",
		        		method: "Post",
		        		contentType: "application/json",															
		        		success:function(response){
		        				$("#containerId").html(response);
		        				$("#headingId").html("Job Details");
		        				addJobDetails(assignModelId);
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
