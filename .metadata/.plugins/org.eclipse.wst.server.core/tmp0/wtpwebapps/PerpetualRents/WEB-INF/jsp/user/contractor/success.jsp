<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The No Voids Man</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css"/> 
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css"/>
<link rel="stylesheet" type="text/css" media="all" href="<%=request.getContextPath()%>/resource/css/jsDatePick_ltr.min.css" />

<!-- ---------------- JavaScript --------------------------------->
<style type="text/css" media="all">
 .contractor-form .form-fields textarea, .contractor-form .form-fields input[type="text"] {
    float: right;
    margin: 0 0 5px 0;
    width: 140px;
}
  </style>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jsDatePick.jquery.min.1.3.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/perpetual/contractor.js"></script>


<style>
	.breadcrumb a { width:173px!important;}
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
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'/>
</head>
<body>
<c:import url="${wordPressUrl}/sub-header" ></c:import>
<div class="clearfix"></div>
<section class="contaner-b">
  <div class="container">
      <div class="row">
      <div class="span10">
        <div role="alert" class="alert alert-success" style="font-size: 25">
          <strong >Thank You for Registering with Us.</strong> 
        </div>
        
        <div class="clearfix"></div>
        <div style="" class="rg-p green" >
         Shortly we will send you an email regarding necessary Information .
        </div>
      </div>
    </div>
  </div>
  </div>
</section>
<div class="clearfix"></div>
<c:import url="${wordPressUrl}/sub-footer/" ></c:import>
</body>
</html>
