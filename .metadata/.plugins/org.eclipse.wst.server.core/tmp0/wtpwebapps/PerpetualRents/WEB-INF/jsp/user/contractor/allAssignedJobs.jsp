	<script type="text/javascript">
		
		$(document).ready(function(){
			var view = ${view}; 
			 $.getJSON(contextPath+"/contractor/loadAllJobs?param="+view,
					    function(response, textStatus, jqXHR)
					    {
				  		var jobsList = $('#jobsList').empty();
				  		if (response.success == true) {
				            $.each(response.data, function(property, address, assignModel, files){
				            	jobsList.append($('<section/>').html(formatHtml(this.property, this.address, this.assignModel, this.files)));
				            });
				        }else{
				        	 $('#alertErrorId').show(200);
				    		 $("#errorMessageId").html("There is no jobs assigned yet.");
				        };
				  		
					   }).fail(function(jqXHR, textStatus, errorThrown)	{
					 console.log(errorThrown);
				}); 
		});
		
		function formatHtml(property, address, assignModel, files){
			
			var htmlStr = '<section id="job'+property.id +'" class="proj-box" onclick=fetchJobsDetail('+assignModel.id+');>';
			
						if(typeof files === "undefined"){
							htmlStr	+= '<img width="595" height="347" src="<%=request.getContextPath()%>/resource/images/contracter.jpg">';
						}else{
							var fPath = contextPath + "/" + files[0];
							htmlStr += '<img alt="Embedded Image" width="595" height="347" src="'+fPath+'" />';
						}
						
			htmlStr += '<div class="proj-disc">'
						+ '<h2>'+ property.uniqueReference +'</h2>'
						+ '<div class="clearfix"></div>'
						+ '<ul class="new-5">'
						+ '<li> Contact Person : &nbsp;  '+ property.contactPerson +'</li>'
						+ '<li> Status : &nbsp;'+ assignModel.statusStr +'</li>'
						+ '<li> City : &nbsp;'+ address.city +'</li>'
						+ '<li> Jobs Detail : &nbsp;'+ assignModel.jobName +'</li>'
						+ ' </ul>'
						+ ' </section>';
									
			return htmlStr;
		}
		
		function fetchJobsDetail(assignModelId){
			$.ajax({
			      url: contextPath+"/contractor/redirectJobDetails?assignModelId="+assignModelId,
			      type: "post",
			      success: function(data){
			    	  $("#containerId").html(data);
			      },
			      error:function(){
			          $("#containerId").html('There is error while submit');
			      }
			  });
		  }
		
	</script>
    <div class="row">
      <div class="span10">
        <h1 class="heading2 margin-top15">Assigned Jobs</h1>
         <div id="alertErrorId" class="alert alert-block alert-error fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true"  id="errorMessageId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
        <div class="clearfix"></div>
       	<div id="jobsList"></div>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
