<script type="text/javascript">
 $(document).ready(function(){
	 $.getJSON("contractor.htm?action=2&param=EXPERTISE-DATA",
			    function(response, textStatus, jqXHR)
			    {
		  		var expertiseList = $('#expertiseList');
		  		if (response.success == true) {
		            $.each(response.data, function(expertise){
		            	expertiseList.append($('<div/>').html(formatHtml(this.expertise)));
		            });
		        }else{
		        	 $('#alertErrorId').show(200);
		    		 $("#errorMessageId").html("There is no property registered yet.");
		        }
		  		
			   }).fail(function(jqXHR, textStatus, errorThrown)	{
			 console.log(errorThrown);
		});
	 
		  	$('.close').click(function () {
		  	    $('#alertSuccessId').hide(200);
		  	    $('#alertErrorId').hide(200);
		    }); 
		  	
		  	$('#alertSuccessId').hide(1000);
			$('#alertErrorId').hide(1000);
			
			
			function formatHtml(obj){
				
			var html = '<div class="rg-p_new">'+
						'<ul>' +
					 	'<li>' +
		          		'<span>Functionality</span><span>' + obj.functionality  + '</span>' +
		            	'<span>Total Experience</span><span>' + obj.experienceYears  + '</span>' +
		            	'<span>Qualification</span><span>' + obj.qualification  + '</span>'+
		            	'<span>Training Place</span><span>' + obj.trainingPlace  + '</span>' +
		            	'</li>'+
		            	'<div class="clearfix"></div>'+
		            	'<ul>'+
		            	'<table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		            	'<tr>'+
		             	'<td width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		               	'<tr>' +
		                '<th colspan="2" class="txt-al1">Reference - 1</th>'+
		                '</tr>'+
		                '<tr>'+
		                '<td width="50%" class="txt-al">Property Owner Name</td>'+
		                '<td width="50%" class="txt-al">' + obj.referenceOwnerName1  + '</td>'+
		                '</tr>'+
		                '<tr>'+
		                '<td width="50%" class="txt-al">Property Owner Contact No.</td>'+
		                '<td width="50%" class="txt-al">' + obj.referenceOwnercontact1  + '</td>'+      
		                '</tr>'+
		                '<tr>'+
		                '<td width="50%" class="txt-al">Job Completion Date</td>'+
		                '<td width="50%" class="txt-al">' + obj.referenceCompletionDate1  + '</td>'+
		                '</tr>'+
		                '</table></td>'+
		                '<td width="50%"><table width="100%" border="0" cellspacing="0" cellpadding="0">'+
		                '<tr>'+
		                '<th colspan="2" class="txt-al1">Reference - 1</th>'+
		                '</tr>'  +
		                '<tr>'+
		                '<td width="50%" class="txt-al">Property Owner Name</td>'+
		                '<td width="50%" class="txt-al">' + obj.referenceOwnerName2  + '</td>'+
		                '</tr>'+
		                '<tr>'+
			            '<td width="50%" class="txt-al">Property Owner Contact No.</td>'+
					    '<td width="50%" class="txt-al">' + obj.referenceOwnercontact2  + '</td>'+
			            '</tr>'+
		                '<tr>'+
		                '<td width="50%" class="txt-al">Job Completion Date</td>'+
		                '<td width="50%" class="txt-al">' + obj.referenceCompletionDate2  + '</td>'+
		                '</tr>'+
		                '</table></td>'+
		                '</tr>'+
		                '</table>'+
		              	'</ul>'+
		            	'</ul>'+
		            	'<a href="" style="float: right;">Edit</a>'+
		          		'<div class="clearfix"></div>'+
		          		'</div>';
		          		
		          return html;
			}
 }); 
 </script>

    <div class="row">
      <div class="span10">
        <h1 class="heading4 margin-top15">Welcome <span>Contractor</span></h1>
        <div class="clearfix"></div>
        <div id="expertiseList"></div>
        <a href="" style="float: right;"></a>
      </div>
      <div class="span2"> <img src="<%=request.getContextPath()%>/resource/images/banner.png" width="160" height="600" class="ad-ban" /> </div>
    </div>
