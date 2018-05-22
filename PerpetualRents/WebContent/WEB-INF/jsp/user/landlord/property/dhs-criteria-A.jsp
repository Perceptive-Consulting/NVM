<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />


<!-- ---------------- JavaScript --------------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/dhs-criteria-A.js"></script>
	
<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
</script>
<%@include file="/WEB-INF/jsp/common/common.jsp" %>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />
</head>
<body id="bodyId">
 <%@include file="/WEB-INF/jsp/user/landlord/header.jsp" %>
<div class="clearfix"></div>
<section class="banner" style="height:124px;">
  <div class="flexslider " style="height:150px;">
    <ul class="slides">
      <li><img src="<%=request.getContextPath()%>/resource/images/slide1.png" title="" alt="" /> </li>
    </ul>
  </div>
  <div class="container">
	  <div class="row">
		  <div class="span-12">
			  <div class="call">
			 	 <div class="ban-cot inner-f ">Call&nbsp;Now.&nbsp; 07801892817</div>
			  </div>
		  </div>
	  </div>
  </div>
</section>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container" id="containerId">
    <div class="row">
      <div class="span10" style="width: 1020px!important;">
        <div class="progress">
          <div class="prog-cap">Form Completion Status</div>
          <section class="work">
           <div id="progressBar" class="round-pink" ><div></div></div>
          </section>
        </div>
         <div class="clearfix"></div>
        <div class="breadcrumb">
        
            <a href="${contextPath}/property/redirectHMOLicence.htm" onmouseover="fetchHMOLicenceDetails();">HMO License
            <div class="adpl-popup" >
            	<ul>
                	<li>Total Questions:<span class="flr" id="hmoLicenseTotalQuestion">0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="hmoLicenseUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="hmoLicenseWrongQues">0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectDHSCriteriaA.htm" class="active" onmouseover="fetchCriteriaADetails();">Criteria A
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaATotalQuestion">0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaAUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaAWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectDHSCriteriaB.htm"  onmouseover="fetchCriteriaBDetails();">Criteria B
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaBTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaBUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaBWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectDHSCriteriaC.htm" onmouseover="fetchCriteriaCDetails();">Criteria C
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaCTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaCUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaCWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectDHSCriteriaD.htm" onmouseover="fetchCriteriaDDetails();">Criteria D
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaDTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaDUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaDWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectMarketingInformation.htm" >Marketing
            <div class="adpl-popup" style="display: none;">
            	<ul>
                	<li>Total Questions:<span class="flr" id="marketingInfoTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="marketingInfoAUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="marketingInfoUnattemptedQues" >0</span></li>
                </ul>
            </div>
            </a>
        </div> 
        
        <h1 class="heading4 margin-top15">Physiological requirements</h1>
        <form name="fDHS-Criteria-APage" id="fDHS-Criteria-APage" action="${contextPath}/property/saveDHSCriteriaA" method="post" enctype="multipart/form-data">
        <div class="every-p">
	
          <article>
           <p><h1 style="font-size: 20px!important;">Hydrothermal condition</h1></p>
            <p><strong>Criteria A.</strong> Free from ALL 'Category 1 Hazards' as set out In the Governments Housing Health and Safety Rating System (HHSRS)</p>
           
            <p>Local authorities are under a duty to take action in the case of category 1 hazards.
             If necessary (or if the owner/manager or tenant requests) the local authority may carry out any necessary
             remedial work themselves and reclaim the costs.
              They also have powers to take action in the case of all category 2 hazards (i.e. those which carry lower risks)</p>
          </article>
          <div class="accept-file" id="acceptedDivId" style="display: none;"><label for="accept" id="acceptedLabel">I accept all the terms and conditions.</label></div>
           <div class="accept-file" id="acceptDivId"><input type="checkbox" id="readAndUnderstandTerms" name="readAndUnderstandTerms" value="" readonly="readonly" /><label for="accept">I have read it.</label></div>
        </div>
          <ul id="menu" style="display: none; margin-top: 45px;">
            <li> <a href="#" sequence = "4">
              <h1>Is the Property?
                <section class="work work-n">
                <span class="spanClass" sequence ="4" style="font-weight: 19px!important;"></span>
              </h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="IsThePropertyGroupID">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
	                       <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="structurallyStableYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="structurallyStableNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Structurally Stable</label>
                            <div class="for-se">
                              <input type="radio" id="structurallyStable1" class="structurallyStable" name="structurallyStable" onclick="validateAnswerForYes(this.name)" value="true" />
                              <label for="a-1" >Yes</label>
                              <input type="radio" id="structurallyStable2" class="structurallyStable" name="structurallyStable" onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="a-2">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" name="structurallyStableComments" id="structurallyStableComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;" />
                          </div></td>
	                        <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="freeFromSeriousDisRepairYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="freeFromSeriousDisRepairNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Free from Serious Disrepair?</label>
                            <div class="for-se">
                              <input type="radio" id="freeFromSeriousDisRepair1" class="" name="freeFromSeriousDisRepair" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="a1" >Yes</label>
                              <input type="radio" id="freeFromSeriousDisRepair2" class=""  name="freeFromSeriousDisRepair"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="a2">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" name="freeFromSeriousDisRepairComments" id="freeFromSeriousDisRepairComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;" />
                          </div></td>
	                        <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="freeFromDampnessYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="freeFromDampnessNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Free from dampness or mould growth?</label>
                            <div class="for-se">
                              <input type="radio" id="freeFromDampness1" class="" name="freeFromDampness" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="a3" >Yes</label>
                              <input type="radio" id="freeFromDampness2" class=""  name="freeFromDampness"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="a4">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" name="freeFromDampnessComments" id="freeFromDampnessComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;" />
                          </div></td>
	                        <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="insulation270mmYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="insulation270mmNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Loft insulation of minimum thickness 270mm </label>
                            <div class="for-se">
                              <input type="radio" id="insulation270mm1" class="" name="insulation270mm" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="a5" >Yes</label>
                              <input type="radio" id="insulation270mm2" class=""  name="insulation270mm"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="a6">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" name="insulation270mmComments" id="insulation270mmComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;" />
                             <div class="clearfix"></div>
                            <div id="installationDateDivId" style="display: none;" >
                            	<label>When the insulation was laid/installed ?</label>
                            	<input type="text" readonly="readonly" id="installationDate" name="installationDate" style="width: 37%!important;" class="dat-icon newo effect" placeholder="DD-MM-YYYY" value="" />
                      			<label id="installationDateLabel" style="display: none; color: red; ">Please select the installation Date.</label>
                            </div>
                          </div></td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" sequence="5">
              <h1>Does the property have <span class="spanClass" sequence ="5" style="font-weight: 19px!important;"> Next >> </span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="DoesThePropertyHaveGroupID">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
	                       <td class="new-l pos-fo">
	                        <div class="question-mrk">
		                        <div class="ques-mrk">
		                       	 <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
		                       	 <div class="qust-popup">
		                       		 Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
		                       	 <div class="dp-arrow"></div>
		                        </div>
		                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="adequateHeatingYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="adequateHeatingNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Adequate heating</label>
                            <div class="for-se">
                              <input type="radio" id="adequateHeating1" class="" name="adequateHeating" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="b7" >Yes</label>
                              <input type="radio" id="adequateHeating2" class=""  name="adequateHeating"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="b8">No</label>
                            </div>
                            <div class="clearfix"></div>
                             <label>Please indicate GCH, other</label>
                             <label>Comment</label>
                            <textarea maxlength = "250" name="adequateHeatingComments" id="adequateHeatingComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;"/>
                           <div class="clearfix"></div>
                            <div id="boilerAgeDivId" style="display: none;">
                            	 <label>How old the boiler is ?</label>
                            	<select name="boilerAge" id="boilerAge" class="for-se" style="margin-right: 72%; width: 28%!important;" onchange="validateBoilerAge(this.value);">
                            	<option value="">Select Age</option>
                            	<option value="1">1 Year</option>
                            	<option value="2">2 Years</option>
                            	<option value="3">3 Years</option>
                            	<option value="4">4 Years</option>
                            	<option value="5">5 Years</option>
                            	<option value="6">6 Years</option>
                            	<option value="7">7 Years</option>
                            	<option value="8">8 Years</option>
                            	<option value="9">9 Years</option>
                            	<option value="10">10 Years</option>
                            	<option value="11">11 Years</option>
                            	<option value="12">12 Years</option>
                            	<option value="13">13 Years</option>
                            	<option value="14">14 Years</option>
                            	<option value="15">15 Years</option>
                            	<option value="15+">more than 15 Years</option>
                            </select>
                            <span id="boilerAgeLabel" style="display: none; color: red; float: left;">Please select age of boiler.</span>
                            </div>
                          </div>
                          </td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" sequence ="6">
              <h1>Is the property free from <span class="spanClass" sequence ="6" style="font-weight: 19px!important;"> Next >> </span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="PropertyFreeFromGroupID">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
	                      <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="pollutantsYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="pollutantsNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Pollutants such as Asbestos, MMF fibres Carbon monoxide (and fuel combustion Products), Biocides, Volatile organic compounds found in paints, radiation & lead?</label>
                            <div class="for-se">
                              <input type="radio" id="pollutants1" class="" name="pollutants" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="c9" >Yes</label>
                              <input type="radio" id="pollutants2" class=""  name="pollutants"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="c10">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>How do you know?</label>
                            <textarea maxlength = "250" name="pollutantsComments" id="pollutantsComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" style="display: none;"/>
                          </div>
                          </td>
                          
                          <td class="new-l pos-fo">
                          <div class="wd-90">
                            <label><p>The main source of harmful radiation in dwellings is from radon gas. Radon is colourless and odourless, and it is not possible to detect it, either in the air or the water, without testing and measurement. But it is airborne radon that poses a more significant threat. Click here to see if your property is in a high concentration area. Radon areas in England and Wales.</p>
								   <p>Radon map link <a target="_blank" href="http://www.ukradon.org">http://www.ukradon.org</a></p>
									<p>If after looking at the above Radon map and you identify that your property needs a risk report you can order one from this link for £3.90, this price was correct at the date of publication 3rd October 2014.</p>
									<p><a target="_blank" href="http://youtu.be/4dnDjmUB-fg">http://youtu.be/4dnDjmUB-fg</a></p>
									</label>
                            <div class="for-se">
                            </div>
                            <div class="clearfix"></div>
                          </div>
                          </td>

                          <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="needRadonRiskReportYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="needRadonRiskReportNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Does your property need a Radon risk Report?</label>
                            <div class="for-se" style="float: left;">
                              <input type="radio" id="needRadonRiskReport1" class="" name="needRadonRiskReport" onclick="validateAnswerForYes(this.name)" value="true"/>
                              <label for="c9" >Yes</label>
                              <input type="radio" id="needRadonRiskReport3" class=""  name="needRadonRiskReport"  onclick="uploadLater(this.name);" value="later" />
                              <label for="c10">Yes, But upload files later</label>
                              <input type="radio" id="needRadonRiskReport2" class=""  name="needRadonRiskReport"  onclick="validateAnswerForNo(this.name)" value="false" />
                              <label for="c10">No</label>
                            </div>
                            <label id="needRadonRiskReportFileLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;"></label>  
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" name="needRadonRiskReportComments" id="needRadonRiskReportComments" class="effect" ></textarea>
                            
                            <div style="display: none;" id="needRadonRiskReportFileDisplay" class="rcm"> 
                      	 	 <a><strong>Name : </strong><span id="needRadonRiskReportFileName"></span></a> 
                      	  	 <a style="display: none;" title=" Radon Risk Report " href="" id="needRadonRiskReportFileView" class="FileView">View</a>
                      	  	 <a target="_blank"  href="" id="needRadonRiskReportFileDownload">Download</a> 
                       		</div>
                            <div class="wd-90" id= "needRadonRiskReportFileDiv" style="display: none;">
                           		 <label>Please attach risk report here.</label>
                            	<div class="clearfix"></div>
                           	 <input type="file" id="needRadonRiskReportFile" name="needRadonRiskReportFile" onchange="validateFile(this.id)" />
                           	  <label id="needRadonRiskReportMaxFileLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max Size is 10 MB</label> 
                            </div>
                          </div>
                          </td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
             <li> <a href="#" sequence="7">
            <h1 class="heading3 margin-top15" id="propertyStandardGroupID">Property Standards :<span class="spanClass" sequence="7" style="font-weight: 19px!important;"> Next >> </span></h1>
            </a>
            <ul>
              <li>
                <div class="rg-p">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                    <tr>
                      <td class="new-l"><label class="lv">Does the property meet all standards as laid as laid down under section A of the property standards guidance note?</label>
                      	<img width="48" height="48" id="propertyMeetStandardsYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      	<img width="48" height="48" id="propertyMeetStandardsNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="for-se" >
                        	<input type="radio" id="propertyMeetStandards1" class="" name="propertyMeetStandards" value="true" onclick="validateAnswerForYes(this.name)" />
                          	<label for="propertyMeetStandards" >Yes</label>																	
                            <input type="radio" id="propertyMeetStandards2" class=""  name="propertyMeetStandards" value = "false" onclick="validateAnswerForNo(this.name)" />
                          <label for="propertyMeetStandards">No</label>
                      	  </div>
                      </td>
                      <td class="new-l" id="" style=" width: 50%!important; margin-top: -80px!important;" >
                        <label class="lv propDivision">If Not, what areas does it fail on?</label>
                        <textarea value="" placeholder="" class="effect propDivision" name="whereITFails" id="whereITFails" ></textarea>
                        <span id="propertyMeetStandardsLabel" class="propDivision" style="display: none; color: red;">Please enter valid reason of failure.</span>
                        </td>
                      <td class="new-l" style="cursor: pointer!important;"><label class="lv">Do you intend to upgrade the property to meet our specification and Decent Home Standard?</label>
                        <div class="for-se" >
                        	<input type="radio" id="upgradeProperty1" class="" name="upgradeProperty" value="true" onclick="validateAnswerForYes(this.name)" />
                          	<label for="a1" >Yes</label>
                            <input type="radio" id="upgradeProperty2" class=""  name="upgradeProperty" value="false" onclick="validateAnswerForNo(this.name)" />
                          <label for="a2">No</label>
                      	 </div>
                      	</td>
                      <td id="workCompletedByLabel" style="display: none;"><label class="regis">When will this work be completed by?</label>
                      <input type="text" readonly="readonly" id="workCompletedBy" style="width: 35% !important;" name="workCompletedBy" class="dat-icon newo effect" placeholder="DD-MM-YYYY" value="" />
                      	<span id="workCompletedBySpanId" style="display: block; color: red; margin-left: 25%"></span>
                      </td>
                      <td>
                      	<img width="48" height="48" id="upgradePropertyYes" style="display: none; margin-top: -100px!important;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      	<img width="48" height="48" id="upgradePropertyNo" style="display: none; margin-top: 10px!important;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                      </td>
                    </tr>
                  </table>
                </div>
              </li>
            </ul>
          </li>
            <li>
              <input type="button" id="dhsCriteriaASave" value="Save and Continue" class="regis-co"/>
              <input type="button" id="dhsCriteriaABack" value="<< Back" class="regis-co"/>
              <input type="button" id="dhsMyPropertiesBtnLink" value="My Properties" class="regis-co"/>
            </li>
          </ul>
          </form>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
 <c:import url="${wordPressUrl}/sub-footer/" ></c:import>
</body>
</html>