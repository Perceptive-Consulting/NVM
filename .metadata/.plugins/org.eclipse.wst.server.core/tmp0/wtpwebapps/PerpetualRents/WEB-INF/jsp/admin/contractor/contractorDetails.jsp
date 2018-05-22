<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/admin/contractor/contractorDetails.js"></script>

<script type="text/javascript">
$("#accordion > li").click(function(){
	if(false == $(this).next().is(':visible')) {
		$('#accordion > ul').slideUp(1000);
	}
	$(this).next().slideToggle(1000);
});
//$('#accordion > ul:eq(0)').show();
</script>

 <style>
.chosen-container-multi .chosen-choices {
	width: 100%!important;
}
.chosen-choices .search-choice {
    font-size: 13px;
    width: auto;
}

.chosen-choices .search-choice span {
    float: left;
    width: 100%;
}

</style>

 <div class="container-ar">
  <section class="contant-area">
  	<div id="errorId" class="alert alert-block alert-error fade in" hidden="true" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">You got an error!</h4>
        </div>
        <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="display: none;" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId"></h4>
        </div>
    <div class="button"><button id="allContractorsId">Back</button><span>&nbsp;&nbsp;&nbsp;</span><button id="approveContractor">Approve</button>
    <button id="disapproveContractor" style="display: none;">DisApprove</button><span>&nbsp;&nbsp;&nbsp;</span><button id="resetPassword">Reset Password</button>
    </div>
    <div class="rgpinnew">
          <ul>
            <li><strong>Company Name</strong><samp>:</samp><span id="companyName"></span></li>
            <li><strong>Reference</strong><samp>:</samp><span id="reference"></span></li>
            <li><strong>Status</strong><samp>:</samp><span id="status"></span></li>   
            <li><strong>Business Nature</strong><samp>:</samp><span id="businessNature"></span></li>
            <li><strong>Email Id</strong><samp>:</samp><span id="emailId"></span></li>
            <li><strong>Phone Number</strong><samp>:</samp><span id="phoneNumber"></span></li>
            <li><strong>Trading Commencement Date</strong><samp>:</samp><span id="tradingCommencementDate"></span></li>
            <li><strong>Company Registration Date</strong><samp>:</samp><span id="companyRegisterationDate"></span></li>
            <li><strong>Vat No</strong><samp>:</samp><span id="vatNo"></span></li>
            <li><strong>User Name</strong><samp>:</samp><span id="userName"></span></li>
            <li><strong>Password</strong><samp>:</samp><span id="password"></span></li>

  			<li><strong>Created On</strong><samp>:</samp><span id="createdOn"></span></li>
            <li><strong>Created By</strong><samp>:</samp><span id="createdBy"></span></li>
            <li><strong>Modified On</strong><samp>:</samp><span id="modifiedOn"></span></li>
            <li><strong>Modified By</strong><samp>:</samp><span id="modifiedBy"></span></li>
            
            <li><strong>Functionality</strong><samp>:</samp><span id="functionality"></span><span style="display: none;" id="functionalityIdStr"></span>
            	<h4><input type="button" id="editFunctionality" name="edit" value="Edit" class="edit" style="height: 20px;" /></h4>
            	<div id="editFunctionalityDiv" class="edit-prof" style="display: none;">
            		<select data-placeholder="Choose Functionalities..." name="functionality" class="chosen-select-functionality" multiple style="width:350px;" tabindex="4" id="functionalityId"></select>
					<label id="functionalityLabel" style="color:red; display: none;margin-top: 3%">Please Select Trades.</label>
					<div>
						<input id="functionalityUpdateBtn" type="button" value="Update" class="btn-class" />
						<input id="functionalityCancelBtn" type="button" value="Cancel" class="btn-class" />
					</div>
            	</div>
            	
            </li>
            <li><strong>City Serviced</strong><samp>:</samp><span id="cityServiced"></span><span style="display: none;" id="cityServicedId"></span>
            	<h4><input type="button" id="editCities" name="edit" value="Edit" class="edit" style="height: 20px;" /></h4>
            	<div id="editCitiesDiv" class="edit-prof" style="display: none;">
            		<select data-placeholder="Choose Cities..." name="cities" class="chosen-select-city" multiple style="width:350px;" tabindex="4" id="citiesId"> </select>
					<label id="cityLabel" style="color:red; display: none;margin-top: 3%">Please Select Cities.</label>
					<div>
						<input id="cityUpdateBtn" type="button" value="Update" class="btn-class" />
						<input id="cityCancelBtn" type="button" value="Cancel" class="btn-class" />
					</div>
            	</div>
            </li>
          </ul>        
          <div class="clearfix"></div>
        </div>    
         <div class="contractor-sec">
              <ul class="menu">
           		 <li> 
                  <ul>
                    <li>
                    	<ul id="accordion">
                            <li id="contractorStep2">Step 2<span>View</span></li>
                            <ul >
                                <div class="rg-p innew">
                                  <div class="">
                                     <h1 class="heading3 margin-top15">Contractor Details</h1>
                                    <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                                         <tr>
                                            <td class="new-l">
                                              <div class="wd-92">
                                                  <h3>Registered office</h3>
                                                   <div class="dfn-width">
                                                        <ul style="display:block;">
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Address Line1:</strong><span style="width: 100%!important;" id="oAddressLine1Str"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Address Line2:</strong><span style="width: 100%!important;" id="oAddressLine2Str"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">City:</strong><span style="width: 100%!important;" id="oCityStr"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">County: </strong><span style="width: 100%!important;" id="oCountyStr"></span></li>                                                
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Postcode:</strong><span style="width: 100%!important;" id="oPostCodeStr"></span></li>  
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Telephone number:</strong><span style="width: 100%!important;" id="oPhoneNumberStr"></span> </li>
                                                        </ul>
                                                    </div>
                                               </div>   
                                            </td>
                                            
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                  <h3>Registered office</h3>
                                                   <div class="form-fields ">
                                                        <ul>
                                                            <li>Address Line1: <input type="text" name="officeAddObj.addressLine1" id="rAddressLine1" placeholder="" class="effect" /></li>
                                                            <li>Address Line2: <input type="text" name="officeAddObj.addressLine2" id="rAddressLine2" placeholder="" class="effect" /></li>
                                                            <li>City: <input type="text" name="officeAddObj.city" id="rCity" placeholder="" class="effect" /></li>
                                                            <li>County: <input type="text" name="officeAddObj.county" id="rCounty" placeholder="" class="effect"/></li>                                                
                                                            <li>Postcode:<input type="text" name="officeAddObj.postCode" id="rPostCode" placeholder="" class="effect" /></li>  
                                                            <li>Telephone number: <input type="text" name="officeAddObj.phoneNumber" id="rPhoneNumber" placeholder=""  class="effect"/></li>
                                                            <li><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></li>
                                                        </ul>
                                                    </div>
                                               </div>   
                                            </td>
                                        </tr>
                                        
                                       <tr>
                                            <td class="new-l">
                                               <div class="wd-92">                                   
                                                 <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;"/></h4>
                                                  <h3>Office for correspondence</h3><br></br>
                                                    <div class="dfn-width">
                                                           <ul style="display:block;">
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Address Line1:</strong><span style="width: 100%!important;"  id="cAddressLine1Str"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Address Line2:</strong><span style="width: 100%!important;"  id="cAddressLine2Str"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">City:</strong><span style="width: 100%!important;"  id="cCityStr"></span> </li>
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">County: </strong><span style="width: 100%!important;"  id="cCountyStr"></span></li>                                                
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Postcode:</strong><span style="width: 100%!important;"  id="cPostCodeStr"></span></li>  
                                                            <li style="width: 100%!important;"><strong style="width: 25%!important;">Telephone number:</strong><span style="width: 100%!important;"  id="cPhoneNumberStr"></span> </li>
                                                        </ul>
                                                    </div>
                                               </div>   
                                             </td>
                                             
                                             <td class="new-l edit-prof" style="display:none;">
                                               <div class="wd-92" >
                                                  <h3>Office for correspondence</h3><br></br>
                                                    <div class="form-fields">
                                                        <ul>
                                                           <li>Address Line1: <input type="text" name="correspondenceAddObj.addressLine1" id="cAddressLine1" placeholder="" class="effect" /></li>
                                                            <li>Address Line2: <input type="text" name="correspondenceAddObj.addressLine2" id="cAddressLine2" placeholder="" class="effect" /></li>
                                                            <li>City: <input type="text" name="correspondenceAddObj.city" id="cCity" placeholder="" class="effect" /></li>
                                                            <li>County: <input type="text" name="correspondenceAddObj.county" id="cCounty" placeholder="" class="effect"/></li>                                                
                                                            <li>Postcode:<input type="text" name="correspondenceAddObj.postCode" id="cPostCode" placeholder="" class="effect" /></li>  
                                                            <li>Telephone number: <input type="text" name="correspondenceAddObj.phoneNumber" id="cPhoneNumber" placeholder=""  class="effect"/></li>
                                                            <li><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></li>                                
                                                        </ul>
                                                    </div>
                                               </div>   
                                             </td>
                                        </tr>
                                        
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">                                   
                                                 <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;"/></h4>
                                                  <h3>Company Type</h3>
                                                        <p style="width:100%; float:left;" id="companyType">Private</p>
                                               </div>  
                                               <div class="for-se wid" id="otherCompanyType" style="display: none;">
                                                   <label>Please specify other</label>
                                                   <input type="text" id="" class="effect" name="otherCompanyType"/>
                                                </div>
                                            </td>
                                            
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92 for-se wid">
                                                  <h3>Company Type</h3>
                                                        <select data-placeholder="Choose Company Type..." name="companyTypeId" class="chosen-select" style="width:350px;" tabindex="4" id="companyTypeId">
                                                        </select>
                                                        <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                               </div>  
                                               <div class="for-se wid" id="otherCompanyType" style="display: none;">
                                                   <label>Please specify other</label>
                                                   <input type="text" id="" class="effect" name="otherCompanyType"/>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                                <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor</h3>
                                                <div class="">
                                                    <p style="width:100%; float:left;" id="allDirectorsOfCompanyStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor</h3>
                                                <div class="for-se wid">
                                                    <textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                     <div style="width:100%" class="for-se wid"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                </div>
                                              </div>   
                                           </td>
                                       </tr>
                                       
                                       <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                                <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Have any of the persons named above in been subject to bankruptcy proceedings or been involved in a company that has been subject to liquidation proceedings or had receivers appointed?</h3>
                                                <div class="">
                                                    <strong style="width:100%;float:left; color:#e33a0c;" id="bankruptcyProceedingsResStr"></strong>
                                                </div>
                                                <div class="">
                                                    <p style="width:100%; float:left;" id="bankruptcyProceedingsCommentsStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Have any of the persons named above in been subject to bankruptcy proceedings or been involved in a company that has been subject to liquidation proceedings or had receivers appointed?</h3>
                                                <div class="for-se wid">
                                                    <textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                     <div style="width:100%" class="for-se wid"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                </div>
                                              </div>   
                                           </td>
                                       </tr>
                                       
                                       <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                                <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Have any persons named above been convicted of any criminal offence other than minor traffic offences?</h3>
                                                <div class="">
                                                	<strong style="width:100%;float:left; color:#e33a0c;" id="convictedToCriminalOffenceResStr"></strong>
                                                </div>
                                                 <div class="">
                                                    <p style="width:100%; float:left;" id="convictedToCriminalOffenceCommentsStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Have any persons named above been convicted of any criminal offence other than minor traffic offences?</h3>
                                                <div class="for-se wid">
                                                    <textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                     <div style="width:100%" class="for-se wid"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                </div>
                                              </div>   
                                           </td>
                                       </tr>
                                        
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                                <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Are any of the persons named above related to a member of Ashantidutch Property letting or any UK charities  staff or one of its trustees?</h3>
                                             	   <div class="">
                                      					 <strong style="width:100%;float:left; color:#e33a0c;" id="trusteeOfAshantiDutchResStr"></strong>
                                   					 </div>
                                                 <div class="">
                                                    <p style="width:100%; float:left;" id="trusteeOfAshantiDutchCommentsStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Are any of the persons named above related to a member of Ashantidutch Property letting or any UK charities  staff or one of its trustees?</h3>
                                                <div class="for-se wid">
                                                    <textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                     <div style="width:100%" class="for-se wid"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                </div>
                                              </div>   
                                           </td>
                                       </tr>
                                        
                                        
                                         <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                                <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Name and registered address of parent or ultimate holding company (if applicable)</h3>
                                                <div class="">
                                                    <p style="width:100%; float:left;" id="parentCompanyAddressStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Name and registered address of parent or ultimate holding company (if applicable)</h3>
                                                <div class="for-se wid">
                                                    <textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                     <div style="width:100%" class="for-se wid"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                </div>
                                              </div>   
                                           </td>
                                       </tr>
                                       
                                       <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Company registration number of parent or ultimate holding company (if applicable)</h3>
                                                <div class="for-se wid">
                                                    <p id="companyRegisterationNumberStr"></p>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                           <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Company registration number of parent or ultimate holding company (if applicable)</h3>
                                                <div class="for-se wid">
                                                   <input type="text" id="companyRegisterationNumber" class="effect" name="companyRegisterationNumber" />
                                                   <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                </div>
                                              </div>   
                                           </td>
                                           
                                       </tr>
                                         <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Are you/ your company registered with any trade bodies (e.g. NICEIC)?</h3>
                                                    <div class="">
                                      					 <strong style="width:100%;float:left; color:#e33a0c;" id="registeredWithTradeBodiesResStr"></strong>
                                   					 </div>
                                       				 <div class="">
                                         				<p style="width:100%; float:left;" id="registeredWithTradeBodiescommentsStr"></p>
                                       				  </div>
                                              </div>   
                                           </td>
                                           
                                           
                                           <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Are you/ your company registered with any trade bodies (e.g. NICEIC)?</h3>
                                                     <div class="for-se">
                                                          <input type="radio" id="registeredWithTradeBodies1" class="effect" value="true" name="registeredWithTradeBodies" />
                                                          <label for="c3" >Yes</label>
                                                          <input type="radio" id="registeredWithTradeBodies2" class="effect"  value="true" name="registeredWithTradeBodies" />
                                                          <label for="c4">No</label>
                                                     </div>
                                                     <div class="for-se wid" id="registeredWithTradeBodiesYes">
                                                        <label for="c4">If YES, please give details below, including registration number(s)</label>
                                                        <input type="text" name="registerationNumber" class="effect"  />
                                                        <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                     </div>
                                              </div>   
                                           </td>
                                       </tr>
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Have you/ your company been accredited or have quality marks awarded by any external bodies (e.g. Trust Mark)?</h3>
                                                     <div class="">
                                      		 			<strong style="width:100%;float:left; color:#e33a0c;" id="qualityMarksResStr"></strong>
                                   		 			</div>
                                        			 <div class="">
                                         				<p style="width:100%; float:left;" id="qualityMarksCommentsStr"></p>
                                        			 </div>
                                              </div>   
                                           </td>
                                           
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Have you/ your company been accredited or have quality marks awarded by any external bodies (e.g. Trust Mark)?</h3>
                                                     <div class="for-se">
                                                          <input type="radio" id="qualityMarks1" class="effect" name="qualityMarks" />
                                                          <label for="c3" >Yes</label>
                                                          <input type="radio" id="qualityMarks2" class="effect"  name="qualityMarks" />
                                                          <label for="c4">No</label>
                                                     </div>
                                                     <div class="for-se wid" id="qualityMarksYes">
                                                        <label for="c4">If YES, please give details below, including registration number(s)</label>
                                                        <textarea id="qualityMarksDetails" name="qualityMarksDetails" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                        <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                     </div>
                                              </div>   
                                           </td>
                                           
                                       </tr>
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Are you/ your company registered with Construction Line?  </h3>
                                                     <div class="">
                                      					 <strong style="width:100%;float:left; color:#e33a0c;" id="registeredWithConstructionLineResStr"></strong>
                                   					 </div>
			                                         <div class="">
			                                         	<p style="width:100%; float:left;" id="registeredWithConstructionLineCommentsStr"></p>
			                                         </div>
                                              </div>   
                                           </td>
                                           
                                           
                                           <td class="new-l  edit-prof" style="display:none;">
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
                                                        <input type="text" name="constructionLineRegisterationNumber" class="effect" />
                                                         <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
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
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Number of employees</h3>
                                                    <div class="">
                                        			  <p style="width:100%; float:left;" id="employeesCountStr"></p>
                                         			</div>
                                               </div>  
                                            </td>
                                            
                                             <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Number of employees</h3>
                                                    <div class="for-se wid">
                                                      <input type="text" id="employeesCount" class="effect" name="employeesCount" />
                                                      <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                     </div>
                                               </div>  
                                            </td>
                                         </tr>
                                        
                                        <tr>
                                            <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Trades of employees(e.g. electricians, plumbers etc.)</h3>
                                                   <div class="">
                                         			 <p style="width:100%; float:left;" id="employeesTradeStr"></p>
                                        			 </div>
                                               </div>  
                                            </td>
                                            
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Trades of employees(e.g. electricians, plumbers etc.)</h3>
                                                    <div class="for-se wid">
                                                      <input type="text" id="employeesTrade" class="effect" name="employeesTrade" />
                                                      <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                    </div>
                                               </div>  
                                            </td>
                                        </tr>
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                <h3>Do you normally employ sub-contractors?</h3>
		                                  		 <div class="">
		                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="employSubcontractorsResStr"></strong>
		                                   		 </div>
		                                        <div class="">
		                                         	<p style="width:100%; float:left;" id="employSubContractorRegisterationNumberStr"></p>
		                                         </div>
		                                       </div>   
                                           </td>
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                <h3>Do you normally employ sub-contractors?</h3>
                                                     <div class="for-se">
                                                          <input type="radio" id="employSubcontractors1" class="effect" name="employSubcontractors" />
                                                          <label for="c3" >Yes</label>
                                                          <input type="radio" id="employSubcontractors2" class="effect"  name="employSubcontractors" />
                                                          <label for="c4">No</label>
                                                     </div>
                                                     <div class="for-se wid" id="employSubcontractorsYes">
                                                        <label for="c4">If YES, please give registration number:</label>
                                                        <input type="text" name="employSubContractorRegisterationNumber" class="effect" />
                                                        <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
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
                                               <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Please give the address of the tax office that deals with you/ your company's tax returns</h3>
                                                     <div class="">
                                         				<p style="width:100%; float:left;" id="taxOfficeAddressStr"></p>
                                        			 </div>
                                               </div>  
                                            </td>
                                            
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Please give the address of the tax office that deals with you/ your company's tax returns </h3>
                                                    <div class="for-se wid">
                                                      <textarea id="taxOfficeAddress" name="taxOfficeAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                      <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                     </div>
                                               </div>  
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Tax reference number </h3>
                                                   <div class="">
                                         				<p style="width:100%; float:left;" id="taxReferenceNumberStr"></p>
                                         			</div>
                                               </div>  
                                            </td>
                                            
                                            <td class="new-l  edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Tax reference number </h3>
                                                    <div class="for-se wid">
                                                      <input type="text" id="taxReferenceNumber" class="effect" name="taxReferenceNumber" />
                                                      <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                    </div>
                                               </div>  
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                           <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Please provide the name and address of your insurer</h3>
                                                   <div class="">
                                         				<p style="width:100%; float:left;" id="insurerNameandAddressStr"></p>
                                        			</div>
                                               </div>  
                                            </td>
                                            
                                             <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <h3>Please provide the name and address of your insurer</h3>
                                                    <div class="for-se wid">
                                                    <textarea id="insurerNameandAddress" name="insurerNameandAddress" rows="5" cols="20" style="width: 300px;" class="effect"></textarea>
                                                    <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                     </div>
                                               </div>  
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Policy number</h3>
                                                    <div class="">
                                         				<p style="width:100%; float:left;" id="policyNumberStr"></p>
                                        			 </div>
                                               </div>  
                                            </td>
                                            
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <label>Policy number </label>
                                                    <div class="for-se wid">
                                                      <input type="text" id="policyNumber" class="effect" name="policyNumber" />
                                                      <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                    </div>
                                               </div>  
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="new-l">
                                               <div class="wd-92">
                                               <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                  <h3>Levels of insurance cover</h3>
                                                    <div class="form-fields">
                                                        <ul style="display: block;">
                                                            <li><span>Employer's liability : </span><span id="employersLiabilityStr"></span></li>
                                             			    <li><span>Public liability:  </span><span id="publicLiabilityStr"></span></li>
                                                			<li><span>Professional indemnity :</span><span id="proffessionalIndemnityStr"></span></li>                                         
                                                        </ul>
                                                    </div>
                                               </div>   
                                             </td>
                                             
                                             <td class="new-l edit-prof" style="display:none;">
                                               <div class="wd-92">
                                                  <label>Levels of insurance cover</label>
                                                    <div class="form-fields">
                                                        <ul>
                                                            <li>Employer's liability : <input type="text" name="employersLiability" placeholder="" class="effect" /></li>
                                                            <li>Public liability:      <input type="text" name="publicLiability" placeholder="" class="effect" /></li>
                                                            <li>Professional indemnity :<input type="text" name="proffessionalIndemnity" placeholder="" class="effect" /></li>  
                                                        </ul>
                                                        <div style="float:left; width:100%;"><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                                    </div>
                                               </div>   
                                             </td>
                                        </tr>
                                        <tr>
                                            <td class="new-l">
                                              <div class="wd-92">
                                              <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                                 <h3>Expiry date of insurance cover</h3>
                                                     <div class="">
                                         				<p style="width:100%; float:left;" id="insauranceCoverExpiryDateStr"></p>
                                        			 </div>
                                               </div>  
                                            </td>
                                            
                                            <td class="new-l edit-prof" style="display:none;">
                                              <div class="wd-92">
                                                 <label>Expiry date of insurance cover</label>
                                                    <div class="for-se wid">
                                                <input readonly="readonly" type="text" id="insauranceCoverExpiryDate" placeholder="Pick Date"  name="insauranceCoverExpiryDate" class="effect dat-icon newo" placeholder="DD-MM-YYYY" value="" />								
                                                     <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                                    </div>
                                               </div>  
                                            </td>
                                        </tr>
                                   </table> 
                                   </div>   
                                 </div>
                             </ul>
                             
                             <li id="contractorStep3">Step 3 <span>View</span></li>
                            <ul>
                                <div class="rg-p innew">
                                  <div class="">
                     <h1 class="heading3 margin-top15">HEALTH AND SAFETY </h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>Do you/ your company have a written health and safety policy?</h3>
                                   		  <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="writtenHealthPolicyResStr"></strong>
                                      		 <div class="">
                                         		<p style="width:100%; float:left;" id="writtenHealthPolicyCommentsStr"></p>
                                         	</div>
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="writtenHealthPolicyFileNameDiv"><a href="#" id="writtenHealthPolicyFileNameStr"></a></strong>
                                   		 </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have a written health and safety policy?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="writtenHealthPolicy1" class="" name="writtenHealthPolicy" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="writtenHealthPolicy2" class=""  name="writtenHealthPolicy" />
                                              <label for="c4">No</label>
                                         </div>
                                         <div style="float:left; width:100%;" class="for-se wid" ><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                         
                                         <div class="for-se wid" id="writtenHealthPolicyYes" style="display: none;">
                                         	<label for="c4">If YES, please enclose a copy:</label>
                                            <input type="file" id="" name="writtenHealthPolicyFile" class="" />
                                         </div>
                                         
                                         <div class="for-se wid" style="clear:both; display: none;" id="writtenHealthPolicyNo" >
                                         	<label for="c4">If NO, please provide a statement that demonstrates your commitment to health and safety and the measures you take to identify potential hazards and  minimise the risk of accidents and injury when undertaking your work. </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="writtenHealthPolicyNoComments" class="effect"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                          <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>Do you/ your company have access to competent health and safety advice? </h3>
                                   		  <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="competentHealthAndSafetyAdviceResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="competentHealthAndSafetyAdviceCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have access to competent health and safety advice? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="competentHealthAndSafetyAdvice1" class="" name="competentHealthAndSafetyAdvice" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="competentHealthAndSafetyAdvice2" class=""  name="competentHealthAndSafetyAdvice" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div style="float:left; width:100%;" class="for-se wid" ><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                          <div class="for-se wid" style="clear:both; display: none;" id="competentHealthAndSafetyAdviceYes">
                                         	<label for="c4">If YES, please give details including the names and qualifications of individuals (e.g. in-house health and safety officers) as appropriate.? </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="competentHealthAndSafetyAdviceYesComments" class="effect"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>Have you and/ or your employees received health and safety training? </h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="receivedHealthAndSafetyResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="receivedHealthAndSafetyCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92">
                                    <h3>Have you and/ or your employees received health and safety training? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="receivedHealthAndSafety1" class="" name="receivedHealthAndSafety" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="receivedHealthAndSafety2" class=""  name="receivedHealthAndSafety" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         
                                         <div class="for-se wid" style="clear:both;" id="receivedHealthAndSafetyYes">
                                         	<label for="c4">If YES, please give details of health and training you/ your employees have undertaken within the last twelve months. </label>
                                           <textarea rows="10" cols="20" style="width: 325px;" name="receivedHealthAndSafetyYesComments" class="effect"></textarea>
                                           <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>In the last three years, has your company been subject to formal investigations ?</h3>
                                    	<div class="form-fields">
                                            <ul style="display: block;">
                                            	<li><span>Year ending: </span><span id="yearEnding1Str"></span></li>
                                            	<li><span>Fatal accidents: </span><span id="fatalAccidents1Str"></span></li>
                                            	<li><span>Reportable injuries (RIDDOR):</span> <span id="reportableInjuries1Str"></span></li>
                                                <li><span>Accident/ incident rate:</span><span id="accidentRate1Str"></span></li>
                                                <li><span>Non-reportable injuries:</span> <span id="nonReportableInjuries1Str"></span></li>       
                                            </ul>
                                            <ul style="display: block;">
                                                <li><span>Year ending:</span> <span id="yearEnding2StrStr"></span></li>
                                            	<li><span>Fatal accidents:</span> <span id="fatalAccidents2StrStr"></span></li>
                                            	<li><span>Reportable injuries (RIDDOR): </span><span id="reportableInjuries2Str"></span></li>
                                                <li><span>Accident/ incident rate:</span> <span id="accidentRate2Str"></span></li>
                                                <li><span>Non-reportable injuries:</span> <span id="nonReportableInjuries2Str"></span></li> 
                                           	</ul>
                                        </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92">
                                    <h3>Has there been any accidents/incidents have they been recorded by your company, and was this in the last two years.</h3>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Year ending: <input type="text" name="yearEnding1" placeholder="" class="effect" /></li>
                                            	<li>Fatal accidents: <textarea name="fatalAccidents1" placeholder="" class="effect"></textarea></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" name="reportableInjuries1" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate: <input type="text" name="accidentRate1" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" name="nonReportableInjuries1" placeholder="" class="effect" /></li>
                                                <li>Year ending: <input type="text" name="yearEnding2" placeholder="" class="effect" /></li>
                                            	<li>Fatal accidents: <textarea name="fatalAccidents2" placeholder="" class="effect"></textarea></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" name="reportableInjuries2" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate: <input type="text" name="accidentRate2" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" name="nonReportableInjurie2" placeholder="" class="effect" /></li>                              
                                            </ul>
                                             <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>Have you/ your company been prosecuted or been issued with enforcement notices in respect of any breaches in health and safety regulations?</h3>
                                   		  <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="enforcementNoticeforHealthSafetyStr"></strong>
                                   		 </div>
                                   		 <div class="">
                                         	<p style="width:100%; float:left;" id="enforcementNoticeforHealthSafetyCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                                <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92 ">
                                    <h3>Have you/ your company been prosecuted or been issued with enforcement notices in respect of any breaches in health and safety regulations?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="enforcementNoticeforHealthSafetyStr"></strong>
                                   		 </div>
                                   		 <div class="">
                                         	<p style="width:100%; float:left;" id="enforcementNoticeforHealthSafetyCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display:none;" /></h4>
                                    <h3>Does your company have any ISO accreditation or is your company working towards one?</h3>
                                   		<div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="safetyAccreditationResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="safetyAccreditationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;">
                                  <div class="wd-92">
                                    <h3>Does your company have any ISO accreditation or is your company working towards one?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="safetyAccreditation1" class="" name="safetyAccreditation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="safetyAccreditation2" class=""  name="safetyAccreditation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                          <div style="float:left; width:100%;" class="for-se wid" ><input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="safetyAccreditationYes">
                                         	<label for="c4">If YES, please give details including accreditation number(s) </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="safetyAccreditationYesComments" class="effect"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                      </table>
                       <h1 class="heading3 margin-top15">EQUALITY AND DIVERSITY</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have a written equality and diversity policy?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="equalityPolicyResStr"></strong>
                                      		 <div class="">
                                         		<p style="width:100%; float:left;" id="equalityPolicyCommentsStr"></p>
                                         	</div>
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="equalityPolicyFileNameDiv"><a href="#" id="equalityPolicyFileName"></a></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="equalityPolicyStrCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>In the last three years, has any finding of unlawful discrimination been made against your company by any Court or Employment Tribunal? </h3>
                                   		<div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="anyunlawfulDiscriminationStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="anyunlawfulDiscriminationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>In the last three years, have you or your company been the subject of formal investigations by the Equality and Human Rights Commission on grounds of alleged unlawful discrimination?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="subjectOfFormalInvestigationResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="subjectOfFormalInvestigationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Are you/ your company willing to abide by the charities Code of Conduct for Contractors ?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="willingToAbideByCharitiesResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="willingToAbideByCharitiesCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                        </table>
                        <h1 class="heading3 margin-top15">PRICING SCHEDULE </h1>
                        <table width="98%" border="0" cellpadding="0" cellspacing="0" class="price-shedule" id="priceScheduleIdStr"></table>
                        
                         <div style="float:unset!important; width: 80%!important; padding: 10px 15px 40px 20px;" class="for-se wid" >
                         		<strong>If you would like to provide any additional information about your price schedule, please give details below.</strong>
                     				<div class="">
                                     	<p style="width:100%; float:left;" id="additionalInformationOfCostStr"></p>
                                   </div>
                         </div>
                 		</div>
                        </div>
                         </ul>
                             <li id="contractorStep4">Step 4 <span>View</span></li>
                            <ul>
                          <div class="rg-p innew">
                            <div class="">
                    <h1 class="heading3 margin-top15">REFERENCES</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                  <h3>Please give details of three organisations that we may approach for reference purposes. These should normally be organisations for which you or your company have carried out similar work to that which you have listed in your response to question<br /></h3>
                                    	<div class="form-fields reference-sec">
                                    		<label><span>Reference 1:</span> </label>
                                            <ul style="display: block;" class="bg-len">
                                            	<li><i>Name and address of referee:</i> <p id="referenceAddress1Str"></p></li>
                                            	<li><i>Contact name and telephone number: </i> <p id="referenceContact1Str"></p></li>
                                            	<li style="width: 97%!important;"><i>Brief description of work undertaken:</i><p id="description1Str"></p> </li>
                                            </ul>
                                           <label><span>Reference 2:</span> </label>
                                             <ul style="display: block;" class="bg-len">
                                            	<li><i>Name and address of referee:</i> <p id="referenceAddress2Str"></p></li>
                                            	<li><i>Contact name and telephone number: </i> <p id="referenceContact2Str"></p></li>
                                            	<li style="width: 97%!important;"><i>Brief description of work undertaken:</i><p id="description2Str"></p> </li>
                                            </ul>
                                            <label><span>Reference 3:</span> </label>
                                             <ul style="display: block;" class="bg-len">
                                            	<li><i>Name and address of referee:</i> <p id="referenceAddress3Str"></p></li>
                                            	<li><i>Contact name and telephone number: </i> <p id="referenceContact3Str"></p></li>
                                            	<li style="width: 97%!important;"><i>Brief description of work undertaken:</i><p id="description3Str"></p> </li>
                                            </ul>
                                            
                                        </div>
                                  </div> 
                                  <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have any external health and safety accreditation (e.g. Contractor Health and Safety Scheme, Safe Contractor etc.)?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="externalHealthAndSafetyAccrediationResStr"></strong>
                                   		 </div>
                                   		 <div class="">
                                         		<p style="width:100%; float:left;" id="externalHealthAndSafetyAccrediationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                          </tr>                                       
                    </table>
                    
                    <h1 class="heading3 margin-top15">ADDITIONAL INFORMATION</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	<p><strong>Please use this section to provide any additional information that is relevant to your application, including any added value that you/ your company can provide.</strong> </p>
                               	  <div class="wd-92">
                                        <div style="width:100%; float:left;">
                                           <p id="additionalInformationStr"><br /></p>
                                         </div>
                                  </div> 
                               </td>
                            </tr>             
                        </table>
                        
                      <h1 class="heading3 margin-top15">DECLARATION</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	<p><h3>This declaration should be signed by the Managing Director, Senior Partner or other senior representative of the company authorised to do so.<br /><br />I have checked that all questions have been answered and that the answers given are, to the best of my knowledge, correct.</h3></h3></p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul style="display: block;">
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
                               </td>
                            </tr>    
                            <tr>
                               <td class="new-l">
                               	<p><h3>Contact person for any queries relating to this application (if different to above):</h3></p>
                               	 	<div class="wd-92">
                                    	<div class="form-fields">
                                            <ul style="display: block;">
                                            	<li><span>Name (in capital letters):</span> <span id="contactPersonNameStr"></span> </li>
                                            	<li><span>Position in the company: </span><span id="contactPersonPositionStr"></span> </li>
                                                <li><span>Telephone number:</span> <span id="contactPersonTelephoneNumberStr"></span></li>
                                                <li><span>Email address:</span> <span id="contactPersonEmailAddressStr"></span></li>                        
                                            </ul>
                                        </div>
                                        <p><strong>Please note your prices will not be disclosed to any other parties but will be used by us for comparative purposes in house, however, we are mindful that to operate one must make a profit.</strong></p>
                                  </div>   
                               </td>
                            </tr>             
                        </table>   
                 		 </div>
                                </div>
                             </ul>
                        </ul>               
                    </li>
                  </ul>
           		</li>
            </ul>
        </div>
  </section>
  </div>
  