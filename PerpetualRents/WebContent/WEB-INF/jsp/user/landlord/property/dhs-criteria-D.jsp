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

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/dhs-criteria-D.js"></script>

<style >
.text{
	font-weight: 500!important;
}
</style>



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
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
</head>
<body>
	<%@include file="/WEB-INF/jsp/user/landlord/header.jsp" %>
<div class="clearfix"></div>
<section class="banner" style="height:124px;">
  <div class="flexslider " style="height:150px;">
    <ul class="slides">
      <li style="display: block;"><img src="<%=request.getContextPath()%>/resource/images/slide1.png" title="" alt="" /> </li>
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
            <a href="${contextPath}/property/redirectDHSCriteriaD.htm" class="active" onmouseover="fetchCriteriaDDetails();">Criteria D
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
         
        <h1 class="heading4 margin-top15">Protection against accidents</h1>
        <div class="every-p">
          <article>
            <p><h1 style="font-size: 20px!important;">Falls, Collisions, Cuts and Strains</h1></p>
            <p><strong>Criteria D.</strong> It must provide a reasonable degree of thermal comfort</p>
          </article>
        </div>
        <form name="fDHS-Criteria-DPage" id="fDHS-Criteria-DPage" action="${contextPath}/property/saveDHSCriteriaD.htm" method="post" enctype="multipart/form-data">
          <ul id="menu">
            <li> <a href="#" sequence="10">
              <h1 class="heading3 margin-top15">Does the property comply by ensuring that:
              	<span class="spanClass" sequence ="10" style="font-weight: 19px!important;"></span>
              </h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="PropertyHaveGroup-CR-D-ID1">
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="riskOfFallYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="riskOfFallNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>The risk of falls has been reduced when getting out of the bath/shower/similar facility, to mitigate falls on the same level, or from one level or room to another.</label>
                          <div class="for-se">
                            <input type="radio" id="riskOfFall1" class="" name="riskOfFall" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a1" >Yes</label>
                            <input type="radio" id="riskOfFall2" class=""  name="riskOfFall" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a2">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="riskOfFallComments" name="riskOfFallComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="riskOfFallFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateNaturalLighteningYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateNaturalLighteningNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>There is adequate natural lighting to the top and foot of the stairs </label>
                          <div class="for-se">
                            <input type="radio" id="adequateNaturalLightening1" class="" name="adequateNaturalLightening" value="true" onclick="validateAnswerForYes(this.name)"/>
                            <label for="a3" >Yes</label>
                            <input type="radio" id="adequateNaturalLightening2" class=""  name="adequateNaturalLightening" value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a4">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="adequateNaturalLighteningComments" name="adequateNaturalLighteningComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="adequateNaturalLighteningFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="securedStepsAndRampsYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="securedStepsAndRampsNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>That trip steps/thresholds/ramps are secured where the change in level is less than 300mm.</label>
                          <div class="for-se">
                            <input type="radio" id="securedStepsAndRamps1" class="" name="securedStepsAndRamps"  value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="securedStepsAndRamps2" class=""  name="securedStepsAndRamps" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="securedStepsAndRampsComments" name="securedStepsAndRampsComments"  class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="securedStepsAndRampsFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="doorsDirectionYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="doorsDirectionNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>That doors do not open directly onto stairs or the head of the stairs causing obstruction or increasing the likelihood of a fall.</label>
                          <div class="for-se">
                            <input type="radio" id="doorsDirection1" class="" name="doorsDirection"  value="true" onclick="validateAnswerForYes(this.name)"/>
                            <label for="a7" >Yes</label>
                            <input type="radio" id="doorsDirection2" class=""  name="doorsDirection" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a8">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="doorsDirectionComments" name="doorsDirectionComments"  class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="doorsDirectionFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="moreThanOneFlightOfStairsYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="moreThanOneFlightOfStairsNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>Do you have more than 1 flight of stairs in the property</label>
                          <div class="for-se">
                            <input type="radio" id="moreThanOneFlightOfStairs1" class="" name="moreThanOneFlightOfStairs" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a9" >Yes</label>
                            <input type="radio" id="moreThanOneFlightOfStairs2" class=""  name="moreThanOneFlightOfStairs" value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a10">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="moreThanOneFlightOfStairsComments" name="moreThanOneFlightOfStairsComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="moreThanOneFlightOfStairsFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="buildingRegulationYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="buildingRegulationNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                           <label>
                        		<p>Do all stairs comply with current building regulations i.e</p> 
								<p class="text">Tread dimensions to be between 280mm and 360mm;</p>
								<p class="text">Rise dimensions to be between 100mm-180mm;</p>
								<p class="text">Pitch (angle of stairs) to be less than 42°;</p>
								<p class="text">Stairs should be checked for above average steepness or shallowness;</p>
								<p class="text">Consistency/uniformity in dimensions of rise and going within a flight (except for obvious change in direction of stair e.g. use of winders)</p>
								<p class="text">Nosing should not project more than 18mm beyond any riser;</p>
								<p class="text">Treads and nosing should provide appropriate friction (carpet etc., if possible)</p>
							</label>
                          <div class="for-se">
                            <input type="radio" id="buildingRegulation1" class="" name="buildingRegulation"  value="true" onclick="validateAnswerForYes(this.name)"/>
                            <label for="a11" >Yes</label>
                            <input type="radio" id="buildingRegulation2" class=""  name="buildingRegulation"  value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a12">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" name="buildingRegulationComments" id="buildingRegulationComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="buildingRegulationFile" style="display: none;"/>
                          </div>
                          </td>
                          
                        <td class="new-l pos-fo" id="spaceAccessedDivId" style="display: none;">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img src="${contextPath}/resource/images/tick_48.png" id="centralHeatingYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="centralHeatingNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90" >
                        <label>What space is accessed via the non compliant flight of stairs</label>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="spaceAccessedViaFlightOfStairsComments" name="spaceAccessedViaFlightOfStairsComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="spaceAccessedViaFlightOfStairsFile" style="display: none;" />
                          </div>
                          </td>
                          
                          
                          <td class="new-l pos-fo" id="buildingRegulationDateDivision" style="display: none;">
	                        <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img src="${contextPath}/resource/images/question-mark.png" width="32" height="32" /> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
                        <div class="wd-90" >
                        <label>Upto Which date will this work get done ?</label>
                          <div class="clearfix"></div>
                          <input type="text" id="buildingRegulationDate" name="buildingRegulationDate" class="dat-icon" placeholder="From When This Is Available" class="effect" value="" style="width: 37%!important;" />
                          <span id="buildingRegulationDateSpanId" style="display: block; color: red; margin-left: 25%">Please enter Date.</span>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="electricalWiringStandardsYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="electricalWiringStandardsNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>Electrical wiring installation meets the latest requirements of Institution of Electrical Engineers/British Standard (BS 7671)</label>
                          <div class="for-se">
                            <input type="radio" id="electricalWiringStandards1" class="" name="electricalWiringStandards" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a13" >Yes</label>
                            <input type="radio" id="electricalWiringStandards2" class=""  name="electricalWiringStandards"  value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a14">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="electricalWiringStandardsComments" name="electricalWiringStandardsComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="electricalWiringStandardsFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="trappingBodyPartsYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="trappingBodyPartsNo" style="display: none;" width="48" height="48" class="cross-btn" />
                        <div class="wd-90">
                        <label>Have threats of trapping body parts been removed or reduced ?</label>
                          <div class="for-se">
                            <input type="radio" id="trappingBodyParts1" class="" name="trappingBodyParts" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a13" >Yes</label>
                            <input type="radio" id="trappingBodyParts2" class=""  name="trappingBodyParts"  value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a14">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="trappingBodyPartsComments" name="trappingBodyPartsComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="centralHeatingFile" style="display: none;" />
                          </div>
                          </td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li>
              <input type="button" id="dhsCriteriaDSave" class="regis-co" value="Save and Continue >>" />
              <input type="button" id="dhsCriteriaDBack" class="regis-co" value=" << Back" />
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
