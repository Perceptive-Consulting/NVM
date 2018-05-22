<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorDetailsStep4.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 	$('.effect').click(function(){
			$(this).addClass('add-effect');
		});
		$('.effect').blur(function(){
			$(this).removeClass('add-effect');
		});
		
	$('.edit').click(function(){ 
	   $(this).closest('tr').children('td:nth-child(2)').show();
	});
	
	$('.cancel').click(function(){ 
	   $(this).closest('td').fadeOut('.edit-prof');
	});
  	$('.close').click(function () {
  	    $('#alertSuccessId').hide(200);
  	    $('#alertErrorId').hide(200);
    }); 
	$('#alertSuccessId').hide(1000);
	$('#alertErrorId').hide(1000);
	
	 new JsDatePick({
			useMode:2,
			target:"signedDate",
			dateFormat:"%d-%M-%Y",
			//limitToToday:true,
		 });
 }); 
 </script>
 
 <style>
	.breadcrumb a { width:173px!important;}
</style>
<div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        
       <div class="breadcrumb">
            <a href="#" id="generalInfo">Step 1</a>
             <a href="#" id="contractorProfileStep2">Step 2</a>
             <a href="#" id="contractorProfileStep3" >Step 3</a>
             <a href="#" id="contractorProfileStep4" class="active">Step 4 </a>
        </div> 
		<div class="contractor-sec">
        	<form id="fContractorRegStep3">
              <ul class="menu">
           		<li>
              <ul>
                <li>
                  <div class="rg-p">
                    <h1 class="heading3 margin-top15">REFERENCES</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                  <p>Please give details of three organisations that we may approach for reference purposes. These should normally be organisations for which you or your company have carried out similar work to that which you have listed in your response to question<br /></p>
                                         <label>Reference 1: </label><h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                         <div class="form-fields">
                                            <ul>
                                            	<li><span>Name and address of referee:</span> <span id="referenceAddress1Str"></span></li>
                                            	<li><span>Contact name and telephone number: </span> <span id="referenceContact1Str"></span></li>
                                            	<li style="width: 97%!important;"><span>Brief Descripton : </span> <span id="description1Str"></span> </li>
                                            </ul>
                                        </div>
                                  </div> 
                                  </td>
                                  <td class="new-l edit-prof" style="display:none;" id="referenceAddress1Division">
                               	  <div class="wd-92">
                                        <label>Reference 1: </label>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Name and address of referee: <textarea id="referenceAddress1" name="referenceAddress1" placeholder="" class="effect" style="width: 180px;"></textarea></li>
                                            	<li>Contact name and telephone number: <textarea id="referenceContact1" name="referenceContact1" placeholder="" class="effect"  style="width: 180px;"></textarea></li>
                                            	<li style="width: 97%!important;">Brief description of work undertaken:<textarea id="description1" name="description1" placeholder="" class="effect" style="width: 100%; float: left;"></textarea></li>
                                            </ul>
                                        </div>
                                        <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('referenceAddress1,referenceContact1,description1');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div> 
                                  </td>
                                 </tr>
                                <tr>
                               	<td class="new-l">
                               	  <div class="wd-92">
                                         <label>Reference 2: </label><h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                         <div class="form-fields">
                                            <ul>
                                            	<li><span>Name and address of referee:</span> <span id="referenceAddress2Str"></span></li>
                                            	<li><span>Contact name and telephone number: </span> <span id="referenceContact2Str"></span></li>
                                            	<li style="width: 97%!important;"><span>Brief Descripton : </span> <span id="description2Str"></span> </li>
                                            </ul>
                                        </div>
                                  </div> 
                                  </td>
                                  <td class="new-l edit-prof" style="display:none;" id="referenceAddress2Division">
                               	  <div class="wd-92">
                                        <label>Reference 2: </label>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Name and address of referee: <textarea id="referenceAddress2" name="referenceAddress2" placeholder="" class="effect"  style="width: 180px;"></textarea></li>
                                            	<li>Contact name and telephone number: <textarea id="referenceContact2" name="referenceContact2" placeholder="" class="effect"  style="width: 180px;"></textarea></li>
                                            	<li style="width: 97%!important;">Brief description of work undertaken:<textarea id="description2" name="description2" placeholder="" class="effect" style="width: 100%; float: left;"></textarea></li>
                                            </ul>
                                        </div>
                                        <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('referenceAddress2,referenceContact2,description2');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div> 
                                  </td>
                                 </tr>
                                 <tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                         <label>Reference 3: </label><h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                         <div class="form-fields">
                                            <ul>
                                            	<li><span>Name and address of referee:</span> <span id="referenceAddress3Str"></span></li>
                                            	<li><span>Contact name and telephone number: </span> <span id="referenceContact3Str"></span></li>
                                            	<li style="width: 97%!important;"><span>Brief Descripton : </span> <span id="description3Str"></span> </li>
                                            </ul>
                                        </div>
                                  </div> 
                                  </td>
                                  <td class="new-l edit-prof" style="display:none;" id="referenceAddress3Division">
                               	  <div class="wd-92">
                                        <label>Reference 3: </label>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Name and address of referee: <textarea id="referenceAddress3" name="referenceAddress3" placeholder="" class="effect"  style="width: 180px;"></textarea></li>
                                            	<li>Contact name and telephone number: <textarea id="referenceContact3" name="referenceContact3" placeholder="" class="effect"  style="width: 180px;"></textarea></li>
                                            	<li style="width: 97%!important;">Brief description of work undertaken:<textarea id="description3" name="description3" placeholder="" class="effect" style="width: 100%; float: left;"></textarea></li>
                                            </ul>
                                        </div>
                                        <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('referenceAddress3,referenceContact3,description3');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div> 
                                  </td>
                                 </tr>
                               <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Do you/ your company have any external health and safety accreditation (e.g. Contractor Health and Safety Scheme, Safe Contractor etc.)?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="externalHealthAndSafetyAccrediationResStr"></strong>
                                   		 </div>
                                   		 <div class="">
                                         		<p style="width:100%; float:left;" id="externalHealthAndSafetyAccrediationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;" id="externalHealthAndSafetyAccrediationDivision">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have any external health and safety accreditation (e.g. Contractor Health and Safety Scheme, Safe Contractor etc.)?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="externalHealthAndSafetyAccrediation1" value="true" class="" name="externalHealthAndSafetyAccrediation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="externalHealthAndSafetyAccrediation1" value="false" class=""  name="externalHealthAndSafetyAccrediation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="externalHealthAndSafetyAccrediationYes">
                                         	<label for="c4">If YES, please give brief details.</label>
                                            <textarea id="externalHealthAndSafetyAccrediationComments" name="externalHealthAndSafetyAccrediationComments" class="effect" style="width: 630px!important;" ></textarea>
                                         </div>
                                          <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('externalHealthAndSafetyAccrediation,externalHealthAndSafetyAccrediationComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div>   
                               </td>
                          </tr>                                       
                    </table>
                    
                    <h1 class="heading3 margin-top15">ADDITIONAL INFORMATION</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               <div class="wd-92">
                               <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                               	<p><h3>Please use this section to provide any additional information that is relevant to your application, including any added value that you/ your company can provide. </h3></p>
                               	  <div class="wd-92">
                                        <div style="width:100%; float:left;">
                                           <p id="additionalInformationStr"><br /></p>
                                         </div>
                                  </div> 
                                </div>  
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;" id="additionalInformationDivision">
                               	<p><h3>Please use this section to provide any additional information that is relevant to your application, including any added value that you/ your company can provide.</h3> </p>
                               	  <div class="wd-92">
                                        <div class="for-se wid" style="clear:both;">
                                           <textarea name="additionalInformation" id="additionalInformation" class="effect" style="width: 870px!important; height: 60px!important;" ></textarea>
                                         </div>
                                        <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('additionalInformation');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div> 
                               </td>
                            </tr>             
                        </table>
                        
                      <h1 class="heading3 margin-top15">DECLARATION</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                                <div class="wd-92">
                               <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                               	<p>This declaration should be signed by the Managing Director, Senior Partner or other senior representative of the company authorised to do so.<br /><br />I have checked that all questions have been answered and that the answers given are, to the best of my knowledge, correct.</p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul style="display: blo">
                                            	<li><span>Signed By:</span><span id="signedByStr"></span> </li>
                                            	<li><span>Date:</span> <span id="signedDateStr"></span></li>
                                            	<li><span>Name (in capital letters):</span> <span id="signeeNameStr"></span></li>
                                                <li><span>Position in the company:</span> <span id="signeePositionStr"></span></li>
                                                <li><span>Telephone number:</span> <span id="signeePhoneNumberStr"></span></li>
                                                 <li><span>Alternate number:</span> <span id="signeeAlternatePhoneNumberStr"></span></li>
                                                <li><span>Email address:</span> <span id="signeeEmailAddressStr"></span></li>                           
                                            </ul>
                                        </div>
                                  </div> 
                                  </div>  
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="signedByDivision">
                               	<p>This declaration should be signed by the Managing Director, Senior Partner or other senior representative of the company authorised to do so.<br /><br />I have checked that all questions have been answered and that the answers given are, to the best of my knowledge, correct.</p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Signed By: <input type="text" id="signedBy" name="signedBy" placeholder="" class="effect"  maxlength="150" /></li>
                                            	<li><span style="float: left;">Date: </span><input type="text" id="signedDate" name="signedDate" style="margin-left: 21px; margin-right: -128px;" placeholder="" class="effect" readonly="readonly" /></li>
                                            	<li>Name (in capital letters): <input type="text" id="signeeName" name="signeeName" placeholder="" class="effect"  maxlength="150" style="text-transform: uppercase;"/></li>
                                                <li>Position in the company: <input type="text" id="signeePosition" name="signeePosition" placeholder="" class="effect"  maxlength="150"/></li>
                                                <li>Telephone number: <input type="text" id="signeePhoneNumber" name="signeePhoneNumber" placeholder="" class="effect"  maxlength="15"/></li>
                                                 <li>Alternate number: <input type="text" id ="signeeAlternatePhoneNumber" name="signeeAlternatePhoneNumber" placeholder="" class="effect" maxlength="15"/></li>
                                                <li>Email address:<input type="text" id="signeeEmailAddress" name="signeeEmailAddress" placeholder="" class="effect"  maxlength="40"/></li>                           
                                            </ul>
                                           <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('signedBy,signedDate,signeeName,signeePosition,signeePhoneNumber,signeeAlternatePhoneNumber,signeeEmailAddress');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                       		</div>
                                        </div>
                                    </div>   
                               </td>
                            </tr>    
                            <tr>
                               <td class="new-l">
                                <div class="wd-92">
                               <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                               	<p>Contact person for any queries relating to this application (if different to above):</p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul>
                                            	<li><span>Name (in capital letters):</span> <span id="contactPersonNameStr"></span> </li>
                                            	<li><span>Position in the company: </span><span id="contactPersonPositionStr"></span> </li>
                                                <li><span>Telephone number:</span> <span id="contactPersonTelephoneNumberStr"></span></li>
                                                <li><span>Email address:</span> <span id="contactPersonEmailAddressStr"></span></li>                           
                                            </ul>
                                        </div>
                                        <p>Please note your prices will not be disclosed to any other parties but will be used by us for comparative purposes in house, however, we are mindful that to operate one must make a profit.</p>
                                  </div>   
                                  </div>
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="contactPersonNameDivision">
                               	<p>Contact person for any queries relating to this application (if different to above):</p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Name (in capital letters): <input type="text" id="contactPersonName" name="contactPersonName" placeholder="" class="effect" style="text-transform: uppercase;" /></li>
                                            	<li>Position in the company: <input type="text" id="contactPersonPosition" name="contactPersonPosition" placeholder="" class="effect" /></li>
                                                <li>Telephone number: <input type="text" id="contactPersonTelephoneNumber" name="contactPersonTelephoneNumber" placeholder="" class="effect" /></li>
                                                <li>Email address: <input type="text" id="contactPersonEmailAddress" name="contactPersonEmailAddress" placeholder="" class="effect"/></li>                           
                                            </ul>
                                             <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('contactPersonName,contactPersonPosition,contactPersonTelephoneNumber,contactPersonEmailAddress');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                       		</div>
                                        </div>
                                        <p>Please note your prices will not be disclosed to any other parties but will be used by us for comparative purposes in house, however, we are mindful that to operate one must make a profit.</p>								
                                  </div>   
                               </td>
                            </tr>             
                        </table>   
                  </div>
                </li>
              </ul>
            </li>
            </ul>
            
             <input type="button" id="contractorInfoStep4SubmitBtn" value="Submit" class="regis-co"/>
             <input type="button" id="contractorInfoStep3PreviousBtn" value="<< Previous" class="regis-co"/>
          </form>
        </div>
      </div>
    </div>
    
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>