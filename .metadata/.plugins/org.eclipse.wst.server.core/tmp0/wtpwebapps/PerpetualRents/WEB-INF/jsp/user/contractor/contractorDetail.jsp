<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorDetailsStep1.js"></script>
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
 }); 
 </script>
 <style>
	.breadcrumb a { width:173px!important;}
</style>
<div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        
       <div class="breadcrumb">
            <a href="#" id="generalInfo" class="active">Step 1</a>
            <a href="#" id="contractorProfileStep2">Step 2</a>
            <a href="#" id="contractorProfileStep3" >Step 3</a>
            <a href="#" id="contractorProfileStep4" >Step 4 </a>
        </div> 
		<div class="contractor-sec">
        	<form id="fContractorgeneralInformationId">
              <ul class="menu">
           		 <li> 
                  <ul>
                    <li>
                      <div class="rg-p">
                      	 <h1 class="heading3 margin-top15">General Information</h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                              		 <h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                     <h3>Trading or company name</h3>
                                        <div  class="">
                                          <p style="float:left; width:100%;" id="companyNameStr"></p>
                                         </div>
                                   </div>  
                                </td> 
                                <td class="new-l edit-prof" style="display:none;" id="companyNameDivision">
                               	  <div class="wd-92">
                                     <h3>Trading or company name</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="companyName" class="effect" name="companyName" />
                                          <input type="button" value="Update" onclick="updateData('companyName')" /><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                     <h3>Nature of your/ your company's business and main business activities</h3>
                                        <div class="">
                                          <p style="float:left; width:100%;" id="businessNatureStr"></p>
                                        </div>
                                   </div>  
                                </td>
                                
                                <td class="new-l edit-prof" style="display:none;" id="businessNatureDivision">
                                  <div class="wd-92">
                                     <h3>Nature of your/ your company's business and main business activities</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="businessNature" class="effect" name="" maxlength="150"/>
                                          <input type="button" value="Update" onclick="updateData('businessNature')"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                      <h3>Contact Information</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li><span>EmailId:</span> <span id="emailIdStr"></span> </li>
                                                <li><span>PhoneNumber:</span><span id="phoneNumberStr"></span></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                                
                                <td class="edit-prof" style="display:none;" id="contactInfoDivision">
                               	  <div class="wd-92">
                                      <h3>Contact Information</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li>PhoneNumber: <input type="text" name="detailsObj.phoneNumber" id="phoneNumber" placeholder="Phone Number" class="effect" maxlength="150" /></li>
                                                <li><input type="button" value="Update" id="contactInfoBtn"/><input type="button" name="" value="Cancel" class="cancel"/></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                  <h4></h4>
                                      <h3>Credentials</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li><span>UserName: </span><span id="usernameStr"> </span></li>
                                                <li><span>Password:</span><span id="passwordStr"> </span></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                        <h3>Date of commencement of trading</h3>
                                        <div class="for-se wid">
                                         <p id="tradingCommencementDateStr"></p>
                                        </div>
                                   </div>   
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">                                  
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                    <h3>Date of company registration</h3>
                                    <div class="for-se wid">
                                     <p id="companyRegisterationDateStr"></p>
                                    </div>
                                  </div>   
                               </td>
                            </tr>
                            
                            <tr>
                               <td class="">
                               	  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                      <h3>Please give details of your annual turnover over the last three years</h3>
                                       <div class="form-fields">
                                            <ul id="turnOverDetails">
                                               
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                                
                                
                                
                                <td class="edit-prof" style="display:none;">
                               	  <div class="wd-92" >
                                      <h3>Please give details of your annual turnover over the last three years</h3>
                                       <div class="form-fields">
                                            <ul>
                                               <li><input type="text" name="turnoverDetails[0].financialYear" placeholder="Year(2000-2001)" class="effect" />  <input type="text" name="turnoverDetails[0].turnOver" placeholder="" class="effect" /></li>
                                               <li><input type="text" name="turnoverDetails[1].financialYear" placeholder="Year(2000-2001)" class="effect" />  <input type="text" name="turnoverDetails[1].turnOver" placeholder="" class="effect" /></li>
                                               <li><input type="text" name="turnoverDetails[2].financialYear" placeholder="Year(2000-2001)" class="effect" />  <input type="text" name="turnoverDetails[2].turnOver" placeholder="" class="effect" /></li>
                                            </ul>
                                        </div>
                                   </div>  
                                </td>
                                
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>VAT registration number (If Applicable )</h3>
                                    <div class="for-se wid">
                                       <p id="vatNoStr"></p>
                                    </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" id="vatNoDivision" style="display:none;">
                                  <div class="wd-92">
                                    <h3>VAT registration number (If Applicable )</h3>
                                    <div class="for-se wid">
                                       <input type="text" id="vatNo" class="effect" name="vatNo" maxlength="15" />
                                        <input type="button" value="Update" onclick="updateData('vatNo')"/><input type="button" name="" value="Cancel" class="cancel"/>
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                            	<td class="">
                                   <div class="wd-92">
                                	<h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                      <h3>Which trade(s) does you/ your company have the skills, experience and capability to provide?</h3>
                                        <div class="for-se wid" id="functionalityStr">                                           
                                 		  </div>
                                  	 </div>   
                                 </td>
                                 
                                 
                                 <td class="edit-prof" style="display:none;">
                                   <div class="wd-92">
                                      <h3>Which trade(s) does you/ your company have the skills, experience and capability to provide?</h3>
                                        <div class="for-se wid">
                                            <select data-placeholder="Choose Functionalities..." name="functionality" class="chosen-select" multiple style="width:350px;" tabindex="4" id="functionalityId">
									         </select>
                                             <input type="submit" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
                                   </div>
                                   </div>   
                                 </td>
                            </tr>
                            
                            <tr>
                            	<td class="">
                                   <div class="wd-92">
                                	<h4><input type="button" name="edit" value="Edit" class="edit" style="display: none;" /></h4>
                                      <h3>Which areas of the country do you operate across?</h3>
                                        <div class="for-se wid" id="citiesStr">                                         
                                 		  </div>
                                  	 </div>   
                                 </td>
                                 
                                 <td class="edit-prof" style="display:none;">
                                   <div class="wd-92">
                                      <h3>Which areas of the country do you operate across?</h3>
                                        <div class="for-se wid">
                                            <select data-placeholder="Choose Functionalities..." name="functionality" class="chosen-select" multiple style="width:350px;" tabindex="4" id="functionalityId">
									         </select>
                                             <input type="button" value="Save"/><input type="button" name="" value="Cancel" class="cancel"/>
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
             <input type="button" id="generalInfoBtn" value="Next >> " class="regis-co"/>
          </form>
        </div>
      </div>
    </div>
    
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>