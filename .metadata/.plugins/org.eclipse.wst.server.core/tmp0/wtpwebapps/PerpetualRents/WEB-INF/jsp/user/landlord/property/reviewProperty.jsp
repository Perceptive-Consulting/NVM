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

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/property.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property/property-review.js"></script>
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

<style>
.G-heading {
    color: #E33A0C;
    font-size: 20px;
    font-weight: 600;
    margin: 13px 0 0;
    text-transform: none;
}
</style>
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
        
        <form>
          <ul id="menu">
            <li> <a href="#" id="hmoLicenceId">
              <h1>License Information And Certification<span>+</span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p">
                  <div class="G-heading">HMO LICENCE</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label> <p>Is the property Licensable HMO</p> <p>NB: A licensable HMO is a property that is three or more stories high and has five or more people living in it, in more than one household and sharing amenities such as bathrooms, toilets and cooking facilities</p></label>
                        <div class="for-se">
                              <label id="hmoLicence">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="hmoLicenceYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="hmoLicenceNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>     
                        <span style="float:left; width:80%;"><span>License Number</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="hmoLicenceComments"></span></span>
                        </td>
                      </tr>
                      </table>
                      
                      <div class="G-heading">CERTIFICATION</div>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>A statisfactory periodic inspection report for fixed electrical installation in the property from a recognised inspection body.</label>
                        <div class="for-se">
                              <label id="electricalInstallation">Not Set</label>
                              
		                      <img src="${contextPath}/resource/images/tick_48.png" id="electricalInstallationYes" width="48" class="tick-btn" style="display: none;" height="48" />
		                      <img src="${contextPath}/resource/images/f-cross.png" id="electricalInstallationNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                          <div class="rcm" id="electricalInstallationFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="electricalInstallationFileName"></span></a> 
                      		<a class="FileView" id="electricalInstallationFileView" href="" style="display: none;">View</a>
                      	    <a id="electricalInstallationFileDownload" href="${contextPath}/download/certificates.htm?param=electricalInstallation" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A satisfactory Electrical Test Certificate, obtained in the last five years for the fire alarm system (HMO / Bedsit only) from a recognised inspection body (i.e. NICEIC, ECA etc.)</label>
                        <div class="for-se">
                              <label id="electricalTest">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="electricalTestYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="electricalTestNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                         <div class="rcm" id="electricalTestFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="electricalTestFileName"></span></a> 
                      		<a class="FileView" id="electricalTestFileView" href="" style="display: none;">View</a>
                      	    <a id="electricalTestFileDownload" href="${contextPath}/download/certificates.htm?param=electricalTest" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A satisfactory gas safety certificate- a new one will be required every year.</label>
                        <div class="for-se">
                              <label id="gasCertificate">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="gasCertificateYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="gasCertificateNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                          <div class="rcm" id="gasCertificateFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="gasCertificateFileName"></span></a> 
                      		<a class="FileView" id="gasCertificateFileView" href="" style="display: none;">View</a>
                      	    <a id="gasCertificateFileDownload" href="${contextPath}/download/certificates.htm?param=gasCertificate" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A satisfactory Energy Performance Certificate (EPC).</label>
                        <div class="for-se">
                              <label id="energyPerformance">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="energyPerformanceYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="energyPerformanceNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                         <div class="rcm" id="energyPerformanceFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="energyPerformanceFileName"></span></a> 
                      		<a class="FileView" id="energyPerformanceFileView" href="" style="display: none;">View</a>
                      	    <a id="energyPerformanceFileDownload" href="${contextPath}/download/certificates.htm?param=energyPerformance" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A satisfactory service contract for the central heating system (optional)</label>
                        <div class="for-se">
                              <label id="centralHeatingSystem">Not Set</label>
	                          <img src="${contextPath}/resource/images/tick_48.png" id="centralHeatingSystemYes" width="48" class="tick-btn" style="display: none;" height="48" />
      		                  <img src="${contextPath}/resource/images/f-cross.png" id="centralHeatingSystemNo" width="32" class="cross-btn" style="display: none;" height="32" />
                          </div>
                          <div class="rcm" id="centralHeatingSystemFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="centralHeatingSystemFileName"></span></a> 
                      		<a class="FileView" id="centralHeatingSystemFileView" href="" style="display: none;">View</a>
                      	    <a id="centralHeatingSystemFileDownload" href="${contextPath}/download/certificates.htm?param=centralHeatingSystem" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A satisfactory Insurance Certificate / policy document for your building insurance (needed) </label>
                        <div class="for-se">
                              <label id="buildingInsaurance">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="buildingInsauranceYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="buildingInsauranceNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="buildingInsauranceFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="buildingInsauranceFileName" style="display: none;"></span></a> 
                      		<a class="FileView" id="buildingInsauranceFileView" href="">View</a>
                      	    <a id="buildingInsauranceFileDownload" href="${contextPath}/download/certificates.htm?param=buildingInsaurance" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Asbestos survey and any removal works </label>
                        <div class="for-se">
                              <label id="asbestosSurvey">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="asbestosSurveyYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="asbestosSurveyNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="asbestosSurveyFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="asbestosSurveyFileName"></span></a> 
                      		<a class="FileView" id="asbestosSurveyFileView" href="" style="display: none;">View</a>
                      	    <a id="asbestosSurveyFileDownload" href="${contextPath}/download/certificates.htm?param=asbestosSurvey" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Periodic inspection of the water system, for example Legionella and any remedial works required to maintain a safe water supply  </label>
                        <div class="for-se">
                              <label id="periodicInspectionOfWaterSupply">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="periodicInspectionOfWaterSupplyYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="periodicInspectionOfWaterSupplyNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="periodicInspectionOfWaterSupplyFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="periodicInspectionOfWaterSupplyFileName"></span></a> 
                      		<a class="FileView" id="periodicInspectionOfWaterSupplyFileView" href="" style="display: none;">View</a>
                      	    <a id="periodicInspectionOfWaterSupplyFileDownload" href="${contextPath}/download/certificates.htm?param=periodicInspectionOfWaterSupply" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>We need two set of key as NACRO  will retain a set and so will Ashantidutch Property Letting, At the end of the scheme both sets of keys will be returned</label>
                        <div class="for-se">
                              <label id="keySet">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="keySetYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="keySetNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                        </td>
                      </tr>
                      <!-- new questions -->
                      <tr>
                        <td class="new-l">
                        <label>Please upload a copy of your land title registry document. The cost to property owners in 2014 was £3.00 you should have a copy or your solicitor should have a copy as part of the purchase process.
                        <a style="background: none!important; color: blue!important;" target="_blank" href="https://eservices.landregistry.gov.uk/www/wps/portal/!ut/p/b1/04_SjzS0tDQwMTIxMjLXj9CPykssy0xPLMnMz0vMAfGjzOKNjSxMDA1NjDwsjM3MDTxN3dyNDUNMjQ1MjPWDU_P0c6McFQH3SLFU/">https://eservices.landregistry.gov.uk/www/wps/portal/</a> </label>
                        <div class="for-se">
                              <label id="landTitleRegisteryDocument">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="landTitleRegisteryDocumentYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="landTitleRegisteryDocumentNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="landTitleRegisteryDocumentFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="landTitleRegisteryDocumentFileName"></span></a> 
                      		<a class="FileView" id="landTitleRegisteryDocumentFileView" href="" style="display: none;">View</a>
                      	    <a id="landTitleRegisteryDocumentFileDownload" href="${contextPath}/download/certificates.htm?param=landTitleRegisteryDocument" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Inventory for the property.</label>
                        
                        <div class="for-se">
                              <label id="inventoryForProperty">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="inventoryForPropertyYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="inventoryForPropertyNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="inventoryForPropertyFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="inventoryForPropertyFileName"></span></a> 
                      		<a class="FileView" id="inventoryForPropertyFileView" href="" style="display: none;">View</a>
                      	    <a id="inventoryForPropertyFileDownload" href="${contextPath}/download/certificates.htm?param=inventoryForProperty" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Landlords insurance for content.</label>
                        
                        <div class="for-se">
                              <label id="landlordInsauranceForContent">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="landlordInsauranceForContentYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="landlordInsauranceForContentNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="landlordInsauranceForContentFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="landlordInsauranceForContentFileName"></span></a> 
                      		<a class="FileView" id="landlordInsauranceForContentFileView" href="" style="display: none;">View</a>
                      	    <a id="landlordInsauranceForContentFileDownload" href="${contextPath}/download/certificates.htm?param=landlordInsauranceForContent" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                    </table>
                    <div class="G-heading">User Manuals for the following : </div>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr style="display: none;">
							<td>
								<div style="font-size: 25px !important; font-weight: bold;">Do
									You have warranties or manuals for the following :</div>
							</td>
						</tr>
						<tr>
						<td class="new-l">
                        <label>A Warrantee for the windows and doors.</label>
                        
                        <div class="for-se">
                              <label id="windowAndDoorWarrantee">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="windowAndDoorWarranteeYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="windowAndDoorWarranteeNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="windowAndDoorWarranteeFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="windowAndDoorWarranteeFileName"></span></a> 
                      		<a class="FileView" id="windowAndDoorWarranteeFileView" href="" style="display: none;">View</a>
                      	    <a id="windowAndDoorWarranteeFileDownload" href="${contextPath}/download/certificates.htm?param=windowAndDoorWarrantee" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label> The Damp poof course certificate.</label>
                        
                        <div class="for-se">
                              <label id="dampPoofcourse">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="dampPoofcourseYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="dampPoofcourseNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="dampPoofcourseFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="dampPoofcourseFileName"></span></a> 
                      		<a class="FileView" id="dampPoofcourseFileView" href="" style="display: none;">View</a>
                      	    <a id="dampPoofcourseFileDownload" href="${contextPath}/download/certificates.htm?param=dampPoofcourse" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>	Fitted Hob and oven to the Kitchen.</label>
                        
                        <div class="for-se">
                              <label id="fittedHobAndOven">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="fittedHobAndOvenYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="fittedHobAndOvenNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="fittedHobAndOvenFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="fittedHobAndOvenFileName"></span></a> 
                      		<a class="FileView" id="fittedHobAndOvenFileView" href="" style="display: none;">View</a>
                      	    <a id="fittedHobAndOvenFileDownload" href="${contextPath}/download/certificates.htm?param=fittedHobAndOven" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>	Electric shower </label>
                        
                        <div class="for-se">
                              <label id="electricShower">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="electricShowerYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="electricShowerNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="electricShowerFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="electricShowerFileName"></span></a> 
                      		<a class="FileView" id="electricShowerFileView" href="" style="display: none;">View</a>
                      	    <a id="electricShowerFileDownload" href="${contextPath}/download/certificates.htm?param=electricShower" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td class="new-l">
                        <label>	Electric Fires </label>
                        
                        <div class="for-se">
                              <label id="electricFires">Not Set</label>
                              <img src="${contextPath}/resource/images/tick_48.png" id="electricFiresYes" width="48" class="tick-btn" style="display: none;" height="48" />
                              <img src="${contextPath}/resource/images/f-cross.png" id="electricFiresNo" width="32" class="cross-btn" style="display: none;" height="32" />
                         </div>
                         <div class="rcm" id="electricFiresFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="electricFiresFileName"></span></a> 
                      		<a class="FileView" id="electricFiresFileView" href="" style="display: none;">View</a>
                      	    <a id="electricFiresFileDownload" href="${contextPath}/download/certificates.htm?param=electricFires" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>The central heating  </label>
                        <div class="for-se">
                              <label id="manualForCentralHeating">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="manualForCentralHeatingYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="manualForCentralHeatingNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                          <div class="rcm" id="manualForCentralHeatingFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="manualForCentralHeatingFileName"></span></a> 
                      		<a class="FileView" id="manualForCentralHeatingFileView" href="" style="display: none;">View</a>
                      	    <a id="manualForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=manualForCentralHeating" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td class="new-l">
                        <label>Wall fixed timer for the central heating  </label>
                        <div class="for-se">
                              <label id="timerForCentralHeating">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="timerForCentralHeatingYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="timerForCentralHeatingNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                          <div class="rcm" id="timerForCentralHeatingFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="timerForCentralHeatingFileName"></span></a> 
                      		<a class="FileView" id="timerForCentralHeatingFileView" href="" style="display: none;">View</a>
                      	    <a id="timerForCentralHeatingFileDownload" href="${contextPath}/download/certificates.htm?param=timerForCentralHeating" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Service manual for the boiler. </label>
                        <div class="for-se">
                              <label id="manualForBoiler">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="manualForBoilerYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="manualForBoilerNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                          <div class="rcm" id="manualForBoilerFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="manualForBoilerFileName"></span></a> 
                      		<a class="FileView" id="manualForBoilerFileView" href="" style="display: none;">View</a>
                      	    <a id="manualForBoilerFileDownload" href="${contextPath}/download/certificates.htm?param=manualForBoiler" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                       <tr>
                        <td class="new-l">
                        <label>Service manual for fitted hob or oven. </label>
                        <div class="for-se">
                              <label id="manualForFittedOven">Not Set</label>
                              
                       		<img src="${contextPath}/resource/images/tick_48.png" id="manualForFittedOvenYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        	<img src="${contextPath}/resource/images/f-cross.png" id="manualForFittedOvenNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                          <div class="rcm" id="manualForFittedOvenFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="manualForFittedOvenFileName"></span></a> 
                      		<a class="FileView" id="manualForFittedOvenFileView" href="" style="display: none;">View</a>
                      	    <a id="manualForFittedOvenFileDownload" href="${contextPath}/download/certificates.htm?param=manualForFittedOven" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                      
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" id="criteriaA">
              <h1><strong>Criteria A.</strong> Free from ALL 'Category 1 Hazards' as set out In the Governments Housing Health and Safety Rating System (HHSRS)<span>+</span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p">
                  	<article>
			            <p>Local authorities are under a duty to take action in the case of category 1 hazards.
			              If necessary (or if the owner/manager or tenant requests) the local authority may carry out any necessary
			              remedial work themselves and reclaim the costs.
			              They also have powers to take action in the case of all category 2 hazards (i.e. those which carry lower risks)
			             </p>
			             <label id="readAndUnderstandTerms"></label>
         		 </article>
                  <div class="G-heading">IS THE PROPERTY?</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>Structurally Stable</label>
                        <div class="for-se">
                              <label id="structurallyStable">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="structurallyStableYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="structurallyStableNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="structurallyStableComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Free from Serious Disrepair?</label>
                        <div class="for-se">
                              <label id="freeFromSeriousDisRepair">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="freeFromSeriousDisRepairYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="freeFromSeriousDisRepairNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="freeFromSeriousDisRepairComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Free from dampness or mould growth?</label>
                        <div class="for-se">
                              <label id="freeFromDampness">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="freeFromDampnessYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="freeFromDampnessNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="freeFromDampnessComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Loft insulation of minimum thickness 270mm</label>
                        <div class="for-se">
                              <label id="insulation270mm">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="insulation270mmYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="insulation270mmNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="insulation270mmComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr id="insulation270mmChild" style="display: none;">
                        <td class="new-l">
                        <label>When the insulation was laid/installed ?</label>
                         <div class="for-se">
                      		 <label id="installationDate"></label>
                      	</div>
                        </td>
                      </tr>
                      </table>
                      <div class="G-heading">DOES THE PROPERTY HAVE</div>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>Adequate heating?<br/>Please indicate GCH, other</label>
                        <div class="for-se">
                              <label id="adequateHeating">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateHeatingYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateHeatingNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateHeatingComments"></span></span>
                        </td>
                      </tr>
                      <tr id="adequateHeatingChild">
                        <td class="new-l">
                        <label>How old the boiler is ?</label>
                        <div class="for-se">
                              <label id="boilerAge">Not Set</label>
                         </div>
                        </td>
                      </tr>
                      </table>
                     <div class="G-heading">IS THE PROPERTY FREE FROM</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                    <tr>
                        <td class="new-l">
                        <label>Pollutants such as Asbestos, MMF fibres Carbon monoxide (and fuel combustion Products), Biocides, Volatile organic compounds found in paints, radiation & lead?</label>
                        <div class="for-se">
                              <label id="pollutants">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="pollutantsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="pollutantsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="pollutantsComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label><p>The main source of harmful radiation in dwellings is from radon gas. Radon is colourless and odourless, and it is not possible to detect it, either in the air or the water, without testing and measurement. But it is airborne radon that poses a more significant threat. Click here to see if your property is in a high concentration area. Radon areas in England and Wales.</p>
								<p>Radon map link <a target="_blank" href="http://www.ukradon.org/information/ukmaps/englandwalesh">http://www.ukradon.org/information/ukmaps/englandwalesh</a></p>
								<p>If after looking at the above Radon map and you identify that your property needs a risk report you can order one from this link for £3.90, this price was correct at the date of publication 3rd October 2014.</p></label>
                        <div class="for-se">
                            </div>
                        </td>
                      </tr>
                     
                      <tr>
                        <td class="new-l">
                        <label>Does your property need a Radon risk Report?</label>
                        <div class="for-se">
                              <label id="needRadonRiskReport">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="needRadonRiskReportYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="needRadonRiskReportNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="needRadonRiskReportComments"></span></span>
                           <div class="rcm" id="needRadonRiskReportFileDisplay" style="display: none;"> 
                      	 	 <a><strong>Name : </strong><span id="needRadonRiskReportFileName"></span></a> 
                      		<a class="FileView" id="needRadonRiskReportFileView" href="" style="display: none;">View</a>
                      	    <a id="needRadonRiskReportFileDownload" href="${contextPath}/download/certificates.htm?param=needRadonRiskReport" target="_blank" >Download</a> 
                        </div>
                        </td>
                      </tr>
                    </table>
                    <div class="G-heading">PROPERTY STANDARDS</div>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>Does the property meet all standards as laid as laid down under section A of the property standards guidance note?</label>
                        <div class="for-se">
                              <label id="propertyMeetStandards">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="propertyMeetStandardsYes" width="48"class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="propertyMeetStandardsNo" width="32" class="cross-btn" style="display: none;" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>If Not, what areas does it fail on?</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="propertyMeetStandardsComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Do you intend to upgrade the property to meet our specification and Decent Home Standard?</label>
                        <div class="for-se">
                              <label id="upgradeProperty">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="upgradePropertyYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="upgradePropertyNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>When will this work be completed by?</label>
                        <div class="for-se">
                         <label id="workCompletedBy">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                        </td>
                      </tr>
                      </table>
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" id="criteriaB">
              <h1><strong>Criteria B. </strong> It must be in a reasonable state of repair<span>+</span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p">
                  <div class="G-heading">Does the property have :</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>If applicable, adequate size and layout of common entrance areas for blocks of flats (e.g. must not have narrow access ways or steep stairs)</label>
                        <div class="for-se">
                              <label id="adequateSizeandLayout">Not Set</label>
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateSizeandLayoutYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateSizeandLayoutNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateSizeandLayoutComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Is the property safe against unauthorized entry so as to delay and deter intruders and make the occupants feel safer.</label>
                        <div class="for-se">
                              <label id="safeAgainstUnauthorizedEntry">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="safeAgainstUnauthorizedEntryYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="safeAgainstUnauthorizedEntryNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="safeAgainstUnauthorizedEntryComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Is there caretaker/entry phone system to block of flats</label>
                        <div class="for-se">
                              <label id="careTaker">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="careTakerYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="careTakerNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="careTakerComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Is there a burglar alarm systems</label>
                        <div class="for-se">
                              <label id="burglarAlarmSystem">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="burglarAlarmSystemYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="burglarAlarmSystemNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="burglarAlarmSystemComments"></span></span>
                         <div class="rcm" id="burglarAlarmSystemFileDisplay" style="display: none;"> 
                     	 	<a><strong>Name : </strong><span id="burglarAlarmSystemFileName"></span></a> 
                     		<a class="FileView" id="burglarAlarmSystemFileView" href="" style="display: none;">View</a>
                     	    <a id="burglarAlarmSystemFileDownload" href="${contextPath}/download/certificates.htm?param=burglarAlarmSystem" target="_blank" >Download</a> 
                       </div>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>If lockable windows have been fitted do all of the windows have keys?</label>
                        <div class="for-se">
                              <label id="allWindowsHaveKeys">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="allWindowsHaveKeysYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="allWindowsHaveKeysNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="allWindowsHaveKeysComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Adequate lighting (natural and artificial)</label>
                        <div class="for-se">
                              <label id="adequateLightening">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateLighteningYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateLighteningNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateLighteningComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Is there adequate Security lighting and is it in working condition</label>
                        <div class="for-se">
                              <label id="adequateSecurityLightening">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateSecurityLighteningYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateSecurityLighteningNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateSecurityLighteningComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Is the property protected from intrusive artificial external lighting at night?</label>
                        <div class="for-se">
                              <label id="externalLighteningAtNight">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="externalLighteningAtNightYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="externalLighteningAtNightNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="externalLighteningAtNightComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Has there been complaints by your tenant or the neighbours in regard to excessive noise levels, Traffic/other external noise also considered?</label>
                        <div class="for-se">
                              <label id="complaintsAgainstNoise">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="complaintsAgainstNoiseYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="complaintsAgainstNoiseNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="complaintsAgainstNoiseComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Safe barriers against fires, flames and hot objects, (fire doors etc.) with means of escape ?</label>
                        <div class="for-se">
                              <label id="safeBarriersAgainstFire">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="safeBarriersAgainstFireYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="safeBarriersAgainstFireNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="safeBarriersAgainstFireComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Is there adequate noise insulation as overlap of domestic noise between one dwelling and another (e.g. toilet flushing/television/conversation etc.)?</label>
                        <div class="for-se">
                              <label id="adequateNoiceInsulation">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateNoiceInsulationYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateNoiceInsulationNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateNoiceInsulationComments"></span></span>
                        </td>
                      </tr>
                      </table>
                     
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" id="criteriaC">
              <h1><strong>Criteria C. </strong> It must have reasonably modern facilities and services<span>+</span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p">
                  <div class="G-heading">Does the property have :</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>The Kitchen floor should be reasonably smooth and impervious for easy cleaning thus maintaining a hygienic condition, joints between sink/drainer/worktop and adjacent wall should be sealed and water tight</label>
                        <div class="for-se">
                              <label id="kitchen">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="kitchenYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="kitchenNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="kitchenComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>A kitchen with adequate space and layout (e.g. large enough to fit sink, cupboards, cooker, worktops</label>
                        <div class="for-se">
                              <label id="adequateKitchenSpace">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateKitchenSpaceYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateKitchenSpaceNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateKitchenSpaceComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>At least four appropriate power sockets associated with the worktop(s) as well as two for general use.</label>
                        <div class="for-se">
                              <label id="appropriatePowerSockets">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="appropriatePowerSocketsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="appropriatePowerSocketsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="appropriatePowerSocketsComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Satisfactory facilities for preparation and cooking of food with a sink and hot and cold water.</label>
                        <div class="for-se">
                              <label id="facilitiesForPreparationOfFood">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="facilitiesForPreparationOfFoodYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="facilitiesForPreparationOfFoodNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="facilitiesForPreparationOfFoodComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Adequate provision and facilities for storage/preparation/cooking of food.</label>
                        <div class="for-se">
                              <label id="storageOfFood">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="storageOfFoodYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="storageOfFoodNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="storageOfFoodComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Adequate and appropriate lighting especially over the facilities; and Suitable ventilation of whole of kitchen area, especially the cooking area.</label>
                        <div class="for-se">
                              <label id="suitableVentilationOfKitchen">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="suitableVentilationOfKitchenYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="suitableVentilationOfKitchenNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="suitableVentilationOfKitchenComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Suitably located bath or shower and wash-hand-basin all with hot and cold water with suitable active ventilation.</label>
                        <div class="for-se">
                              <label id="suitableLocatedWashBasin">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="suitableLocatedWashBasinYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="suitableLocatedWashBasinNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="suitableLocatedWashBasinComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Effective drainage for foul-waste/surface-water</label>
                        <div class="for-se">
                              <label id="drainageOfFoulWater">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="drainageOfFoulWaterYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="drainageOfFoulWaterNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="drainageOfFoulWaterComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>An appropriately located bathroom and WC (e.g. it isn't accessed via a bedroom, located outside, or has no sink and is entered from kitchen)</label>
                        <div class="for-se">
                              <label id="appropriatelyLocatedBathroom">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="appropriatelyLocatedBathroomYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="appropriatelyLocatedBathroomNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="appropriatelyLocatedBathroomComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Water For drinking/cooking/washing/cleaning/sanitation</label>
                        <div class="for-se">
                              <label id="drinkingWater">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="drinkingWaterYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="drinkingWaterNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="drinkingWaterComments"></span></span>
                        </td>
                      </tr>
                      
                      <tr>
                        <td class="new-l">
                        <label>Adequate facilities for refuse storage</label>
                        <div class="for-se">
                              <label id="refuseStorage">Not Set</label>
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="refuseStorageYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="refuseStorageNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="refuseStorageComments"></span></span>
                        </td>
                      </tr>
                      
                      </table>
                     
                  </div>
                </li>
              </ul>
            </li>
            <li> <a href="#" id="criteriaD">
              <h1><strong>Criteria D.</strong> It must provide a reasonable degree of thermal comfort<span>+</span></h1>
              </a>
              <ul>
                <li>
                  <div class="rg-p">
                  <div class="G-heading">Does the property comply by ensuring that:</div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>The risk of falls has been reduced when getting out of the bath/shower/similar facility, to mitigate falls on the same level, or from one level or room to another. </label>
                        <div class="for-se">
                              <label id="riskOfFall">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="riskOfFallYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="riskOfFallNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="riskOfFallComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>There is adequate natural lighting to the top and foot of the stairs? </label>
                        <div class="for-se">
                              <label id="adequateNaturalLightening">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="adequateNaturalLighteningYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="adequateNaturalLighteningNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="adequateNaturalLighteningComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>That trip steps/thresholds/ramps are secured where the change in level is less than 300mm.</label>
                        <div class="for-se">
                              <label id="securedStepsAndRamps">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="securedStepsAndRampsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="securedStepsAndRampsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="securedStepsAndRampsComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>That doors do not open directly onto stairs or the head of the stairs causing obstruction or increasing the likelihood of a fall.?</label>
                        <div class="for-se">
                              <label id="doorsDirection">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="doorsDirectionYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="doorsDirectionNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="doorsDirectionComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Do you have more than 1 flight of stairs in the property</label>
                        <div class="for-se">
                              <label id="moreThanOneFlightOfStairs">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="moreThanOneFlightOfStairsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="moreThanOneFlightOfStairsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="moreThanOneFlightOfStairsComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>
                        		<p>Do all stairs comply with current building regulations i.e</p> 
								<p class="text">Tread dimensions to be between 280mm and 360mm;</p>
								<p class="text">Rise dimensions to be between 100mm-180mm;</p>
								<p class="text">Pitch (angle of stairs) to be less than 42°;</p>
								<p class="text">Stairs should be checked for above average steepness or shallowness;</p>
								<p class="text">Consistency/uniformity in dimensions of rise and going within a flight (except for obvious change in direction of stair e.g. use of winders);</p>
								<p class="text">Nosing should not project more than 18mm beyond any riser;</p>
								<p class="text">Treads and nosing should provide appropriate friction (carpet etc., if possible)</p>
							</label>
                        <div class="for-se">
                              <label id="buildingRegulation">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="buildingRegulationYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="buildingRegulationNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="buildingRegulationComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>What space is accessed via the non compliant flight of stairs?</label>
                        <div class="for-se">
                              <label id="spaceAccessedViaFlightOfStairs"></label>
                         </div>
                          <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="spaceAccessedViaFlightOfStairsComments"></span></span>
                        </td>
                      </tr>
                      <tr id="buildingRegulationDateDivision">
                        <td class="new-l">
                        <label> Upto Which date will this work get done ?</label>
                        <div class="for-se">
                              <label id="buildingRegulationDate"></label>
                         </div>
                        </td>
                      </tr>
                      </table>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="regis regis-1">
                      <tr>
                        <td class="new-l">
                        <label>Electrical wiring installation meets the latest requirements of Institution of Electrical Engineers/British Standard (BS 7671) </label>
                        <div class="for-se">
                              <label id="electricalWiringStandards">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="electricalWiringStandardsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="electricalWiringStandardsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="electricalWiringStandardsComments"></span></span>
                        </td>
                      </tr>
                      <tr>
                        <td class="new-l">
                        <label>Have threats of trapping body parts been removed or reduced ?</label>
                        <div class="for-se">
                              <label id="trappingBodyParts">Not Set</label>
                              
                              
                        <img src="${contextPath}/resource/images/tick_48.png" id="trappingBodyPartsYes" width="48" class="tick-btn" style="display: none;" height="48" />
                        <img src="${contextPath}/resource/images/f-cross.png" id="trappingBodyPartsNo" width="32" class="cross-btn" style="display: none;" height="32" />
                            </div>
                            <span style="float:left; width:80%;"><span>Comment</span><span>&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="trappingBodyPartsComments"></span></span>
                        </td>
                      </tr>
                    </table>
                  </div>
                </li>
              </ul>
            </li>
            <li>
              <input type="button" id="reviewSubmit" value="Submit" class="regis-co" />
              <input type="button" style="text-decoration: underline!important; display: block;" id="downloadADPLPdfId" value="Downlod ADPL as PDF" class="regis-co" />
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