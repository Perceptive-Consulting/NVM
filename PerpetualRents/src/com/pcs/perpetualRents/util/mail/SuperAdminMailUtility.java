package com.pcs.perpetualRents.util.mail;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.MailEventManager;

//http://ckeditor.com/demo
@SuppressWarnings("unused")
public class SuperAdminMailUtility implements Runnable {
	
	private static Logger logger = ApplicationSettings.getLogger(SuperAdminMailUtility.class.getName()); 
	
	private JavaMailSender mailSender;
	private ApplicationSettings applicationSettings;
	private MailEventType mailEventType;
	private SpringTemplateEngine templateEngine;
	private MailEventManager eventManager;
	private CommonManager commonManager;
	private UserLogin userLoginObj;
	private PropertyDeveloper properydeveloperObj;
	private PDProperty pdpropertyObj;
	
	public SuperAdminMailUtility() {
		super();
	}
	
	public SuperAdminMailUtility(final ApplicationSettings settingsObj, final JavaMailSender mailSender,
			MailEventType mailEventType, final MailEventManager eventManager, SpringTemplateEngine templateEngine, CommonManager commonManager) {
		this.mailSender = mailSender;
		this.applicationSettings = settingsObj;
		this.mailEventType = mailEventType;
		this.templateEngine = templateEngine;
		this.eventManager = eventManager;
		this.commonManager = commonManager;
	}
	
	/*public SuperAdminMailUtility(propertyDeveloperObj,pdPropObj,applicationSettings,mailSenderObj, MailEventType.ADMIN_UPLOAD_FOR_PDPROPERTY, mailEventManager, templateEngine, commonManager, loginObj){
		

	}*/
	
	

	public SuperAdminMailUtility(final PropertyDeveloper properydeveloperObj,PDProperty pdpropertyObj,final ApplicationSettings settingsObj,final JavaMailSender mailSender,
			MailEventType mailEventType, final MailEventManager eventManager, SpringTemplateEngine templateEngine, CommonManager commonManager,UserLogin userLoginObj) {
		this.mailSender = mailSender;
		this.properydeveloperObj = properydeveloperObj;
		this.pdpropertyObj = pdpropertyObj;
		this.applicationSettings = settingsObj;
		this.mailEventType = mailEventType;
		this.templateEngine = templateEngine;
		this.eventManager = eventManager;
		this.commonManager = commonManager;
		this.userLoginObj  = userLoginObj;
		
	}

	
	
	@Override 
	public void run() {
		Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
		try{
			logger.info("MAIL-THREAD has been started.");
			List<MailEventConfiguration> mailConfList = eventManager.loadMailEventByEventType(mailEventType, MailEventActor.SUPER_ADMIN);
			if(mailConfList != null && !mailConfList.isEmpty()){
				for (MailEventConfiguration _mailConfObj : mailConfList) {
					 if(_mailConfObj.getMailEventTypeId() == MailEventType.PROFILE_EDIT.id()){
						editSubAdminProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_CHANGE.id()){
						changeSubAdminPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_RESET.id()){
						resetSuperAdminPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}
					else if(_mailConfObj.getMailEventTypeId() == MailEventType.ADMIN_UPLOAD_FOR_PDPROPERTY.id()){
						uploadDocumentsBySuperAdmin(MailEventActor.get(_mailConfObj.getActorTypeId()));
					} 
					else if(_mailConfObj.getMailEventTypeId() == MailEventType.ADMIN_UPDATE_FOR_PDPROPERTY.id()){
						updateDocumentsBySuperAdmin(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}
				}
			}else {
				logger.severe("No configuration found for MAIL..");
			}
			
			logger.finest("MAIL THREAD COMPLETED.");
		
		}catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, "Some error has been occured" + e.getMessage());
		}
	}
	
	public void editSubAdminProfile(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					UserLogin  loginObj = null;
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
					
			   switch(actor){
			   		
			   case SUPER_ADMIN:
				   
				   Admin superAdmin = commonManager.loadsuperAdmin();
				   if(superAdmin != null){
				   		 loginObj = superAdmin.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						ctx.setVariable("receiverName", superAdmin.getFirstName());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = superAdmin.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("superadmin/superAdminEditProfile.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PMC : MAIL is sending to " + emailId);
				   }
			   
				   
				   break;
			default:
				break;
			   }
		   }catch(Exception e){
				e.printStackTrace();
			}
	   }
	
	public void changeSubAdminPassword(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  
					  UserLogin loginObj = null;
			   switch(actor){
			   		
			   case SUPER_ADMIN:
				   Admin superAdmin = commonManager.loadsuperAdmin();
				   if(superAdmin != null){
				   		 loginObj = superAdmin.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("reference", loginObj.getPassword());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = superAdmin.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("superadmin/superAdminEditCredentials.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PMC : MAIL is sending to " + emailId);
				   	}
				   break;
			default:
				break;
			   }
		   }catch(Exception e){
				e.printStackTrace();
			}
	   }
	
	public void resetSuperAdminPassword(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  System.out.println("actor " + actor);
					  UserLogin loginObj = null;
			   switch(actor){
			   		
			   case SUPER_ADMIN : 
				   Admin superAdmin = commonManager.loadsuperAdmin();
				   	if(superAdmin != null){
				   		loginObj = superAdmin.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("reference", loginObj.getPassword());
						ctx.setVariable("cities", superAdmin.getCityAlloted());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = superAdmin.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminRegisteration.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PMC : MAIL is sending to " + emailId);
				   	}
					  
				   break;
			default:
				break;
				   
			   }
		   }catch(Exception e){
				e.printStackTrace();
			}
	   }
	
	
	
	public void uploadDocumentsBySuperAdmin(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  System.out.println("actor " + actor);
					
			   switch(actor){
			   		
			   case PROPERTY_DEVELOPER : 
				  
				   if(properydeveloperObj != null){
					   ctx.setVariable("propertyDeveloperName", properydeveloperObj.getFirstName() + " " + properydeveloperObj.getLastName());
					   ctx.setVariable("reference", properydeveloperObj.getUniqueReference());
						UserLogin loginObj = properydeveloperObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
								  ctx.setVariable("password", loginObj.getPassword());
						  }
						  }
				   		 Admin superAdminObj1 = commonManager.loadsuperAdmin();
				   		 if(superAdminObj1 != null){
					   
					      ctx.setVariable("receiverName", superAdminObj1.getFirstName());
						 
						  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String landlordEmailId = "";
						  if(properydeveloperObj.getPrimaryEmailId() != null && properydeveloperObj.getPrimaryEmailId().contains("@")){
							  landlordEmailId = properydeveloperObj.getPrimaryEmailId();
						  	}
							  mimeMessageHelper.setTo(landlordEmailId);
							  
						  if(properydeveloperObj.getSecondaryEmailId() != null && properydeveloperObj.getSecondaryEmailId().contains("@"))
							  mimeMessageHelper.setBcc(properydeveloperObj.getSecondaryEmailId());
						  if(pdpropertyObj!=null)
						  {
							  ctx.setVariable("Address", pdpropertyObj.getAddressObj().getAddressLine1() + " " + " " + pdpropertyObj.getAddressObj().getPostCode());
							 // String pdpropertyUniqueReference=pdpropertyObj.getUniqueReference();
							  ctx.setVariable("PropertyID",pdpropertyObj.getUniqueReference());
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("superadmin/uploadDocumentsBySuperAdmin-propertyDeveloper.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PROPERTY DEVELOPER UPLOAD DOCUMENTS  : MAIL is sending to " + landlordEmailId);
					  
				   break;
				   
			  
			   case SUPER_ADMIN:
				   
				   if(properydeveloperObj != null){
					   Admin superAdminObj = commonManager.loadsuperAdmin();
					   if(superAdminObj != null){
						   
						      ctx.setVariable("receiverName", superAdminObj.getFirstName());
							  ctx.setVariable("propertyDeveloperName", properydeveloperObj.getFirstName() + " " + properydeveloperObj.getLastName());
							  ctx.setVariable("reference", properydeveloperObj.getUniqueReference());
							  UserLogin loginObj = properydeveloperObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
							  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String emailId = "";
						  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
						  if(detailsObj != null){
							  emailId = detailsObj.getEmailId();
						  }
						  if(pdpropertyObj!=null)
						  {
							  ctx.setVariable("Address", pdpropertyObj.getAddressObj().getAddressLine1() + " " + " " + pdpropertyObj.getAddressObj().getPostCode());  
							  ctx.setVariable("PropertyID",pdpropertyObj.getUniqueReference());
						  }
						
						  mimeMessageHelper.setTo(emailId);
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  this.templateEngine.initialize();
						  final String htmlContent2 = this.templateEngine.process("superadmin/uploadDocumentsBySuperAdmin-superadmin.html", ctx);
						  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  
						  logger.info("SUPER ADMIN : MAIL is sending to " + emailId);
					   }
				   }
				   break;
			default:
				break;
				   
			    
			   }
		   }catch(Exception e){
				e.printStackTrace();
			}
	  }
	
	public void updateDocumentsBySuperAdmin(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  System.out.println("actor " + actor);
					
			   switch(actor){
			   		
			   case PROPERTY_DEVELOPER : 
				  
				   if(properydeveloperObj != null){
					   ctx.setVariable("propertyDeveloperName", properydeveloperObj.getFirstName() + " " + properydeveloperObj.getLastName());
					   ctx.setVariable("reference", properydeveloperObj.getUniqueReference());
						UserLogin loginObj = properydeveloperObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
								  ctx.setVariable("password", loginObj.getPassword());
						  }
						  }
				   		 Admin superAdminObj1 = commonManager.loadsuperAdmin();
				   		 if(superAdminObj1 != null){
					   
					      ctx.setVariable("receiverName", superAdminObj1.getFirstName());
						 
						  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String landlordEmailId = "";
						  if(properydeveloperObj.getPrimaryEmailId() != null && properydeveloperObj.getPrimaryEmailId().contains("@")){
							  landlordEmailId = properydeveloperObj.getPrimaryEmailId();
						  	}
							  mimeMessageHelper.setTo(landlordEmailId);
							  
						  if(properydeveloperObj.getSecondaryEmailId() != null && properydeveloperObj.getSecondaryEmailId().contains("@"))
							  mimeMessageHelper.setBcc(properydeveloperObj.getSecondaryEmailId());
						  if(pdpropertyObj!=null)
						  {
							  ctx.setVariable("Address", pdpropertyObj.getAddressObj().getAddressLine1() + " " + " " + pdpropertyObj.getAddressObj().getPostCode());
							 // String pdpropertyUniqueReference=pdpropertyObj.getUniqueReference();
							  ctx.setVariable("PropertyID",pdpropertyObj.getUniqueReference());
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("superadmin/updateDocumentsBySuperAdmin-propertyDeveloper.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("SUPER ADMIN UPDATE DOCUMENTS  : MAIL is sending to " + landlordEmailId);
					  
				   break;
				   
			  
			   case SUPER_ADMIN:
				   
				   if(properydeveloperObj != null){
					   Admin superAdminObj = commonManager.loadsuperAdmin();
					   if(superAdminObj != null){
						   
						      ctx.setVariable("receiverName", superAdminObj.getFirstName());
							  ctx.setVariable("propertyDeveloperName", properydeveloperObj.getFirstName() + " " + properydeveloperObj.getLastName());
							  ctx.setVariable("reference", properydeveloperObj.getUniqueReference());
							  UserLogin loginObj = properydeveloperObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
							  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String emailId = "";
						  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
						  if(detailsObj != null){
							  emailId = detailsObj.getEmailId();
						  }
						  if(pdpropertyObj!=null)
						  {
							  ctx.setVariable("Address", pdpropertyObj.getAddressObj().getAddressLine1() + " " + " " + pdpropertyObj.getAddressObj().getPostCode());  
							  ctx.setVariable("PropertyID",pdpropertyObj.getUniqueReference());
						  }
						
						  mimeMessageHelper.setTo(emailId);
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  this.templateEngine.initialize();
						  final String htmlContent2 = this.templateEngine.process("superadmin/updateDocumentsBySuperAdmin-superAdmin.html", ctx);
						  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  
						  logger.info("SUPER ADMIN- DOCS UPDATE : MAIL is sending to " + emailId);
					   }
				   }
				   break;
			default:
				break;
				   
			    
			   }
		   }catch(Exception e){
				e.printStackTrace();
			}
	  }

	   
}