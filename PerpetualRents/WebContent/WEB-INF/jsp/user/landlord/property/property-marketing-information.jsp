<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<!-- ---------------- JavaScript --------------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.carouFredSel-5.6.4-packed.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/marketing-information.js"></script>

<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js">
$(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
</script>
  <style>
label.error{
	color: #FF0000;
	float: right;
}
	
</style> 

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

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
            <div class="adpl-popup">
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
            <a href="${contextPath}/property/redirectDHSCriteriaD.htm" onmouseover="fetchCriteriaDDetails();">Criteria D
            <div class="adpl-popup">
            	<ul>
                	<li>Total Questions:<span class="flr" id="criteriaDTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="criteriaDUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="criteriaDWrongQues" >0</span></li>
                </ul>
            </div>
            </a>
            <a href="${contextPath}/property/redirectMarketingInformation.htm" class="active" >Marketing
            <div class="adpl-popup" style="display: none;">
            	<ul>
                	<li>Total Questions:<span class="flr" id="marketingInfoTotalQuestion" >0</span></li>
                	<li>Unattempted Questions:<span class="flr" id="marketingInfoAUnattemptedQues" >0</span></li>
                	<li>Wrong Questions:<span class="flr" id="marketingInfoUnattemptedQues" >0</span></li>
                </ul>
            </div>
            </a>
        </div> 
        
        <h1 class="heading4 margin-top15">Property Marketing Information</h1>
        <!--<div class="every-p">
          <article>
            <p><strong>Criteria D.</strong> It must provide a reasonable degree of thermal comfort</p>
          </article>
        </div>-->
        <form name="fMarketingInfo" id="fMarketingInfo" action="${contextPath}/property/saveMarketingInformation.htm" method="post"  enctype="multipart/form-data">
          <div class="rg-p">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="regis">
              <tbody>
                <tr>
                  <td><label>The property will be available to let from (date)? </label>
                   <input type="text" id="availability" name="availability" class="dat-icon" placeholder="From When This Is Available" value="" style="background-position: 446px -695px;"/></td>
                  <td><label>What is the rent for this property(per month)</label>
                    <input type="text" id="rentAmount" name="rentAmount" class="" placeholder="Rent Amount" value="" /></td>
                </tr>
                <tr>
                  <td><label>Type of property</label>
                    <select id="propertyType" name="propertyType" class="form-control">
                      <option value="1">House</option>
                      <option value="2">Flat</option>
                      <option value="3">Maisonette</option>
                      <option value="4">HMO</option>
                      <option value="5">Bungalows</option> 
                      <option value="6">Studio flats</option>
                      <option value="7">Studio flat above Shop</option>
                      <option value="8">Flat above Shop</option>
                      <option value="9">Flat/Studio in converted industrial unit</option>
                      <option value="10">Flat/Studio in converted House</option>
                      <option value="11">Other</option>
                    </select></td>
                  <td id="otherPropertyTypeId"  style="display: none;"><label id="labelId"></label>
                    <input type="text" id="propertyOtherType" name="propertyOtherType" class="" placeholder="" value="" /></td>
                </tr>
                <tr>
                  <td><label>What length of let are you willing to offer the Tenant(Months)?</label>
                    <select id="rentPeriod" name="rentPeriod">
                    <option value = "1">less than 6</option>
                      <option value = "2">6</option>
                      <option value = "3">12</option>
                      <option value = "4">18</option>
                      <option value = "5">24</option>
                      <option value = "6">30</option>
                      <option value = "7">36</option>
                    </select></td>
                    <td id = "lessRentReasonCommentTypeId" style = "display: none;"><label id="rentReasonLabelId" ></label>
                    <input type="text" id = "rentReasonComment" name="rentReasonComment" class=""  value="" />
                    </td>
                  <td><label>Number of bedrooms</label>
                    <input type="text" id="bedroomCount" name="bedroomCount" class="" placeholder="Total no. of Bedrooms" value="" /></td>
                </tr>
                <tr>
                  <td><label>Number of bathrooms- to include bath And/ or shower, WC and basin</label>
                    <input type="text" id="bathroomCount" name="bathroomCount" class="" placeholder="Total no. of Bathrooms" value="" /></td>
                  <td><label>Separate WC</label>
                    <input type="text" id="seprateWC" name="seprateWC" class="" placeholder="Any Seprate WC" value="" /></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="form-mg"></div>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
              <tr>
                <h1 class="heading3 margin-top15">Furnishing we will provide all furniture.</h1>
                <td class="new-l"><label>Is the property furnished?</label>
                  <div class="for-se">
                    <input type="radio" id="furnished1" class="" name="furnished" value="true" onclick="showData('#furnishedPropertyLabel')"/>
                    <label for="a15" >Yes</label>
                    <input type="radio" id="furnished2" class=""  name="furnished" value="false" onclick="hideLabel('#furnishedPropertyLabel')"/>
                    <label for="a16">No</label>
                  </div>
                  <div class="clearfix"></div>
                  </td>
              </tr>
            </table>
          </div>
          
           <div class="form-mg"></div>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
              <tr>
                <h1 class="heading3 margin-top15">Property Photos.</h1>
                <td class="new-l"><label style="width: 95%!important;">Please upload pictures, Adding images of your property especially of the kitchen, bathroom, will help us to get back to you sooner, however these shots maybe in the inventory.</label>
                  <div class="clearfix"></div>
                  <input type="file" id="furnishedPropertyFile" name="furnishedPropertyFile" multiple />
                  <label id="furnishedPropertyFileIDLbl" style="color: red; width: 32%; margin-bottom: 12px; display: block; float: left;"></label>
                  </td>
                  <td id="imageDisplaytd" class="new-l" style="display: none;">
                  <div class="clearfix"></div>
                  <div class="im-gal" >
                   <ul id="imageGalary">
                   
                   </ul> 
					<a id="prev2" class="prev" href="#">&laquo;</a>
					<a id="next2" class="next" href="#">&raquo;</a>
					<div id="pager2" class="pager"></div>
                 </div>
                  </td>
              </tr>
            </table>
          </div>
          
          <div class="form-mg"></div>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
              <tr>
                <h1 class="heading3 margin-top15">Does the property include:</h1>
                <td class="new-l"><label>Flooring</label>
                  <div class="for-se">
                    <input type="radio" id="flooring1" class="" value="true" name="flooring" />
                    <label for="a17" >Yes</label>
                    <input type="radio" id="flooring2" class=""  value="false" name="flooring" />
                    <label for="a18">No</label>
                  </div>
                  <div class="clearfix"></div>
                   <label>Comment (Type of flooring)</label>
                   <textarea maxlength = "250" id="flooringComments" name="flooringComments" class="effect"></textarea>
                  </td>
              </tr>
              
                <td class="new-l"><label>Curtains/Blinds </label>
                  <div class="for-se">
                    <input type="radio" id="curtains1" value="true" class="" name="curtains" />
                    <label for="a19" >Yes</label>
                    <input type="radio" id="curtains2" value="false" class=""  name="curtains" />
                    <label for="a20">No</label>
                  </div>
                  <div class="clearfix"></div>
                   <label>Comment (Type of curtain)</label>
                   <textarea maxlength = "250" id="curtainsComments" name="curtainsComments" class="effect" ></textarea>
                  </td>
              </tr>
            </table>
          </div>
          <div class="form-mg"></div>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
              <tr>
                <h1 class="heading3 margin-top15">Does the property have own or share a communal garden ?</h1>
                <td class="new-l"><label>At the front</label>
                  <div class="for-se">
                    <input type="radio" id="frontGarden1" value="true" class="" name="frontGarden" />
                    <label for="a21" >Yes</label>
                    <input type="radio" id="frontGarden2" value="false" class=""  name="frontGarden" />
                    <label for="a22">No</label>
                  </div>
                  <div class="clearfix"></div>
                   <label>Comment</label>
                   <textarea maxlength = "250" id="frontGardenComments" name="frontGardenComments" class="effect" ></textarea>
                  </td>
                <td class="new-l"><label>At the Back</label>
                  <div class="for-se">
                    <input type="radio" id="rearGarden1" value="true" class="" name="rearGarden" />
                    <label for="a23" >Yes</label>
                    <input type="radio" id="rearGarden2" value="false" class=""  name="rearGarden" />
                    <label for="a24">No</label>
                  </div>
                  <div class="clearfix"></div>
                   <label>Comment</label>
                   <textarea maxlength = "250" id="rearGardenComments" name="rearGardenComments" class="effect" ></textarea>
                  </td>
              </tr>
            </table>
          </div>
          <div class="form-mg"></div>
          <div class="rg-p">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
              <tr>
                <h1 class="heading3 margin-top15">Access</h1>
                <td class="new-l"><label>Are there steps that must be used to enter the property which do not have wheelchair access?</label>
                  <div class="for-se">
                    <input type="radio" id="wheelChairAccess1" value="true" class="" name="wheelChairAccess" />
                    <label for="a21" >Yes</label>
                    <input type="radio" id="wheelChairAccess2" value="false" class=""  name="wheelChairAccess"  />
                    <label for="a22">No</label>
                  </div>
                  
                  <div class="clearfix"></div>
                   <label>Comment</label>
                   <textarea maxlength = "250" id="wheelChairAccessComments" name="wheelChairAccessComments" class="effect" ></textarea>
                  </td>
                <td class="new-l"><label>Are there steps within the property other than a staircase between floors in a house, e.g. rooms on the ground floor at different levels? </label>
                  <div class="for-se">
                    <input type="radio" id="extraStairs1" class="" name="extraStairs" />
                    <label for="a23" >Yes</label>
                    <input type="radio" id="extraStairs2" class=""  name="extraStairs" />
                    <label for="a24">No</label>
                  </div>
                  <div class="or-field"></div>
                  <div class="clearfix"></div>
                  <label>Comment</label>
                  <textarea maxlength = "250" id="extraStairsComments" name="extraStairsComments" class="effect" ></textarea></td>
              </tr>
            </table>
          </div>
          <input type="button" id="marketingInformationSubmit" class="regis-co" value="Submit" />
          <input type="button" id="marketingInformationBack" class="regis-co" value="<< Back" />
          <input type="button" id="dhsMyPropertiesBtnLink" value="My Properties" class="regis-co"/>
        </form>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
	<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
</body>
</html>