<link rel="shortcut icon" href="<%=request.getContextPath()%>/resource/images/favicon.ico" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/logout-popup.js"></script>
<script type="text/javascript">
(function() {
	  // Union of Chrome, Firefox, IE, Opera, and Safari console methods
	  var methods = ["assert", "assert", "cd", "clear", "count", "countReset",
	    "debug", "dir", "dirxml", "dirxml", "dirxml", "error", "error", "exception",
	    "group", "group", "groupCollapsed", "groupCollapsed", "groupEnd", "info",
	    "info", "log", "log", "markTimeline", "profile", "profileEnd", "profileEnd",
	    "select", "table", "table", "time", "time", "timeEnd", "timeEnd", "timeEnd",
	    "timeEnd", "timeEnd", "timeStamp", "timeline", "timelineEnd", "trace",
	    "trace", "trace", "trace", "trace", "warn"];
	  var length = methods.length;
	  var console = (window.console = window.console || {});
	  var method;
	  var noop = function() {};
	  while (length--) {
	    method = methods[length];
	    // define undefined methods as noops to prevent errors
	    if (!console[method])
	      console[method] = noop;
	  }
	})();
</script>
<script>
    var contextPath ;
	$(document).ready(function(){
		contextPath = '${contextPath}';
			$("#logoutBtnId").click(function(){
				$.ajax({
					  url: contextPath+"/home/userLogout.htm",
				      type: "get",
				      dataType : "json",
				      success: function(response){
				    	  
				    	 if(response.success == 'true' || response.success == true){
				    		 window.location.href = contextPath+"/j_spring_security_logout";
				    	 }
				      },
				      error:function(){
				    	  console.log('Some error is there.');
				      }
				  });
			});
			$("#continueBtnId").click(function(){
				window.location.href = "${contextPath}/home.htm";
			});
		console.log(contextPath);
		});
	function getContextPath() {
		   return "${pageContext.request.contextPath}";
		}
</script>
<script type="text/javascript">

$(document).ready(function(){
	  var homemaxage = '${homemaxage}';
	  
	 var stop = true;
  	 var maxage ="";
  	 var name = "maxage" + "=";
  	 var intval = 1000;
  	 
  	 setInterval(function (){
  		 
  	   	 var cdata = document.cookie.split(';');
        // console.log(cdata);
         
  	   	  for(var i=0; i<cdata.length; i++){

  	   	  	var c = cdata[i].trim();
  	   	  	if (c.indexOf("maxage")==0){
  	   	  			maxage = c.substring(name.length,c.length);
  	   	  			if(maxage == homemaxage){
  	   	  				document.cookie ='maxage='+maxage;
  	   	  				stop = true;
  	   	  			}
  	   	  	    	break;	
  	   	 		}
  	   	  }
  	   	 
  	   	  if(maxage != null && maxage!=""){
  	   		  maxage = parseInt(maxage)-1000;
  	   		  if(parseInt(maxage) <= 0.00){
  	   			  document.cookie =name+";expires="+new Date();
  	   			$.ajax({
    				  url: contextPath+"/home/applicationLogout.htm",
    			      type: "GET",
    			      dataType : "json",
    			      success: function(response){
    			    	 if(response.success == 'true' || response.success == true){
    			    		window.location.href = contextPath+'/j_spring_security_logout';
    			    	 }
    			      },
    			      error:function(){
    			         console.log('Some error is there.');
    			      }
    			  });
  	   			  
  	   			  
  	   		  }
  	   		  document.cookie ='maxage='+maxage;
  	     		  if(parseInt(maxage) < (2*60*1000)){
  	     			  if(stop){
  	     				 var logoutStr = getLogoutTime();
  	     				console.log(logoutStr);
  	     				$("#timeLeftId").html(logoutStr);
  	     				logoutPopUp('bodyId', 'logoutWindowId');
  	     				stop =false;
  	     				
  	     			  }
  	     			 var logoutStr = getLogoutTime();
	     				console.log("appending : " + logoutStr);
	     			$("#timeLeftId").html(logoutStr);
  	     		  }
  	   	  }
  	    }, intval);
  	 
 
  	function getLogoutTime(){
        var ch  =  (((parseInt(maxage)/(60*1000)).toFixed(2)).toString()).split(".");   
        if(ch[0]>0){
     	   return ""+ch[0]+" min(s) "+((parseInt(maxage)-(ch[0]*60*1000))/1000)+" sec(s)";
        }else{
     	   return ""+ch[0]+" min(s) "+(parseInt(maxage)/1000)+" sec(s)";   
        }
    };
 }); 
 
$(document).ready (function(){
	$('.effect').click(function(){
		$(this).addClass('add-effect');
	});
	$('.effect').blur(function(){
		$(this).removeClass('add-effect');
	});
});
</script>