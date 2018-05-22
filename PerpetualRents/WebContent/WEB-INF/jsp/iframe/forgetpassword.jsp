<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" lang="en-US">
<![endif]-->
<!--[if !(IE 7) & !(IE 8)]><!-->
<html lang="en-US">
<!--<![endif]-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<title>
Forgot Password | The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<!-- ---------------- JavaScript --------------------------------->
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>

<!-- ---------------- flexslider --------------------------------->
<script src="<%=request.getContextPath()%>/resource/js/jquery.flexslider.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/forgetPassword.js"></script> 

<script type="text/javascript" charset="utf-8">
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
  
  $(document).ready(function(){
	$("#cookiesImgId").click(function(){
		 $("#cookiesDivisionId").slideUp(500);
	});
	
	$("#cookiesAgreeId").click(function(){
		 $("#cookiesDivisionId").slideUp(500);
	});
 
 
  $("#Confirmation").click(function () {
            $("#Submit").attr("disabled", !this.checked);
        });
		
		$("#Submit").click(function(e) {
            location.href="http://54.191.172.136:8484/PerpetualRents/register/registerContractorFrame.htm";
        });


	/*$("#fogetPassword").click(function () {
	       alert(123456);
    });*/
        
   });
  
</script>

<script type="text/javascript" src="http://54.191.172.136:82/thenovoidsman/wp-content/themes/novoidsman/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="http://54.191.172.136:82/thenovoidsman/wp-content/themes/novoidsman/js/jquery.easy-ticker.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	var dd = $('.vticker').easyTicker({
		direction: 'up',
		easing: 'easeInOutBack',
		speed: 'slow',
		interval: 1200,
		height: '835px',
		visible:20,
		mousePause: 0,
		controls: {
		//up: '.up',
		//down: '.down',
		//toggle: '.toggle',
		//stopText: 'Stop !!!'
		}
	})	
});
</script>


<script>

$(function() {
    $("#forgetPasswordId").validate({
        rules: {
            "emailId": {
                required: true,
                email: true
            }
    }
 });
});

  </script>









<style>
.vticker{
	
}
.vticker ul{
	padding: 0;
}
.vticker li{
	list-style: none;
}
.et-run{
}
</style>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<link rel='stylesheet' id='mgop-theme-style-css'  href='http://54.191.172.136:82/thenovoidsman/wp-content/plugins/multiple-gallery-on-post/style/style.css?ver=4.0' type='text/css' media='all' />
<script type='text/javascript' src='http://54.191.172.136:82/thenovoidsman/wp-content/plugins/multiple-gallery-on-post/style/style.js?ver=4.0'></script>
<link rel='canonical' href='http://54.191.172.136:82/thenovoidsman/forgot-password/' />
<link rel='shortlink' href='http://54.191.172.136:82/thenovoidsman/?p=298' />
</head>
<body>
<c:import url="${wordPressUrl}/sub-header" ></c:import>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container">
    <div class="row">
      <div class="span12">
        <div class="featherlight" style="display: block; position:relative; background:none;">
          <div class="featherlight-content frgpass">
            <div class="lightbox featherlight-inner">
              <h2 class="heading2">Forgot your password ?</h2>
              <!-- <div class="errormsg">Invalid email</div>-->
              <!--<div class="errormsg green">Password sent successfully !</div>-->
              <form method="post"  id="forgetPasswordId">
                <label>Enter your email</label><br>
                <input type="text"  id="emailId"  name="emailId"  />
                <input type="button"  value="Submit" id="submitemailId"/>
              </form>
            </div>
            </p>
          </div>
          </p>
        </div>
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>

<div class="clearfix"></div>
<footer>
  <div class="container">
    <div class="row">
      <div class="span12"> 
      <div class="ClientLogo"><a href="https://www.theprs.co.uk" target="_blank"><img height="40" width="150" src="http://54.191.172.136:82/thenovoidsman/wp-content/themes/novoidsman/images/prs.gif"></a></div>
      <span>Copyright ©2014 The Novoids Man Ltd. | All Rights Reserved | <a href="http://54.191.172.136:82/thenovoidsman/privacy-policy/">Privacy Policy</a> | <a href="http://54.191.172.136:82/thenovoidsman/acceptable-use-policy/">Acceptable Policy</a></span>
        <div class="socal"> 
                    <a href="https://www.facebook.com/pages/The-No-Voids-Man/721865587892586" class="fb" target="_blank"></a> 
                    <a href="https://twitter.com/" class="tw" target="_blank"></a> 
                    <a href="https://in.linkedin.com/" class="in" target="_blank"></a> 
                    <a href="https://plus.google.com/" class="gp" target="_blank"></a> 
                </div>
      </div>
    </div>
  </div>
</footer>
<div class="lightbox" id="fl1">
  <h2 class="heading2">Login</h2>
  <form action="http://54.191.172.136:8484/PerpetualRents/j_spring_security_check" method="post">
    <label>User Name</label>
    <input type="text" value="" placeholder="User Name" class="" name="j_username"  />
    <label>Password</label>
    <input type="password" value="" placeholder="Enter Your Password" class="" name="j_password" />
    <input type="submit" name="submit" value="Log In" /><br />
    <a href="http://54.191.172.136:82/thenovoidsman/forgot-password/" class="fogetPass" id="fogetPassword">Forget Password</a>
  </form>
 </div>

<script type='text/javascript' src='http://54.191.172.136:82/thenovoidsman/wp-includes/js/comment-reply.min.js?ver=4.0'></script>
</body></html>
