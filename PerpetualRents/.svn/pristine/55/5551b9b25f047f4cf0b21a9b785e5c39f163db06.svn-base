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

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/dhs-criteria-B.js"></script>

<!-- ---------------- flexslider --------------------------------->

<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
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
<script src="<%=request.getContextPath()%>/resource/js/menu.js" type="text/javascript"></script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />
</head>

<body>
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
  <div class="container">
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
            <a href="${contextPath}/property/redirectDHSCriteriaA.htm"  onmouseover="fetchCriteriaADetails();">Criteria A
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaATotalQuestion">0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaAUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaAWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectDHSCriteriaB.htm" class="active" onmouseover="fetchCriteriaBDetails();">Criteria B
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
        <div class="every-p">
          <article>
          	<p><h1 style="font-size: 20px!important;">Space, security, light and noise</h1></p>
            <p><strong>Criteria B. </strong> It must be in a reasonable state of repair </p>
          </article>
        </div>
        <form name="fDHS-Criteria-BPage" id="fDHS-Criteria-BPage" action="${contextPath}/property/saveDHSCriteriaB.htm" method="post" enctype="multipart/form-data">
          <ul id="menu">
            <li> <a href="#" sequence="8">
              <h1 class="heading3 margin-top15">Does the property have:
              <span class="spanClass" sequence ="8" style="font-weight: 19px!important; top: -20px!important;"></span>
              </h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="AgeOfBuildingGroupID">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                          <td class="new-l pos-fo">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource//images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="adequateSizeandLayoutYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="adequateSizeandLayoutNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>If applicable, adequate size and layout of common entrance areas for blocks of flats and if your accommodation is other than a flat then tick yes and please put a comment in the box.(e.g. must not have narrow access ways or steep stairs)</label>
                            <div class="for-se">
                              <input type="radio" id="adequateSizeandLayout1" class="" name="adequateSizeandLayout" value="true" onclick="validateAnswerForYes(this.name)"  />
                              <label for="a1" >Yes</label>
                              <input type="radio" id="adequateSizeandLayout2" class=""  name="adequateSizeandLayout"  value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="a2">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="adequateSizeandLayoutComments" name="adequateSizeandLayoutComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="adequateSizeandLayoutFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="safeAgainstUnauthorizedEntryYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="safeAgainstUnauthorizedEntryNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Is the property safe against unauthorized entry so as to delay and deter intruders and make the occupants feel safer.</label>
                            <div class="for-se">
                              <input type="radio" id="safeAgainstUnauthorizedEntry1" class="" name="safeAgainstUnauthorizedEntry" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="a3" >Yes</label>
                              <input type="radio" id="safeAgainstUnauthorizedEntry2" class=""  name="safeAgainstUnauthorizedEntry"  value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="a4">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="safeAgainstUnauthorizedEntryComments" name="safeAgainstUnauthorizedEntryComments"  class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="safeAgainstUnauthorizedEntryFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="careTakerYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="careTakerNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Is there caretaker/entry phone system to block of flats or residence </label>
                            <div class="for-se">
                              <input type="radio" id="careTaker1" class="" name="careTaker"  value="true" onclick="validateAnswerForYes(this.name)"/>
                              <label for="doorAndWindow" >Yes</label>
                              <input type="radio" id="careTaker2" class=""  name="careTaker" value="false" onclick="validateAnswerForNo(this.name)"/>
                              <label for="doorAndWindow">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="careTakerComments" name="careTakerComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="careTakerFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="burglarAlarmSystemYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="burglarAlarmSystemNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Is there a burglar alarm systems (Upload Document If Available)</label>
                            <input type="file" id="burglarAlarmSystemFile" name="burglarAlarmSystemFile" style="margin-right: 1%;"  />
                            <label id="burglarAlarmLabel" style="color: red; width: 32%; margin-bottom: 12px; display: block; float: left;"></label>
                            <div class="for-se">
                              <input type="radio" id="burglarAlarmSystem1" class="" name="burglarAlarmSystem" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="a7" >Yes</label>
                              <input type="radio" id="burglarAlarmSystem2" class=""  name="burglarAlarmSystem" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="a8">No</label>
                            </div>
                            <div class="rcm" id="burglarAlarmSystemFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="burglarAlarmSystemFileName"></span></a> 
                      	  	 <a class="FileView" id="burglarAlarmSystemFileView" href="" title="Burglar Alarm System" style="display: none;" >View</a>
                      	  	 <a id="burglarAlarmSystemFileDownload" href="" onclick="" target="_blank">Download</a> 
                       		</div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="burglarAlarmSystemComments" name="burglarAlarmSystemComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="allWindowsHaveKeysYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="allWindowsHaveKeysNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>If lockable windows have been fitted do all of the windows have keys?</label>
                            <div class="for-se">
                              <input type="radio" id="allWindowsHaveKeys1" class="" value="true" onclick="validateAnswerForYes(this.name)" name="allWindowsHaveKeys" />
                              <label for="a9" >Yes</label>
                              <input type="radio" id="allWindowsHaveKeys2" class="" value="false" onclick="validateAnswerForNo(this.name)"  name="allWindowsHaveKeys"/>
                              <label for="a10">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="allWindowsHaveKeysComments" name="allWindowsHaveKeysComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="centralHeatingBoilersFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="adequateLighteningYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="adequateLighteningNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Adequate lighting (natural and artificial)</label>
                            <div class="for-se">
                              <input type="radio" id="adequateLightening1" class="" value="true" onclick="validateAnswerForYes(this.name)" name="adequateLightening" />
                              <label for="b1" >Yes</label>
                              <input type="radio" id="adequateLightening2" class="" value="false" onclick="validateAnswerForNo(this.name)"  name="adequateLightening" />
                              <label for="b2">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="adequateLighteningComments" name="adequateLighteningComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="adequateLighteningFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="adequateSecurityLighteningYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="adequateSecurityLighteningNo" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                            <label>Is there adequate Security lighting and is it in working condition</label>
                            <div class="for-se">
                              <input type="radio" id="adequateSecurityLightening1" class="" name="adequateSecurityLightening" value="true" onclick="validateAnswerForYes(this.name)"  />
                              <label for="b5" >Yes</label>
                              <input type="radio" id="adequateSecurityLightening2" class=""  name="adequateSecurityLightening" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="b6">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="adequateSecurityLighteningComments" name="adequateSecurityLighteningComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="adequateSecurityLighteningFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="externalLighteningAtNightYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="externalLighteningAtNightNo" width="48" height="48"  class="cross-btn" />
                          <div class="wd-90">
                            <label>Is the property protected from intrusive artificial external lighting at night are blinds or curtains provided. </label>
                            <div class="for-se">
                              <input type="radio" id="externalLighteningAtNight1" class="" name="externalLighteningAtNight" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="b7" >Yes</label>
                              <input type="radio" id="externalLighteningAtNight2" class=""  name="externalLighteningAtNight" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="b8">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="externalLighteningAtNightComments" name="externalLighteningAtNightComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="externalLighteningAtNightFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="complaintsAgainstNoiseYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="complaintsAgainstNoiseNo" width="48" height="48"  class="cross-btn" />
                          <div class="wd-90">
                            <label>Has there been complaints by your tenant or the neighbours in regard to excessive noise levels, Traffic/other external noise also considered </label>
                            <div class="for-se">
                              <input type="radio" id="complaintsAgainstNoise1" class="" name="complaintsAgainstNoise" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="b7" >Yes</label>
                              <input type="radio" id="complaintsAgainstNoise2" class=""  name="complaintsAgainstNoise" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="b8">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="complaintsAgainstNoiseComments" name="complaintsAgainstNoiseComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="complaintsAgainstNoiseFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="safeBarriersAgainstFireYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="safeBarriersAgainstFireNo" width="48" height="48"  class="cross-btn" />
                          <div class="wd-90">
                            <label>Safe barriers against fires, flames and hot objects, (fire doors etc.) with means of escape  </label>
                            <div class="for-se">
                              <input type="radio" id="safeBarriersAgainstFire1" class="" name="safeBarriersAgainstFire" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="b7" >Yes</label>
                              <input type="radio" id="safeBarriersAgainstFire2" class=""  name="safeBarriersAgainstFire" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="b8">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="safeBarriersAgainstFireComments" name="safeBarriersAgainstFireComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="safeBarriersAgainstFireFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" style="display: none;" id="adequateNoiceInsulationYes" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" style="display: none;" id="adequateNoiceInsulationNo" width="48" height="48"  class="cross-btn" />
                          <div class="wd-90">
                            <label>Is there adequate noise insulation as overlap of domestic noise between one dwelling and another (e.g. toilet flushing/television/conversation etc.)</label>
                            <div class="for-se">
                              <input type="radio" id="adequateNoiceInsulation1" class="" name="adequateNoiceInsulation" value="true" onclick="validateAnswerForYes(this.name)" />
                              <label for="b7" >Yes</label>
                              <input type="radio" id="adequateNoiceInsulation2" class=""  name="adequateNoiceInsulation" value="false" onclick="validateAnswerForNo(this.name)" />
                              <label for="b8">No</label>
                            </div>
                            <div class="clearfix"></div>
                            <label>Comment</label>
                            <textarea maxlength = "250" id="adequateNoiceInsulationComments" name="adequateNoiceInsulationComments" class="effect" ></textarea>
                            <input type="file" id="exampleInputFile" name="adequateNoiceInsulationFile" style="display: none;" />
                          </div></td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li>
              <input type="button" id="dhsCriteriaBSave" class="regis-co" value="Save and Continue" />
              <input type="button" id="dhsCriteriaBBack" class="regis-co" value=" << Back" />
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
