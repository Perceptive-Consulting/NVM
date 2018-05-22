<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css"/>
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen-prism.css" />
<link rel="stylesheet" rel="stylesheet" href="<%=request.getContextPath()%>/resource/api/chosen/chosen.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css"/> 
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript --------------------------------->
<style type="text/css" media="all">
    .chosen-rtl .chosen-drop { left: -9000px; }
    label.error{
		color: #FF0000;
		float: right;
		}
  </style>

<style>
	.breadcrumb a { width:173px!important;}
</style>

<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>
<body>
<c:import url="${wordPressUrl}/sub-header/" ></c:import>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        
       <div class="breadcrumb">
            <a href="#" >Step 1</a>
            <a href="#" class="active">Step 2 </a>
            <a href="#">Step 3 </a>
             <a href="#">Step 4 </a>
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
                                      <h3>Registered office</h3>
                                       <div class="form-fields">
                                            <ul>
                                                <li>Address Line1: <input type="text" name="officeAddObj.addressLine1" id="rAddressLine1" placeholder="" class="effect" value="" maxlength="150"/></li>
                                                <li>Address Line2: <input type="text" name="officeAddObj.addressLine2" id="rAddressLine2" placeholder="" class="effect" maxlength="150" /></li>
                                                <li>City: <input type="text" name="officeAddObj.city" id="rCity" placeholder="" class="effect" value="" maxlength="36"/></li>
                                                <li>County: <input type="text" name="officeAddObj.county" id="rCounty" placeholder="" class="effect" value="" maxlength="36"/></li>                                                
                                                <li>Postcode:<input type="text" name="officeAddObj.postCode" id="rPostCode" placeholder="" class="effect" value="" maxlength="21" style="text-transform: uppercase;" /></li>  
                                                <li>Telephone number: <input type="text" name="officeAddObj.telephoneNumber" id="rPhoneNumber" placeholder=""  class="effect" value="" maxlength="16"/></li>
                                            </ul>
                                        </div>
                                   </div>   
                                </td>
                            </tr>
                            
                           <tr>
                            	<td class="new-l">
                                   <div class="wd-92">
                                      <h3>Office for correspondence</h3><br></br>
                                      <h5 style="margin-top: -9px; margin-bottom: 35px;"><input type="checkbox" name="sameAddress" id="copyAddress" style="float: left;"><label style="margin-left: 12px;">Same as Above</label></h5>
                                        <div class="form-fields">
                                            <ul>
                                               <li>Address Line1: <input type="text" name="correspondenceAddObj.addressLine1" id="cAddressLine1" placeholder="" class="effect" value="" maxlength="150" /></li>
                                                <li>Address Line2: <input type="text" name="correspondenceAddObj.addressLine2" id="cAddressLine2" placeholder="" class="effect" maxlength="150" /></li>
                                                <li>City: <input type="text" name="correspondenceAddObj.city" id="cCity" placeholder="" class="effect" value="" maxlength="36" /></li>
                                                <li>County: <input type="text" name="correspondenceAddObj.county" id="cCounty" placeholder="" class="effect" value="" maxlength="36"/></li>                                                
                                                <li>Postcode:<input type="text" name="correspondenceAddObj.postCode" id="cPostCode" placeholder="" class="effect" value="" maxlength="21" style="text-transform: uppercase;" /></li>  
                                                <li>Telephone number: <input type="text" name="correspondenceAddObj.telephoneNumber" id="cPhoneNumber" placeholder="" class="effect" value="" maxlength="16"/></li>                                
                                            </ul>
                                        </div>
                                   </div>   
                                 </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                      <h3>Company Type</h3>
                                            <select data-placeholder="Choose Company Type..." name="companyTypeId" class="chosen-select" style="width:350px;" tabindex="4" id="companyTypeId">
									        </select>
									        <label id="companyTypeLabel" class="error" generated="true" style="display: none;">Please Select Company Type</label>
                                   </div>  
                                   <div class="for-se wid" id="otherCompanyType" style="display: none;">
                                       <label>Please specify other</label>
                                       <input type="text" id="" class="effect" name="otherCompanyType"  maxlength="150"/>
                                    </div>
                                </td>
                            </tr>
                            
                            
                           <!-- <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="directorsDetails1" class="" name="directorsDetails" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="directorsDetails2" class=""  name="directorsDetails" />
                                              <label for="c4">No</label>
                                   		 </div>
                                  </div>   
                               </td>
                           </tr> -->
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Full names and addresses of all directors, company secretary, partners, associates or proprietor </h3>
                                    <div class="for-se wid">
                                   		<textarea id="allDirectorsOfCompany" name="allDirectorsOfCompany" rows="5" cols="20" style="width: 610px;height: 80px;" class="effect" value="" maxlength="1000"></textarea>
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Have any of the persons named above in been subject to bankruptcy proceedings or been involved in a company that has been subject to liquidation proceedings or had receivers appointed?</h3>
                                   <div class="for-se">
                                      		  <input type="radio" id="bankruptcyProceedings1" class="effect" value="true" name="bankruptcyProceedings" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="bankruptcyProceedings2" class="effect"  value="true" name="bankruptcyProceedings" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="bankruptcyProceedingsYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below, </label>
                                            <input type="text" name="bankruptcyProceedingsComments" class="effect" maxlength="150" />
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Have any persons named above been convicted of any criminal offence other than minor traffic offences?</h3>
                                   <div class="for-se">
                                      		  <input type="radio" id="convictedToCriminalOffence1" class="effect" value="true" name="convictedToCriminalOffence" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="convictedToCriminalOffence2" class="effect"  value="true" name="convictedToCriminalOffence" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="convictedToCriminalOffenceYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below,</label>
                                            <input type="text" name="convictedToCriminalOffenceComments" class="effect" maxlength="150" />
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Are any of the persons named above related to a member of Ashantidutch Property letting or any UK charities  staff or one of its trustees?</h3>
                                   <div class="for-se">
                                      		  <input type="radio" id="trusteeOfAshantiDutch1" class="effect" value="true" name="trusteeOfAshantiDutch" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="trusteeOfAshantiDutch2" class="effect"  value="true" name="trusteeOfAshantiDutch" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="trusteeOfAshantiDutchYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below,</label>
                                            <input type="text" name="trusteeOfAshantiDutchComments" class="effect" maxlength="150" />
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Name and registered address of parent or ultimate holding company (if applicable)</h3>
                                    <div class="for-se wid">
                                   		<textarea id="parentCompanyAddress" name="parentCompanyAddress" rows="5" cols="20" style="width: 300px;" class="effect" value="" maxlength="150"></textarea>
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Company registration number of parent or ultimate holding company (if applicable)</h3>
                                    <div class="for-se wid">
                                       <input type="text" id="companyRegisterationNumber" class="effect" name="companyRegisterationNumber" value="" maxlength="150" />
                                    </div>
                                  </div>   
                               </td>
                           </tr>
                             <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Are you/ your company registered with any trade bodies (e.g. NICEIC)?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="registeredWithTradeBodies1" class="effect" value="true" name="registeredWithTradeBodies" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="registeredWithTradeBodies2" class="effect"  value="true" name="registeredWithTradeBodies" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="registeredWithTradeBodiesYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                            <input type="text" name="registerationNumber" class="effect" maxlength="150" />
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Have you/ your company been accredited or have quality marks awarded by any external bodies (e.g. Trust Mark)?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="qualityMarks1" class="effect" name="qualityMarks" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="qualityMarks2" class="effect"  name="qualityMarks" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="qualityMarksYes" style="display: none;">
                                         	<label for="c4">If YES, please give details below, including registration number(s)</label>
                                         	<textarea id="qualityMarksDetails" name="qualityMarksDetails" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150" ></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Are you/ your company registered with Construction Line?  </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="registeredWithConstructionLine1" value="true" class="effect" name="registeredWithConstructionLine" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="registeredWithConstructionLine2" value="false" class="effect"  name="registeredWithConstructionLine" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="registeredWithConstructionLineYes" style="display: none;">
                                         	<label for="c4">If YES, please give registration number:</label>
                                            <input type="text" name="constructionLineRegisterationNumber" class="effect" />
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
                                     <h3>Number of employees</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="employeesCount" class="effect" name="employeesCount" value="" />
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                     <h3>Trades of employees(e.g. electricians, plumbers etc.)</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="employeesTrade" class="effect" name="employeesTrade" value="" maxlength="150"/>
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Do you normally employ sub-contractors?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="employSubcontractors1" class="effect" name="employSubcontractors" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="employSubcontractors2" class="effect"  name="employSubcontractors" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" id="employSubcontractorsYes" style="display: none;">
                                         	<label for="c4">If YES, please give registration number:</label>
                                            <input type="text" name="employSubContractorRegisterationNumber" class="effect" maxlength="150" />
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
                                     <h3>Please give the address of the tax office that deals with you/ your company's tax returns</h3>
                                        <div class="for-se wid">
                                          <textarea id="taxOfficeAddress" name="taxOfficeAddress" rows="5" cols="20" style="width: 300px;" class="effect" value="" maxlength="150"></textarea>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                     <h3>Tax reference number</h3>
                                        <div class="for-se wid">
                                          <input type="text" id="taxReferenceNumber" class="effect" name="taxReferenceNumber" value="" maxlength="150" />
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                               <td class="new-l">
                               	  <div class="wd-92">
                                     <h3>Please provide the name and address of your insurer</h3>
                                        <div class="for-se wid">
                                        <textarea id="insurerNameandAddress" name="insurerNameandAddress" rows="5" cols="20" style="width: 300px;" class="effect" maxlength="150"></textarea>
                                         </div>
                                   </div>  
                                </td>
                            </tr>
                            
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                     <h3>Policy number </h3>
                                        <div class="for-se wid">
                                          <input type="text" id="policyNumber" class="effect" name="policyNumber" maxlength="150" />
                                        </div>
                                   </div>  
                                </td>
                            </tr>
                            <tr>
                            	<td class="new-l">
                                   <div class="wd-92">
                                      <h3>Levels of insurance cover</h3>
                                        <div class="form-fields">
                                            <ul>
                                                <li>Employer's liability : <input type="text" name="employersLiability" placeholder="" class="effect" value="" maxlength="150"/></li>
                                                <li>Public liability:      <input type="text" name="publicLiability" placeholder="" class="effect" value="" maxlength="150"/></li>
                                                <li>Professional indemnity :<input type="text" name="proffessionalIndemnity" placeholder="" class="effect" value="" maxlength="150"/></li>                                    
                                            </ul>
                                        </div>
                                   </div>   
                                 </td>
                            </tr>
                            <tr>
                            	<td class="new-l">
                                  <div class="wd-92">
                                     <h3>Expiry date of insurance cover</h3>
                                        <div class="for-se wid">
                                       	 <input readonly="readonly" type="text" id="insauranceCoverExpiryDate" placeholder="Pick Date"  name="insauranceCoverExpiryDate" class="effect dat-icon newo" placeholder="DD-MM-YYYY" value="" />
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
             <input type="button" id="contractorRegStep2Btn" value="Save and Continue" class="regis-co"/>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
	var contextPath = getContextPath();
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>

<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready (function(){
		$('.effect').click(function(){
			$(this).addClass('add-effect');
		});
		$('.effect').blur(function(){
			$(this).removeClass('add-effect');
		});
		
		 new JsDatePick({
				useMode:2,
				target:"insauranceCoverExpiryDate",
				dateFormat:"%d-%M-%Y",
				backDate : true
			 });
	    
	});
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/api/chosen/chosen.jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/api/chosen/chosen.prism.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorRegisterationStep2.js"></script>
</body>
</html>
