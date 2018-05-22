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
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.MailEventManager;

//http://ckeditor.com/demo
public class SubAdminMailUtility implements Runnable {
	
	private static Logger logger = ApplicationSettings.getLogger(SubAdminMailUtility.class.getName()); 
	
	private JavaMailSender mailSender;
	private Admin adminObj;
	private ApplicationSettings applicationSettings;
	private MailEventType mailEventType;
	private SpringTemplateEngine templateEngine;
	private MailEventManager eventManager;
	private CommonManager commonManager;
	
	
	public SubAdminMailUtility() {
		super();
	}
	
	public SubAdminMailUtility(final Admin adminObj, final ApplicationSettings settingsObj, final JavaMailSender mailSender,
			MailEventType mailEventType, final MailEventManager eventManager, SpringTemplateEngine templateEngine, CommonManager commonManager) {
		this.mailSender = mailSender;
		this.adminObj = adminObj;
		this.applicationSettings = settingsObj;
		this.mailEventType = mailEventType;
		this.templateEngine = templateEngine;
		this.eventManager = eventManager;
		this.commonManager = commonManager;
	}
	
	@Override 
	public void run() {
		Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
		try{
			logger.info("MAIL-THREAD has been started.");
			List<MailEventConfiguration> mailConfList = eventManager.loadMailEventByEventType(mailEventType, MailEventActor.SUB_ADMIN);
			if(mailConfList != null && !mailConfList.isEmpty()){
				for (MailEventConfiguration _mailConfObj : mailConfList) {
					if(_mailConfObj.getMailEventTypeId() == MailEventType.REGISTER.id()){
						subAdminRegisteration(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PROFILE_EDIT.id()){
						editSubAdminProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_CHANGE.id()){
						changeSubAdminPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_RESET.id()){
						resetSubAdminPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.ENABLE.id()){
						enableSubAdminProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.DISABLE.id()){
						disableSubAdminProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
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
	
	private void subAdminRegisteration(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					UserLogin loginObj = null;
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
					 
			   switch(actor){
			   		
			   case SUB_ADMIN: 
				   
				   if(adminObj != null){
					   
					   ctx.setVariable("receiverName", adminObj.getFirstName() + " " + adminObj.getLastName());
				   		 loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("cities", adminObj.getCityAlloted());
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminRegisteration.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("SUB-ADMIN : MAIL is sending to " + emailId);
				   	}
					  
				   break;
			   case SUPER_ADMIN:
				   
				   if(adminObj != null){
					   Admin superAdminObj = commonManager.loadsuperAdmin();
					   if(superAdminObj != null){
							
							ctx.setVariable("receiverName", superAdminObj.getFirstName() + " " + superAdminObj.getLastName());
							ctx.setVariable("cities", adminObj.getCityAlloted());
							ctx.setVariable("adminName", superAdminObj.getFirstName());
							
							ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
							  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
									  String emailId = "";
								  if(detailsObj != null){
									  emailId = detailsObj.getEmailId();
									  mimeMessageHelper.setTo(detailsObj.getEmailId());
								  }
							  
							  mimeMessageHelper.setSubject("Email From Perpetual.");
							  
							  final String htmlContent = this.templateEngine.process("subadmin/subAdminRegisteration-superAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
							 
							  mailSender.send(mimeMessage);
							  logger.info("SUPER-ADMIN : MAIL is sending to " + emailId);
					   	
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
	   
	public void editSubAdminProfile(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					UserLogin  loginObj = null;
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
					
			   switch(actor){
			   		
			   case SUB_ADMIN: 

				   	if(adminObj != null){
				   		loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("receiverName", adminObj.getFirstName());
						ctx.setVariable("cities", adminObj.getCityAlloted());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminEditProfile.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PMC : MAIL is sending to " + emailId);
				   	}
					  
				   break;
			   case SUPER_ADMIN:
				   
				   if(adminObj != null){
					   Admin superAdmin = commonManager.loadsuperAdmin();
					   if(superAdmin != null){
					   		 loginObj = adminObj.getLoginObj();
							if(loginObj != null){
								ctx.setVariable("userName", loginObj.getUsername());
								ctx.setVariable("password", loginObj.getPassword());
							}
							ctx.setVariable("receiverName", superAdmin.getFirstName());
							ctx.setVariable("cities", adminObj.getCityAlloted());
							
							ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
							  ContactDetails detailsObj = adminObj.getContactDetailsObj();
									  String emailId = "";
								  if(detailsObj != null){
									  emailId = detailsObj.getEmailId();
									  mimeMessageHelper.setTo(detailsObj.getEmailId());
								  }
							  
							  mimeMessageHelper.setSubject("Email From Perpetual.");
							  
							  final String htmlContent = this.templateEngine.process("subadmin/subAdminEditProfile-superAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
							 
							  mailSender.send(mimeMessage);
							  logger.info("PMC : MAIL is sending to " + emailId);
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
	
	public void enableSubAdminProfile(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					UserLogin  loginObj = null;
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
					
			   switch(actor){
			   		
			   case SUB_ADMIN: 

				   	if(adminObj != null){
				   		
				   		ctx.setVariable("receiverName", adminObj.getFirstName());
				   		ctx.setVariable("reference", adminObj.getUniqueReference());
				   		
				   		loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/enableSubAdmin.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("Sub Admin : MAIL is sending to " + emailId);
				   	}
					  
				   break;
			   case SUPER_ADMIN:
				   
				   if(adminObj != null){
					   Admin superAdmin = commonManager.loadsuperAdmin();
					   if(superAdmin != null){
						   
						   ctx.setVariable("receiverName", superAdmin.getFirstName());
						   ctx.setVariable("adminName", adminObj.getFirstName());
						   
					   		 loginObj = adminObj.getLoginObj();
							if(loginObj != null){
								ctx.setVariable("userName", loginObj.getUsername());
								ctx.setVariable("password", loginObj.getPassword());
							}
							
							ctx.setVariable("reference", adminObj.getUniqueReference());
							
							ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
							  ContactDetails detailsObj = superAdmin.getContactDetailsObj();
									  String emailId = "";
								  if(detailsObj != null){
									  emailId = detailsObj.getEmailId();
									  mimeMessageHelper.setTo(detailsObj.getEmailId());
								  }
							  
							  mimeMessageHelper.setSubject("Email From Perpetual.");
							  
							  final String htmlContent = this.templateEngine.process("subadmin/enableSubAdmin-superAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
							 
							  mailSender.send(mimeMessage);
							  logger.info("Super Admin : MAIL is sending to " + emailId);
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
	
	public void disableSubAdminProfile(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					UserLogin  loginObj = null;
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
					
			   switch(actor){
			   		
			   case SUB_ADMIN: 

				   	if(adminObj != null){
				   		
				   		ctx.setVariable("receiverName", adminObj.getFirstName());
				   		ctx.setVariable("reference", adminObj.getUniqueReference());
				   		
				   		loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/disableSubAdmin.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("SubAdmin: MAIL is sending to " + emailId);
				   	}
					  
				   break;
			   case SUPER_ADMIN:
				   
				   if(adminObj != null){
					   Admin superAdmin = commonManager.loadsuperAdmin();
					   if(superAdmin != null){
						   
						   ctx.setVariable("receiverName", superAdmin.getFirstName());
						   ctx.setVariable("adminName", adminObj.getFirstName());
						   
						   
					   		 loginObj = adminObj.getLoginObj();
							if(loginObj != null){
								ctx.setVariable("userName", loginObj.getUsername());
								ctx.setVariable("password", loginObj.getPassword());
							}
							
							ctx.setVariable("reference", adminObj.getUniqueReference());
							
							ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
							  ContactDetails detailsObj = superAdmin.getContactDetailsObj();
									  String emailId = "";
								  if(detailsObj != null){
									  emailId = detailsObj.getEmailId();
									  mimeMessageHelper.setTo(detailsObj.getEmailId());
								  }
							  
							  mimeMessageHelper.setSubject("Email From Perpetual.");
							  
							  final String htmlContent = this.templateEngine.process("subadmin/disableSubAdmin-superAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
							 
							  mailSender.send(mimeMessage);
							  logger.info("subAdmin : MAIL is sending to " + emailId);
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
	
	public void changeSubAdminPassword(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  
					  UserLogin loginObj = null;
			   switch(actor){
			   		
			   case SUB_ADMIN: 
				   
				   if(adminObj != null){
				   		 loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminEditPassword.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("PMC : MAIL is sending to " + emailId);
				   	}
				   
				   
				   break;
			   case SUPER_ADMIN:
				   
				   if(adminObj != null){
				   		 loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("reference", loginObj.getPassword());
						ctx.setVariable("cities", adminObj.getCityAlloted());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminEditPassword-superAdmin.html", ctx);
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
	
	public void resetSubAdminPassword(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  System.out.println("actor " + actor);
					  UserLogin loginObj = null;
			   switch(actor){
			   		
			   case SUB_ADMIN : 
				  
				   	if(adminObj != null){
				   		loginObj = adminObj.getLoginObj();
						if(loginObj != null){
							ctx.setVariable("userName", loginObj.getUsername());
							ctx.setVariable("password", loginObj.getPassword());
						}
						
						ctx.setVariable("reference", loginObj.getPassword());
						ctx.setVariable("cities", adminObj.getCityAlloted());
						
						ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails detailsObj = adminObj.getContactDetailsObj();
								  String emailId = "";
							  if(detailsObj != null){
								  emailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(detailsObj.getEmailId());
							  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("subadmin/subAdminPasswordReset.html", ctx);
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
	   
}