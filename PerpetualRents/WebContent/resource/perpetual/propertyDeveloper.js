$(document).ready(function() {
					$("#regPropDeveloperhref").click(function() {
						$.ajax({
													url : contextPath
															+ "/register/redirectPropertyDeveloperRegistration.htm",
													type : "post",
													success : function(data) {
														$("#containerId").html(data);
													},
													error : function() {
														$("#containerId")
																.html('There is error while submit');
													}
												});
									});

					$("#propertyDeveloperSubmitId").click(
									function(event) {
										if ($("#registerPropertyDeveloperId")
												.valid() == true) {
											var formData = form2object(
													'registerPropertyDeveloperId',
													'.',
													true,
													function(node) {
														if (node.id
																&& node.id
																		.match(/callbackTest/)) {
															return {
																name : node.id,
																value : node.innerHTML
															};
														}
													});
											var postData = JSON.stringify(
													formData, null, '\t');
											$.ajax({
														url : contextPath
																+ "/register/createPropertyDeveloper.htm", // createPropertyDeveloper
														type : "POST",
														data : postData,
														dataType : "json",
														contentType : 'application/json',
														success : function(
																response,
																textStatus,
																jqXHR) {
															if (response.success == true
																	|| response.success == 'true') {
																$
																		.get(
																				contextPath
																						+ "/propertyDeveloper/success.htm",
																				function(
																						data) {
																					$(
																							"#containerId")
																							.html(
																									data);
																				});
															} else {
																console
																		.log('response.message : '
																				+ response.message);
																$(
																		"#commonMessageErrorId")
																		.show();
																$(
																		"#commonMessageErrorId")
																		.html(
																				response.message);
																setTimeout(
																		function() {
																			$(
																					"#commonMessageErrorId")
																					.fadeOut(
																							4000);
																		}, 1000);
															}
														}
													});
											event.stopImmediatePropagation();
										}

									});
/*
------------1----------------			
					
					$("#uploadDrawingsId").click(function() {

										var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=1";
										$("#uploadPDDocuments").attr("action",actionUrl);

										$("#uploadPDDocuments").submit();
									});
------------2----------------
					$("#uploadSpecificationsId").click(function() {

						var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=2";
						$("#uploadPDDocuments").attr("action",actionUrl);

						$("#uploadPDDocuments").submit();
					});
------------3----------------
					$("#uploadRegisteryId").click(function(){
						var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=3";
						$("#uploadPDDocuments").attr("action",actionUrl);

						$("#uploadPDDocuments").submit();
					});
					
------------4----------------
					$("#uploadTenderDocumentId").click(function(){
						var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=4";
						$("#uploadPDDocuments").attr("action",actionUrl);

						$("#uploadPDDocuments").submit();
					});
					
------------5----------------
					$("#uploadconstructionScheduleId").click(function(){
						var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=5";
						$("#uploadPDDocuments").attr("action",actionUrl);

						$("#uploadPDDocuments").submit();
					});
------------6----------------				
					$("#additionalDocuments1Id").click(function() {

						var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=6";
						$("#uploadPDDocuments").attr("action",actionUrl);

						$("#uploadPDDocuments").submit();
					});
------------7----------------
				$("#additionalDocuments2Id").click(function() {
			
					var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=7";
					$("#uploadPDDocuments").attr("action",actionUrl);
			
					$("#uploadPDDocuments").submit();
				});
------------8----------------
				$("#additionalDocuments3Id").click(function(){
					var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=8";
					$("#uploadPDDocuments").attr("action",actionUrl);
			
					$("#uploadPDDocuments").submit();
				});
	
------------9----------------
				$("#additionalDocuments4Id").click(function(){
					var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=9";
					$("#uploadPDDocuments").attr("action",actionUrl);
			
					$("#uploadPDDocuments").submit();
				});
				
------------10----------------
			$("#additionalDocuments5Id").click(function(){
				var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=10";
				$("#uploadPDDocuments").attr("action",actionUrl);
		
				$("#uploadPDDocuments").submit();
			});
------------11----------------
			$("#imagesId").click(function(){
				var actionUrl = contextPath+ "/propertyDeveloper/uploadDocuments.htm?param=11";
				$("#uploadPDDocuments").attr("action",actionUrl);
		
				$("#uploadPDDocuments").submit();
			});
			
		*/
					/*
					 * ==============================================================================
					 * Update profile=============
					 */
					$("#propertyDeveloperUpdate")
							.click(
									function(event) {
										if ($("#fUpdatePropertyDeveloper")
												.valid() == true) {
											event.preventDefault();
											var formData = form2object(
													'fUpdatePropertyDeveloper',
													'.',
													true,
													function(node) {
														if (node.id
																&& node.id
																		.match(/callbackTest/)) {
															return {
																name : node.id,
																value : node.innerHTML
															};
														}
													});
											var postData = JSON.stringify(
													formData, null, '\t');
											$
													.ajax({
														url : contextPath
																+ "/propertyDeveloper/updateProfile.htm",
														type : "POST",
														data : postData,
														dataType : "json",
														contentType : 'application/json',
														success : function(
																data,
																textStatus,
																jqXHR) {
															if (data.success == true) {
																$
																		.get(
																				contextPath
																						+ "/propertyDeveloper/redirectPropertyDeveloperProfile.htm",
																				function(
																						data) {
																					$(
																							"#containerId")
																							.html(
																									data);
																					$(
																							'#alertSuccessId')
																							.show(
																									200);
																					$(
																							"#successMessageId")
																							.html(
																									"Your Profile has been successfully updated.");
																					setTimeout(
																							function() {
																								$(
																										'#alertSuccessId')
																										.hide(
																												100);
																							},
																							2500);
																				});
															}
														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															
														}
													});
											event.stopImmediatePropagation();
											// STOP default action
										}

									});
					
	/*=========Update Property == and move to second detailed page==========================================================*/				
						
		$("#UpdatePDProperty").click(function(event) {
				if ($("#fPDPropertyDetails").valid() == true) {
						event.preventDefault();
						var formData = form2object('fPDPropertyDetails','.',true,function(node) {
							if (node.id && node.id.match(/callbackTest/)) {return {
														name : node.id,
														value : node.innerHTML
													};
												}
											});
									var postData = JSON.stringify(formData, null, '\t');
									$.ajax({    url : contextPath+ "/propertyDeveloper/updateProperty.htm",
												type : "POST",
												data : postData,
												dataType : "json",
												contentType : 'application/json',
												success : function(data,textStatus,jqXHR) {
													if (data.success == true) {
														window.location.href = contextPath+ "/propertyDeveloper/gotoUpdatePDPropertySecond";  // /propertyDeveloper/uploadPropertyFiles
													}
												},
												error : function(jqXHR,
														textStatus,
														errorThrown) {
												
												}
											});
									event.stopImmediatePropagation();
									// STOP default action
								}

							});
	/*-=-=-=-=-=-=-=-=-=update second detail page -- move to update documents=-=-=-=-=-=-=-=--==-=-=-=-=-=-*/
		
		$("#UpdateDetailedPDPropertyID").click(function(event) {
			if ($("#secondfPDPropertyDetails").valid() == true) {
					event.preventDefault();
					var formData = form2object('secondfPDPropertyDetails','.',true,function(node) {
						if (node.id && node.id.match(/callbackTest/)) {return {
													name : node.id,
													value : node.innerHTML
												};
											}
										});
								var postData = JSON.stringify(formData, null, '\t');
								$.ajax({    url : contextPath+ "/propertyDeveloper/updatePropertyDetailsSecond.htm",
											type : "POST",
											data : postData,
											dataType : "json",
											contentType : 'application/json',
											success : function(data,textStatus,jqXHR) {
												if (data.success == true) {
													window.location.href = contextPath+ "/propertyDeveloper/uploadPropertyFiles.htm";  
												}
											},
											error : function(jqXHR,
													textStatus,
													errorThrown) {
											
											}
										});
								event.stopImmediatePropagation();
								// STOP default action
							}

						});
		
					
					
		/*=====================================================*/			

					$("#updatePassword")
							.click(
									function(event) {
										var postData = JSON.stringify($(
												'#fChangePassword')
												.serializeObject());
										event.preventDefault();
										$
												.ajax({
													url : contextPath
															+ "/propertyDeveloper/updatePassword.htm",
													type : "POST",
													data : postData,
													dataType : "json",
													contentType : 'application/json',
													success : function(
															response,
															textStatus, jqXHR) {
														$('#alertSuccessId')
																.hide();
														$('#alertSuccessId')
																.hide();
														$('#alertErrorId')
																.hide();
														if (response.success == true) {
															$
																	.get(
																			contextPath
																					+ "/propertyDeveloper/redirectPropertyDeveloperProfile.htm",
																			function(
																					data) {
																				$(
																						"#containerId")
																						.html(
																								data);
																				$(
																						'#alertSuccessId')
																						.show(
																								200);
																				$(
																						"#successMessageId")
																						.html(
																								"Your Profile has been successfully updated.");
																				setTimeout(
																						function() {
																							$(
																									'#alertSuccessId')
																									.hide(
																											100);
																						},
																						2500);
																			});
															$(
																	'#fChangePassword')
																	.trigger(
																			"reset");
														} else {
															$('#alertErrorId')
																	.show(200);
															$("#errorMessageId")
																	.html(
																			response.message);
															$(
																	'#fChangePassword')
																	.trigger(
																			"reset");
														}
													},
													error : function(jqXHR,
															textStatus,
															errorThrown) {
														
													}
												});
										event.stopImmediatePropagation();
									});

					$("#propertyDeveloperProfilePH")
							.click(
									function() {
										window.location.href = contextPath
												+ "/propertyDeveloper/redirectCompleteProfile.htm";
									});

					$("#editPropertyDeveloperPH")
							.click(
									function() {
										window.location.href = contextPath
												+ "/propertyDeveloper/redirectCompleteEditProfile.htm";
									});

					$("#changePropertyDeveloperPassword")
							.click(
									function() {
										window.location.href = contextPath
												+ "/propertyDeveloper/redirectCompleteChangePassword.htm";
									});

					$("#pdProperty")
							.click(
									function() {
										window.location.href = contextPath
												+ "/propertyDeveloper/redirectCompleteProperties.htm";
									});

					$("#pdNext").click(
							function(event) {
								$.ajax({
									url : contextPath
											+ "/propertyDeveloper/proceed.htm",
									type : "GET",
									success : function(response, textStatus,
											jqXHR) {
										$("#containerId").html(response);
									}
								});
								event.stopImmediatePropagation();
							});

					$("#registerNewPropertyPH")
							.click(
									function() {
										window.location.href = contextPath
												+ "/propertyDeveloper/registerNewProperty.htm";
									});
					
/*--------------------------------------------move to next Registration--------------------------------------------------------*/
					
					$("#savePDPropertyDetails")
							.click(
									function(event) {

										if ($("#fPDPropertyDetails").valid() == true) {

											var formData = form2object(
													'fPDPropertyDetails',
													'.',
													true,
													function(node) {
														if (node.id
																&& node.id
																		.match(/callbackTest/)) {
															return {
																name : node.id,
																value : node.innerHTML
															};
														}
													});
											var postData = JSON.stringify(
													formData, null, '\t');
											$.ajax({
														url : contextPath
																+ "/propertyDeveloper/savePDProperty.htm",
														type : "POST",
														data : postData,
														dataType : "json",
														contentType : 'application/json',
														success : function(
																response,
																textStatus,
																jqXHR) {
															if (response.success == true) {
																window.location.href = contextPath
																		+ "/propertyDeveloper/savePropertyDetailsDescription.htm";      // change here  /propertyDeveloper/uploadPropertyFiles.htm";
															} else {

															}
														}
													});
										}
										event.stopImmediatePropagation();
									});

					
	/*	---------propertyDetail To UploadFiles-------------------------*/
					
					$("#savePDPropertyDetailsAgain")
					.click(
							function(event) {

								if ($("#secondfPDPropertyDetails").valid() == true) {

									var formData = form2object(
											'secondfPDPropertyDetails',
											'.',
											true,
											function(node) {
												if (node.id
														&& node.id
																.match(/callbackTest/)) {
													return {
														name : node.id,
														value : node.innerHTML
													};
												}
											});
									var postData = JSON.stringify(
											formData, null, '\t');
									$.ajax({
												url : contextPath
														+ "/propertyDeveloper/savePDPropertySecondDetail.htm",
												type : "POST",
												data : postData,
												dataType : "json",
												contentType : 'application/json',
												success : function(
														response,
														textStatus,
														jqXHR) {
													if (response.success == true) {
														window.location.href = contextPath
																+ "/propertyDeveloper/uploadPropertyFiles.htm";      // change here  /propertyDeveloper/uploadPropertyFiles.htm";
													} else {
														window.location.href = contextPath
														+ "/propertyDeveloper/uploadPropertyFiles.htm"; 
													}
												}
											});
								}
								event.stopImmediatePropagation();
							});
					
					// ------------------- Common Function
					// -------------------

					$.fn.serializeObject = function() {
						var o = {};
						var a = this.serializeArray();
						$.each(a, function() {
							if (o[this.name] !== undefined) {
								if (!o[this.name].push) {
									o[this.name] = [ o[this.name] ];
								}
								o[this.name].push(this.value || '');
							} else {
								o[this.name] = this.value || '';
							}
						});
						return o;
					};

			});
function removeDocument(docId) {
	window.location.href = contextPath
			+ "/propertyDeveloper/removeDocuments.htm?docId=" + docId;
	}	

$("#downloadPropertyFormId").click(function(event){
	 window.location.href = contextPath+"/download/proposedPropertyPDF.htm?pdId="+pdId;
});
