	var globalFileId;
	$(document).ready(function(){
		$(".close").click(function(){
			$("#alertSuccessId3").hide();
			$("#alertErrorId3").hide();
		});
		
		$("#removeOk").click(function(){
			$.getJSON(contextPath+"/contractor/removeFile.htm?fileId="+globalFileId,
				    function(response, textStatus, jqXHR){	
						if(response.success == true){
							$("#successMessageId4").html("Removed Successfully");
							$("#alertSuccessId4").show();
						}
				    }).fail(function(jqXHR, textStatus, errorThrown){
				 console.log(errorThrown);
			}); 
		});
	});
	//http://hayageek.com/jquery-ajax-form-submit/
	$("#certificateForm").submit(function(e){
	    var formObj = $(this);
	    var formURL = formObj.attr("action");
	    var formData = new FormData(this);
	    var uploadCertificate = $("#uploadCertificate").val();
		    if(uploadCertificate.length == 0 ){
		    	
		    	showErrorMessage("Please attach file", "250px");
		    	return false;
		    }
	    $.ajax({
	    	beforeSend: function(){
				$(".loader").css('height', $(document).height());
				$(".loader").css('display', 'block');				    
			},
		    url: formURL,
		    type: 'POST',
		    data:  formData,
		    mimeType:"multipart/form-data",
		    dataType : "json",
		    contentType: false ,
		    contentTransferEncoding: "base64",
	        cache: false,
	        processData:false,
	        success: function(response, textStatus, jqXHR){
	        	$(".loader").css('display', 'none');
	 			if(response.success == true || response.success == 'true'){
	 				showSuccessMessage("Successfully Uploaded", "250px");
	 				$("#certificateDivision").hide();
	 				$("#invoiceDivision").hide();
	 				setContractorDocuments(globalAssignModelId);
	 			}
	        },
		    error: function(jqXHR, textStatus, errorThrown){
		    	 
		     }          
	    });
	    e.preventDefault(); //Prevent Default action.
	    e.stopImmediatePropagation();
	}); 
	
$("#invoiceForm").submit(function(e){
    var formObj = $(this);
    var formURL = formObj.attr("action");
    var formData = new FormData(this);
    var uploadInvoice = $("#uploadInvoice").val();
    if(uploadInvoice.length == 0 ){
    	showErrorMessage("Please attach file", "250px");
    	return false;
    }
    $.ajax({
    	beforeSend: function(){
			$(".loader").css('height', $(document).height());
			$(".loader").css('display', 'block');				    
		},
	    url: formURL,
	    type: 'POST',
	    data:  formData,
	    mimeType:"multipart/form-data",
	    dataType : "json",
	    contentType: false,
        cache: false,
        processData:false,
        success: function(response, textStatus, jqXHR){
        	$(".loader").css('display', 'none');
 			if(response.success == true || response.success == 'true'){
 				showSuccessMessage("Successfully Uploaded", "250px");
 				$("#certificateDivision").hide();
 				$("#invoiceDivision").hide();
 				setContractorDocuments(globalAssignModelId);
 			}
        },
	    error: function(jqXHR, textStatus, errorThrown){
	    	 
	     }          
    });
    e.preventDefault(); //Prevent Default action.
    e.stopImmediatePropagation();
}); 

 function setContractorDocuments(assignModelId){
	  $.getJSON(contextPath+"/contractor/loadAllDocuments.htm?assignModelId="+assignModelId,
			    function(response, textStatus, jqXHR){	
		 		if(response.success == true){
		 			var documentList = response.data;
		 			var html = "";
		 			var i = 0;
		 			 $.each(documentList, function(documents, file){
		 				 if(i == 0){
		 					html += formatHtml1();
		 					html += formatHtml(this.documents, this.file);
		 				 } else
		 					 html += formatHtml(this.documents, this.file);
		 				 i++;
			          });
		 			$("#documentId").empty().html(html);
		 		}else{
		 			showErrorMessage("No Documents Uploaded Yet.", "250px");
		 		}
		 			
			    }).fail(function(jqXHR, textStatus, errorThrown)
			{
			 console.log(errorThrown);
		}); 
 }
 
 function formatHtml1(){
	 var htmlStr = '<tr style="width: 100%">'
		 		 + '<th style="width:20%">Name</th>'
                 + '<th style="width:20%">Uploaded On</th>'
                 + '<th style="width:20%">Status</th>'
                 + '<th style="width:20%">Document Type</th>'
                 + '<th style="width:20%">Action</th>'
                 + '</tr>';
	 
	 return htmlStr;
 	}
 
 function formatHtml(document, file){
	 globalFileId = file.id;
	 var htmlStr = '<tr>'
		 		 + '<td>' + file.fileName + '</td>'
	             + '<td>' + document.createdOn + '</td>'
	             + ' <td>' + document.documentTypeStr + '</td>'
	             + ' <td>' + document.statusStr + '</td>'
	             + '<td>'
	             + '<a href="javascript:downloadFile('+file.id+')" style="margin-top: 5px;"><img src="resource/images/downloadIcon.png"></a>'
	             + '&nbsp;&nbsp;&nbsp;&nbsp;'
	             + '<a id = "removehrefId" href="#" onclick ="div_show(removehrefId, rejectPopUp);" style="margin-top: 5px;display: none;"><img src="resource/images/removeIcon.png"></a>'
				 + '</td>'
				 + '</tr>';
				 
	return htmlStr;
 }
 
 function downloadFile(fileId){
	 window.location.href = contextPath+"/download/uploadedDocuments.htm?fileId="+fileId; 
 }
