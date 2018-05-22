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
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript ------------------------------------>
   	 
<script type="text/javascript">
function getContextPath() {
	   return "${pageContext.request.contextPath}";
	}
var contextPath = getContextPath();

</script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/landlord.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloperDetail.js"></script>  --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/propertyDeveloper.js"></script> 
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
	  //var abc = ${requestScope.name};
	  			$('.close').click(function () {
		  	    $('#alertSuccessId').hide(200);
		  	    $('#alertErrorId').hide(200);
		    }); 
		  	
		  //	$('#alertSuccessId').hide(5000);
		//	$('#alertErrorId').hide(5000);
 }); 
  

  $(document).ready(function(){
	  	$(".featherlight-close").bind('style', function() {
	  	  console.log('bind........');
	  	});
  		$(".featherlight-close").click(function() {
  			console.log('clicked........');
  		});
  });
</script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
</head>

<body>
	<% String paramName = request.getServletContext().getInitParameter("wordPressUrl");
	if(paramName != null && paramName.length() > 0){
		response.sendRedirect(paramName);   	
	}
	%>
<header>
  <div class="container">
  <div class="cooki" id="cookiesDivisionId">
        <p><strong>Information about our use of cookies </strong>  Our website uses cookies to distinguish you from other users of our website. This helps us to provide..... <span>
        <a href="#containerId" id="readCookiesId">Read More</a>  |  <a style="cursor: pointer!important;" id="cookiesAgreeId">Agree</a> <img id="cookiesImgId" src="<%=request.getContextPath()%>/resource/images/small-ico.png" alt="" /></span>
		</p>
	</div>
	<div class="avoid-video">"THE NO VOIDS MAN", if you want to avoid voids then don't avoid me</div>
    <div class="row">
      <div class="span4">
        <div class="logo"><a href="login.htm"><img src="<%=request.getContextPath()%>/resource/images/logo.png" /></a></div>
      </div>
      <div class="span8">
        <section class="login-sec">
          <div class="user-bt ano-r"><a href="#">Register</a>
            <div class="login-drop">
              <ul>
                 <li><a id="regLandlordhref" href="#regLandlordhref">Landlord</a></li>
                <li><a id="regContractorhref" href="#regContractorhref">Contractor</a></li>
                 <li><a id="regPropDeveloperhref" href="#regPropDeveloperhref">Property Developer</a></li>
              </ul>
            </div>
          </div>
          <div class="user-bt"><a href="#" data-featherlight="#fl1">Login</a></div>
        </section>
        <div class="clearfix"></div>
        <div class="navbar navbar-inverse">
          <div class="navbar-inner">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <div class="nav-collapse collapse">
              <ul class="nav">
                <li class="active" id="homeliId"><a href="login.htm" id="homeId">Home</a></li>
                <li id="aboutUsliId"><a href="#aboutUsId" id="aboutUsId">About Us</a></li>
                <li id="contactUsliId"><a href="#contactUsId" id="contactUsId">Contact Us</a></li>
              </ul>
            </div>
          </div>
        </div>
        
        <div>
       <c:if test="${not empty error}">
			<%-- <div class="error">${error}</div> --%>
			<div id="alertErrorId" class="alert alert-block alert-error fade in" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="errorId">${error}</h4>
        </div>
		</c:if>
		<c:if test="${not empty msg}">
			<%-- <div class="msg">${msg}</div> --%>
			<div id="alertSuccessId" class="alert alert-block alert-success fade in" >
            <button id="alert" type="button" class="close"  ><span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
            <h4 class="alert-heading" animation="true" id="successMessageId">${msg}</h4>
        </div>
		</c:if>
      </div>
      </div>
       
    </div>
  </div>
</header>
<div class="clearfix"></div>
<section class="banner">
  <div class="flexslider">
    <ul class="slides">
      <li><img src="<%=request.getContextPath()%>/resource/images/slide1.png" title="" alt="" /> </li>
      <li><img src="<%=request.getContextPath()%>/resource/images/slide2.png" title="" alt="" /> </li>
      <li><img src="<%=request.getContextPath()%>/resource/images/slide1.png" title="" alt="" /> </li>
    </ul>
  </div>
</section>
<div class="clearfix"></div>
<section class="contaner-b">

  <div class="container" id="containerId">
   	 <%@include file="/WEB-INF/jsp/user/home/home.jsp" %>
  </div>
</section>
<div class="clearfix"></div>
 <%@include file="/WEB-INF/jsp/user/home/footer.jsp" %>
<div class="lightbox" id="fl1">
  <h2 class="heading2">Login</h2>
  <form action="j_spring_security_check" method="post" >
    <label>User Name</label>
    <input type="text" value="" placeholder="UserName" class="" name="j_username"  />
    <!--<ul class="error">
    	<li>Error</li>
    </ul>-->
    <label>Password</label>
    <input type="password" value="" placeholder="Enter Your Password" class="" name="j_password" />
    <input type="submit" value="Log In" />
  </form>
  <a href="#">Forgot Password ?</a> <a href="#">Creat Account</a>
 </div>
</body>
</html>