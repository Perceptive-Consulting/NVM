<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/google-fonts.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css"/> 
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript --------------------------------->
<style type="text/css" media="all">
 .contractor-form .form-fields textarea, .contractor-form .form-fields input[type="text"] {
    float: right;
    margin: 0 0 5px 0;
    width: 140px;
}
.breadcrumb a { width:173px!important;}
	label.error{
		color: #FF0000;
		float: right;
		}
  </style>
  
<!--================== Fonts Calling Section =====-->

<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>
<body>
<c:import url="${wordPressUrl}/sub-header" ></c:import>
 <div id="maskLoader" class="loader" ></div>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container">
    <div class="row">
      <div class="span10">
        <div class="clearfix"></div>
        
       <div class="breadcrumb">
            <a href="#">Step 1</a>
            <a href="#">Step 2</a>
            <a href="#" class="active">Step 3</a>
            <a href="#" >Step 4 </a>
        </div> 
		<div class="contractor-sec" id="parentDiv">
              <ul class="menu">
           		<li> 
              <ul>
                <li>
                  <div class="rg-p">
                     <h1 class="heading3 margin-top15">HEALTH AND SAFETY </h1>
                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="regis regis-1 contractor-form">
                        	<tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have a written health and safety policy?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="writtenHealthPolicy1" class="" value="true" name="writtenHealthPolicy" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="writtenHealthPolicy2" class="" value="false"  name="writtenHealthPolicy" />
                                              <label for="c4">No</label>
                                              <input type="hidden" id="writtenHealthPolicyFileId" class="" value="" name="writtenHealthPolicyFileId" />
                                   		 </div>
                                   		 
                                   		 <form action="${contextPath}/register/contractorRegisterationStep3File.htm" id="fileData" method="post" enctype="multipart/form-data">
	                                         <div class="for-se wid" id="writtenHealthPolicyYes" style="display: none;">
	                                         	<label for="c4">If YES, please enclose a copy:</label>
	                                            <input type="file" id="writtenFile" name="writtenFile" class="" />
	                                            <label id="writtenHealthPolicyFileIDLbl" style="color: red; width: 25%; margin-bottom: 12px; display: block; float: left;"></label>
	                                         </div>
                                         </form>
                                         <div class="for-se wid" style="clear:both; display: none;" id="writtenHealthPolicyNo" >
                                         	<label for="c4">If NO, please provide a statement that demonstrates your commitment to health and safety and the measures you take to identify potential hazards and  minimise the risk of accidents and injury when undertaking your work. </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="writtenHealthPolicyComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                          <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Do you/ your company have access to competent health and safety advice? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="competentHealthAndSafetyAdvice1" class="" value="true" name="competentHealthAndSafetyAdvice" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="competentHealthAndSafetyAdvice2" class="" value="false" name="competentHealthAndSafetyAdvice" />
                                              <label for="c4">No</label>
                                   		 </div>
                                          <div class="for-se wid" style="clear:both; display: none;" id="competentHealthAndSafetyAdviceYes">
                                         	<label for="c4">If YES, please give details including the names and qualifications of individuals (e.g. in-house health and safety officers) as appropriate.? </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="competentHealthAndSafetyAdviceYesComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Have you and/ or your employees received health and safety training? </h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="receivedHealthAndSafety1" class="" value="true" name="receivedHealthAndSafety" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="receivedHealthAndSafety2" class="" value="false" name="receivedHealthAndSafety" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both;" id="receivedHealthAndSafetyYes">
                                         	<label for="c4">If YES, please give details of health and training you/ your employees have undertaken within the last twelve months. </label>
                                           <textarea rows="10" cols="20" style="width: 325px;" name="receivedHealthAndSafetyYesComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Has there been any accidents/incidents have they been recorded by your company, and was this in the last two years.</h3>
                                    	<div class="for-se">
                                      		  <input type="radio" id="accidentReports1" class="" value="true" name="accidentReports" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="accidentReports2" class="" value="false" name="accidentReports" />
                                              <label for="c4">No</label>
                                   		 </div>
                                   <form id="accidentReport">
                                    	<div class="form-fields" id="accidentReportYes" style="display: none;">
                                            <ul>
                                            	<li>Year ending: <input type="text" name="yearEnding1" placeholder="" class="effect" /></li>
                                            	<li>Year ending: <input type="text" name="yearEnding2" placeholder="" class="effect" /></li>
                                            	<li>Fatal accidents: <textarea name="fatalAccidents1" placeholder="" class="effect"></textarea></li>
                                            	<li>Fatal accidents: <textarea name="fatalAccidents2" placeholder="" class="effect"></textarea></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" name="reportableInjuries1" placeholder="" class="effect" /></li>
                                            	<li>Reportable injuries (RIDDOR): <input type="text" name="reportableInjuries2" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" name="nonReportableInjuries1" placeholder="" class="effect" /></li>
                                                <li>Non-reportable injuries: <input type="text" name="nonReportableInjurie2" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate: <input type="text" name="accidentRate1" placeholder="" class="effect" /></li>
                                                <li>Accident/ incident rate: <input type="text" name="accidentRate2" placeholder="" class="effect" /></li>
                                            </ul>
                                        </div>
                                        </form>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Have you/ your company been prosecuted or been issued with enforcement notices in respect of any breaches in health and safety regulations?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="enforcementNoticeforHealthSafety1" class="" value="true" name="enforcementNoticeforHealthSafety" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="enforcementNoticeforHealthSafety2" class="" value="false"  name="enforcementNoticeforHealthSafety" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="enforcementNoticeforHealthSafetyYes" >
                                         	<label for="c4">If YES, please give details. </label>
                                         	<textarea rows="10" cols="20" style="width: 325px;" name="enforcementNoticeforHealthSafetyYesComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Does your company have any ISO accreditation  or is your company working towards one?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="safetyAccreditation1" class="" value="true" name="safetyAccreditation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="safetyAccreditation2" class="" value="false"  name="safetyAccreditation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="safetyAccreditationYes">
                                         	<label for="c4">If YES, please give details including accreditation number(s) </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="safetyAccreditationYesComments" class="effect" maxlength="150"></textarea>
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
                                   		 <div class="for-se ">
                                      		  <input type="radio" id="equalityPolicy1" class="" value="true" name="equalityPolicy" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="equalityPolicy2" class="" value="false"  name="equalityPolicy" />
                                              <label for="c4">No</label>
                                              <input type="hidden" id="equalityPolicyFileId" class=""  name="equalityPolicyFileId" />
                                   		 </div>
                                   		 
                                         <div class="for-se wid" style="display: none;" id="equalityPolicyYes">
                                         	<label for="c4">If YES, please enclose a copy.</label>
                                            <input type="file" name="equalityFile" id="equalityFile" class="" form="fileData"/>
                                            <label id="equalityPolicyFileIDLbl" style="color: red; width: 25%; margin-bottom: 12px; display: block; float: left;"></label>
                                         </div>
                                         
                                         <div class="for-se wid" style="clear:both; display: none;" id="equalityPolicyNo">
                                         	<label for="c4">If NO, please provide a short written statement that demonstrates your awareness of equality and diversity issues.  </label>
                                            <textarea rows="10" cols="20" style="width: 325px;" name="equalityPolicyNoComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>In the last three years, has your company been subject to formal investigations ?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="anyunlawfulDiscrimination1" class="" value="true" name="anyunlawfulDiscrimination" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="anyunlawfulDiscrimination2" class="" value="false" name="anyunlawfulDiscrimination" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="anyunlawfulDiscriminationYes">
                                         	<label for="c4">please give details, including measures taken to address any findings against your company. </label>
                                         	<textarea rows="10" cols="20" style="width: 325px;" name="anyunlawfulDiscriminationYesComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>In the last three years, have you or your company been the subject of formal investigations by the Equality and Human Rights Commission on grounds of alleged unlawful discrimination?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="subjectOfFormalInvestigation1" class="" value="true" name="subjectOfFormalInvestigation" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="subjectOfFormalInvestigation2" class="" value="false"  name="subjectOfFormalInvestigation" />
                                              <label for="c4">No</label>
                                   		 </div>
                                         <div class="for-se wid" style="clear:both; display: none;" id="subjectOfFormalInvestigationYes">
                                         	<label for="c4">If YES, please give brief details, including measures taken to address any findings against your company.</label>
                                           <textarea rows="10" cols="20" style="width: 325px;" name="subjectOfFormalInvestigationYesComments" class="effect" maxlength="150"></textarea>
                                         </div>
                                  </div>   
                               </td>
                           </tr>
                           <tr>
                               <td class="new-l">
                                  <div class="wd-92">
                                    <h3>Are you/ your company willing to abide by the charities Code of Conduct for Contractors ?</h3>
                                   		 <div class="for-se">
                                      		  <input type="radio" id="willingToAbideByCharities1" class="" value="true" name="willingToAbideByCharities" />
                                              <label for="c3" >Yes</label>
                                              <input type="radio" id="willingToAbideByCharities2" class="" value="false" name="willingToAbideByCharities" />
                                              <label for="c4">No</label>
                                   		 </div>
                                  </div>   
                               </td>
                           </tr>
                        </table>
                        <h1 class="heading3 margin-top15">PRICING SCHEDULE </h1>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="price-shedule" id="priceScheduleId">
	                    </table>
	                    <label id="costLabel" style="float: none; color:red; display: none; mar">Please enter cost of all functionalities.</label>
                  </div>
                </li>
              </ul>
            </li>
            </ul>
             <input type="button" id="contractorRegStep3Btn1" value="Save And Continue" class="regis-co" form = "fileData"/>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
<c:import url="${wordPressUrl}/sub-footer/" ></c:import>


<!-- Java Script code -->
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
	var contextPath = getContextPath();
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/from2json.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/contractor/contractorRegisterationStep3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready (function(){
		$('.effect').click(function(){
			$(this).addClass('add-effect');
		});
		$('.effect').blur(function(){
			$(this).removeClass('add-effect');
		});
		
	});
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
</script>
</body>
</html>
