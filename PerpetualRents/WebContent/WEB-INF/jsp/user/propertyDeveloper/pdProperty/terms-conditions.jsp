<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<style>
	.wd-100{
		width: 84%!important;
	}
	.viewbox{
		height: 500px!important;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#next").attr("disabled", true);
		$(".regis-co").css('cursor', 'no-drop');
		$(".regis-co").css('background', '#707070');
		
		$("#accept").click(function(){
			if($("#accept").is(':checked')){
				$.ajax({
				    url : contextPath+"/download/getPDDocumentsDownloadStatus.htm",
				    type: "GET",
				    dataType : "json",
				    contentType: 'application/json',
				    success:function(response, textStatus, jqXHR){	
				    	if(response.success == 'true' || response.success == true){
				    		$("#pdNext").attr("disabled", false);
							$(".regis-co").css('cursor', 'pointer');
							$(".regis-co").css('background', '#FF0000');
				    	}else if(response.success == 'false' || response.success == false){
				    		$('#accept').prop('checked', false);
				    		showErrorMessage(response.message, "320px");
				    	}
				    }
				});
			
			} else{
				$("#pdNext").attr("disabled", true);
				$(".regis-co").css('cursor', 'no-drop');
				$(".regis-co").css('background', '#707070');
			}
		});
	  });
	
</script>

<div class="clearfix"></div>
<section class="contaner-b">

  <div class="container">
    <div class="row">
     	<c:import url="${wordPressUrl}/termcondition/" ></c:import>
     	
        <div class="wd-100" style="width: ">
        <a href="${contextPath}/download/nonDisclosureAgreement.htm" class="pcf-link" target="_blank">Non Disclosure Agreement</a>&nbsp;&nbsp;

        <a href="${contextPath}/download/preConstructionAgreement.htm" class="pcf-link" target="_blank">Pre Construction Agreement</a>&nbsp;&nbsp;
        
        <div class="accept-file"><input type="checkbox" id="accept" name="" /><label for="accept">I agree the above terms & conditions and ready to proceed.</label></div>
        </div>
        
         <div class="wd-100 border-tp"><p style="font-weight: bold;"> Note: Please download the attachments before you proceed further.</p>
        
        <input type="button" id="pdNext" class="regis-co" value="Proceed" />
        <input type="button" class="prevbtn" value="Previous" style="display: none;" />    
      </div>
    </div>
  </div>
</section>
<div class="clearfix"></div>
</body>
</html>
