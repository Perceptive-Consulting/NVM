<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorDetailsStep3.js"></script>
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
             <a href="#" id="contractorProfileStep3" class="active">Step 3</a>
             <a href="#" id="contractorProfileStep4" >Step 4 </a>
        </div> 
		<div class="contractor-sec">
              <ul class="menu">
           		<li> 
              <ul>
                <li>
                  <div class="rg-p" id="parentData">
                     <h1 class="heading3 margin-top15">HEALTH AND SAFETY </h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
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
                               
                               <td class="new-l edit-prof" style="display:none;" id="writtenHealthPolicyDivision">
                                  <div class="wd-92">
                                  
                                    <h3>Do you/ your company have a written health and safety policy?</h3>
                                     
                                     <form action="${contextPath}/contractor/updateWrittenHealthPolicyFiles.htm" id="writtenHealthPolicyFileUpdate" method="post" enctype="multipart/form-data">
                                   		 <div class="for-se">
                                      		  <input type="radio" id="writtenHealthPolicy1" value="true" class="" name="writtenHealthPolicy" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="writtenHealthPolicy2" value="false" class=""  name="writtenHealthPolicy" />
                                              <label for="c4">No</label>
                                         </div>
                                         
                                         <div class="for-se wid" id="writtenHealthPolicyYes" style="display: none;">
                                         	<label for="c4">If YES, please enclose a copy:</label>
                                            <input type="file" id="writtenHealthPolicyFile" name="writtenHealthPolicyFile" class="" />
                                            <label id="writtenHealthPolicyFileIDLbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; float: left;"></label>
                                            <div style="float:unset!important; width: 53%!important;" class="for-se wid" id="wFileUpdateBtn" >
                                         		<input type="button" value="Update" id="writtenHealthPolicyFileBtn"/><input type="button" name="" value="Cancel" class="cancel"/>
                                 		 	</div>
                                         </div>
                                      </form>
                                         
                                         <div class="for-se wid" style="clear:both; display: none;" id="writtenHealthPolicyNo">
                                         	<label for="c4">If NO, please provide a statement that demonstrates your commitment to health and safety and the measures you take to identify potential hazards and  minimise the risk of accidents and injury when undertaking your work. </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" id="writtenHealthPolicyComments" name="writtenHealthPolicyComments" class="effect"></textarea>
                                            <input type="button" value="Update" onclick="updateData('writtenHealthPolicy,writtenHealthPolicyComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                         
                                       </div>
                               </td>
                           </tr>
                          <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Do you/ your company have access to competent health and safety advice? </h3>
                                   		  <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="competentHealthAndSafetyAdviceResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="competentHealthAndSafetyAdviceCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;" id="competentHealthAndSafetyAdviceDivision">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have access to competent health and safety advice? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="competentHealthAndSafetyAdvice1" value="true" class="" name="competentHealthAndSafetyAdvice" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="competentHealthAndSafetyAdvice2" value="false" class=""  name="competentHealthAndSafetyAdvice" />
                                              <label for="c4">No</label>
                                   		 </div>
                                          <div class="for-se wid" style="clear:both; display: none;" id="competentHealthAndSafetyAdviceYes">
                                         	<label for="c4">If YES, please give details including the names and qualifications of individuals (e.g. in-house health and safety officers) as appropriate.? </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" id="competentHealthAndSafetyAdviceComments" name="competentHealthAndSafetyAdviceComments" class="effect"></textarea>
                                         </div>
                                         <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('competentHealthAndSafetyAdvice,competentHealthAndSafetyAdviceComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                 	</div> 
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Have you and/ or your employees received health and safety training? </h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="receivedHealthAndSafetyResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="receivedHealthAndSafetyCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="receivedHealthAndSafetyDivision">
                                  <div class="wd-92">
                                    <h3>Have you and/ or your employees received health and safety training? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="receivedHealthAndSafety1" value="true" class="" name="receivedHealthAndSafety" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="receivedHealthAndSafety2" value="false" class=""  name="receivedHealthAndSafety" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         
                                         <div class="for-se wid" style="clear:both; display: none;" id="receivedHealthAndSafetyYes">
                                         	<label for="c4">If YES, please give details of health and training you/ your employees have undertaken within the last twelve months. </label>
                                           <textarea rows="10" cols="20" style="width: 325px;" name="receivedHealthAndSafetyComments" id="receivedHealthAndSafetyComments" class="effect"></textarea>
                                         </div>
                                          <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update"  onclick="updateData('receivedHealthAndSafety,receivedHealthAndSafetyComments');"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                 		 </div> 
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Has there been any accidents/incidents have they been recorded by your company, and was this in the last two years.</h3>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li><span>Year ending: </span><span id="yearEnding1Str"></span></li>
                                            	<li><span>Year ending:</span> <span id="yearEnding2Str"></span></li>
                                            	
                                            	<li><span>Fatal accidents: </span><span id="fatalAccidents1Str"></span></li>
                                            	<li><span>Fatal accidents:</span> <span id="fatalAccidents2Str"></span></li>
                                            	
                                            	<li><span>Reportable injuries (RIDDOR):</span> <span id="reportableInjuries1Str"></span></li>
                                            	<li><span>Reportable injuries (RIDDOR): </span><span id="reportableInjuries2Str"></span></li>
                                            	
                                                <li><span>Accident/ incident rate:</span><span id="accidentRate1Str"></span></li>
                                                <li><span>Accident/ incident rate:</span> <span id="accidentRate2Str"></span></li>
                                                
                                                <li><span>Non-reportable injuries:</span> <span id="nonReportableInjuries1Str"></span></li>
                                                <li><span>Non-reportable injuries:</span> <span id="nonReportableInjuries2Str"></span></li>    
                                                                          
                                            </ul>
                                        </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="yearEnding1Division">
                                  <div class="wd-92">
                                    <h3>Has there been any accidents/incidents have they been recorded by your company, and was this in the last two years.</h3>
                                    	<div class="form-fields">
                                            <ul>
                                            	<li>Year ending: <input type="text" id="yearEnding1" name="yearEnding1" placeholder="" class="effect" /></li>
                                            	<li>Year ending: <input type="text" id="yearEnding2" name="yearEnding2" placeholder="" class="effect" /></li>
                                            	<li>Fatal accidents: <textarea id="fatalAccidents1" name="fatalAccidents1" placeholder="" class="effect"></textarea></li>
                                            	<li>Fatal accidents: <textarea id="fatalAccidents2" name="fatalAccidents2" placeholder="" class="effect"></textarea></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" id="reportableInjuries1" name="reportableInjuries1" placeholder="" class="effect" /></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" id="reportableInjuries2" name="reportableInjuries2" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate (AIR)/100,000 workers: <input type="text" id="accidentRate1" name="accidentRate1" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate (AIR)/100,000 workers: <input type="text" id="accidentRate2" name="accidentRate2" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" id="nonReportableInjuries1" name="nonReportableInjuries1" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" id="nonReportableInjuries2" name="nonReportableInjuries2" placeholder="" class="effect" /></li>                              
                                            </ul>
                                             <input type="button" value="Update" onclick="updateData('yearEnding1,fatalAccidents1,reportableInjuries1,accidentRate1,nonReportableInjuries1,yearEnding2,fatalAccidents2,reportableInjuries2,accidentRate2,nonReportableInjuries2');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                        </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Have you/ your company been prosecuted or been issued with enforcement notices in respect of any breaches in health and safety regulations?</h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="enforcementNoticeforHealthSafetyStr"></strong>
                                   		 </div>
                                   		 <div class="">
                                         	<p style="width:100%; float:left;" id="enforcementNoticeforHealthSafetyCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               
                                <td class="new-l edit-prof" style="display:none;" id="enforcementNoticeforHealthSafetyDivision">
                                  <div class="wd-92 ">
                                    <h3>Have you/ your company been prosecuted or been issued with enforcement notices in respect of any breaches in health and safety regulations?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="enforcementNoticeforHealthSafety1" value="true" class="" name="enforcementNoticeforHealthSafety" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="enforcementNoticeforHealthSafety2" value="false" class=""  name="enforcementNoticeforHealthSafety" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="enforcementNoticeforHealthSafetyYes" >
                                         	<label for="c4">If YES, please give details. </label>
                                         	<textarea rows="10" cols="20" style="width: 325px;" id="enforcementNoticeforHealthSafetyComments" name="enforcementNoticeforHealthSafetyComments" class="effect" maxlenght="150"></textarea>
                                         </div>
                                          <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update" onclick="updateData('enforcementNoticeforHealthSafety,enforcementNoticeforHealthSafetyComments');"/><input type="button" name="" value="Cancel" class="cancel"/></div>
                                 		 </div> 
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                  <h3>Does your company have any ISO accreditation  or is your company working towards one?</h3>
                                    <!-- <h3>Do you/ your company have any external health and safety ISO accreditation (e.g. Contractor Health and Safety Scheme, Safe Contractor etc.)?</h3> -->
                                   		<div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="safetyAccreditationResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="safetyAccreditationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="safetyAccreditationDivision">
                                  <div class="wd-92">
                                    <h3>Does your company have any ISO accreditation  or is your company working towards one?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="safetyAccreditation1" value="true" class="" name="safetyAccreditation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="safetyAccreditation2" value="false" class=""  name="safetyAccreditation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="safetyAccreditationYes">
                                         	<label for="c4">If YES, please give details including accreditation number(s) </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" id="safetyAccreditationComments" name="safetyAccreditationComments" class="effect"></textarea>
                                         </div>
                                          <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update" onclick="updateData('safetyAccreditation,safetyAccreditationComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
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
                                   <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
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
                               
                                <td class="new-l edit-prof" style="display:none;" id="equalityPolicyDivision">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have a written equality and diversity policy?</h3>
                                    <form action="${contextPath}/contractor/updateEqualityPolicyFiles.htm" id="equalityPolicyFileUpdate" method="post" enctype="multipart/form-data">
                                   		 <div class="for-se">
                                      		  <input type="radio" id="equalityPolicy1" value="true" class="" name="equalityPolicy" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="equalityPolicy2" value="false" class=""  name="equalityPolicy" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="display: none;" id="equalityPolicyYes">
                                         	<label for="c4">If YES, please enclose a copy.</label>
                                            <input type="file" name="equalityPolicyFile" id="equalityPolicyFile" class="" />
                                            <label id="equalityPolicyFileIDLbl" style="color: red; width: 25%; margin-bottom: 12px; display: none; float: left;"></label>
                                             <div style="float:unset!important; width: 53%!important;" class="for-se wid" id="eFileUpdateBtn" >
                                         		<input type="button" value="Update" id="equalityPolicyFileBtn"/><input type="button" name="" value="Cancel" class="cancel"/>
                                 		 </div>
                                         </div>
                                         </form>
                                         <div class="for-se wid" style="clear:both; display: none;" id="equalityPolicyNo">
                                         	<label for="c4">If NO, please provide a short written statement that demonstrates your awareness of equality and diversity issues.  </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" id="equalityPolicyComments" name="equalityPolicyComments" class="effect"></textarea>
                                             <input type="button" value="Update" onclick="updateData('equalityPolicy,equalityPolicyComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                 	</div> 
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                  <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>In the last three years, has your company been subject to formal investigations ? </h3>
                                   		 <div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="anyunlawfulDiscriminationStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="anyunlawfulDiscriminationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="anyunlawfulDiscriminationDivision">
                                  <div class="wd-92">
                                    <h3>In the last three years, has any finding of unlawful discrimination been made against your company by any Court or Employment Tribunal? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="anyunlawfulDiscrimination1" value="true" class="" name="anyunlawfulDiscrimination" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="anyunlawfulDiscrimination2" value="false" class=""  name="anyunlawfulDiscrimination" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="anyunlawfulDiscriminationYes">
                                         	<label for="c4">please give details, including measures taken to address any findings against your company. </label>
                                         	<textarea rows="10" cols="20" style="width: 325px;" id="anyunlawfulDiscriminationComments" name="anyunlawfulDiscriminationComments" class="effect"></textarea>
                                         </div>
                                         <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update" onclick="updateData('anyunlawfulDiscrimination,anyunlawfulDiscriminationComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>In the last three years, have you or your company been the subject of formal investigations by the Equality and Human Rights Commission on grounds of alleged unlawful discrimination?</h3>
                                   		<div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="subjectOfFormalInvestigationResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="subjectOfFormalInvestigationCommentsStr"></p>
                                         </div>
                                  </div>   
                               </td>
                               
                               <td class="new-l edit-prof" style="display:none;" id="subjectOfFormalInvestigationDivision">
                                  <div class="wd-92">
                                    <h3>In the last three years, have you or your company been the subject of formal investigations by the Equality and Human Rights Commission on gro unds of alleged unlawful discrimination?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="subjectOfFormalInvestigation1" value="true" class="" name="subjectOfFormalInvestigation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="subjectOfFormalInvestigation2" value="false" class=""  name="subjectOfFormalInvestigation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="subjectOfFormalInvestigationYes">
                                         	<label for="c4">If YES, please give brief details, including measures taken to address any findings against your company.</label>
                                           <textarea rows="10" cols="20" style="width: 325px;" id="subjectOfFormalInvestigationComments" name="subjectOfFormalInvestigationComments" class="effect"></textarea>
                                         </div>
                                         <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update" onclick="updateData('subjectOfFormalInvestigation,subjectOfFormalInvestigationComments');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" /></h4>
                                    <h3>Are you/ your company willing to abide by the charities Code of Conduct for Contractors ?</h3>
                                    	<div class="">
                                      		 <strong style="width:100%;float:left; color:#e33a0c;" id="willingToAbideByCharitiesResStr"></strong>
                                   		 </div>
                                         <div class="">
                                         	<p style="width:100%; float:left;" id="willingToAbideByCharitiesCommentsStr"></p>
                                         </div>
                                   		 
                                  </div>   
                               </td>
                               
                                <td class="new-l edit-prof" style="display:none;" id="willingToAbideByCharitiesDivision">
                                  <div class="wd-92">
                                    <h3>Are you/ your company willing to abide by the charities Code of Conduct for Contractors ?</h3>
                                   		<div class="for-se">
                                      		  <input type="radio" id="willingToAbideByCharities1" value="true" class="" name="willingToAbideByCharities" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="willingToAbideByCharities2" value="false" class=""  name="willingToAbideByCharities" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div style="float:unset!important;" class="for-se wid" >
                                         	<input type="button" value="Update" onclick="updateData('willingToAbideByCharities');"/><input type="button" name="" value="Cancel" class="cancel"/>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                        </table>
                        <h1 class="heading3 margin-top15">PRICING SCHEDULE</h1>
                        <table width="98%" border="0" cellpadding="0" cellspacing="0" class="price-shedule" id="priceScheduleIdStr">
	                    </table>
	                     <div style="float:unset!important;" class="for-se wid full-width" >
	                     	<div class="wd-92 ">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" id="priceScheduleEditBtn"></h4>
                           </div>
                         </div>
	                    <div id="priceScheduleEditDivision" class="edit-prof" style="display: none;">
	                    	<table width="98%" border="0" cellpadding="0" cellspacing="0" class="price-shedule"  id="priceScheduleEditIdStr">
	                    </table>
	                     <div style="float:unset!important; display: none;" class="for-se wid edit-prof"  id="updatePriceBtn">
                             <input type="button" value="Update" id="schedulePriceUpdateBtn" /><input type="button" name="" id="schedulePriceCancelBtn" value="Cancel" class="cancel"/>
                          </div>
	                    </div>
                         
                        <div style="float:unset!important; width: 80%!important; padding: 10px 15px 40px 20px;" class="for-se wid" >
                         		<h3 >If you would like to provide any additional information about your price schedule, please give details below.</h3>
                       				<div class="">
                                       	<p style="width:100%; float:left;" id="additionalInformationOfCostStr"></p>
                                     </div>
                         </div>
                         
                         <div style="float:unset!important; display: inline-block;margin: 0 0 17px 10px !important; width: auto !important;" class="for-se wid " >
	                     	<div class="wd-92 ">
                                   <h4><input type="button" name="edit" value="Edit" class="edit" id="addCostEditId" style="margin-left: 100%!important;"></h4>
                           </div>
                         </div>
                         <div class="wd-92 edit-prof" id="additionalInformationOfCostDivision" style="display: none; float: none;  margin: 0 0 12px; padding: 12px 25px 5px 33px; width: 93%;">
                               	<h3>If you would like to provide any additional information about your price schedule, please give details below.</h3>
                                <textarea style="width: 70%;" id="additionalInformationOfCost" name="additionalInformationOfCost" class="effect"></textarea>
                                 <div style="" class="for-se wid" >
                                  	<input type="button" value="Update" onclick="updateData('additionalInformationOfCost');"/><input id="addCostCancelBtn" type="button" name="" value="Cancel" class="cancel"/>
                                 </div>
                         </div>  
                  </div>
                </li>
              </ul>
            </li>
            </ul>
             <input type="button" id="contractorInfoNextStep3Btn" value="Next >>" class="regis-co"/>
             <input type="button" id="contractorInfoPreviousStep3Btn" value="<< Previous" class="regis-co"/>
        </div>
      </div>
    </div>
    
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
   <script src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>