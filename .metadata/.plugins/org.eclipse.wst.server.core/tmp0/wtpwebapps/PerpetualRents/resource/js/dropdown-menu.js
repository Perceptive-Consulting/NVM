/*function initMenu() {
  $('#menu ul').hide();
  $('#menu ul:first').show();
  $('#menu li a').click(
    function() {
      var checkElement = $(this).next();
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        return false;
        }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
$(document).ready(function() {initMenu();});*/




function initDropDown(flag) {
  $('.menu ul').hide();
  $('.menu ul:first').hide();
  $('.menu li a').click(
    function() {
      var checkElement = $(this).next();
    if(flag){
    	 var value = $(this).attr('value');
         console.log(value);
         setPieChartData(value); // for developer use only.
     }
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) { 
	    $(this).children('ul:visible').slideDown('normal');
          checkElement.slideUp('normal');
          return false;
	    }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) { 
       // $('.menu ul:visible').slideUp('normal');
	   $(this).children('ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }
      }
    );
  }
