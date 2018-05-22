<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
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

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/dhs-criteria-C.js"></script>



<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
$(document).ready (function(){
	$('.effect').focus(function(){
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
  <div class="container" >
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
            <a href="${contextPath}/property/redirectDHSCriteriaC.htm" class="active" onmouseover="fetchCriteriaCDetails();">Criteria C
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
        <h1 class="heading4 margin-top15">Protection against Infection</h1>
        <div class="every-p">
          <article>
          <p><h1 style="font-size: 20px!important;">Hygiene, sanitation and water supply</h1></p>
            <p><strong>Criteria C. </strong>It must have reasonably modern facilities and services</p>
          </article>
        </div>
        <form name="fDHS-Criteria-CPage" id="fDHS-Criteria-CPage" action="${contextPath}/property/saveDHSCriteriaC.htm" method="post" enctype="multipart/form-data">
          <ul id="menu">
            <li> <a href="#" sequence="9">
              <h1 class="heading3 margin-top15">Does the property have :
              	<span class="spanClass" sequence ="9" style="font-weight: 19px!important; top: -20px!important;"></span>
              </h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p" id="PropertyHaveGroup-CR-C-ID">
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="kitchenYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="kitchenNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>The Kitchen floor should be reasonably smooth and impervious for easy cleaning thus maintaining a hygienic condition, joints between sink/drainer/worktop and adjacent wall should be sealed and water tight</label>
                          <div class="for-se">
                            <input type="radio" id="kitchen1" class="" name="kitchen" value="true" onclick="validateAnswerForYes(this.name)"  />
                            <label for="a1" >Yes</label>
                            <input type="radio" id="kitchen2" class=""  name="kitchen" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a2">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="kitchenComments" name="kitchenComments" class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="kitchenFile" style="display: none;"/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateKitchenSpaceYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateKitchenSpaceNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>A kitchen with adequate space and layout (e.g. large enough to fit sink, cupboards, cooker, worktops )</label>
                          <div class="for-se">
                            <input type="radio" id="adequateKitchenSpace1" class="" name="adequateKitchenSpace" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a3" >Yes</label>
                            <input type="radio" id="adequateKitchenSpace2" class=""  name="adequateKitchenSpace" value="false" onclick="validateAnswerForNo(this.name)"/>
                            <label for="a4">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="adequateKitchenSpaceComments" name="adequateKitchenSpaceComments"  class="effect" ></textarea>
                          <input type="file" id="exampleInputFile" name="adequateKitchenSpaceFile" style="display: none; "/>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="appropriatePowerSocketsYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="appropriatePowerSocketsNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>At least four appropriate power sockets associated with the worktop(s) as well as two for general use. </label>
                          <div class="for-se">
                            <input type="radio" id="appropriatePowerSockets1" class="" name="appropriatePowerSockets" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="appropriatePowerSockets2" class=""  name="appropriatePowerSockets" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="appropriatePowerSocketsComments" name="appropriatePowerSocketsComments" class="effect"  ></textarea>
                          <input type="file" id="exampleInputFile" name="appropriatePowerSocketsFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="facilitiesForPreparationOfFoodYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="facilitiesForPreparationOfFoodNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Satisfactory facilities for preparation and cooking of food with a sink and hot and cold water.</label>
                          <div class="for-se">
                            <input type="radio" id="facilitiesForPreparationOfFood1" class="" name="facilitiesForPreparationOfFood" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="facilitiesForPreparationOfFood2" class=""  name="facilitiesForPreparationOfFood" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="facilitiesForPreparationOfFoodComments" name="facilitiesForPreparationOfFoodComments" class="effect"  ></textarea>
                          <input type="file" id="exampleInputFile" name="facilitiesForPreparationOfFoodFile" style="display: none;" />
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="storageOfFoodYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="storageOfFoodNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Adequate provision and facilities for storage/preparation/cooking of food.</label>
                          <div class="for-se">
                            <input type="radio" id="storageOfFood1" class="" name="storageOfFood" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="storageOfFood2" class=""  name="storageOfFood" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="storageOfFoodComments" name="storageOfFoodComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="suitableVentilationOfKitchenYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="suitableVentilationOfKitchenNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Adequate and appropriate lighting especially over the facilities and suitable ventilation of whole of kitchen area, especially the cooking area.</label>
                          <div class="for-se">
                            <input type="radio" id="suitableVentilationOfKitchen1" class="" name="suitableVentilationOfKitchen" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="suitableVentilationOfKitchen2" class=""  name="suitableVentilationOfKitchen" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="suitableVentilationOfKitchenComments" name="suitableVentilationOfKitchenComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="suitableLocatedWashBasinYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="suitableLocatedWashBasinNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Suitably located bath or shower and wash-hand-basin all with hot and cold water with suitable active ventilation.</label>
                          <div class="for-se">
                            <input type="radio" id="suitableLocatedWashBasin1" class="" name="suitableLocatedWashBasin" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="suitableLocatedWashBasin2" class=""  name="suitableLocatedWashBasin" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="suitableLocatedWashBasinComments" name="suitableLocatedWashBasinComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="drainageOfFoulWaterYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="drainageOfFoulWaterNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Effective drainage for foul-waste/surface-water </label>
                          <div class="for-se">
                            <input type="radio" id="drainageOfFoulWater1" class="" name="drainageOfFoulWater" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="drainageOfFoulWater2" class=""  name="drainageOfFoulWater" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="drainageOfFoulWaterComments" name="drainageOfFoulWaterComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="appropriatelyLocatedBathroomYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="appropriatelyLocatedBathroomNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>An appropriately located bathroom and WC (e.g. it isn't accessed via a bedroom, located outside, or has no sink and is entered from kitchen) </label>
                          <div class="for-se">
                            <input type="radio" id="appropriatelyLocatedBathroom1" class="" name="appropriatelyLocatedBathroom" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="appropriatelyLocatedBathroom2" class=""  name="appropriatelyLocatedBathroom" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="appropriatelyLocatedBathroomComments" name="appropriatelyLocatedBathroomComments" class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="drinkingWaterYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="drinkingWaterNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Water for drinking/cooking/washing/cleaning/sanitation</label>
                          <div class="for-se">
                            <input type="radio" id="drinkingWater1" class="" name="drinkingWater" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="drinkingWater2" class=""  name="drinkingWater" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="drinkingWaterComments" name="drinkingWaterComments"  class="effect" ></textarea>
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
	                        <img src="${contextPath}/resource/images/tick_48.png" id="refuseStorageYes" style="display: none;" width="48" height="48" class="tick-btn" />
	                        <img src="${contextPath}/resource/images/f-cross.png" id="refuseStorageNo" style="display: none;" width="48" height="48" class="cross-btn" />
                          <div class="wd-90">
                        <label>Adequate facilities for refuse storage</label>
                          <div class="for-se">
                            <input type="radio" id="refuseStorage1" class="" name="refuseStorage" value="true" onclick="validateAnswerForYes(this.name)" />
                            <label for="a5" >Yes</label>
                            <input type="radio" id="refuseStorage2" class=""  name="refuseStorage" value="false" onclick="validateAnswerForNo(this.name)" />
                            <label for="a6">No</label>
                          </div>
                          <div class="clearfix"></div>
                          <label>Comment</label>
                          <textarea maxlength = "250" id="refuseStorageComments" name="refuseStorageComments" class="effect" ></textarea>
                          </div>
                          </td>
                       
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li>
              <input type="button" id="dhsCriteriaCSave" value="Save and Continue" class="regis-co" />
              <input type="button" id="dhsCriteriaCBack" value="<< Back" class="regis-co" />
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
