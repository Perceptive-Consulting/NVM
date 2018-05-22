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
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/popelements.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.remodal.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />


<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css' />

<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/font-awesome.min.css" />
	
<!-- ---------------- JavaScript --------------------------------->


<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.remodal.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/progress-bar/progressbar.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/menu.js" ></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/pop-up.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/hmoLicence-conversation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/hmoLicense-certification.js"></script>


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
	          //checked...
	    });
	  });
	  var flag;
	  
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>
	
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
            <a href="${contextPath}/property/redirectHMOLicence.htm" class="active" onmouseover="fetchHMOLicenceDetails();">HMO License
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
          
        <form action="${contextPath}/property/saveHMOLicense.htm" id="fHMOLicencePage" name="fHMOLicencePage" method="post" enctype="multipart/form-data">
        <ul id="menu">
          <li> <a href="#" sequence="1">
            <h1 class="heading3 margin-top15" id="HMOLicenceGroupID">HMO Licence : <span class="spanClass" sequence ="1" style="font-weight: 19px!important;"></span> </h1>
            </a>
            <ul>
              <li>
                <div class="rg-p">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                    <tr>
                      <td class="new-l" id="HMOLicenceQuestionID"><label> <p>Is the property Licensable HMO</p> <p>NB: A licensable HMO is a property that is three or more stories high and has five or more people living in it, in more than one household and sharing amenities such as bathrooms, toilets and cooking facilities</p></label>
                        <img width="48" height="48" id="licenceNumberYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      	<img width="48" height="48" id="licenceNumberNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="for-se" >
                          <input type="radio" id="hmoLicence1" class="" name="hmoLicence" value="true" onclick="showData('#licenceDIVID','licenceNumber');" />
                          <label for="a1" >Yes</label>
                          <input type="radio" id="hmoLicence2" class="" name="hmoLicence"  value="false" onclick="hideLabel('#licenceDIVID','licenceNumber');" />
                          <label for="a2">No</label>
                          <input type="radio" id="hmoLicence3" class="" name="hmoLicence" value="equalToTrue" onclick="showTickImage('licenceNumber');" />
                          <label for="a1" >Not Applicable</label>
                        </div></td>
                      	<td class="new-l" id="licenceDIVID" hidden="true"><label class="lv">License Number</label>
                        <input type="text" value="" placeholder="" class="effect" name="licenceNumber" id="licenceNumber" />
                        <span id="licenceNumberLabel" style="display: block; color: red;">Please enter licence number.</span>
                       </td>
                    </tr>
                  </table>
                </div>
              </li>
            </ul>
          </li>
          <li> <a href="#" sequence="2">
            <h1 class="heading3 margin-top15" id="certificationGroupID">Certification :<span class="spanClass" sequence="2" style="font-weight: 19px!important;"> Next >> </span></h1>
            </a>
            <ul>
              <li>
                <div class="rg-p">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                    <tr>
                      <td class="new-l pos-fo">
                        <div class="question-mrk">
                        <div class="ques-mrk">
                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
                        <div class="qust-popup">
                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
                        <div class="dp-arrow"></div>
                        </div>
                        </div>
                        </div>
                        <img width="48" height="48" id="electricalInstallationYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                        <img width="48" height="48" id="electricalInstallationNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90" >
                          <label class="lv">A satisfactory periodic inspection report for fixed electrical installation in the property from a recognised inspection body.</label>
                          <div class="clearfix"></div>
                          <div class="for-se lef" >
                            <input type="radio" id="electricalInstallation1" class="" name="electricalInstallation" onclick="showData('#electricalInstallationFileID', this.name);" value="true" />
                            <label for="a2" >Yes</label>
                            <input type="radio" id="electricalInstallation3" class="" name="electricalInstallation" onclick="uploadLater(this.name);" value="later" />
                            <label for="a2" >Yes, But upload files later</label>
                            <input type="radio" id="electricalInstallation2" class=""  name="electricalInstallation" onclick="hideData('#electricalInstallationFileID', this.name);" value="false" />
                            <label for="a3">No</label>
                          </div>
                          <input type="file" id="electricalInstallationFileID" name="electricalInstallationFile" style="display: none;" onchange="validateYesData('electricalInstallation')" onclick="validateCross('electricalInstallation')" />
 						 <label id="electricalInstallationFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;"></label>                          
                        </div>
                         <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="electricalInstallationMessageId"></div>
                        </div>
	                        <div class="rcm" id="electricalInstallationConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="electricalInstallationConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="electricalInstallationConversationView" href="javascript:viewConversation('electricalInstallation')">View Conversation</a>
	                        </div>
                          <div class="rcm" id="electricalInstallationFileDisplay" style="display: none;"> 
                      	 	<a><strong>Name : </strong><span id="electricalInstallationFileName"></span></a> 
                      		<a class="FileView" id="electricalInstallationFileView" href="" title="Electrical Certification" style="display: none;">View</a>
                      	    <a id="electricalInstallationFileDownload" href="${contextPath}/download/certificates.htm?param=electricalInstallation" target="_blank" >Download</a> 
                        </div>
                        </td>
                      <td class="new-l pos-fo" >
                        <div class="question-mrk">
                        <div class="ques-mrk">
                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
                        <div class="qust-popup">
                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
                        <div class="dp-arrow"></div>
                        </div>
                        </div>
                        </div>
                        <img width="48" height="48" id="electricalTestYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                        <img width="48" height="48" id="electricalTestNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">A satisfactory Electrical Test Certificate, obtained in the last five years for the fire alarm system (HMO / Bedsit only) from a recognised inspection body (i.e. NICEIC, ECA etc.)</label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="electricalTest1" class="" name="electricalTest" onclick="showData('#electricalTestFileID', this.name)" value="true" />
                            <label for="a4" >Yes</label>
                             <input type="radio" id="electricalTest3" class="" name="electricalTest" onclick="uploadLater(this.name);" value="later" />
                            <label for="a4" >Yes, But upload files later</label>
                            <input  type="radio" id="electricalTest2" class=""  name="electricalTest" onclick="hideData('#electricalTestFileID', this.name)" value="false" />
                            <label for="a5">No</label>
                          </div>
                          <input type="file" id="electricalTestFileID" name="electricalTestFile" style="display: none;"  onchange="validateYesData('electricalTest')" onclick="validateCross('electricalTest')" />
                          <label id="electricalTestFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="electricalTestMessageId"></div>
                        </div>
                        <div class="rcm" id="electricalTestConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="electricalTestConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="electricalTestConversationView" href="javascript:viewConversation('electricalTest')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="electricalTestFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="electricalTestFileName"></span></a> 
                      	  <a class="FileView" id="electricalTestFileView" href="" title="Electrical Test" style="display: none;" >View</a>
                      	  <a id="electricalTestFileDownload" href="${contextPath}/download/certificates.htm?param=electricalTest" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
	                     <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="gasCertificateYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="gasCertificateNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">A satisfactory gas safety certificate- a new one will be required every year. And will be paid for by the landlord.</label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="gasCertificate1" class="" name="gasCertificate" onclick="showData('#gasCertificateFileID', this.name)" value="true" />
                            <label for="a6" >Yes</label>
                            <input type="radio" id="gasCertificate3" class="" name="gasCertificate" onclick="uploadLater(this.name);" value="later" />
                            <label for="a6" >Yes, But upload files later</label>
                            <input  type="radio" id="gasCertificate2" class=""  name="gasCertificate" onclick="hideData('#gasCertificateFileID', this.name)" value="false" />
                            <label for="a7">No</label>
                          </div>
                          <input type="file" id="gasCertificateFileID" name="gasCertificateFile" style="display: none;"  onchange="validateYesData('gasCertificate')"  onclick="validateCross('gasCertificate')" />
                          <label id="gasCertificateFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;"></label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="gasCertificateMessageId"></div>
                        </div>
                        <div class="rcm" id="gasCertificateConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="gasCertificateConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="gasCertificateConversationView" href="javascript:viewConversation('gasCertificate')">View Conversation</a>
	                     </div>
                         <div class="rcm" id="gasCertificateFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="gasCertificateFileName"></span></a>
                      	   <a class="FileView" id="gasCertificateFileView" href="" title="Gas Certificate" style="display: none;" >View</a>
                      	  <a id="gasCertificateFileDownload" href="${contextPath}/download/certificates.htm?param=gasCertificate" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                       <td class="new-l pos-fo" >                      
                  	   <div class="question-mrk">
                        <div class="ques-mrk">
                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
                        <div class="qust-popup">
                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
                        <div class="dp-arrow"></div>
                        </div>
                        </div>
                        </div>
                         <img width="48" height="48" id="energyPerformanceYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                         <img width="48" height="48" id="energyPerformanceNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">A satisfactory Energy Performance Certificate (EPC band A - High D all other bands will need to be updated by 2018 or your property may be deemed as been uninhabitable thus been in breach of contract) for more information see website for details.</label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="energyPerformance1" class="" name="energyPerformance" onclick="showData('#energyPerformanceFileID', this.name)" value="true" />
                            <label for="a8" >Yes</label>
                            <input type="radio" id="energyPerformance3" class="" name="energyPerformance" onclick="uploadLater(this.name);" value="later" />
                            <label for="a8" >Yes, But upload files later</label>
                            <input type="radio" id="energyPerformance2" class=""  name="energyPerformance" onclick="hideData('#energyPerformanceFileID', this.name)" value="false" />
                            <label for="a9">No</label>
                          </div>
                          <input type="file" id="energyPerformanceFileID" name="energyPerformanceFile" style="display: none;"  onchange="validateYesData('energyPerformance')"  onclick="validateCross('energyPerformance')"  />
                          <label id="energyPerformanceFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label> 
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="energyPerformanceMessageId"></div>
                        </div>
                         <div class="rcm" id="energyPerformanceConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="energyPerformanceConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="energyPerformanceConversationView" href="javascript:viewConversation('energyPerformance')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="energyPerformanceFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="energyPerformanceFileName"></span></a>
                      	   <a class="FileView" id="energyPerformanceFileView" href="" title="Energy Performance" style="display: none;" >View</a>
                      	  <a id="energyPerformanceFileDownload" href="${contextPath}/download/certificates.htm?param=energyPerformance" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                    	  <td class="new-l pos-fo" >                    
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="centralHeatingSystemYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                       		 <img width="48" height="48" id="centralHeatingSystemNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">A satisfactory service contract for the central heating system (optional)</label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="centralHeatingSystem1" class="" name="centralHeatingSystem" onclick="showData('#centralHeatingSystemFileID', this.name)" value="true" />
                            <label for="a11" >Yes</label>
                            <input type="radio" id="centralHeatingSystem3" class="" name="centralHeatingSystem" onclick="uploadLater(this.name);" value="later" />
                            <label for="a11" >Yes, But upload files later</label>
                            <input type="radio" id="centralHeatingSystem2" class=""  name="centralHeatingSystem" onclick="hideData('#centralHeatingSystemFileID', this.name)" value="false" />
                            <label for="a12">No</label>
                            <input type="radio" id="centralHeatingSystem4" class=""  name="centralHeatingSystem" value="N/A" onclick="notApplicable(this.name)"/>
                            <label for="a122">Not applicable</label>
                          </div>
                          <label>Comments</label>
                          <textarea maxlength = "250" name="centralHeatingSystemComments" id="centralHeatingSystemComments" class="effect" ></textarea>
                          <input type="file" id="centralHeatingSystemFileID" name="centralHeatingSystemFile"  style="display: none;"  onchange="validateYesData('centralHeatingSystem')"  onclick="validateCross('centralHeatingSystem')" />
                          <label id="centralHeatingSystemFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                        </div>
                         <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="centralHeatingSystemMessageId"></div>
                        </div>
                        <div class="rcm" id="centralHeatingSystemConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="centralHeatingSystemConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="centralHeatingSystemConversationView" href="javascript:viewConversation('centralHeatingSystem')">View Conversation</a>
	                     </div>
                         <div class="rcm" id="centralHeatingSystemFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="centralHeatingSystemFileName"></span></a> 
                      	   <a class="FileView" id="centralHeatingSystemFileView" href="" title="Central Heating System" style="display: none;" >View</a>
                      	  <a id="centralHeatingSystemFileDownload" href="${contextPath}/download/certificates.htm?param=centralHeatingSystem" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                   	  <td class="new-l pos-fo" >                  
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                        <img width="48" height="48" id="buildingInsauranceYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png" />
                      		<img width="48" height="48" id="buildingInsauranceNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">A satisfactory Insurance Certificate / policy document for your building insurance (needed) </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="buildingInsaurance1" class="" name="buildingInsaurance" onclick="showData('#buildingInsauranceFileID', this.name)" value="true" />
                            <label for="a13" >Yes</label>
                            <input type="radio" id="buildingInsaurance3" class="" name="buildingInsaurance" onclick="uploadLater(this.name);" value="later" />
                            <label for="a13" >Yes, But upload files later</label>
                            <input type="radio" id="buildingInsaurance2" class=""  name="buildingInsaurance" onclick="hideData('#buildingInsauranceFileID', this.name)" value="false"  />
                            <label for="a14">No</label>
                          </div>
                          <input type="file" id="buildingInsauranceFileID" name="buildingInsauranceFile"  style="display: none;"  onchange="validateYesData('buildingInsaurance')"  onclick="validateCross('buildingInsaurance')" />
                          <label id="buildingInsauranceFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90">
                        	<div id="buildingInsauranceMessageId"></div>
                        </div>
                        <div class="rcm" id="buildingInsauranceConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="buildingInsauranceConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="buildingInsauranceConversationView" href="javascript:viewConversation('buildingInsaurance')">View Conversation</a>
	                     </div>
                         <div class="rcm" id="buildingInsauranceFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="buildingInsauranceFileName"></span></a> 
                      	   <a class="FileView" id="buildingInsauranceFileView" href="" title="Building Insaurance" style="display: none;" >View</a>
                      	  <a id="buildingInsauranceFileDownload" href="${contextPath}/download/certificates.htm?param=buildingInsaurance" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        <!-- =====================================Modified=========================================== -->
                        
                         <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="asbestosSurveyYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="asbestosSurveyNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">Asbestos survey and any removal works </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="asbestosSurvey1" class="" name="asbestosSurvey" onclick="showData('#asbestosSurveyFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                             <input type="radio" id="asbestosSurvey3" class="" name="asbestosSurvey" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="asbestosSurvey2" class=""  name="asbestosSurvey" onclick="hideData('#asbestosSurveyFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="asbestosSurveyFileID" name="asbestosSurveyFile" style="display: none;" onchange="validateYesData('asbestosSurvey');" onclick="validateCross('asbestosSurvey')" />
                          <label id="asbestosSurveyFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;"></label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="asbestosSurveyMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="asbestosSurveyConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="asbestosSurveyConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="asbestosSurveyConversationView" href="javascript:viewConversation('asbestosSurvey')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="asbestosSurveyFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="asbestosSurveyFileName"></span></a> 
                      	   <a class="FileView" id="asbestosSurveyFileView" href="" title="Asbestos Survey" style="display: none;" >View</a>
                      	  <a id="asbestosSurveyFileDownload" href="${contextPath}/download/certificates.htm?param=asbestosSurvey" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="periodicInspectionOfWaterSupplyYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="periodicInspectionOfWaterSupplyNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">Periodic inspection of the water system, for example Legionella and any remedial works required to maintain a safe water supply </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="periodicInspectionOfWaterSupply1" class="" name="periodicInspectionOfWaterSupply" onclick="showData('#periodicInspectionOfWaterSupplyFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="periodicInspectionOfWaterSupply3" class="" name="periodicInspectionOfWaterSupply" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="periodicInspectionOfWaterSupply2" class=""  name="periodicInspectionOfWaterSupply" onclick="hideData('#periodicInspectionOfWaterSupplyFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="periodicInspectionOfWaterSupplyFileID" name="periodicInspectionOfWaterSupplyFile" style="display: none;" onchange="validateYesData('periodicInspectionOfWaterSupply');" onclick="validateCross('periodicInspectionOfWaterSupply')" />
                          <label id="periodicInspectionOfWaterSupplyFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="periodicInspectionOfWaterSupplyMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="periodicInspectionOfWaterSupplyConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="periodicInspectionOfWaterSupplyConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="periodicInspectionOfWaterSupplyConversationView" href="javascript:viewConversation('periodicInspectionOfWaterSupply')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="periodicInspectionOfWaterSupplyFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="periodicInspectionOfWaterSupplyFileName"></span></a> 
                      	  <a class="FileView" id="periodicInspectionOfWaterSupplyFileView" href="" title="Periodic Inspection Of Water Supply" style="display: none;" >View</a> 
                      	  <a id="periodicInspectionOfWaterSupplyFileDownload" href="${contextPath}/download/certificates.htm?param=periodicInspectionOfWaterSupply" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                         <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="keySetYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="keySetNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">We need 3  sets of keys as the Charity or Charities will retain a set and so will Ashantidutch Property Letting and a key will be passed to the tenant. At the end of the scheme all  keys will be returned. </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="keySet1" class="" name="keySet" onclick="showData('#keySetYes', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="keySet2" class=""  name="keySet" onclick="hideData('null', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                        </div>
                        <div class="clearfix"></div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="landTitleRegisteryDocumentYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="landTitleRegisteryDocumentNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Please upload a copy of your land title registry document. The cost to property owners in 2014 was £3.00 you should have a copy or your solicitor should have a copy as part of the purchase process.
                          	<a style="background: none!important; color: blue!important;" target="_blank" href="https://eservices.landregistry.gov.uk/www/wps/portal/!ut/p/b1/04_SjzS0tDQwMTIxMjLXj9CPykssy0xPLMnMz0vMAfGjzOKNjSxMDA1NjDwsjM3MDTxN3dyNDUNMjQ1MjPWDU_P0c6McFQH3SLFU/">https://eservices.landregistry.gov.uk/www/wps/portal/</a>
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="landTitleRegisteryDocument1" class="" name="landTitleRegisteryDocument" onclick="showData('#landTitleRegisteryDocumentFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="landTitleRegisteryDocument3" class="" name="landTitleRegisteryDocument" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="landTitleRegisteryDocument2" class=""  name="landTitleRegisteryDocument" onclick="hideData('#landTitleRegisteryDocumentFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="landTitleRegisteryDocumentFileID" name="landTitleRegisteryDocumentFile" style="display: none;" onchange="validateYesData('landTitleRegisteryDocument');" onclick="validateCross('landTitleRegisteryDocument')" />
                          <label id="landTitleRegisteryDocumentFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="landTitleRegisteryDocumentMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="landTitleRegisteryDocumentConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="landTitleRegisteryDocumentConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="landTitleRegisteryDocumentConversationView" href="javascript:viewConversation('landTitleRegisteryDocument')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="landTitleRegisteryDocumentFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="landTitleRegisteryDocumentFileName"></span></a> 
                      	  <a class="FileView" id="landTitleRegisteryDocumentFileView" href="" title="Land Title Registery Document" style="display: none;" >View</a> 
                      	  <a id="landTitleRegisteryDocumentFileDownload" href="${contextPath}/download/certificates.htm?param=landTitleRegisteryDocument" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="inventoryForPropertyYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="inventoryForPropertyNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Inventory for the property.
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="inventoryForProperty1" class="" name="inventoryForProperty" onclick="showData('#inventoryForPropertyFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="inventoryForProperty3" class="" name="inventoryForProperty" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="inventoryForProperty2" class=""  name="inventoryForProperty" onclick="hideData('#inventoryForPropertyFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="inventoryForPropertyFileID" name="inventoryForPropertyFile" style="display: none;" onchange="validateYesData('inventoryForProperty');" onclick="validateCross('inventoryForProperty')" />
                          <label id="inventoryForPropertyFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="inventoryForPropertyMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="inventoryForPropertyConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="inventoryForPropertyConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="inventoryForPropertyConversationView" href="javascript:viewConversation('inventoryForProperty')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="inventoryForPropertyFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="inventoryForPropertyFileName"></span></a> 
                      	  <a class="FileView" id="inventoryForPropertyFileView" href="" title="Inventory For Property" style="display: none;" >View</a> 
                      	  <a id="inventoryForPropertyFileDownload" href="${contextPath}/download/certificates.htm?param=inventoryForProperty" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="landlordInsauranceForContentYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="landlordInsauranceForContentNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Landlords insurance for content.
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="landlordInsauranceForContent1" class="" name="landlordInsauranceForContent" onclick="showData('#landlordInsauranceForContentFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="landlordInsauranceForContent3" class="" name="landlordInsauranceForContent" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="landlordInsauranceForContent2" class=""  name="landlordInsauranceForContent" onclick="hideData('#landlordInsauranceForContentFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="landlordInsauranceForContentFileID" name="landlordInsauranceForContentFile" style="display: none;" onchange="validateYesData('inventoryForProperty');" onclick="validateCross('inventoryForProperty')" />
                          <label id="landlordInsauranceForContentFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="landlordInsauranceForContentMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="landlordInsauranceForContentConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="landlordInsauranceForContentConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="landlordInsauranceForContentConversationView" href="javascript:viewConversation('landlordInsauranceForContent')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="landlordInsauranceForContentFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="landlordInsauranceForContentFileName"></span></a> 
                      	  <a class="FileView" id="landlordInsauranceForContentFileView" href="" title="Inventory For Property" style="display: none;" >View</a> 
                      	  <a id="landlordInsauranceForContentFileDownload" href="${contextPath}/download/certificates.htm?param=landlordInsauranceForContent" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                    </tr>
                  </table>
                </div>
              </li>
            </ul>
          </li>
          <li> <a href="#" sequence="3">
            <h1 class="heading3 margin-top15" id="">User Manuals for the following : <span class="spanClass" sequence ="3" style="font-weight: 19px!important;">Next >> </span> </h1>
            </a>
            <ul>
              <li>
                <div class="rg-p">
                  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                    <tr>
                    	
                    	<td style="display: none;">
                        	<div style="font-size: 25px!important; font-weight: bold; ">Do You have warranties or manuals for the following :</div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="windowAndDoorWarranteeYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="windowAndDoorWarranteeNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	A Warrantee for the windows and doors
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="windowAndDoorWarrantee1" class="" name="windowAndDoorWarrantee" onclick="showData('#windowAndDoorWarranteeFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="windowAndDoorWarrantee3" class="" name="windowAndDoorWarrantee" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="windowAndDoorWarrantee2" class=""  name="windowAndDoorWarrantee" onclick="hideData('#windowAndDoorWarranteeFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="windowAndDoorWarranteeFileID" name="windowAndDoorWarranteeFile" style="display: none;" onchange="validateYesData('windowAndDoorWarrantee');" onclick="validateCross('windowAndDoorWarrantee')" />
                          <label id="windowAndDoorWarranteeFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="windowAndDoorWarranteeMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="windowAndDoorWarranteeConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="windowAndDoorWarranteeConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="windowAndDoorWarranteeConversationView" href="javascript:viewConversation('windowAndDoorWarrantee')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="windowAndDoorWarranteeFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="windowAndDoorWarranteeFileName"></span></a> 
                      	  <a class="FileView" id="windowAndDoorWarranteeFileView" href="" title="Inventory For Property" style="display: none;" >View</a> 
                      	  <a id="windowAndDoorWarranteeFileDownload" href="${contextPath}/download/certificates.htm?param=windowAndDoorWarrantee" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="dampPoofcourseYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="dampPoofcourseNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	The Damp poof course certificate  
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="dampPoofcourse1" class="" name="dampPoofcourse" onclick="showData('#dampPoofcourseFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="dampPoofcourse3" class="" name="dampPoofcourse" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="dampPoofcourse2" class=""  name="dampPoofcourse" onclick="hideData('#dampPoofcourseFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="dampPoofcourseFileID" name="dampPoofcourseFile" style="display: none;" onchange="validateYesData('dampPoofcourse');" onclick="validateCross('dampPoofcourse')" />
                          <label id="dampPoofcourseFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="dampPoofcourseMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="dampPoofcourseConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="dampPoofcourseConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="dampPoofcourseConversationView" href="javascript:viewConversation('dampPoofcourse')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="dampPoofcourseFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="dampPoofcourseFileName"></span></a> 
                      	  <a class="FileView" id="dampPoofcourseFileView" href="" title="Damp Poof Course" style="display: none;" >View</a> 
                      	  <a id="dampPoofcourseFileDownload" href="${contextPath}/download/certificates.htm?param=dampPoofcourse" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="fittedHobAndOvenYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="fittedHobAndOvenNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Fitted Hob and oven to the Kitchen.
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="fittedHobAndOven1" class="" name="fittedHobAndOven" onclick="showData('#fittedHobAndOvenFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="fittedHobAndOven3" class="" name="fittedHobAndOven" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="fittedHobAndOven2" class=""  name="fittedHobAndOven" onclick="hideData('#fittedHobAndOvenFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="fittedHobAndOvenFileID" name="fittedHobAndOvenFile" style="display: none;" onchange="validateYesData('fittedHobAndOven');" onclick="validateCross('fittedHobAndOven')" />
                          <label id="fittedHobAndOvenFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="fittedHobAndOvenMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="fittedHobAndOvenConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="fittedHobAndOvenConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="fittedHobAndOvenConversationView" href="javascript:viewConversation('fittedHobAndOven')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="fittedHobAndOvenFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="fittedHobAndOvenFileName"></span></a> 
                      	  <a class="FileView" id="fittedHobAndOvenFileView" href="" title="Damp Poof Course" style="display: none;" >View</a> 
                      	  <a id="fittedHobAndOvenFileDownload" href="${contextPath}/download/certificates.htm?param=fittedHobAndOven" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                         <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="electricShowerYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="electricShowerNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Electric shower 
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="electricShower1" class="" name="electricShower" onclick="showData('#electricShowerFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="electricShower3" class="" name="electricShower" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="electricShower2" class=""  name="electricShower" onclick="hideData('#electricShowerFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="electricShowerFileID" name="electricShowerFile" style="display: none;" onchange="validateYesData('electricShower');" onclick="validateCross('electricShower')" />
                          <label id="electricShowerFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="electricShowerMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="electricShowerConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="electricShowerConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="electricShowerConversationView" href="javascript:viewConversation('electricShower')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="electricShowerFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="electricShowerFileName"></span></a> 
                      	  <a class="FileView" id="electricShowerFileView" href="" title="Damp Poof Course" style="display: none;" >View</a> 
                      	  <a id="electricShowerFileDownload" href="${contextPath}/download/certificates.htm?param=electricShower" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="electricFiresYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="electricFiresNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Electric Fires 
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="electricFires1" class="" name="electricFires" onclick="showData('#electricFiresFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="electricFires3" class="" name="electricFires" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="electricFires2" class=""  name="electricFires" onclick="hideData('#electricFiresFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="electricFiresFileID" name="electricFiresFile" style="display: none;" onchange="validateYesData('electricFires');" onclick="validateCross('electricFires')" />
                          <label id="electricFiresFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="electricFiresMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="electricFiresConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="electricFiresConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="electricFiresConversationView" href="javascript:viewConversation('electricFires')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="electricFiresFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="electricFiresFileName"></span></a> 
                      	  <a class="FileView" id="electricFiresFileView" href="" title="Damp Poof Course" style="display: none;" >View</a> 
                      	  <a id="electricFiresFileDownload" href="${contextPath}/download/certificates.htm?param=electricFires" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                    	
                    
                      <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="manualForCentralHeatingYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="manualForCentralHeatingNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	The central heating  
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="manualForCentralHeating1" class="" name="manualForCentralHeating" onclick="showData('#manualForCentralHeatingFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="manualForCentralHeating3" class="" name="manualForCentralHeating" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="manualForCentralHeating2" class=""  name="manualForCentralHeating" onclick="hideData('#manualForCentralHeatingFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="manualForCentralHeatingFileID" name="manualForCentralHeatingFile" style="display: none;" onchange="validateYesData('manualForCentralHeating');" onclick="validateCross('manualForCentralHeating')" />
                          <label id="manualForCentralHeatingFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="manualForCentralHeatingMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="manualForCentralHeatingConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="manualForCentralHeatingConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="manualForCentralHeatingConversationView" href="javascript:viewConversation('manualForCentralHeating')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="manualForCentralHeatingFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="manualForCentralHeatingFileName"></span></a> 
                      	  <a class="FileView" id="manualForCentralHeatingFileView" href="" title="Central Heating Manual" style="display: none;" >View</a> 
                      	  <a id="manualForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=manualForCentralHeating" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="timerForCentralHeatingYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="timerForCentralHeatingNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Wall fixed timer for the central heating . 
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="timerForCentralHeating1" class="" name="timerForCentralHeating" onclick="showData('#timerForCentralHeatingFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="timerForCentralHeating3" class="" name="timerForCentralHeating" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="timerForCentralHeating2" class=""  name="timerForCentralHeating" onclick="hideData('#timerForCentralHeatingFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="timerForCentralHeatingFileID" name="timerForCentralHeatingFile" style="display: none;" onchange="validateYesData('timerForCentralHeating');" onclick="validateCross('timerForCentralHeating')" />
                          <label id="timerForCentralHeatingFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="timerForCentralHeatingMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="timerForCentralHeatingConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="timerForCentralHeatingConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="timerForCentralHeatingConversationView" href="javascript:viewConversation('timerForCentralHeating')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="timerForCentralHeatingFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="timerForCentralHeatingFileName"></span></a> 
                      	  <a class="FileView" id="timerForCentralHeatingFileView" href="" title="Central Heating Timer" style="display: none;" >View</a> 
                      	  <a id="timerForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=timerForCentralHeating" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="manualForBoilerYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="manualForBoilerNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Service manual for the boiler. 
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="manualForBoiler1" class="" name="manualForBoiler" onclick="showData('#manualForBoilerFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="manualForBoiler3" class="" name="manualForBoiler" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="manualForBoiler2" class=""  name="manualForBoiler" onclick="hideData('#manualForBoilerFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="manualForBoilerFileID" name="manualForBoilerFile" style="display: none;" onchange="validateYesData('manualForBoiler');" onclick="validateCross('manualForBoiler')" />
                          <label id="manualForBoilerFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="manualForBoilerMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="manualForBoilerConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="manualForBoilerConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="manualForBoilerConversationView" href="javascript:viewConversation('manualForBoiler')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="manualForBoilerFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="manualForBoilerFileName"></span></a> 
                      	  <a class="FileView" id="manualForBoilerFileView" href="" title="Boiler Manual" style="display: none;" >View</a> 
                      	  <a id="manualForBoilerFileDownload" href="${contextPath}/download/certificates.htm?param=manualForBoiler" onclick="" target="_blank">Download</a> 
                        </div>
                        </td>
                        
                        <td class="new-l pos-fo" >                      
	                     <div class="question-mrk">
	                        <div class="ques-mrk">
	                        <img width="32" height="32" src="${contextPath}/resource/images/question-mark.png"/> 
	                        <div class="qust-popup">
	                        Governments Health and Safety Rating System (HHSRS) Introduced in April 2006 (Any questions answered
	                        <div class="dp-arrow"></div>
	                        </div>
	                        </div>
	                        </div>
	                         <img width="48" height="48" id="manualForFittedOvenYes" style="display: none;" class="tick-btn" src="${contextPath}/resource/images/tick_48.png"/>
                      		 <img width="48" height="48" id="manualForFittedOvenNo" style="display: none;" class="cross-btn" src="${contextPath}/resource/images/f-cross.png"/>
                        <div class="wd-90">
                          <label class="lv">
                          	Service manual for fitted hob or oven. 
                           </label>
                          <div class="clearfix"></div>
                          <div class="for-se lef">
                            <input type="radio" id="manualForFittedOven1" class="" name="manualForFittedOven" onclick="showData('#manualForFittedOvenFileID', this.name)" value="true" />
                            <label for="a15" >Yes</label>
                            <input type="radio" id="manualForFittedOven3" class="" name="manualForFittedOven" onclick="uploadLater(this.name);" value="later" />
                            <label for="a15" >Yes, But upload files later</label>
                            <input type="radio" id="manualForFittedOven2" class=""  name="manualForFittedOven" onclick="hideData('#manualForFittedOvenFileID', this.name)" value="false" />
                            <label for="a16">No</label>
                          </div>
                          <input type="file" id="manualForFittedOvenFileID" name="manualForFittedOvenFile" style="display: none;" onchange="validateYesData('manualForFittedOven');" onclick="validateCross('manualForFittedOven')" />
                          <label id="manualForFittedOvenFileIDLbl" style="color: red; width: 30%; margin-top: 40px; display: none; float: none;">Max size 10Mb</label>
                          <div class="clearfix"></div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="wd-90" id="manualForFittedOvenMessageId">
                        	<div ></div>
                        </div>
                        <div class="rcm" id="manualForFittedOvenConversationDisplay" style="display: none;"> 
	                      	 	 <a><strong id="manualForFittedOvenConversationMessage">You have already invite Contractors for this job.</strong></a> 
	                      		<a id="manualForFittedOvenConversationView" href="javascript:viewConversation('manualForFittedOven')">View Conversation</a>
	                     </div>
                          <div class="rcm" id="manualForFittedOvenFileDisplay" style="display: none;"> 
                      	  <a><strong>Name : </strong><span id="manualForFittedOvenFileName"></span></a> 
                      	  <a class="FileView" id="manualForFittedOvenFileView" href="" title="Fitted Oven Manual" style="display: none;" >View</a> 
                      	  <a id="manualForFittedOvenFileDownload" href="${contextPath}/download/certificates.htm?param=manualForFittedOven" onclick="" target="_blank">Download</a>
                        </div>
                        </td>
                      	
                    </tr>
                  </table>
                </div>
              </li>
            </ul>
          </li>
          <li>
             <input type="button" id="saveHMOLicencePage" class="regis-co" value="Save and Continue >>" />
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
  <div id="cId" class="remodal tabs-file" style="max-width:1140px;" data-remodal-id="contractorId" style="display: none;">
  	 <div id="maskLoader" class="loader" ></div>
	  <h1>Contractor</h1>
	   <span id="invitationErrorMessageId" style="display: none; position: absolute; top:0px; margin: 0 auto; height: 35px; border-radius:6px; width: 42%; border:1px solid #ccc; left:0; right:0; line-height: 35px;
  				background:#FFD6D6 url('${contextPath}/resource/images/not-ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center; margin-left: 407px;"></span>
	  <table id="contractorTable" width="100%" border="0" cellspacing="0" cellpadding="0" >
	  </table>
	  <textarea style="margin: 57px 0 0 107px; width: 60%;" maxlength = "250" placeholder="Description of task." name="jobsDescription" id="jobsDescription" onfocus="javascript:$(this).css('border','1px solid #E33A0C').animate({height:'50px'});" onblur="javascript:$(this).css('border','1px solid #ccc')" ></textarea>
	  <button style="margin: 82px 16px 0; float: right;" class="remodal-cancel">Close</button>
	  <button style="margin: 82px 16px 0; float: right;" class="remodal-button" id="sendQuotationId">Invite</button>
 </div>
	
	<div class="popup" id="emailPopUpId" onclick = "checkEvent(event)">
	<div id="maskLoader" class="loader" ></div>
		<span id="successMsgId1" style="display: none; position: absolute; top:37%; margin: 0 auto; height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0;
 		line-height: 35px; background:#66FF99 url('${contextPath}/resource/images/ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center;"></span>
 		<span id="errorMsgId1" style="display: none; position: absolute; top:10%; margin: 0 auto; height: 35px; border-radius:6px; width: 20%; border:1px solid #ccc; left:0; right:0; line-height: 35px;
  		background:#FFD6D6 url('${contextPath}/resource/images/not-ok-icon.png') no-repeat 25px 5px; background-size: 25px 25px; z-index:99999; text-align: center;"></span>
		
	  <div class="pop_up" style="width: 60%;">
	      <img src="${contextPath}/resource/images/cross-image.png" id="closeId" class="close" style="right: 6px; top: -25px; display: none;"/>
	      <div class="popup_h2" style=" padding:15px 35px;">
	      </div>
		      <div class="email-area" style="width: 100%!important; margin-top: 55px!important; padding: 4px;min-height: 86% !important;">
	          <div class="left-inbox" style="height: 96%!important;"> <span class="inbox-ar">Contractors</span>
	          <div class="clearfix"></div>
	            <ul class="menu" id="contractorListId">
	            </ul>
	          </div>
	          <div class="right-index">
	          <div class="tab_content2" id="tab1">
	            <h1 class="heading4 margin-top15" id="subjectId"></h1>
	            <div class="index-blog">
	            <form name="fEmail" id="emailId">
	            	<div id="conId"></div>
	            	<input type="hidden" name="conversationId" id="conversationId" value=""/>
	              <textarea placeholder="Type your message" name="mailBody" id="mailBody" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});"></textarea>
	              
	              <input type="button" id="sendEmail" class="regis-co" value="Send" />
	              
	             </form>
	              <div class="clearfix"></div><!--
	              <div class="arrow-bottom"></div>-->
	            </div>
	           	<div id="mailContentId">
	           		<div id="alertErrorId1" class="alert alert-block alert-error fade in" style="display: none;" >
	          		  <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
	          	  <h4 class="alert-heading" animation="true"  id="errorMessageId1">There is no conversation yet.</h4>
	 				</div>
	           	</div>
	           </div>
	        </div>
	      </div>
	      <button type="button" id="closeButton" class=" button-file close">Cancel</button>
	     <!--  <button type="button" id="rejectOk" class="button-file">OK</button> -->
	      </div>
	  </div>
  	
  	
  	
