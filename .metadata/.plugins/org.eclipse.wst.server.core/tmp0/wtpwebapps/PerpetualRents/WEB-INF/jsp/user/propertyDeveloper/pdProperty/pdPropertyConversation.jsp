<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.remodal.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript ------------------------------------>
<script type="text/javascript">
	function getContextPath() {
		return "<%=request.getContextPath()%>";
	}
	var contextPath = getContextPath();	
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<%@include file="/WEB-INF/jsp/common/common.jsp" %>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/user/propertyDeveloper/pdProperty-pmc-conversation.js"></script>

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
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>

<body>
<%@include file="/WEB-INF/jsp/user/propertyDeveloper/pdheader.jsp" %>
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
       	 	 <li id="charityLiId" ><a href="#charity" id="charityHREFId" style="color: #E33A0C;">Property Management Company</a></li>
     	 </ul>
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
      
      </div>
      <div class="span2"> <img width="160" height="600" class="ad-ban" src="<%=request.getContextPath()%>/resource/images/banner.png"> </div>
    </div>
  </div>
  
</section>
<div class="clearfix"></div>
<%-- 	<c:import url="${wordPressUrl}/sub-footer/" ></c:import> --%>
</body>
</html>
