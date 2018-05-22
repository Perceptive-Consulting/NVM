package com.pcs.perpetualRents.util.mail;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AdminUploadDocuments;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.MailDAO;
import com.pcs.perpetualRents.enm.AdminDocuments;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.enm.MailFlowType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.MailEventManager;
import com.pcs.perpetualRents.manager.UserAdminManager;

//http://ckeditor.com/demo
@SuppressWarnings("unused")
public class LandlordMailUtility implements Runnable {
	
	private static Logger logger = ApplicationSettings.getLogger(LandlordMailUtility.class.getName()); 
	
	private JavaMailSender mailSender;
	private LandLord landlordObj;
	private ApplicationSettings applicationSettings;
	private MailEventType mailEventType;
	private SpringTemplateEngine templateEngine;
	private List<Contractor> contractorList;
	private Map<Long,Conversation> conversationMap;
	private Property propertyObj;
	private MailDAO mailDAO; 
	private MailEventManager eventManager;
	private CommonManager commonManager;
	private static int counter = 0; 
	private Charity charityObj;
	private UserLogin userLoginObj;
	private UserAdminManager userAdminManager;
	
	public LandlordMailUtility() {
		super();
	}
	
	public LandlordMailUtility(final LandLord landlordObj, final UserAdminManager userAdminManager, final ApplicationSettings settingsObj, final JavaMailSender mailSender,
			MailEventType mailEventType, final MailEventManager eventManager, SpringTemplateEngine templateEngine, CommonManager commonManager,UserLogin userLoginObj) {
		this.mailSender = mailSender;
		this.landlordObj = landlordObj;
		this.applicationSettings = settingsObj;
		this.mailEventType = mailEventType;
		this.templateEngine = templateEngine;
		this.eventManager = eventManager;
		this.commonManager = commonManager;
		this.userLoginObj  = userLoginObj;
		this.userAdminManager = userAdminManager;
	}
	
	public LandlordMailUtility(final LandLord landlordObj, final ApplicationSettings settingsObj, final JavaMailSender mailSender, MailEventType mailEventType, 
			SpringTemplateEngine templateEngine,List<Contractor> contractorList,Map<Long,Conversation> conversationMap,Property propertyObj,MailDAO mailDAO) {
		this.mailSender = mailSender;
		this.landlordObj = landlordObj;
		this.applicationSettings = settingsObj;
		this.mailEventType = mailEventType;
		this.templateEngine = templateEngine;
		this.contractorList = contractorList;
		this.conversationMap = conversationMap;
		this.propertyObj = propertyObj;
		this.mailDAO  = mailDAO;
	}
	
	@Override 
	public void run() {
		Thread.currentThread().setContextClassLoader(getClass().getClassLoader());
		try{
			logger.info("MAIL-THREAD has been started.");
			if(mailEventType.id() == MailEventType.SEND_QUOTATION.id()){
				contractorQuotation();
			}else{
				List<MailEventConfiguration> mailConfList = eventManager.loadMailEventByEventType(mailEventType, MailEventActor.LANDLORD);
				System.out.println("Mail List : " + mailConfList);
				if(mailConfList != null && !mailConfList.isEmpty()){
					for (MailEventConfiguration _mailConfObj : mailConfList) {
						System.out.println(_mailConfObj.toString());
						if(_mailConfObj.getMailEventTypeId() == MailEventType.REGISTER.id()){
							logger.info("Mailer has been initialized to send mail for LANDLORD REGISTERATION");
							landlordRegisteration(MailEventActor.get(_mailConfObj.getActorTypeId()));
						}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PROFILE_EDIT.id()){
							logger.info("Mailer has been initialized to send mail for LANDLORD PROFILE EDITING");
							editLandlordProfile(MailEventActor.get(_mailConfObj.getActorTypeId()));
						}else if(_mailConfObj.getMailEventTypeId() == MailEventType.PASSWORD_CHANGE.id()){
							logger.info("Mailer has been initialized to send mail for LANDLORD PASSWORD CHANGE");
							changeLandlordPassword(MailEventActor.get(_mailConfObj.getActorTypeId()));
						}
					}
				}else {
					logger.severe("No configuration found for MAIL..");
				}
				
				logger.finest("MAIL THREAD COMPLETED.");
			}
		}catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, "Some error has been occured" + e.getMessage());
		}
	}
	
	private void landlordRegisteration(MailEventActor actor){
				try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					 logger.info("ACTOR IS " + MailEventActor.get(actor.id()) + " ID IS " + actor.id());
					 
			   switch(actor){
			   		
			   case LANDLORD : 
				  
				   AdminUploadDocuments adpl1DocumentObj = userAdminManager.loadByDocumentId(AdminDocuments.ADPL1.id());
				//   System.out.println("adpl1DocumentObj : " + adpl1DocumentObj.toString());
				   if(adpl1DocumentObj != null ){
					   		com.pcs.perpetualRents.business.bean.File adpl1FileObj = adpl1DocumentObj.getFileObj();
					   		//System.out.println("adpl1FileObj : " + adpl1FileObj);
					   	 if(adpl1FileObj != null){
					   		 
					   		 	File fileObj = new File(adpl1FileObj.getFilePath());
								
								//System.out.println("fileObj : " + fileObj.toString());
								FileOutputStream fOStream = new FileOutputStream(fileObj);
								fOStream.write(adpl1FileObj.getFileData(), 0, (int)adpl1FileObj.getSize());
								fOStream.flush();
								fOStream.close();
							mimeMessageHelper.addAttachment(adpl1FileObj.getFileName(), fileObj);
							logger.info("Attaching " + adpl1FileObj.getFileName());
						  }
				   }
				   
				   AdminUploadDocuments adpl3DocumentObj = userAdminManager.loadByDocumentId(AdminDocuments.ADPL3.id());
				   if(adpl3DocumentObj != null ){
					   		com.pcs.perpetualRents.business.bean.File adpl3FileObj = adpl3DocumentObj.getFileObj();
					   	 if(adpl3FileObj != null){
					   		 	File fileObj = new File(adpl3FileObj.getFilePath());
								FileOutputStream fOStream = new FileOutputStream(fileObj);
								fOStream.write(adpl3FileObj.getFileData(), 0, (int)adpl3FileObj.getSize());
								fOStream.flush();
								fOStream.close();
							mimeMessageHelper.addAttachment(adpl3FileObj.getFileName(), fileObj);
							logger.info("Attaching " + adpl3FileObj.getFileName());
						  }
				   }
				  
				   AdminUploadDocuments bankingDocumentObj = userAdminManager.loadByDocumentId(AdminDocuments.BANKING_DOCUMENTS.id());
				   if(bankingDocumentObj != null ){
					   		com.pcs.perpetualRents.business.bean.File bankingFileObj = bankingDocumentObj.getFileObj();
					   	 if(bankingFileObj != null){
					   		  File fileObj = new File(bankingFileObj.getFilePath());
								FileOutputStream fOStream = new FileOutputStream(fileObj);
								fOStream.write(bankingFileObj.getFileData(), 0, (int)bankingFileObj.getSize());
								fOStream.flush();
								fOStream.close();
							mimeMessageHelper.addAttachment(bankingFileObj.getFileName(), fileObj);
							logger.info("Attaching ---" + bankingFileObj.getFileName());
						  }
				   }
				   
				   AdminUploadDocuments termsAndConditionDocumentObj = userAdminManager.loadByDocumentId(AdminDocuments.TEERMS_AND_CONDITIONS.id());
				   if(adpl3DocumentObj != null ){
					   		com.pcs.perpetualRents.business.bean.File termsAndConditionFileObj = termsAndConditionDocumentObj.getFileObj();
					   	 if(termsAndConditionFileObj != null){
					   		 	File fileObj = new File(termsAndConditionFileObj.getFilePath());
								FileOutputStream fOStream = new FileOutputStream(fileObj);
								fOStream.write(termsAndConditionFileObj.getFileData(), 0, (int)termsAndConditionFileObj.getSize());
								fOStream.flush();
								fOStream.close();
							mimeMessageHelper.addAttachment(termsAndConditionFileObj.getFileName(), fileObj);
							logger.info("Attaching " + termsAndConditionFileObj.getFileName());
						  }
				   }
				   
				  /* List<com.pcs.perpetualRents.business.bean.File> bankStandingOrderFileList = propertyManager.bankStandingOrderFile();
				   System.out.println("bankStandingOrderFileList :: "+ bankStandingOrderFileList);
				   if(bankStandingOrderFileList != null){
					   if(bankStandingOrderFileList.size() == 1){
						   com.pcs.perpetualRents.business.bean.File bankStandingOrderFileObj = bankStandingOrderFileList.get(0);
						   if(bankStandingOrderFileObj != null){
								File fileObj = new File(CommonFunctions.getStaggingDirectory(), bankStandingOrderFileObj.getFileName());
								FileOutputStream fOStream = new FileOutputStream(fileObj);
								fOStream.write(bankStandingOrderFileObj.getFileData(), 0, (int)bankStandingOrderFileObj.getSize());
								fOStream.flush();
								fOStream.close();
							mimeMessageHelper.addAttachment(bankStandingOrderFileObj.getFileName(), fileObj);
							logger.info("Attaching  " + bankStandingOrderFileObj.getFileName());
						  }
					   }else{
						   ByteArrayOutputStream bos = new ByteArrayOutputStream();
							ZipOutputStream zipOs = new ZipOutputStream(bos);
						   for (com.pcs.perpetualRents.business.bean.File file : bankStandingOrderFileList) {	
								zipOs.putNextEntry(new ZipEntry(file.getFileName()));
								zipOs.write(file.getFileData());
								zipOs.closeEntry();
						   	 }
						    zipOs.flush();
							bos.flush();
							zipOs.close();
							bos.close();
							
							String fileName = "Bank Standing Order.zip";
							
							File fileObj = new File(CommonFunctions.getStaggingDirectory(), fileName);
							FileOutputStream fOStream = new FileOutputStream(fileObj);
							fOStream.write(bos.toByteArray(), 0, bos.toByteArray().length);
							fOStream.flush();
							fOStream.close();
						mimeMessageHelper.addAttachment(fileName, fileObj);
						logger.info("Attaching " + fileName);
					   }
				   }*/
				   
					 if(landlordObj != null){
							 ctx.setVariable("receiverName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							UserLogin loginObj = landlordObj.getLoginObj();
								  if(loginObj != null){
									  ctx.setVariable("username", loginObj.getUsername());
									  ctx.setVariable("password", loginObj.getPassword());
								  }
							  }
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  if(landlordObj.getPrimaryEmailId() != null && landlordObj.getPrimaryEmailId().length() != 0)
								  mimeMessageHelper.setTo(landlordObj.getPrimaryEmailId());
							  
							  if(landlordObj.getSecondaryEmailId() != null && landlordObj.getSecondaryEmailId().length() != 0 && landlordObj.getSecondaryEmailId().contains("@"))
								  mimeMessageHelper.setBcc(landlordObj.getSecondaryEmailId());
							  
							  mimeMessageHelper.setSubject("Email From Perpetual");
							  this.templateEngine.initialize();
							  final String htmlContent = this.templateEngine.process("landlord/landlordRegisteration.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
							 
							  mailSender.send(mimeMessage);
							  logger.info("LANDLORD : MAIL is sending to " + landlordObj.getPrimaryEmailId());
					  
				   break;
				   
			   case SUB_ADMIN: 
				   
				  if(landlordObj != null){
					  List<Admin> adminList = commonManager.loadAdminByLandlord(landlordObj.getId());
					  if(adminList != null && adminList.isEmpty()){
						  for (Admin admin : adminList) {
							  
							  ctx.setVariable("receiverName", admin.getFirstName() + " " + admin.getLastName());
							  ctx.setVariable("landlordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
					  
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						   ContactDetails detailsObj = admin.getContactDetailsObj();
						   String emailId = "";
						   if(detailsObj != null){
							   emailId = detailsObj.getEmailId();
							   mimeMessageHelper.setTo(detailsObj.getEmailId());
						   }else{
							   logger.severe("ADMIN : No MAIL ID  FOUND.");
						   }
						   
					  mimeMessageHelper.setSubject("Email From Perpetual");
					  this.templateEngine.initialize();
					  final String htmlContent1 = this.templateEngine.process("landlord/landlordRegister-admin.html", ctx);
					  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
					 			  
					  mailSender.send(mimeMessage);
					  logger.info("ADMIN : MAIL is sending to " + emailId);
					  
						}
					  }
				  }
				  
				   break;
			   case SUPER_ADMIN:
				  
				   if(landlordObj != null){
					   Admin superAdminObj = commonManager.loadsuperAdmin();
					   if(superAdminObj != null){
						   
						      ctx.setVariable("receiverName", superAdminObj.getFirstName());
							  ctx.setVariable("landlordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
						  
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
						  String emailId = "";
						  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
						  if(detailsObj != null){
							  emailId = detailsObj.getEmailId();
						  }else{
							   logger.severe("SUPER ADMIN : No MAIL ID FOUND.");
						   }
						  mimeMessageHelper.setTo(emailId);
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  this.templateEngine.initialize();
						  final String htmlContent2 = this.templateEngine.process("landlord/landlordRegister-superadmin.html", ctx);
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
	   
	public void editLandlordProfile(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					Context ctx = new Context();
					logger.info("EDITING : SENDING MAIL TO " + actor.value().toUpperCase());
					Admin superAdminObj = commonManager.loadsuperAdmin();
					
			   switch(actor){
			   		
			   case LANDLORD : 
				  
				   if(landlordObj != null){
					   ctx.setVariable("landlordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
					   ctx.setVariable("reference", landlordObj.getUniqueReference());
						UserLogin loginObj = landlordObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
								  ctx.setVariable("password", loginObj.getPassword());
							  }
						  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  ctx.setVariable("superAdminName", superAdminObj.getFirstName() + "" + superAdminObj.getLastName());
						  
						  mimeMessageHelper.setTo(landlordObj.getPrimaryEmailId());
						  if(landlordObj.getSecondaryEmailId() != null && landlordObj.getSecondaryEmailId().contains("@"))
							  mimeMessageHelper.setBcc(landlordObj.getSecondaryEmailId());
						  
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  
						  if(userLoginObj.getUserTypeId() == UserType.SUPER_ADMIN.id() || userLoginObj.getUserTypeId() == UserType.ADMIN.id()) {
							  final String htmlContent = this.templateEngine.process("landlord/landlordEdit-updatedBySuperAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						  } else {
							  final String htmlContent = this.templateEngine.process("landlord/landlordEdit.html", ctx);
							  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						  }
						   
						  mailSender.send(mimeMessage);
						  logger.info("LANDLORD : MAIL is sending to " + landlordObj.getPrimaryEmailId());
					  
				   break;
				   
			   case SUB_ADMIN: 
				   if(landlordObj != null){
					   List<Admin> adminList = commonManager.loadAdminByLandlord(landlordObj.getId());
					   if(adminList != null && !adminList.isEmpty()){
						   for (Admin admin : adminList) {

									  ctx.setVariable("landLordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
									  ctx.setVariable("reference", landlordObj.getUniqueReference());
									  UserLogin loginObj = landlordObj.getLoginObj();
									  if(loginObj != null){
										  ctx.setVariable("username", loginObj.getUsername());
										  ctx.setVariable("password", loginObj.getPassword());
									  }
							  
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  ctx.setVariable("adminName", admin.getFirstName() + "" + admin.getLastName());
							  ctx.setVariable("landlordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							  ctx.setVariable("superAdminName", superAdminObj.getFirstName() + "" + superAdminObj.getLastName());
							  
							  ContactDetails detailsObj = admin.getContactDetailsObj();
							  String subAdminEmailId = "";
							  if(detailsObj != null){
								  subAdminEmailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(subAdminEmailId);
							  }else{
								  subAdminEmailId = applicationSettings.getAdminEmailId();
								  mimeMessageHelper.setTo(applicationSettings.getAdminEmailId());  
							  }
							  mimeMessageHelper.setSubject("Email From Perpetual");
							  this.templateEngine.initialize();
							  if(userLoginObj.getUserTypeId() == UserType.SUPER_ADMIN.id() || userLoginObj.getUserTypeId() == UserType.ADMIN.id()) {
								  final String htmlContent1 = this.templateEngine.process("landlord/landlordEdit-admin-updatedBySuperAdmin.html", ctx);
								  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
							  } else {
								  final String htmlContent1 = this.templateEngine.process("landlord/landlordEdit-admin.html", ctx);
								  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
							  }
							 			  
							  mailSender.send(mimeMessage);
							  logger.info("ADMIN : MAIL is sending to " + subAdminEmailId);
						   
						}
					   }
				   }
				  
				   break;
			   case SUPER_ADMIN:
				   
				   if(landlordObj != null){
					   
					   if(superAdminObj != null){
						      
						      ctx.setVariable("receiverName", superAdminObj.getFirstName());
							  ctx.setVariable("landLordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							  ctx.setVariable("adminName", superAdminObj.getFirstName() + "" + superAdminObj.getLastName());
							  ctx.setVariable("reference", landlordObj.getUniqueReference());
							  
							  UserLogin loginObj = landlordObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
							  }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String emailId = "";
						  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
						  if(detailsObj != null){
							  emailId = detailsObj.getEmailId();
						  }
						  mimeMessageHelper.setTo(emailId);
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  this.templateEngine.initialize();
						  
						  if(userLoginObj.getUserTypeId() == UserType.SUPER_ADMIN.id() || userLoginObj.getUserTypeId() == UserType.ADMIN.id()) {
							  final String htmlContent2 = this.templateEngine.process("landlord/landlordEdit-superadmin-updatedBySuperAdmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
						  } else {
							  final String htmlContent2 = this.templateEngine.process("landlord/landlordEdit-superadmin.html", ctx);
							  mimeMessageHelper.setText(htmlContent2, true); // true = isHtml
						  }
						  
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
	
	public void changeLandlordPassword(MailEventActor actor){
		   try{
				   	MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					
					 Context ctx = new Context();
					  System.out.println("actor " + actor);
					
			   switch(actor){
			   		
			   case LANDLORD : 
				  
				   if(landlordObj != null){
					   ctx.setVariable("name", landlordObj.getFirstName() + " " + landlordObj.getLastName());
					   ctx.setVariable("reference", landlordObj.getUniqueReference());
						UserLogin loginObj = landlordObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
								  ctx.setVariable("password", loginObj.getPassword());
							  }
						  }
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String landlordEmailId = "";
						  if(landlordObj.getPrimaryEmailId() != null && landlordObj.getPrimaryEmailId().contains("@")){
							  landlordEmailId = landlordObj.getPrimaryEmailId();
						  	}
							  mimeMessageHelper.setTo(landlordEmailId);
							  
						  if(landlordObj.getSecondaryEmailId() != null && landlordObj.getSecondaryEmailId().contains("@"))
							  mimeMessageHelper.setBcc(landlordObj.getSecondaryEmailId());
						  
						  mimeMessageHelper.setSubject("Email From Perpetual.");
						  
						  final String htmlContent = this.templateEngine.process("landlord/landlordPasswordChange.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); // true = isHtml
						 
						  mailSender.send(mimeMessage);
						  logger.info("LANDLORD : MAIL is sending to " + landlordEmailId);
					  
				   break;
				   
			   case SUB_ADMIN: 
				   
				   if(landlordObj != null){
					   List<Admin> adminList = commonManager.loadAdminByLandlord(landlordObj.getId());
					   if(adminList != null && !adminList.isEmpty()){
						   for (Admin admin : adminList) {

							   ctx.setVariable("name", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							   ctx.setVariable("reference", landlordObj.getUniqueReference());
							   if(landlordObj.getLoginObj() != null)
								  ctx.setVariable("userName", landlordObj.getLoginObj().getUsername());
							  
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
							  
							  ContactDetails detailsObj = admin.getContactDetailsObj();
							  String subAdminEmailId = "";
							  if(detailsObj != null){
								  subAdminEmailId = detailsObj.getEmailId();
								  mimeMessageHelper.setTo(subAdminEmailId);
							  }else{
								  subAdminEmailId = applicationSettings.getAdminEmailId();
								  mimeMessageHelper.setTo(applicationSettings.getAdminEmailId());  
							  }
							  mimeMessageHelper.setSubject("Email From Perpetual");
							  this.templateEngine.initialize();
							  final String htmlContent1 = this.templateEngine.process("landlord/landlordEdit-admin.html", ctx);
							  mimeMessageHelper.setText(htmlContent1, true); // true = isHtml
							 			  
							  mailSender.send(mimeMessage);
							  logger.info("ADMIN : MAIL is sending to " + subAdminEmailId);
						   
						}
					   }
				   }
				  
				   break;
			   case SUPER_ADMIN:
				   
				   if(landlordObj != null){
					   Admin superAdminObj = commonManager.loadsuperAdmin();
					   if(superAdminObj != null){
						   
						      ctx.setVariable("receiverName", superAdminObj.getFirstName());
							  ctx.setVariable("landlordName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							  ctx.setVariable("reference", landlordObj.getUniqueReference());
							  UserLogin loginObj = landlordObj.getLoginObj();
							  if(loginObj != null){
								  ctx.setVariable("username", loginObj.getUsername());
							  }
						  
						  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());
						  String emailId = "";
						  ContactDetails detailsObj = superAdminObj.getContactDetailsObj();
						  if(detailsObj != null){
							  emailId = detailsObj.getEmailId();
						  }
						  mimeMessageHelper.setTo(emailId);
						  mimeMessageHelper.setSubject("Email From Perpetual");
						  this.templateEngine.initialize();
						  final String htmlContent2 = this.templateEngine.process("landlord/landlordPasswordChange-superadmin.html", ctx);
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
	   
	public void contractorQuotation(){
		   try{
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				  Conversation conversation = null;
				  final Context ctx = new Context();
				  
				  if(contractorList !=null && contractorList.size()>0){
					  
					  for(Contractor contractor : contractorList){
						  ContactDetails contactDetails = contractor.getContactDetailsObj();
						  String contractorMailId = contactDetails.getEmailId();
						  conversation = conversationMap.get(contractor.getId());
						  mimeMessageHelper.setTo(contractorMailId);
						  mimeMessageHelper.setSubject(""+conversation.getConversationIdentity());
						  
						  if(landlordObj != null){
							  ctx.setVariable("receiverName", landlordObj.getFirstName() + " " + landlordObj.getLastName());
							  ctx.setVariable("reference", landlordObj.getUniqueReference());
						  }
					  
						  Address addressObj = propertyObj.getAddressObj();
						  if(addressObj!=null){
							  ctx.setVariable("postcode", addressObj.getPostCode());
							  ctx.setVariable("functionality", contractor.getExpertiseObj().getFunctionality());
							  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());  
						  }
						  
										  
						  this.templateEngine.initialize();
						  final String htmlContent = this.templateEngine.process("landlord/contractor-quotation.html", ctx);
						  mimeMessageHelper.setText(htmlContent, true); 
						 			  
						  mailSender.send(mimeMessage);
						  
						 
							  Mail mail = new Mail();
							  
							  mail.setMailTo(contractorMailId);
							  mail.setMailFrom(landlordObj.getPrimaryEmailId());
							  mail.setSubject(conversation.getConversationIdentity());
							  mail.setMailBody(htmlContent);
							  mail.setMailOrigin(applicationSettings.getControlEmailId());
							  mail.setMailFlowType((short)MailFlowType.SEND.id());
							  mail.setMailEventActor((short)MailEventActor.LANDLORD.id());
							  mail.setMailEventType((short)MailEventType.SEND_QUOTATION.id());
							  mail.setAttachmentCount(0);
							  mail.setMailMessageId(null);
							  mail.setMailMessageReference(null);
							  mail.setConversationId(conversation.getId());
							  mailDAO.saveMail(mail);
						  
						  
						  logger.info("MAIL is send to " + contractorMailId);
					  }
				  }
				  
				 			 
				 
			}catch(Exception e){
				e.printStackTrace();
			}
	   }
	
}