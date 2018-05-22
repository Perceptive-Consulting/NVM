var parentId;
var childId;

function logoutPopUp(pId, cId){
	parentId = pId;
	childId = cId;
	
	document.getElementById(childId).style.display = "block";
}

//function to check target element
function check(e){ 
var target = (e && e.target) || (event && event.srcElement); 

var obj = document.getElementById(childId); 
var obj2 = document.getElementById(parentId); 

checkParent(target)?obj.style.display='none':null;
target==obj2?obj.style.display='block':null; 

} 

//function to check parent node and return result accordingly
function checkParent(t){ 
	while(t.parentNode){ 
		if(t==document.getElementById(childId)){
				return false; 
			}else if(t==document.getElementById('close')){
				return true;
			}else if(t==document.getElementById('closeButton')){
				return true;
			}
		t=t.parentNode ;
	} 
	return true ;
} 

function showSuccessMessage(message, topMargininPx){
	 $("#commonMessageSuccessId").css("top", topMargininPx);
	 $("#commonMessageSuccessId").html(message);
	 $("#commonMessageSuccessId").show();
	 setTimeout(function(){
		 $("#commonMessageSuccessId").fadeOut(4000);
	 }, 4000);
}


function showErrorMessage(message, topMargininPx){
	$("#commonMessageErrorId").hide();
	 $("#commonMessageErrorId").css("top", topMargininPx);
	 $("#commonMessageErrorId").html(message);
	 $("#commonMessageErrorId").show();
	 setTimeout(function(){
		 $("#commonMessageErrorId").fadeOut(4000);
	 }, 4000);
}

