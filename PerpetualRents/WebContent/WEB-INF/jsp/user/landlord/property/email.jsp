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
<link rel="stylesheet" rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />
<link rel="stylesheet" rel="stylesheet"  href="<%=request.getContextPath()%>/resource/css/popelements.css" />


<!-- ---------------- JavaScript ------------------------------------>
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property-conversation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/dropdown-menu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property-assigned-jobs.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/landlord/property-pmc-conversation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/pop-up.js"></script> 


<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });

  $(document).ready(function(){
		 new JsDatePick({
				useMode:2,
				target:"estimatedCompletionDate",
				dateFormat:"%d-%M-%Y",
				backDate : true
		 });	 
	 });
</script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>

<body>
<%@include file="/WEB-INF/jsp/user/landlord/header.jsp" %>
<div class="clearfix"></div>
<<section class="banner" style="height:124px;">
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
      <div class="span10">
     	 <div class="tab-menu">
     	 <ul>
      	 	 <li id="contractorLiId" style="display: none;" class="selected" ><a href="#contractor" style="color: #E33A0C;">Contractor</a></li>
       	 	 <li id="assignedJobsLiId" style="display: none;"><a href="#assignedJobs" style="color: #E33A0C;">Assigned Jobs</a></li>
       	 	 <li id="charityLiId" style="display: none;"><a href="#charity" id="charityHREFId" style="color: #E33A0C;">Property Management Company</a></li>
     	 </ul>
  		</div>
        <div class="tab_content1 email-area" id="contractor">
           <div class="left-inbox" > <span class="inbox-ar">Jobs</span>
            <div class="clearfix"></div>
             
            <ul class="menu" id="functionalityListId">
            </ul>
            
          </div>
          <div class="right-index" >
          <div id="pieChartdivisionId" style="margin: 0 15px;">
              <h1 class="heading4 margin-top15"></h1>
              <div class="clearfix"></div>
              <div class="pie-detaild">
              <div class="rgpinnew">
                  <ul>
                    <li><strong>Job Name</strong><samp>:</samp><span id="jobName"></span></li>
            		<li><strong>Contractors Invited</strong><samp>:</samp><span id="invitationCount"></span></li>
            		<li><strong>Job's Status</strong><samp>:</samp><span id="jobStatus"></span></li>
            		<li><strong>Job's Description</strong><samp>:</samp><span id="jobsDescription"></span></li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
              </div>
             </div>
          <div id="mailDivisionId" style="margin-left: 15px; display: none;">
            <h1 class="heading4 margin-top15" id="subjectId"></h1>
            <div class="index-blog">
            <div id="alertSuccessId" class="alert alert-block alert-success fade in" style="width: 657px!important; display: none;">
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true" id="successMessageId">Successfully Sent</h4>
	        </div>
	        <div id="alertErrorId1" class="alert alert-block alert-error fade in" style="width: 657px!important; display: none;" >
            	<button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            	<h4 class="alert-heading" animation="true"  id="errorMessageId1">Not Sent</h4>
            </div>
            <form name="fEmail" id="emailId">
            	<div id="conId"></div>
            	<input type="hidden" name="conversationId" id="conversationId" value=""/>
              <textarea placeholder="Type your message" name="mailBody" id="mailBody" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});"></textarea>
              
              <input type="button" id="sendEmail" class="regis-co" value="Send" />
              </form>
              <input type="button" id="infoBtnId" class="regis-co" value="Assign Property" style="float: left; display: none; " />
              <table id="informationId" width="100%" border="0" cellpadding="0" cellspacing="0" class="regis" style="border: 1px none #ccc; background: #E8E8E8; display: none;">
	             <tr style="border: 1px;">
	          		 <td>
	          			<label>Estimated Completion Date</label>
	          			 <input readonly="readonly" type="text" id="estimatedCompletionDate" placeholder="Pick Date" style="width: 94% !important;" name="estimatedCompletionDate" class="dat-icon newo" placeholder="DD-MM-YYYY" value="" />
	          		</td>
	               <td>
		               <label>Cost</label>
		               <input type="text" placeholder="Cost" class="" name="estimatedCost" id="estimatedCost" value="" />
		            </td>
	           	 </tr>
	           	  <tr style="width: 100%;">
	          		 <td style="width: 90%;">
	          			<label>Description of Job You want to Assign</label>
	          			  <textarea placeholder="250 Words" name="jobDescription" id="jobDescription" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});"  maxlength="250" style="margin-left: 25px;" ></textarea>
	          		</td>
	               <td style="width: 10%;"> </td>
	           	 </tr>
	           	 <tr>
	           	 	<td></td>
	           	 	<td>
	           	 		<input type="button" id="assignProperty" class="regis-co" value="Assign" style="float: right; margin-top: 18px; " />
	           	 	</td>
	           	 </tr>
	           	</table>
              
             
              <div class="clearfix"></div><!--
              <div class="arrow-bottom"></div>-->
            </div>
           	<div id="mailContentId">
           	</div>
           </div>
        </div>
      </div>
      
      <div style="overflow: auto!important;" class="tab_content1 email-area" id="charity">
         <div class="left-inbox pmcConversation"> <span class="inbox-ar">PMC</span>
         <div class="clearfix"></div>
            <ul class="menu" id="pmcListId">
            </ul>
          </div>
          <div class="right-index pmcConversation" style="overflow: unset!important;">
          <div class="" id="">
            <h1 class="heading4 margin-top15" id="pmcSubjectId"></h1>
            <div class="index-blog">
            <form name="fEmail" id="pmcEmailId">
            	<div id="conId"></div>
            	<input type="hidden" name="conversationId" id="pmcConversationId" value=""/>
               <textarea placeholder="Type your message" name="mailBody" id="pmcMailBody" onfocus="javascript:$(this).css('border','2px solid #E33A0C').animate({height:'60px'});"></textarea>
              <input type="button" id="pmcSendEmail" class="regis-co" value="Send" />
             </form>
              <div class="clearfix"></div><!--
              <div class="arrow-bottom"></div>-->
            </div>
           	<div id="charitymailContentId">
           	</div>
           </div>
        </div>
      </div>
      
      <div style="overflow: auto!important;" class="tab_content1" id="assignedJobs">
         <div class="contentdiv">
        <div class="contdiv-inside">
        
        
        <div class="First-div-page" id="slidedivision">
       <div style="" class="tabs-file" id="assignedJobs">
		  <table style="width: 97%!important;" cellspacing="0" cellpadding="0" border="0" id="assignedJobsId">
		  	<tbody>
		  		<tr>
		  			<th style="width: 14%">Job Name</th>
		  			<th style="width: 14%">Contractor Name</th>
		  			<th style="width: 14%">Assigned On</th>
		  			<th style="width: 14%">Status</th>
		  			<th style="width: 14%">View Details</th>
		  		</tr>
		  	</tbody>
		  </table>
          <div class="clearfix"></div>
        </div>
        </div>
        
        <div class="Second-div-page">
        <div class="Back-Button" style="float: left;"><a href = "#" id="backBtnId">Back to Jobs</a></div>
        <div class="clearfix"></div>
        <div class="rgpinnew" style="margin: 0 40px 0 0;">
          <ul>
            <li><strong>Job Name</strong><samp>:</samp><span id="dJobName"></span></li>
            <li><strong>Contractor Name</strong><samp>:</samp><span id="dContractorName"></span></li>
            <li><strong>Assigned On</strong><samp>:</samp><span id="dAssignedOn"></span></li>
            <li><strong>Status</strong><samp>:</samp><span id="dJobStatus"></span></li>
            <li><strong>Estimated Completion Date</strong><samp>:</samp><span id="dEstimatedCompletionDate"></span></li>
            <li><strong>Estimated Cost</strong><samp>:</samp><span id="dEstimatedCost"></span></li>
            <li><strong>Job's Description</strong><samp>:</samp><span id="dJobDescription"></span></li>
          </ul>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
        <div id="documentsDivisionId" class="rg-p innew tabs-file" style="margin: 12px 46px 0 0; width: 91%!important;">
		  <h1> Documents</h1>
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" id="documentsId" class="doc-table"> 
		  
		  </table>
		   
          <div class="clearfix"></div>
        </div>
        
        </div>
        
        </div>
        </div>
      </div>
      
      </div>
      <div class="span2"> <img width="160" height="600" class="ad-ban" src="<%=request.getContextPath()%>/resource/images/banner.png"> </div>
    </div>
  </div>
  
</section>
<div class="clearfix"></div>
	<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
</body>
</html>
<div class="popup" id="acceptDocumentPopUp" onclick = "checkEvent(event)">
	<div id="maskLoader" class="loader" ></div>
	  <div class="pop_up" style="top: 36%!important; width: 25%!important; height: 73px!important;">
	      <img src="${contextPath}/resource/images/3.png" id="closeId" class="closeIcon" style="display: block;" />
	      <div class="popup_h2" style=" padding:15px 35px;">
	      </div>
	      <div class="tab-area">
				<div class="clearfix"></div>
				<h1 style="margin-top: 50px; color: black; font-size: 14px;">You accept the certificate uploaded by Contractor for this job?</h1>
				<input type="hidden" id="documentId" value="" />
	      </div>
	      <button type="button" id="closeButton" class=" button-file close">Cancel</button>
	      <button type="button" id="acceptDocumentBtnId" class="button-file">Yes</button>
	      </div>
	</div>

