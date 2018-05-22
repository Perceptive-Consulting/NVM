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
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">

<title>
<!-- http://www.codeforest.net/html5-image-upload-resize-and-crop -->
Charity Registration | Perpetual Rents</title>
<!-- ---------------- Style Sheet --------------------------------->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap-responsive.css" />
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/responsive-media-queries.css" />
<link media="screen" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/ui-progress-bar.css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/jquery.remodal.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
<!-- ---------------- JavaScript --------------------------------->

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-transition.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap-collapse.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/featherlight.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/form2Object.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/form/json2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/fancybox/jquery.fancybox.pack.js"></script>
<!-- ---------------- flexslider --------------------------------->
<script src="http://78.47.231.114/thenovoidsman/wp-content/themes/novoidsman/js/jquery.flexslider.js"></script>
<script type="text/javascript" charset="utf-8">

$(document).ready(function() {
	  alert('hello');
	  $(".FileView").fancybox();
	});
	
  $(window).load(function() {
    $('.flexslider').flexslider({
          animation: "fade",  // slide or fade
          controlsContainer: ".flex-container" // the container that holds the flexslider
    });
  });
  
  $(document).ready(function(){
	  
	  
	  console.log('hi---------------------');
	$('#uploadId').click(function(){
		console.log('clicked...');
		var input = $("#fileData")[0].files;
		 /* var fsize = $('#writtenFile')[0].files[0].size; */
		var filesToUpload = input[0];
		 console.log('filesToUpload.type ' + filesToUpload.type);
		if (filesToUpload.type.match(/image.*/)) {
			resizeAndUpload(filesToUpload); 
		};
	});
	
	
	function resizeAndUpload(file) {
		alert('hello');
		var reader = new FileReader();
		    reader.onloadend = function() {
		 
		    var tempImg = new Image();
		    tempImg.src = reader.result;
		    tempImg.onload = function() {
		 
		        var MAX_WIDTH = 400;
		        var MAX_HEIGHT = 300;
		        var tempW = tempImg.width;
		        var tempH = tempImg.height;
		        if (tempW > tempH) {
		            if (tempW > MAX_WIDTH) {
		               tempH *= MAX_WIDTH / tempW;
		               tempW = MAX_WIDTH;
		            }
		        } else {
		            if (tempH > MAX_HEIGHT) {
		               tempW *= MAX_HEIGHT / tempH;
		               tempH = MAX_HEIGHT;
		            }
		        }
		 
		        var canvas = document.createElement('canvas');
		        canvas.width = tempW;
		        canvas.height = tempH;
		        var ctx = canvas.getContext("2d");
		        ctx.drawImage(this, 0, 0, tempW, tempH);
		        var dataURL = canvas.toDataURL("image/jpeg");
		 
		        var xhr = new XMLHttpRequest();
		        xhr.onreadystatechange = function(ev){
		            document.getElementById('filesInfo').innerHTML = 'Done!';
		        };
		 
		        xhr.open('POST', 'uploadResized.php', true);
		        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		        var data = 'image=' + dataURL;
		        xhr.send(data);
		      }
		   }
		   reader.readAsDataURL(file);
		}
	
  });
  
  
</script>
<!--================== Fonts Calling Section =====-->
<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900' rel='stylesheet' type='text/css'>
<link rel='stylesheet' id='mgop-theme-style-css'  href='http://78.47.231.114/thenovoidsman/wp-content/plugins/multiple-gallery-on-post/style/style.css?ver=4.0' type='text/css' media='all' />
<script type='text/javascript' src='http://78.47.231.114/thenovoidsman/wp-content/plugins/multiple-gallery-on-post/style/style.js?ver=4.0'></script>
<link rel='canonical' href='http://78.47.231.114/thenovoidsman/charity-registration/' />
<link rel='shortlink' href='http://78.47.231.114/thenovoidsman/?p=71' />
</head>
<body>

<div class="clearfix"></div>

<div class="clearfix"></div>
<section class="contaner-b">
  
  <form action="">
  	<input type="file" id="fileData">
  	<input id="uploadId" type="button" value="Upload">
  </form>
  <a class="FileView" href="http://maps.google.com/maps?q=Eiffel+Tower,+Avenue+Gustave+Eiffel,+Paris,+France&t=h&z=17">Search results</a>
  
</section>



<div class="clearfix"></div>
<footer>
  <div class="container">
    <div class="row">
      <div class="span12"> <span>Copyright ©2014  The Novoids Man Ltd. | All Rights Reserved | <a href="http://78.47.231.114/thenovoidsman/privacy-policy/">Privacy Policy</a> | <a href="http://78.47.231.114/thenovoidsman/acceptable-use-policy/">Acceptable Policy</a></span>
        <div class="socal"> 
                <a href="https://www.facebook.com/" class="fb" target="_blank"></a> 
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
  <form action="http://thenovoidsman.com/j_spring_security_check" method="post" >
    <label>User Name</label>
    <input type="text" value="" placeholder="User Name" class="" name="j_username"  />
    <label>Password</label>
    <input type="password" value="" placeholder="Enter Your Password" class="" name="j_password" />
    <input type="submit" name="submit" value="Log In" />
  </form>
  <a href="javascript:void(0);">Forgot Password ?</a> <a href="javascript:void(0);">Creat Account</a> </div>
<script type='text/javascript' src='http://78.47.231.114/thenovoidsman/wp-includes/js/comment-reply.min.js?ver=4.0'></script>
</body></html>
<!-- Dynamic page generated in 0.112 seconds. -->
<!-- Cached page generated by WP-Super-Cache on 2014-11-28 06:49:03 -->

<!-- super cache -->