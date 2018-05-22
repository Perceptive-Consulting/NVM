  var id ;
  $(document).ready(function(){
	/*------------------------*/  
	  loadFiles();
	  $('#adpl1UploadBtn, #uploadADPL1Btn').click(function(){
		  $("#adpl1Div").toggle();
	  });
	  $('#adpl3UploadBtn, #uploadADPL3Btn').click(function(){
		  $("#adpl3Div").toggle();
	  });
	  $('#bankDocumentUploadBtn, #uploadBankDocumentBtn').click(function(){
		  $("#bankDocumentDiv").toggle();
	  });
	  $('#termsAndConditionUploadBtn, #uploadTermsAndConditionsBtn').click(function(){
		  $("#termsAndConditionDiv").toggle();
	  });
	  $('#pdDoc1UploadBtn, #uploadDocBtn1').click(function(){
		  $("#pdDoc1Div").toggle();
	  });
	  $('#pdDoc2UploadBtn, #uploadDocBtn2').click(function(){
		  $("#pdDoc2Div").toggle();
	  });
	  
	  $('#adpl1DownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  $('#adpl3DownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  $('#bankDocumentDownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  $('#termsAndConditionDownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  $('#pdDoc1DownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  $('#pdDoc2DownloadBtn').click(function(){
		  var href = $(this).attr('url');
		  window.location.href=href;
	  });
	  
	  
  });
  
  function loadFiles(){
	  $.ajax({
	      url: contextPath+"/admin/loadFileData.htm",
	      type: "post",
	      contentType: "application/json",
	      dataType: "json",
	      success: function(response){
	    	  
	    	  var status = response.success;
	    	  var obj = response.data;
	    	  if(status == true || status == 'true'){
	    		  $("#adpl1Id").html(obj.adpl1Name);
	    		  $("#adpl3Id").html(obj.adpl3Name);
	    		  $("#bankDocumentId").html(obj.bankDocumentName);
	    		  $("#termsAndConditionId").html(obj.termsAndConditionName);
	    		  $("#pdDoc1Id").html(obj.pdDeveloperDoc1Name);
	    		  $("#pdDoc2Id").html(obj.pdDeveloperDoc2Name);
	    		  
	    		  if(obj.adpl1Id != undefined && obj.adpl1Id.length != 0){
	    			  $("#adpl1DownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.adpl1Id;
	    			  $("#adpl1DownloadBtn").attr("url",href);
	    			  
	    		  }
	    		  
	    		  if(obj.adpl3Id != undefined && obj.adpl3Id.length != 0){
	    			  $("#adpl3DownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.adpl3Id;
	    			  $("#adpl3DownloadBtn").attr("url",href);
	    			  
	    		  }
	    		  
	    		  if(obj.bankDocumentId != undefined && obj.bankDocumentId.length != 0){
	    			  $("#bankDocumentDownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.bankDocumentId;
	    			  $("#bankDocumentDownloadBtn").attr("url",href);
	    			  
	    		  }
	    		  
	    		  if(obj.termsAndConditionId != undefined && obj.termsAndConditionId.length != 0){
	    			  $("#termsAndConditionDownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.termsAndConditionId;
	    			  $("#termsAndConditionDownloadBtn").attr("url",href);
	    			  
	    		  }
	    		  
	    		  if(obj.pdDeveloperDoc1Id != undefined && obj.pdDeveloperDoc1Id.length != 0){
	    			  $("#pdDoc1DownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.pdDeveloperDoc1Id;
	    			  $("#pdDoc1DownloadBtn").attr("url",href);
	    			  
	    		  }
	    		  
	    		  if(obj.pdDeveloperDoc2Id != undefined && obj.pdDeveloperDoc2Id.length != 0){
	    			  $("#pdDoc2DownloadBtn").show();
	    			  var href = contextPath + "/download/uploadedDocuments?fileId="+obj.pdDeveloperDoc2Id;
	    			  $("#pdDoc2DownloadBtn").attr("url",href);
	    			  
	    		  }
	    	  }
	        },
	      error:function(){
	    	  $("errorId").show();
	      }
	 });
	}
  
  $(".uploadFiles").click(function(){
	  var contaierId = $(this).attr('name');
	  var form = $(this).parent('form');  
	  var file = $(this).parent().children(":file").val(); 
	  
	  if(file == "" ){
		 $(this).prev('label').html("Please select a file.").show(); return false;	 
	  }else{
		  $(this).prev('label').empty().hide();
		  
		   var iframe = $('<iframe name="postiframe" id="postiframe" style="display: none"></iframe>'); 
		   $(this).parent().append(iframe);
           //var form = $('#uploadADPL1');
           form.attr("action", form.attr('action'));
           form.attr("method", "post");
           form.attr("encoding", "multipart/form-data");
           form.attr("enctype", "multipart/form-data");
           form.attr("target", "postiframe");
           form.attr("file", $('#uploadADPL1File').val());
           form.submit();
           
            $(".loader").css('height', $(document).height());
			$(".loader").css('display', 'block');	
			
           $("#postiframe").load(function () {
        	  
            if ($("#postiframe").contents().find('pre').length){ 
             var preresponse = $("#postiframe").contents().find('pre').text();
			} else{
			var preresponse = $("#postiframe").contents().find('body').text();
			}
             //var preresponse = this.contentWindow.document.body.innerHTML.replace('(<pre style="word-wrap: break-word; white-space: pre-wrap;">','').replace('</pre>)','');  
				//alert(preresponse);return false;
	        	var jsonvar =  JSON.stringify(eval("("+preresponse+")")); 
	        	var response = JSON.parse(jsonvar); 
	        	$(".loader").css('display', 'none');
	        	
	 			if(response.success == true || response.success == 'true'){
	 			    $("#"+contaierId).hide();
	 				loadFiles();
	 				$("#commonMessageErrorId").empty().hide();
					$("#commonMessageSuccessId").show();
				    $("#commonMessageSuccessId").fadeOut(4000);
					
	 			}
	 			else if(response.sizeError == false || response.sizeError == 'false'){
	 				$("#"+contaierId).show();
	 				loadFiles();
	 				showErrorMessage("Max size is 5Mb", "55px");
	 			}
           });
	  }
	  
  });