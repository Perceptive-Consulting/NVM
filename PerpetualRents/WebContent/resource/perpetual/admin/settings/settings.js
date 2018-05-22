  var id ;
  $(document).ready(function(){
		/*$(".tab_content").hide(); //Hide all content
		$(".tab-menu li:first").addClass("selected").show(); //Activate first tab
		$(".tab_content:first").show(); //Show first tab content
		$("#adpl1Doc").on("change", function()
				{
				    var str = this.value.split(/[\/\\]/).pop();
				    var filetype = str.split(".").pop();
				    if(filetype != "pdf"){
				    	$("#adpl1Doc").val(null);
				    	alert("Please select the pdf only");
				    }
				});
		$("#adpl3Doc").on("change", function()
				{
				    var str = this.value.split(/[\/\\]/).pop();
				    var filetype = str.split(".").pop();
				    if(filetype != "pdf"){
				    	$("#adpl3Doc").val(null);
				    	alert("Please select the pdf only");
				    }
				});
		$("#adpl1btn").click(function(){
			$("#adpl1btn").hide();
			$("#adpl1Id").css("display", "inline");
			$("#adpl1List").css("display", "block");
			
		});
		$("#adpl3btn").click(function(){
			$("#adpl3btn").hide();
			$("#adpl3Id").css("display", "inline");
			$("#adpl3List").css("display", "block");
			
		});
		$("#fileButtonId").click(function(){
			if(adpl1.contains(".pdf"))
				$("#myWebFormId").submit();
			
		}); 
		adminSettings();
		//On Click Event
		$(".tab-menu li").click(function() {
			$(".tab-menu li").removeClass("selected"); //Remove any "active" class
			$(this).addClass("selected"); //Add "active" class to selected tab
			$(".tab_content").hide(); //Hide all tab content
			var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
			$(activeTab).fadeIn(); //Fade in the active content
			return false;
		});*/
		
		 $.fn.dataTable.TableTools.defaults.aButtons = [];
			$.fn.dataTableExt.sErrMode = 'console';
			 table = $('#dataTableId').DataTable({
			        	dom: 'Tfrtip',"ajax": {
			            "url": contextPath+"/admin/listPerpetualCity.htm",
			            "type": "POST",
			            "dataType": "json"
			        	},tableTools: {
			                "aButtons ": [
			                          ]
			        	},
			        	columns: [
			            	{ data: null, defaultContent: '<input type="checkbox" />', orderable: false },
			            	{ data: "city" }
			        	],
			        	 "pageLength": 15,
		        			fnRowCallback : function(nRow, aData, iDisplayIndex){
		    	                $("td:first", nRow).html(iDisplayIndex +1);
		    	               return nRow;
		        			}
			    } );
		 
		$('#dataTableId tbody').on( 'click', 'tr', function () {
		    if ($(this).hasClass('selected')) {
		        $(this).removeClass('selected');
		        aData = null;
		        $.colorbox.remove();
		    }
		    else {
		        table.$('tr.selected').removeClass('selected');
		        $(this).addClass('selected');
		        aData = table.row( this ).data();
		    }
		} );
		
		$( "#createButtonId" ).click(function() {
	          $("#createButtonId").colorbox({width:"400px", inline:true, href:"#create"});
	        });
		
		$( "#deleteButtonId" ).click(function() {
			var jObj = table.row('.selected').data();
			if(jObj){
	          $("#deleteButtonId").colorbox({width:"400px", inline:true, href:"#delete"});
			}
			else{
				alert("Please select the city");
			}
	        });

			
		$("#createCityButton").click(function(){
			var city = $("#city").val();
			if(city.trim()){
			  $.ajax({
			      url: contextPath+"/admin/createPerpetualCity.htm?city="+city,
			      type: "post",
			      dataType: "json",
			      success: function(data){
			    	  var status = data.success;
			    	  if(status == true){
			    		  $.colorbox.close();
							table.ajax.reload();
							$("#commonMessageSuccessId").html("Successfully updated");
							$("#commonMessageSuccessId").fadeIn();
							setTimeout(function(){
								$("#commonMessageSuccessId").fadeOut(4000);
							}, 4000);
			    	  }
			    	  else if(data.message){
			    		  $.colorbox.close();
							table.ajax.reload();
							$("#commonMessageErrorId").html(data.message);
							$("#commonMessageErrorId").fadeIn();
							setTimeout(function(){
								$("#commonMessageErrorId").fadeOut(4000);
							}, 4000);
						}
			      },
			      error:function(){
			          $("errorId").show();
			      }
			  });
			}
			else{
				alert("Please fill out city name");
			}
		});
		
		
		$("#uploadFileButtonId").click(function(){
			  $.ajax({
			      url: contextPath+"/admin/uploadNewFile.htm",
			      type: "post",
			      success: function(data){
			    	  var status = data.success;
			    	  if(status == true){
							$("#commonMessageSuccessId").html("Successfully updated");
					  }
			      },
			      error:function(){
			          $("errorId").show();
			      }
			  });
		});
		
		$('#delete_yes').click(function(){
			var jObj = table.row('.selected').data();
			var city = jObj.city;
			if(jObj!=null){
			$.ajax({
					url:contextPath+"/admin/deletePerpetualCity.htm?city="+city,
			  		method: "GET",
			  		dataType: "json",
			  		contentType: "application/json",															
					success:function(result){
						if(result.success==true){
							$.colorbox.close();
							table.ajax.reload();
						}
				  }});
			}
			
		});
		
		
		$("#myWebFormId1").submit(function(e){
			var formData = new FormData(this);
			e.preventDefault();
		    e.stopImmediatePropagation();
			if(!$("#adpl1Doc").val()){
			    $("#commonMessageErrorId").html("No PDF selected");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
			}
			else{
		    $.ajax({
			    url: contextPath+"/admin/fileUpload.htm?file=1",
			    type: 'POST',
			    data:  formData,
			    mimeType:"multipart/form-data",
			    dataType : "json",
			    contentType: false,
		        cache: false,
		        processData:false,
		        success: function(response, textStatus, jqXHR){
		        	$(".loader").css('display', 'none');
		 			console.log(response.success);
		 			if(response.success == true || response.success == 'true'){
		 				$("#commonMessageSuccessId").html("Successfully Uploaded");
		 				$("#commonMessageSuccessId").fadeIn();
						setTimeout(function(){
							$("#commonMessageSuccessId").fadeOut(4000);
						}, 4000);
						$("#adpl1Id").hide();
						$("#adpl1List").hide();
						$("#adpl1btn").show();
		 			}
		 			else{
		 				$("#commonMessageErrorId").html("Upload unsuccessful");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
		 			}
		        },
			    error: function(jqXHR, textStatus, errorThrown){
			    	 
			     }          
		    });
			}
		});
		
		$("#myWebFormId3").submit(function(e){
			var formData = new FormData(this);
			e.preventDefault();
		    e.stopImmediatePropagation();
			if(!$("#adpl3Doc").val()){
			    $("#commonMessageErrorId").html("No PDF selected");
				$("#commonMessageErrorId").fadeIn();
				setTimeout(function(){
					$("#commonMessageErrorId").fadeOut(4000);
				}, 4000);
			}
			else{
		    $.ajax({
			    url: contextPath+"/admin/fileUpload.htm?file=3",
			    type: 'POST',
			    data:  formData,
			    mimeType:"multipart/form-data",
			    dataType : "json",
			    contentType: false,
		        cache: false,
		        processData:false,
		        success: function(response, textStatus, jqXHR){
		        	$(".loader").css('display', 'none');
		 			console.log(response.success);
		 			if(response.success == true || response.success == 'true'){
		 				$("#commonMessageSuccessId").html("Successfully Uploaded");
		 				$("#commonMessageSuccessId").fadeIn();
						setTimeout(function(){
							$("#commonMessageSuccessId").fadeOut(4000);
						}, 4000);
						$("#adpl3Id").hide();
						$("#adpl3List").hide();
		 				$("#adpl3btn").show();
		 			}else{
		 				$("#commonMessageErrorId").html("Upload unsuccessful");
						$("#commonMessageErrorId").fadeIn();
						setTimeout(function(){
							$("#commonMessageErrorId").fadeOut(4000);
						}, 4000);
		 			}
		        },
			    error: function(jqXHR, textStatus, errorThrown){
			    	 
			     }          
		    });
			}
		});

		$('#delete_no').click(function(){
			$.colorbox.close();
		});
		
  });

  
  function createPopupFormAdmin(){
	   var formData = form2object('createPopupFormIdAdmin', '.', true,
	  			function(node)
	  			{
	  				if (node.id && node.id.match(/callbackTest/))
	  				{
	  					return { name: node.id, value: node.innerHTML };
	  				}
	  			});
	   console.log(formData);
	  	var jObj = JSON.stringify(formData, null, '\t');																				
	  	console.log(jObj);
	  	$.ajax({
	  		
	  		url:contextPath+"/admin/addAdmin.htm",
	  		data: jObj,
	  		method: "Post",
	  		dataType: "json",
	  		contentType: "application/json",															
	  		success:function(result){
	  			if(result.success==true){
	  				$.colorbox.close();
	  				table1.ajax.reload();
	  			}
	  	  }});
	  }
  function adminSettings(){
	  $.ajax({
	      url: contextPath+"/admin/viewAdmin.htm",
	      type: "post",
	      dataType: "json",
	      success: function(data){
	    	  if(data.success == true){
	    	  var obj = data.data.loginObj;
	    	  $("#username").html(obj.username);
	    	  $("#password").html(obj.password);
	    	  }
	    	  else{
	    		  $("#commonMessageErrorId").html("Unsuccessful");
					$("#commonMessageErrorId").fadeIn();
					setTimeout(function(){
						$("#commonMessageErrorId").fadeOut(4000);
					}, 4000);
	    	  }
	    	  
	      },
	      error:function(){
	          alert('error');
	      }
	  });
  }