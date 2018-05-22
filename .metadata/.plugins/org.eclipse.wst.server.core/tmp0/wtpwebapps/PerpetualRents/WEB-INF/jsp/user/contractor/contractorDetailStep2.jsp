<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorDetailsStep2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 	$('.effect').click(function(){
			$(this).addClass('add-effect')
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
			target:"insauranceCoverExpiryDate",
			dateFormat:"%d-%M-%Y",
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
            <a href="#" id="contractorProfileStep2" class="active">Step 2</a>
            <a href="#" id="contractorProfileStep3" >Step 3</a>
            <a href="#" id="contractorProfileStep4" >Step 4 </a>
        </div> 
		<div class="contractor-sec">
        	<form id="fContractorRegStep2">
              <ul class="menu">
           		 <li> 
                  <ul>
                    <li>
                      <div class="rg-p">
                      	 <h1 class="heading3 margin-top15">Contractor Details</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	 <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                              		 <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                      <h3>Registered office</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li><span>Address Line1:</span> <span id="oAddressLine1Str"></span></li>
                                                <li><span>Address Line2:</span> <span id="oAddressLine2Str"></span></li>
                                                <li><span>City:</span> <span id="oCityStr"></span></li>
                                                <li><span>County: </span><span id="oCountyStr"></span></li>                                                
                                                <li><span>Postcode:</span><span id="oPostCodeStr" style="text-transform: uppercase;"></span></li>  
                                                <li><span>Telephone number:</span> <span id="oPhoneNumberStr"></span></li>
                                            </ul>
                                        </div>
                                   </div>   
                                </td>
                                
                                <td class="new-l edit-prof" style="display:none;" id="officeAddressDivisionId">
                                  <div class="wd-92">
                                      <h3>Registered office</h3>
                                       <div id="officeAddressId" class="form-fields">
                                        <input type="hidden" value="" name="id" id="oId" />
                                        <input type="hidden" value="1" name="objectType" id="" />
                                            <ul>
                                                <li>Address Line1: <input type="text" name="addressLine1" id="oAddressLine1" placeholder="" class="effect"  maxlength="150"/></li>
                                                <li>Address Line2: <input type="text" name="addressLine2" id="oAddressLine2" placeholder="" class="effect" maxlength="150"/></li>
                                                <li>City: <input type="text" name="city" id="oCity" placeholder="" class="effect"  maxlength="150"/></li>
                                                <li>County: <input type="text" name="county" id="oCounty" placeholder="" class="effect" maxlength="150"/></li>                                                
                                                <li>Postcode:<input type="text" name="postCode" id="oPostCode" placeholder="" class="effect" maxlength="150" style="text-transform: uppercase;"/></li>  
                                                <li>Telephone number: <input type="text" name="telephoneNumber" id="oPhoneNumber" placeholder=""  class="effect" maxlength="150"/></li>
                                                <li><input type="button" id="officeAddressBtn" value="Update"/><input type="button" name="" value="Cancel" class="cancel" maxlength="150"/></li>
                                            </ul>
                                        </div>
                                   </div>   
                                </td>
                            </tr>
                            
                           <tr>
                            	<td class="new-l">
                                   <div class="wd-92">                                   
                              		 <h4><input type="button" name="edit" value="Edit" class="edit"/></h4>
                                      <h3>Office for correspondence</h3><br></br>
                                      <h5 style="margin-top: -9px; margin-bottom: 35px;"></h5>
                                        <div class="form-fields">
                                            <ul>
                                               <li><span>Address Line1:</span> <span id="cAddressLine1Str"></span></li>
                                                <li><span>Address Line2:</span> <span id="cAddressLine2Str"></span></li>
                                                <li><span>City:</span> <span id="cCityStr"></span></li>
                                                <li><span>County: </span><span id="cCountyStr"></span></li>                                                
                                                <li><span>Postcode:</span><span id="cPostCodeStr" style="text-transform: uppercase;"></span></li>  
                                                <li><span>Telephone number:</span> <span id="cPhoneNumberStr"></span></li>                              
                                            </ul>
                                        </div>
                                   </div>   
                                 </td>
                                 
                                 <td class="new-l edit-prof" style="display:none;" id="correspondenceAddresssDivisionId">
                                   <div class="wd-92" >
                                      <h3>Office for correspondence</h3><br></br>
                                      <h5 style="margin-top: -9px; margin-bottom: 35px;"></h5>
                                        <div id="correspondenceAddresssId" class="form-fields">
                                        	<input type="hidden" value="" name="id" id="cId">
                                        	<input type="hidden" value="2" name="objectType" id="" />
                                            <ul>
                                               <li>Address Line1: <input type="text" name="addressLine1" id="cAddressLine1" placeholder="" class="effect" /></li>
                                               <li>Address Line2: <input type="text" name="addressLine2" id="cAddressLine2" placeholder="" class="effect" /></li>
                                               <li>City: <input type="text" name="city" id="cCity" placeholder="" class="effect" /></li>
                                               <li>County: <input type="text" name="county" id="cCounty" placeholder="" class="effect"/></li>                                                
                                               <li>Postcode:<input type="text" name="postCode" id="cPostCode" placeholder="" class="effect" style="text-transform: uppercase;" /></li>  
                                               <li>Telephone number: <input type="text" name="telephoneNumber" id="cPhoneNumber" placeholder=""  class="effect"/></li>
                                               <li><input type="button" value="Update" id="correspondenceAddresssBtn"/><input type="button" name="" value="Cancel" class="cancel"/></li>                                
                                            </ul>
                                        </div>
                                   </div>   
                                 </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                               	  <div class="wd-92">                                   
                              		 <h4><input type="button" name="edit" value="Edit" class="edit" id="companyType" /></h4>
                                      <h3>Company Type</h3>
                                            <p style="width:100%; float:left;" id="companytypeStr"></p>
                                   </div>  
                                </td>
                                
                                <td class="new-l edit-prof" style="display:none;" id="companyTypeIdDivision">
                               	  <div class="wd-92 for-se wid">
                                      <h3>Company Type</h3>
                                            <select name="companyTypeId" class="chosen-select" style="width:350px;" tabindex="4" id="companyTypeId">
									        </select>
									        <input type="button" value="Update" class="companyTypeBtnClass" onclick="updateData('companyTypeId');" /><input type="button" name="" value="Cancel" class="cancel companyTypeBtnClass"/>
									        <div class="for-se wid" id="otherCompanyTypeDiv" style="display: none; width: 50%;">
                                      			 <label>Please specify other</label>
                                      			 <input type="text" id="otherCompanyType" class="effect" name="otherCompanyType" maxlength="150"/>
                                      			 <input type="button" value="Update" id="" onclick="updateData('companyTypeId,otherCompanyType');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                  			 </div>
                                            
                                   </div>  
                                   
                                </td> 
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor</h3>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="allDirectorsOfCompanyStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l edit-prof" style="display:none;" id="allDirectorsOfCompanyDivision">
                                  <div class="wd-92">
                                    <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor</h3>
                                         <div class="for-se wid" id="">
                                            <textarea id="allDirectorsOfCompany" name="allDirectorsOfCompany" rows="5" cols="20" style="width:610px;height: 80px;" class="effect" value="" maxlength="1000"></textarea>
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	<input type="button" value="Update" onclick="updateData('allDirectorsOfCompany');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            
                             <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Have any of the persons named above in been subject to bankruptcy proceedings or been involved in a company that has been subject to liquidation proceedings or had receivers appointed?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="bankruptcyProceedingsResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="bankruptcyProceedingscommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l edit-prof" style="display:none;" id="bankruptcyProceedingsDivision">
                                  <div class="wd-92">
                                    <h3>Have any of the persons named above in been subject to bankruptcy proceedings or been involved in a company that has been subject to liquidation proceedings or had receivers appointed?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="bankruptcyProceedings1" class="effect" value="true" name="bankruptcyProceedings" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="bankruptcyProceedings2" class="effect"  value="false" name="bankruptcyProceedings" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="bankruptcyProceedingsYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below</label>
                                            <input type="text" id="bankruptcyProceedingsComments" name="bankruptcyProceedingsComments" class="effect"  />
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	<input type="button" value="Update" onclick="updateData('bankruptcyProceedings, bankruptcyProceedingsComments');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Have any persons named above been convicted of any criminal offence other than minor traffic offences?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="convictedToCriminalOffenceResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="convictedToCriminalOffenceCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l edit-prof" style="display:none;" id="convictedToCriminalOffenceDivision">
                                  <div class="wd-92">
                                    <h3>Have any persons named above been convicted of any criminal offence other than minor traffic offences?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="convictedToCriminalOffence1" class="effect" value="true" name="convictedToCriminalOffence" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="convictedToCriminalOffence2" class="effect"  value="false" name="convictedToCriminalOffence" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="convictedToCriminalOffenceYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                            <input type="text" id="convictedToCriminalOffenceComments" name="convictedToCriminalOffenceComments" class="effect"  />
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	<input type="button" value="Update" onclick="updateData('convictedToCriminalOffence, convictedToCriminalOffenceComments');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Are any of the persons named above related to a member of Ashantidutch Property letting or any UK charities  staff or one of its trustees?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c; " id="trusteeOfAshantiDutchResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="trusteeOfAshantiDutchcommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l edit-prof" style="display:none;" id="trusteeOfAshantiDutchDivision">
                                  <div class="wd-92">
                                    <h3>Are any of the persons named above related to a member of Ashantidutch Property letting or any UK charities  staff or one of its trustees?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="trusteeOfAshantiDutch1" class="effect" value="true" name="trusteeOfAshantiDutch" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="trusteeOfAshantiDutch2" class="effect"  value="false" name="trusteeOfAshantiDutch" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="trusteeOfAshantiDutchYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                            <input type="text" id="trusteeOfAshantiDutchComments" name="trusteeOfAshantiDutchComments" class="effect"  />
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	<input type="button" value="Update" onclick="updateData('trusteeOfAshantiDutch, trusteeOfAshantiDutchComments');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            
                             <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  	<h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Name and registered address of parent or ultimate holding company (if applicable)</h3>
                                    <div class="">
                                   		<p style="width:100%; float:left; " id="parentCompanyAddressStr"></p>
                                    </div>
                                  </div>   
                               </td>
                               
                                <td class="new-l  edit-prof" style="display:none;" id="parentCompanyAddressDivision">
                                  <div class="wd-92">
                                    <h3>Name and registered address of parent or ultimate holding company (if applicable)</h3>
                                    <div class="for-se wid">
                                   		<textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150"></textarea>
                                         <div style="width:100%" class="for-se wid">
                                         <input type="button" value="Update" onclick="updateData('parentCompanyAddress');"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Company registration number of parent or ultimate holding company (if applicable)</h3>
                                    <div class="for-se wid">
                                       <p id="companyRegisterationNumberStr"></p>
                                    </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="companyRegisterationNumberDivision">
                                  <div class="wd-92">
                                    <h3>Company registration number of parent or ultimate holding company (if applicable)</h3>
                                    <div class="for-se wid">
                                       <input type="text" id="companyRegisterationNumber" class="effect" name="companyRegisterationNumber" maxlength="150" />
                                       <input type="button" value="Update" onclick="updateData('companyRegisterationNumber');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                    </div>
                                  </div>   
                               </td>
                               
                           </tr>
                             <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Are you/ your company registered with any trade bodies (e.g. NICEIC)?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="registeredWithTradeBodiesResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="registeredWithTradeBodiescommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l edit-prof" style="display:none;" id="registeredWithTradeBodiesDivision">
                                  <div class="wd-92">
                                    <h3>Are you/ your company registered with any trade bodies (e.g. NICEIC)?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="registeredWithTradeBodies1" class="effect" value="true" name="registeredWithTradeBodies" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="registeredWithTradeBodies2" class="effect"  value="false" name="registeredWithTradeBodies" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="registeredWithTradeBodiesYes">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                            <input type="text" id="registerationNumber" name="registerationNumber" class="effect"  />
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	<input type="button" value="Update" onclick="updateData('registeredWithTradeBodies, registerationNumber');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Have you/ your company been accredited or have quality marks awarded by any external bodies (e.g. Trust Mark)?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="qualityMarksResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="qualityMarksCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;" id="qualityMarksDivision">
                                  <div class="wd-92">
                                    <h3>Have you/ your company been accredited or have quality marks awarded by any external bodies (e.g. Trust Mark)?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="qualityMarks1" value="true" class="effect" name="qualityMarks" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="qualityMarks2" value="false" class="effect"  name="qualityMarks" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="qualityMarksYes">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                         	<textarea id="qualityMarksDetails" name="qualityMarksDetails" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150"></textarea>
                                         </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('qualityMarks, qualityMarksDetails');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                               
                           </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Are you/ your company registered with Construction Line?  </h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="registeredWithConstructionLineResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="registeredWithConstructionLineCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                               <td class="new-l  edit-prof" style="display:none;" id="registeredWithConstructionLineDivision">
                                  <div class="wd-92">
                                    <h3>Are you/ your company registered with Construction Line?  </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="registeredWithConstructionLine1" value="true" class="effect" name="registeredWithConstructionLine" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="registeredWithConstructionLine2" value="false" class="effect"  name="registeredWithConstructionLine" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="registeredWithConstructionLineYes">
                                         	<label for="c4">If YES, please give registration number:</label>
                                            <input type="text" id="constructionLineRegisterationNumber" name="constructionLineRegisterationNumber" class="effect" />
                                         </div>
                                          <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('registeredWithConstructionLine,constructionLineRegisterationNumber');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                        </table>
                         <h1 class="heading3 margin-top15">EMPLOYEES & SUB-CONTRACTORS </h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Number of employees</h3>
                                        <div class="">
                                          <p style="width:100%; float:left;" id="employeesCountStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                 <td class="new-l edit-prof" style="display:none;" id="employeesCountDivision">
                               	  <div class="wd-92">
                                     <h3>Number of employees</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="employeesCount" class="effect" name="employeesCount" maxlength="150" />
                                         </div>
                                          <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('employeesCount');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                             </tr>
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Trades of employees(e.g. electricians, plumbers etc.)</h3>
                                       <div class="">
                                          <p style="width:100%; float:left;" id="employeesTradeStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l  edit-prof" style="display:none;" id="employeesTradeDivision">
                                  <div class="wd-92">
                                     <h3>Trades of employees(e.g. electricians, plumbers etc.)</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="employeesTrade" class="effect" name="employeesTrade" maxlength="150" />
                                        </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('employeesTrade');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Do you normally employ sub-contractors?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="employSubcontractorsResStr"></strong>
                                   		 </div>
                                        <div class="">
                                         	<p style="width:100%; float:left;" id="employSubContractorRegisterationNumberStr"></p>
                                         </div>
                                  </div>   
                               </td>
                                <td class="new-l   edit-prof" style="display:none;" id="employSubcontractorsDivision">
                                  <div class="wd-92">
                                    <label>Do you normally employ sub-contractors?</label>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="employSubcontractors1" value="true" class="effect" name="employSubcontractors" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="employSubcontractors2" value="false" class="effect"  name="employSubcontractors" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="employSubcontractorsYes" style="display: none;">
                                         	<label for="c4">If YES, please give registration number:</label>
                                            <input type="text" name="employSubContractorRegisterationNumber" id="employSubContractorRegisterationNumber" class="effect" maxlength="150" />
                                         </div>
                                          <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('employSubcontractors,employSubContractorRegisterationNumber');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                       </table> 
                       <h1 class="heading3 margin-top15">TAX AND INSURANCE</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Please give the address of the tax office that deals with you/ your company's tax returns</h3>
                                        <div class="">
                                         	<p style="width:100%; float:left;" id="taxOfficeAddressStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l  edit-prof" style="display:none;" id="taxOfficeAddressDivision">
                               	  <div class="wd-92">
                                     <label>Please give the address of the tax office that deals with you/ your company'€™s tax returns </label>
                                        <div class="for-se wid">
                                          <textarea id="taxOfficeAddress" name="taxOfficeAddress" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150"></textarea>
                                         </div>
                                          <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('taxOfficeAddress');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Tax reference number</h3>
                                       <div class="">
                                         	<p style="width:100%; float:left;" id="taxReferenceNumberStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l  edit-prof" style="display:none;" id="taxReferenceNumberDivision">
                                  <div class="wd-92">
                                     <label>Tax reference number </label>
                                        <div class="for-se wid">
                                          <input type="text" id="taxReferenceNumber" class="effect" name="taxReferenceNumber" maxlength="150" />
                                        </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('taxReferenceNumber');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Please provide the name and address of your insurer</h3>
                                        <div class="">
                                         	<p style="width:100%; float:left;" id="insurerNameandAddressStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                 <td class="new-l edit-prof" style="display:none;" id="insurerNameandAddressDivision">
                               	  <div class="wd-92">
                                     <label>Please provide the name and address of your insurer</label>
                                        <div class="for-se wid">
                                       		 <textarea id="insurerNameandAddress" name="insurerNameandAddress" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150"></textarea>
                                         </div>
                                          <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('insurerNameandAddress');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Policy number </h3>
                                        <div class="">
                                         	<p style="width:100%; float:left;" id="policyNumberStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l edit-prof" style="display:none;" id="policyNumberDivision">
                                  <div class="wd-92">
                                     <label>Policy number </label>
                                        <div class="for-se wid">
                                          <input type="text" id="policyNumber" class="effect" name="policyNumber" maxlength="150" />
                                        </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('policyNumber');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            <tr>
                            	<td class="new-l">
                                   <div class="wd-92">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                      <h3>Levels of insurance cover</h3>
                                        <div class="form-fields">
                                            <ul>
                                                <li><span>Employer's liability : </span><span id="employersLiabilityStr"></span></li>
                                                <li><span>Public liability:  </span><span id="publicLiabilityStr"></span></li>
                                                <li><span>Professional indemnity :</span><span id="proffessionalIndemnityStr"></span></li>                                    
                                            </ul>
                                        </div>
                                   </div>   
                                 </td>
                                 
                                 <td class="new-l edit-prof" style="display:none;" id="employersLiabilityDivision">
                                   <div class="wd-92">
                                      <label>Levels of insurance cover</label>
                                        <div class="form-fields">
                                            <ul>
                                                <li>Employer's liability : <input type="text" id="employersLiability" name="employersLiability" placeholder="" class="effect" maxlength="150" /></li>
                                                <li>Public liability:      <input type="text" id="publicLiability" name="publicLiability" placeholder="" class="effect" maxlength="150" /></li>
                                                <li>Professional indemnity :<input type="text" id="proffessionalIndemnity" name="proffessionalIndemnity" placeholder="" class="effect" maxlength="150" /></li>  
                                            </ul>
                                        </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('employersLiability,publicLiability,proffessionalIndemnity');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>   
                                 </td>
                            </tr>
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Expiry date of insurance cover</h3>
                                          <div class="">
                                         	<p style="width:100%; float:left;" id="insauranceCoverExpiryDateStr"></p>
                                         </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l edit-prof" style="display:none;" id="insauranceCoverExpiryDateDivision">
                                  <div class="wd-92">
                                     <label>Expiry date of insurance cover</label>
                                        <div class="for-se wid">
                                       	 <input readonly="readonly" type="text" id="insauranceCoverExpiryDate" placeholder="Pick Date"  name="insauranceCoverExpiryDate" class="effect dat-icon newo" placeholder="DD-MM-YYYY" value="" />								
                                        </div>
                                         <div class="for-se wid" style="float: unset!important;">
                                         	 <input type="button" value="Update" onclick="updateData('insauranceCoverExpiryDate');" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                       </table> 
                       </div>         
                    </li>
                  </ul>
           		</li>
            </ul>
             <input type="button" id="contractorInfoNextStep2Btn" value="Next >>" class="regis-co"/>
             <input type="button" id="contractorInfoPreviousStep2Btn" value="<< Previous" class="regis-co"/>
          </form>
        </div>
      </div>
    </div>
    
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>