package com.pcs.perpetualRents.util.mail;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.commonFunction.CommonFunctions;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.MailEventManager;

//http://ckeditor.com/demo
public class ContractorMailUtility implements Runnable {
	
	private static Logger logger = ApplicationSettings.getLogger(ContractorMailUtility.class.getName()); 
	
	private JavaMailSender mailSender;
	private Contractor contractorObj;
	private ApplicationSettings applicationSettings;
	private MailEventType mailEventType;
	private SpringTemplateEngine templateEngine;
	private MailEventManager eventManager;
	private CommonManager commonManager;
	private ContractorManager contractorManager;
	
	
	public ContractorMailUtility() {
		super();
		
	}
	
	public ContractorMailUtility(final Contractor contractorObj, final ContractorManager contractorManager, final ApplicationSettings settingsObj, final JavaMailSender mailSender,
			final MailEventType mailEventType, final MailEventManager eventManager,  SpringTemplateEngine templateEngine, CommonManager commonManager) {
		this.mailSender = mailSender;
		this.contractorManager = contractorManager;
		this.contractorObj = contractorObj;
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
			
		List<MailEventConfiguration> mailConfList = eventManager.loadMailEventByEventType(mailEventType, MailEventActor.CONTRACTOR);
			if(mailConfList != null && !mailConfList.isEmpty()){
				for (MailEventConfiguration _mailConfObj : mailConfList) {
					if(_mailConfObj.getMailEventTypeId() == MailEventType.REGISTER.id()){
						logger.info("Mailer has been initialized to send mail for CONTRACTOR REGISTERATION");
						contractorRegisteration(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PROFILE_EDIT.id()){
						logger.info("Mailer has been initialized to send mail for CONTRACTOR PROFILE EDIT");
						editContractorProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_CHANGE.id()){
						logger.info("Mailer has been initialized to send mail for CONTRACTOR PASSWORD CHANGE");
						changeContractorPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.ENABLE.id()){
						enableContractor(MailEventActor.get(_mailConfObj.getActorTypeId()));
						logger.info("Mailer has been initialized to send mail for CONTRACTOR ENABLE");
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.DISABLE.id()){
						disableContractor(MailEventActor.get(_mailConfObj.getActorTypeId()));
						logger.info("Mailer has been initialized to send mail for CONTRACTOR DISABLE");
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.APPROVE.id()){
						approveContractor(MailEventActor.get(_mailConfObj.getActorTypeId()));
						logger.info("Mailer has been initialized to send mail for CONTRACTOR APPROVAL");
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.DIS_APPROVE.id()){
						disapproveContractor(MailEventActor.get(_mailConfObj.getActorTypeId()));
						logger.info("Mailer has been initialized to send mail for CONTRACTOR DIS-APPROVAL");
					}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_RESET.id()){
						disapproveContractor(MailEventActor.get(_mailConfObj.getActorTypeId()));
						logger.info("Mailer has been initialized to send mail for CONTRACTOR RESET PASSWORD");
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
	
   private void contractorRegisteration(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				UserLogin loginObj = null;
				 Context ctx = new Context();
				 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
		   switch(actor){
		   		
		   case CONTRACTOR : 
			   
			   List<com.pcs.perpetualRents.business.bean.File> contracotrFilesList = contractorManager.loadContracotrFile();
			   if(contracotrFilesList != null){
				   if(contracotrFilesList.size() == 1){
					   com.pcs.perpetualRents.business.bean.File contractorFileObj = contracotrFilesList.get(0);
					   if(contractorFileObj != null){
							File fileObj = new File(CommonFunctions.getStaggingDirectory(), contractorFileObj.getFileName());
							FileOutputStream fOStream = new FileOutputStream(fileObj);
							fOStream.write(contractorFileObj.getFileData(), 0, (int)contractorFileObj.getSize());
							fOStream.flush();
							fOStream.close();
						mimeMessageHelper.addAttachment(contractorFileObj.getFileName(), fileObj);
						logger.info("Attaching " + contractorFileObj.getFileName());
					  }
				   }else{
					   ByteArrayOutputStream bos = new ByteArrayOutputStream();
						ZipOutputStream zipOs = new ZipOutputStream(bos);
					   for (com.pcs.perpetualRents.business.bean.File file : contracotrFilesList) {	
							zipOs.putNextEntry(new ZipEntry(file.getFileName()));
							zipOs.write(file.getFileData());
							zipOs.closeEntry();
					   	 }
					    zipOs.flush();
						bos.flush();
						zipOs.close();
						bos.close();
						
						String fileName = "Contractor Files.zip";
						
						File fileObj = new File(CommonFunctions.getStaggingDirectory(), fileName);
						FileOutputStream fOStream = new FileOutputStream(fileObj);
						fOStream.write(bos.toByteArray(), 0, bos.toByteArray().length);
						fOStream.flush();
						fOStream.close();
					mimeMessageHelper.addAttachment(fileName, fileObj);
					logger.info("Attaching " + fileName);
				   }
			   }
				  if(contractorObj != null){
					  ctx.setVariable("receiverName", contractorObj.getContactPerson());
					  loginObj = contractorObj.getLoginObj();
					  if(loginObj != null){
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
						  ctx.setVariable("companyName", contractorObj.getCompanyName());
					 
					  }
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		final String htmlContent = this.templateEngine.process("contractor/contractorRegisteration.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   if(contractorObj != null){
							   ctx.setVariable("receiverName", admin.getFirstName() + " " + admin.getLastName());
								  ctx.setVariable("companyName", contractorObj.getCompanyName());
								  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
						      }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  emailId = details.getEmailId();
							  mimeMessageHelper.setTo(details.getEmailId());  
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorRegister-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					}
				   }
			   }
			  
			   break;
		   case SUPER_ADMIN:
			   
			   if(contractorObj != null){
				   Admin adminObj = commonManager.loadsuperAdmin();
				   if(adminObj != null){
					   
					  ctx.setVariable("receiverName", adminObj.getFirstName() + " " + adminObj.getLastName());
					  ctx.setVariable("companyName", contractorObj.getCompanyName());
					  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
					  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
				  
				  ContactDetails details = adminObj.getContactDetailsObj();
				  String emailId = "";
				  if(details != null){
					  emailId = details.getEmailId();
					  mimeMessageHelper.setTo(emailId);  
				  }
				  
				  
				  mimeMessageHelper.setSubject("Email From Perpetual.");
				  
				  	final String htmlContent2 = this.templateEngine.process("contractor/contractorRegister-superadmin.html", ctx);
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
   
   public void editContractorProfile(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				
				 Context ctx = new Context();
				  System.out.println("actor " + actor);
				
		   switch(actor){
		   		
		   case CONTRACTOR : 
			  
				  if(contractorObj != null){
					  ctx.setVariable("companyName", contractorObj.getCompanyName());
					  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
					  ctx.setVariable("reference", contractorObj.getUniqueReference());
					  if(contractorObj.getLoginObj() != null){
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
					      ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
					  }
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		String htmlContentStr  = this.templateEngine.process("contractor/contractorEdit.html", ctx);
				  mimeMessageHelper.setText(htmlContentStr, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   if(contractorObj != null){
							   	  ctx.setVariable("companyName", contractorObj.getCompanyName());
								  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
								  ctx.setVariable("reference", contractorObj.getUniqueReference());
							   if(contractorObj.getLoginObj() != null){
								   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
								   ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
							   }
						  }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  emailId = details.getEmailId();
							  mimeMessageHelper.setTo(details.getEmailId());  
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorEdit-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					   
					}
				   }
			   }
			   
			   break;
		   case SUPER_ADMIN:
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){

					   ctx.setVariable("companyName", contractorObj.getCompanyName());
						  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
						  ctx.setVariable("reference", contractorObj.getUniqueReference());
					   if(contractorObj.getLoginObj() != null){
						   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						   ctx.setVariable("password", contractorObj.getLoginObj().getPassword()); 
					   }
				  
				  
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
					  
					  ContactDetails details = admin.getContactDetailsObj();
					  String emaiId = "";
					  if(details != null){
						  emaiId = details.getEmailId();
						  mimeMessageHelper.setTo(details.getEmailId());  
					  }
					  
					  mimeMessageHelper.setSubject("Email From Perpetual");
					  
					  String htmlContentStr2 = this.templateEngine.process("contractor/contractorEdit-superadmin.html", ctx);
					  mimeMessageHelper.setText(htmlContentStr2, true); // true = isHtml
					 			  
					  mailSender.send(mimeMessage);
					  logger.info("ADMIN : MAIL is sending to " + emaiId);
				   
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
  
   public void resetContractorPassword(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				
				 Context ctx = new Context();
				  System.out.println("actor " + actor);
				
		   switch(actor){
		   		
		   case CONTRACTOR : 
				  
				  if(contractorObj != null){
					  ctx.setVariable("companyName", contractorObj.getCompanyName());
					  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
					  ctx.setVariable("reference", contractorObj.getUniqueReference());
					  if(contractorObj.getLoginObj() != null)
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
					   ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		String htmlContentStr  = this.templateEngine.process("contractor/contractorPasswordChange.html", ctx);
				  mimeMessageHelper.setText(htmlContentStr, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
							   ctx.setVariable("companyName", contractorObj.getCompanyName());
								  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
								  ctx.setVariable("reference", contractorObj.getUniqueReference());
							   if(contractorObj.getLoginObj() != null){
								   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
								   ctx.setVariable("password", contractorObj.getLoginObj().getPassword()); 
						  }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  emailId = details.getEmailId();
							  mimeMessageHelper.setTo(details.getEmailId());  
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorRegister-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					   
					}
				   }
			   }
			  
			   break;
		   case SUPER_ADMIN:
			   
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){
					   ctx.setVariable("companyName", contractorObj.getCompanyName());
						  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
						  ctx.setVariable("reference", contractorObj.getUniqueReference());
					   if(contractorObj.getLoginObj() != null){
						   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						   ctx.setVariable("password", contractorObj.getLoginObj().getPassword()); 
					   }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
				  ContactDetails details = admin.getContactDetailsObj();
				  String emailId = "";
				  if(details != null){
					  emailId = details.getEmailId();
					  mimeMessageHelper.setTo(details.getEmailId());  
				  }
				  mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  String htmlContentStr2 = this.templateEngine.process("contractor/contractorPasswordChange-superadmin.html", ctx);
				  mimeMessageHelper.setText(htmlContentStr2, true); // true = isHtml 
				 			  
				  mailSender.send(mimeMessage);
				  logger.info("ADMIN : MAIL is sending to " + emailId);
			   
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
   public void changeContractorPassword(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				
				 Context ctx = new Context();
				  System.out.println("actor " + actor);
				
		   switch(actor){
		   		
		   case CONTRACTOR : 
				  
				  if(contractorObj != null){
					  ctx.setVariable("companyName", contractorObj.getCompanyName());
					  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
					  ctx.setVariable("reference", contractorObj.getUniqueReference());
					  if(contractorObj.getLoginObj() != null)
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
					   ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		String htmlContentStr  = this.templateEngine.process("contractor/contractorPasswordChange.html", ctx);
				  mimeMessageHelper.setText(htmlContentStr, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
							   ctx.setVariable("companyName", contractorObj.getCompanyName());
								  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
								  ctx.setVariable("reference", contractorObj.getUniqueReference());
							   if(contractorObj.getLoginObj() != null){
								   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
								   ctx.setVariable("password", contractorObj.getLoginObj().getPassword()); 
						  }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  emailId = details.getEmailId();
							  mimeMessageHelper.setTo(details.getEmailId());  
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorRegister-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					   
					}
				   }
			   }
			  
			   break;
		   case SUPER_ADMIN:
			   
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){
					   ctx.setVariable("companyName", contractorObj.getCompanyName());
						  ctx.setVariable("contactPerson", contractorObj.getContactPerson());
						  ctx.setVariable("reference", contractorObj.getUniqueReference());
					   if(contractorObj.getLoginObj() != null){
						   ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						   ctx.setVariable("password", contractorObj.getLoginObj().getPassword()); 
					   }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
				  ContactDetails details = admin.getContactDetailsObj();
				  String emailId = "";
				  if(details != null){
					  emailId = details.getEmailId();
					  mimeMessageHelper.setTo(details.getEmailId());  
				  }
				  mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  String htmlContentStr2 = this.templateEngine.process("contractor/contractorPasswordChange-superadmin.html", ctx);
				  mimeMessageHelper.setText(htmlContentStr2, true); // true = isHtml 
				 			  
				  mailSender.send(mimeMessage);
				  logger.info("ADMIN : MAIL is sending to " + emailId);
			   
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
   
   private void enableContractor(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				UserLogin loginObj = null;
				 Context ctx = new Context();
				 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
		   switch(actor){
		   		
		   case CONTRACTOR : 
			  
				  if(contractorObj != null){
					  loginObj = contractorObj.getLoginObj();
					  if(loginObj != null){
						  ctx.setVariable("receiverName", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
					  }
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		final String htmlContent = this.templateEngine.process("contractor/contractorEnable.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   
						   ctx.setVariable("receiverName", admin.getFirstName());
						   loginObj = contractorObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
							  }
							ctx.setVariable("companyName", contractorObj.getCompanyName());
							ctx.setVariable("reference", contractorObj.getUniqueReference());
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  mimeMessageHelper.setTo(details.getEmailId());
							  emailId = details.getEmailId();
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorEnable-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					}
				   }
			   }
			   
			  
			   break;
		   case SUPER_ADMIN:
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){

					   
					   ctx.setVariable("receiverName", admin.getFirstName());
					   loginObj = contractorObj.getLoginObj();
						  if(loginObj != null){
							  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
						  }
						ctx.setVariable("companyName", contractorObj.getCompanyName());
						ctx.setVariable("reference", contractorObj.getUniqueReference());
					  
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
					  ContactDetails details = admin.getContactDetailsObj();
					  String emailId = "";
					  if(details != null){
						  mimeMessageHelper.setTo(details.getEmailId());
						  emailId = details.getEmailId();
					  }
					  
					  mimeMessageHelper.setSubject("Email From Perpetual.");
				  
				  	final String htmlContent2 = this.templateEngine.process("contractor/contractorEnable-superAdmin.html", ctx);
				  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
				 			  
				  mailSender.send(mimeMessage);
				  logger.info("SUPER ADMIN : MAIL is sending to " + emailId);
					   break;
				   
				   }
			   }
		default:
			break;
			  }
		   }catch(Exception e){
				e.printStackTrace();
			}
   		}
   
   private void disableContractor(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				UserLogin loginObj = null;
				 Context ctx = new Context();
				 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
		   switch(actor){
		   		
		   case CONTRACTOR : 
			  
				  if(contractorObj != null){
					  
					  ctx.setVariable("perpetualEmailId", applicationSettings.getAdminEmailId());
					  ctx.setVariable("phoneNumber", applicationSettings.getAdminEmailId());
					  
					  loginObj = contractorObj.getLoginObj();
					  if(loginObj != null){
						  ctx.setVariable("receiverName", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
					  }
				 
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		final String htmlContent = this.templateEngine.process("contractor/contractorDisable.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  }
				  
			   break;
		   case SUB_ADMIN: 
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   
						   ctx.setVariable("receiverName", admin.getFirstName());
						   loginObj = contractorObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
							  }
							  
							ctx.setVariable("contactPerson", contractorObj.getContactPerson());
							ctx.setVariable("companyName", contractorObj.getCompanyName());
							ctx.setVariable("reference", contractorObj.getUniqueReference());
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  mimeMessageHelper.setTo(details.getEmailId());
							  emailId = details.getEmailId();
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorDisable-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					}
				   }
			   }
			   
			  
			   break;
		   case SUPER_ADMIN:
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){

					   ctx.setVariable("receiverName", admin.getFirstName());
					   loginObj = contractorObj.getLoginObj();
						  if(loginObj != null){
							  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
						  }
						  
						ctx.setVariable("contactPerson", contractorObj.getContactPerson());
						ctx.setVariable("companyName", contractorObj.getCompanyName());
						ctx.setVariable("reference", contractorObj.getUniqueReference());
					  
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
					  
					  ContactDetails details = admin.getContactDetailsObj();
					  String emailId = "";
					  if(details != null){
						  mimeMessageHelper.setTo(details.getEmailId());
						  emailId = details.getEmailId();
					  }
					  
					  mimeMessageHelper.setSubject("Email From Perpetual.");
				  
				  	final String htmlContent2 = this.templateEngine.process("contractor/contractorDisable-superAdmin.html", ctx);
				  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
				 			  
				  mailSender.send(mimeMessage);
				  logger.info("SUPER ADMIN : MAIL is sending to " + emailId);
					   break;
				   
				   }
			   }
		default:
			break;
			  }
		   }catch(Exception e){
				e.printStackTrace();
			}
   		}
   
   private void approveContractor(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				UserLogin loginObj = null;
				 Context ctx = new Context();
				 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
		   switch(actor){
		   		
		   case CONTRACTOR : 
			  
				  if(contractorObj != null){
					  loginObj = contractorObj.getLoginObj();
					  if(loginObj != null){
						  ctx.setVariable("receiverName", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
					  }
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		final String htmlContent = this.templateEngine.process("contractor/contractorApprove.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   
						   ctx.setVariable("receiverName", admin.getFirstName());
						   loginObj = contractorObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
							  }
							ctx.setVariable("companyName", contractorObj.getCompanyName());
							ctx.setVariable("reference", contractorObj.getUniqueReference());
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  mimeMessageHelper.setTo(details.getEmailId());
							  emailId = details.getEmailId();
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorApprove-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					}
				   }
			   }
			   
			  
			   break;
		   case SUPER_ADMIN:
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){
					   ctx.setVariable("receiverName", admin.getFirstName());
					   loginObj = contractorObj.getLoginObj();
						  if(loginObj != null){
							  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
						  }
						ctx.setVariable("companyName", contractorObj.getCompanyName());
						ctx.setVariable("reference", contractorObj.getUniqueReference());
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
					  ContactDetails details = admin.getContactDetailsObj();
					  String emailId = "";
					  if(details != null){
						  mimeMessageHelper.setTo(details.getEmailId());
						  emailId = details.getEmailId();
					  }

					  mimeMessageHelper.setSubject("Email From Perpetual.");
				  	final String htmlContent2 = this.templateEngine.process("contractor/contractorApprove-superAdmin.html", ctx);
				  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
				  mailSender.send(mimeMessage);
				  logger.info("SUPER ADMIN : MAIL is sending to " + emailId);
					   break;
				   }
			   }
		default:
			break;
			  }
		   }catch(Exception e){
				e.printStackTrace();
			}
   		}
   
   private void disapproveContractor(MailEventActor actor){
	   try{
			   	MimeMessage mimeMessage = mailSender.createMimeMessage();
				MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				UserLogin loginObj = null;
				 Context ctx = new Context();
				 logger.info("ACTOR IS " + MailEventActor.get(actor.id()).value() + " ITS ID IS " + actor.id());
		   switch(actor){
		   		
		   case CONTRACTOR : 
			  
				  if(contractorObj != null){
					  loginObj = contractorObj.getLoginObj();
					  if(loginObj != null){
						  ctx.setVariable("receiverName", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("username", contractorObj.getLoginObj().getUsername());
						  ctx.setVariable("password", contractorObj.getLoginObj().getPassword());
					  }
				  }
				  
				  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());

				  ContactDetails detailsObj = contractorObj.getContactDetailsObj();
				 
				  if(detailsObj != null)
					  mimeMessageHelper.setTo(detailsObj.getEmailId());
				  
				  		mimeMessageHelper.setSubject("Email From Perpetual");
				  
				  		final String htmlContent = this.templateEngine.process("contractor/contractorDisapprove.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
				
				  mailSender.send(mimeMessage);
				  logger.info("CONTRACTOR : MAIL has been successfully send to " + detailsObj.getEmailId());
				  
			   break;
			   
		   case SUB_ADMIN: 
			   if(contractorObj != null){
				   List<Admin> adminList = commonManager.loadAdminByContractor(contractorObj.getId());   
				   if(adminList != null && !adminList.isEmpty()){
					   for (Admin admin : adminList) {
						   
						   ctx.setVariable("receiverName", admin.getFirstName());
						   loginObj = contractorObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
							  }
							ctx.setVariable("companyName", contractorObj.getCompanyName());
							ctx.setVariable("reference", contractorObj.getUniqueReference());
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ContactDetails details = admin.getContactDetailsObj();
						  String emailId = "";
						  if(details != null){
							  mimeMessageHelper.setTo(details.getEmailId());
							  emailId = details.getEmailId();
						  }
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent1 = this.templateEngine.process("contractor/contractorDisapprove-admin.html", ctx);
						  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
						 			  
						  mailSender.send(mimeMessage);
						  logger.info("ADMIN : MAIL is sending to " + emailId);
					}
				   }
			   }
			   
			  
			   break;
		   case SUPER_ADMIN:
			   if(contractorObj != null){
				   Admin admin = commonManager.loadsuperAdmin();
				   if(admin != null){

					   
					   ctx.setVariable("receiverName", admin.getFirstName());
					   loginObj = contractorObj.getLoginObj();
						  if(loginObj != null){
							  ctx.setVariable("userName", contractorObj.getLoginObj().getUsername());
						  }
						ctx.setVariable("companyName", contractorObj.getCompanyName());
						ctx.setVariable("reference", contractorObj.getUniqueReference());
					  
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
					  ContactDetails details = admin.getContactDetailsObj();
					  String emailId = "";
					  if(details != null){
						  mimeMessageHelper.setTo(details.getEmailId());
						  emailId = details.getEmailId();
					  }
					  
					  mimeMessageHelper.setSubject("Email From Perpetual.");

				  	final String htmlContent2 = this.templateEngine.process("contractor/contractorDisapprove-superAdmin.html", ctx);
				  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
				 			  
				  mailSender.send(mimeMessage);
				  logger.info("SUPER ADMIN : MAIL is sending to " + emailId);
					   break;
				   
				   }
			   }
		default:
			break;
			  }
		   }catch(Exception e){
				e.printStackTrace();
			}
   		}
	}
