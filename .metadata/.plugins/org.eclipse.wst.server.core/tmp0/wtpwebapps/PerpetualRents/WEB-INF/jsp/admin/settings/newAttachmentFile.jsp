<script src="<%=request.getContextPath()%>/resource/perpetual/admin/settings/attachmentFile.js"></script> 

<style>
.doc_download{
	display: none;
}
 	.heading{
		text-transform: uppercase;
		text-decoration: underline;
		font-size: 20px!important;
	}
		
</style>

 <div class="container-ar">
  <section class="contant-area">
    <div class="rgpinnew">
          <ul>
          <li><strong class="heading">Landlord Documents</strong></li>
            <li><strong>ADPL 1:</strong><samp>:</samp><span id="adpl1Id"></span>
           		 <h4><input type="button" id="adpl1UploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="adpl1DownloadBtn" name="edit" url = "" value="Download" class="doc_download" style="height: 20px;" /></h4>
            	<div id="adpl1Div" class="edit-prof" style="display:none;">
            	
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=1" id="uploadADPL1" enctype="multipart/form-data">
						  <input type="file" id = "uploadADPL1File" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadADPL1Lbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" id = "uploadADPL1Btn" class="uploadFiles" name="adpl1Div"  value ="Submit" >
				 </form>
            	</div>
            </li>
            
            <li><strong>ADPL 3:</strong><samp>:</samp><span id="adpl3Id"></span>
           		 <h4><input type="button" id="adpl3UploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="adpl3DownloadBtn" name="edit" value="Download" url = ""  class="doc_download" style="height: 20px;" /></h4>
            	<div id="adpl3Div" class="edit-prof" style="display:none;">
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=2" id="uploadADPL3" enctype="multipart/form-data">
						  <input type="file" id = "uploadADPL3File" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadADPL3Lbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" class="uploadFiles" id = "uploadADPL3Btn" name="adpl3Div"  value = "Submit" >
				 </form>
            	</div>
            </li>
            
            <li><strong>Bank Document:</strong><samp>:</samp><span id="bankDocumentId"> </span>
           		 <h4><input type="button" id="bankDocumentUploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="bankDocumentDownloadBtn" name="edit" value="Download" url = ""  class="doc_download" style="height: 20px;" /></h4>
            	<div id="bankDocumentDiv" class="edit-prof" style="display:none;">
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=3" id="uploadBankDocument" enctype="multipart/form-data">
						  <input type="file" id = "uploadBankDocumentFile" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadBankDocumentLbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" id = "uploadBankDocumentBtn" class="uploadFiles" name="bankDocumentDiv"  value = "Submit" >
				 </form>
            	</div>
            </li>
                      
            <li><strong>Terms and Conditions Document: </strong><samp>:</samp><span id="termsAndConditionId"></span>
           		 <h4><input type="button" id="termsAndConditionUploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="termsAndConditionDownloadBtn" name="edit" value="Download" url = ""  class="doc_download" style="height: 20px;" /></h4>
            	<div id="termsAndConditionDiv" class="edit-prof" style="display:none;">
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=4" id="uploadTermsAndConditions" enctype="multipart/form-data">
						  <input type="file" id = "uploadTermsAndConditionsFile" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadTermsAndConditionsLbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" id = "uploadTermsAndConditionsBtn" class="uploadFiles" name ="termsAndConditionDiv" value = "Submit"  >
				 </form>
            	</div>
            </li>
            
            <li><strong class="heading">Property Developer Documents</strong></li>
            <li><strong>Document 1:</strong><samp>:</samp><span id="pdDoc1Id"></span>
           		 <h4><input type="button" id="pdDoc1UploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="pdDoc1DownloadBtn" name="edit" url = "" value="Download" class="doc_download" style="height: 20px;" /></h4>
            	<div id="pdDoc1Div" class="edit-prof" style="display:none;">
            	
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=5" id="uploadPDDoc1" enctype="multipart/form-data">
						  <input type="file" id = "uploadPDDocFile1" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadPDDoc1Lbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" id = "uploadDocBtn1" class="uploadFiles" name="adpl1Div"  value ="Submit" >
				 </form>
            	</div>
            </li>
            
            <li><strong>Document 2:</strong><samp>:</samp><span id="pdDoc2Id"></span>
           		 <h4><input type="button" id="pdDoc2UploadBtn" name="edit" value="Upload" class="doc_upload" style="height: 20px;" /></h4>
           		 <h4><input type="button" id="pdDoc2DownloadBtn" name="edit" url = "" value="Download" class="doc_download" style="height: 20px;" /></h4>
            	<div id="pdDoc2Div" class="edit-prof" style="display:none;">
            	
            	<form action="${contextPath}/admin/uploadFiles.htm?adminDocumentId=6" id="uploadPDDoc2" enctype="multipart/form-data">
						  <input type="file" id = "uploadPDDocFile2" name = "uploadedFile" value = "Select File"/> <br>
						   <label id="uploadPDDoc2Lbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; "></label>
						  <input type="button" id = "uploadDocBtn2" class="uploadFiles" name=""  value ="Submit" >
				 </form>
            	</div>
            </li>
            
          </ul>
          <div class="clearfix"></div>
        </div>    
  </section>
  </div>