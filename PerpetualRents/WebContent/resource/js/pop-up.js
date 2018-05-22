var globalParentId;
var globalchildId;

function div_show(pId, cId){
	globalParentId = pId;
	globalchildId = cId;
	
	document.getElementById(globalchildId).style.display = "block";
}

//function to check target element
function checkEvent(e){
var target = (e && e.target) || (event && event.srcElement); 

var obj = document.getElementById(globalchildId); 
var obj2 = document.getElementById(globalParentId); 
checkParent1(target)?obj.style.display='none':null;
target==obj2?obj.style.display='block':null; 

} 

//function to check parent node and return result accordingly
function checkParent1(t){
	while(t.parentNode){ 
		if(t==document.getElementById(globalchildId)){
				return false; 
			}else if(t==document.getElementById('closeId')){
				return true;
			}else if(t==document.getElementById('closeButton')){
				return true;
			}
		t=t.parentNode ;
	} 
	return true ;
} 

