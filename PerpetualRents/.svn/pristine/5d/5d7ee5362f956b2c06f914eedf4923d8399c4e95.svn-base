package com.pcs.perpetualRents.manager.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.MailDAO;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.enm.MailFlowType;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.PropertyType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.MailManager;
import com.pcs.perpetualRents.manager.PropertyDeveloperManager;
import com.pcs.perpetualRents.manager.PropertyManager;

@Service
@Transactional
public class MailManagerImpl implements MailManager {

	private static Logger logger = ApplicationSettings.getLogger(MailManagerImpl.class.getName()); 
	
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SpringTemplateEngine templateEngine;
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private PropertyDeveloperManager propertyDeveloperManager;
	@Autowired
	private ConversationManager conversationManager;
	@Autowired
	private MailDAO mailDAO;
	
	@Override
	public List<Contractor> contractorQuotationFromLandlord(String[] contractorIdArr,UserLogin loginObj,String propertyId, String functionalityId, String jobsDescription){
		try{
			if(contractorIdArr != null && contractorIdArr.length > 0){
				LandLord landlordObj = landLordManager.loadLandLordByUserLogin(loginObj);
				Property propertyObj = propertyManager.loadPropertyById(Long.valueOf(propertyId));
				Contractor contractorObj = null;
				if(propertyObj != null){
					List<Contractor> rejectedContractorList = new ArrayList<Contractor>();
					for (String contractorIdStr : contractorIdArr) {
						Address addressObj = propertyObj.getAddressObj();
						if(addressObj != null){
							contractorObj = contractorManager.loadContractorById(Long.valueOf(contractorIdStr));
							Expertise expObj = contractorManager.loadExpertiseByContractorAndCity(contractorObj.getId(), Long.valueOf(functionalityId));
							contractorObj.setExpertiseObj(expObj);
							Conversation convObj = null;
							
							if(landlordObj != null && contractorObj != null){
								convObj = new Conversation(ObjectType.LANDLORD.id(), landlordObj.getId(), ObjectType.CONTRACTOR.id(), contractorObj.getId(), landlordObj.getUniqueReference(), contractorObj.getUniqueReference());
								convObj.setPropertyId(Long.valueOf(propertyId));
								convObj.setPropertyTypeId(PropertyType.CURRENT_DEVELOPMENT.id());
								convObj.setJobsDescription(jobsDescription);
								convObj.setMailId1(landlordObj.getPrimaryEmailId());
								convObj.setMailId2(contractorObj.getContactDetailsObj().getEmailId());
								convObj.setFunctionalityId(Long.valueOf(functionalityId));
								convObj.setConversationIdentity(convObj.generateContractorConversationIdentity());
								Conversation existingConversationObj = conversationManager.loadConversationByConvIdentityAndPropertyId(convObj.getConversationIdentity(), convObj.getPropertyId(), convObj.getPropertyTypeId());
								if(existingConversationObj != null){
									Contractor conObj = contractorManager.loadContractorById(Long.valueOf(contractorIdStr.trim()));
									if(conObj != null){
										rejectedContractorList.add(conObj);
										break;
									}
								}else{
									Long id = conversationManager.createConversation(convObj, loginObj.getId());
									if(id != null){
										convObj.setId(id);
										sendContractorQuotation(contractorObj, landlordObj, propertyObj, convObj);
									}
								}
							}
						}
						
					}
					return rejectedContractorList;
				}
			}
			return null;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	private boolean sendContractorQuotation(Contractor contractor, LandLord landlord, Property property, Conversation tConversation){
		try{
			if(contractor != null && tConversation != null){
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
				  final Context ctx = new Context();
				  
				 ContactDetails contactDetails = contractor.getContactDetailsObj();
				  String contractorMailId = contactDetails.getEmailId();
				  mimeMessageHelper.setTo(contractorMailId);
				  mimeMessageHelper.setSubject(""+tConversation.getConversationIdentity());
				  
				  if(landlord != null){
					  ctx.setVariable("receiverName", landlord.getFirstName() + " " + landlord.getLastName());
					  ctx.setVariable("reference", landlord.getUniqueReference());
				  }
			  
				  Address addressObj = property.getAddressObj();
				  if(addressObj!=null){
					  ctx.setVariable("postcode", addressObj.getPostCode());
					//  ctx.setVariable("functionality", contractor.getExpertiseObj().getFunctionality());
					  ctx.setVariable("senderName", applicationSettings.getCommonEmailSenderName());  
				  }
				  ctx.setVariable("jobsDescription", tConversation.getJobsDescription());
				  
				  this.templateEngine.initialize();
				  final String htmlContent = this.templateEngine.process("landlord/contractor-quotation.html", ctx);
				  mimeMessageHelper.setText(htmlContent, true); 
				 			  
				  mailSender.send(mimeMessage);
				  
				 
					  Mail mail = new Mail();
					  
					  mail.setMailTo(contractorMailId);
					  mail.setMailFrom(landlord.getPrimaryEmailId());
					  mail.setSubject(tConversation.getConversationIdentity());
					  mail.setMailBody(htmlContent);
					  mail.setMailOrigin(applicationSettings.getControlEmailId());
					  mail.setMailFlowType((short)MailFlowType.SEND.id());
					  mail.setMailEventActor((short)MailEventActor.LANDLORD.id());
					  mail.setMailEventType((short)MailEventType.SEND_QUOTATION.id());
					  mail.setAttachmentCount(0);
					  mail.setMailMessageId(null);
					  mail.setMailMessageReference(null);
					  mail.setConversationId(tConversation.getId());
					  mailDAO.saveMail(mail);
				  
				  
				  logger.info("MAIL is send to " + contractorMailId);
			}
			return true;
		
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Long createPMCConversation(Mail mailObj, Charity charityObj, UserLogin loginObj, Long propertyId, Integer propertyTypeId){
		try{
			if(charityObj != null && loginObj != null && propertyId != null){
				Property propertyObj = propertyManager.loadPropertyById(propertyId);
				if(propertyObj != null){
					LandLord landlordObj = landLordManager.loadLandlordById(propertyObj.getLandlordId());
					if(landlordObj != null){
								Conversation convObj;
									convObj = new Conversation(ObjectType.SUPER_PMC.id(), charityObj.getId(), ObjectType.LANDLORD.id(), landlordObj.getId(), landlordObj.getUniqueReference(), charityObj.getUniqueReference());
									convObj.setPropertyId(propertyId);
									convObj.setPropertyTypeId(propertyTypeId);
									Address addressObj = propertyObj.getAddressObj();
									if(addressObj != null){
										convObj.setPostCode(addressObj.getPostCode());
									}
									ContactDetails detailObj = charityObj.getContactDetailsObj();
										if(detailObj != null)
											convObj.setMailId1(detailObj.getEmailId());
									convObj.setMailId2(landlordObj.getPrimaryEmailId());
									convObj.setConversationIdentity(convObj.generatePMCConversationIdentity());
									
									Long id = conversationManager.createConversation(convObj, loginObj.getId());
									if(id != null){
										convObj.setId(id);
										mailObj.setConversationId(convObj.getId());
										if(loginObj.getUserTypeId() == UserType.SUPER_PMC.id())
											mailObj.setMailEventActor((short)MailEventActor.PMC_ADMIN.id());
										else if(loginObj.getUserTypeId() == UserType.PMC.id())
											mailObj.setMailEventActor((short)MailEventActor.PMC_USERS.id());
							sendMailByPMC(mailObj);
							return id;
								}
						return null;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	@Override
	public Long createPropertyDeveloperConversation(Mail mailObj, Charity charityObj, UserLogin loginObj, Long pdPropertyId){
		try{
			if(charityObj != null && loginObj != null && pdPropertyId != null){
				PDProperty pdPropertyObj = propertyDeveloperManager.loadPDPropertyById(pdPropertyId);
				if(pdPropertyObj != null){
					PropertyDeveloper propDeveloperObj = propertyDeveloperManager.loadPropDeveloperById(pdPropertyObj.getPropertyDeveloperId());
					if(propDeveloperObj != null){
								Conversation convObj;
							
								
									convObj = new Conversation(loginObj.getObjectType().id(), charityObj.getId(), ObjectType.PROPERTY_DEVELOPER.id(), propDeveloperObj.getId(), propDeveloperObj.getUniqueReference(), charityObj.getUniqueReference());
									convObj.setPropertyId(pdPropertyId);
									convObj.setPropertyTypeId(PropertyType.PROPOSED_DEVELOPMENT.id());
									Address addressObj = pdPropertyObj.getAddressObj();
									if(addressObj != null){
										convObj.setPostCode(addressObj.getPostCode());
									}
									ContactDetails detailObj = charityObj.getContactDetailsObj();
										if(detailObj != null)
											convObj.setMailId1(detailObj.getEmailId());
									convObj.setMailId2(propDeveloperObj.getPrimaryEmailId());
									convObj.setConversationIdentity(convObj.generatePMCConversationIdentity());
									
									Long id = conversationManager.createConversation(convObj, loginObj.getId());
									if(id != null){
										convObj.setId(id);
										mailObj.setConversationId(convObj.getId());
										mailObj.setMailEventType((short)MailEventType.CONVERSATION.id());
										if(loginObj.getUserTypeId() == UserType.SUPER_PMC.id())
											mailObj.setMailEventActor((short)MailEventActor.PMC_ADMIN.id());
										else if(loginObj.getUserTypeId() == UserType.PMC.id())
											mailObj.setMailEventActor((short)MailEventActor.PMC_USERS.id());
							sendMailByPMC(mailObj);
							return id;
								}
						return null;
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return null;
	}
	
	@Override
	public List<Mail> loadMailBySubject(String conversationIdentity) {
		
		return null;
	}

    
	@Override
	public Mail getLastMailByFlowStatus(MailFlowType mailFlowType) {
		Mail mail = null;
		if(mailFlowType.id() == MailFlowType.ALL.id()){
			mail = mailDAO.getLastMailByFlowStatus(MailFlowType.ALL);
		}else{
			mail = mailDAO.getLastMailByFlowStatus(mailFlowType);
		}
		return mail;
	}
	
	@Override
	public Mail getMailByMessageReference(String messageReference) {
		return mailDAO.getMailByMessageReference(messageReference);
		
	}
	
	@Override
	public List<Mail> loadMailByConversationId(Long conversationId) {
		List<Mail> mailList = mailDAO.loadMailByconversationId(conversationId);
		if(mailList != null && !mailList.isEmpty())
			return mailList;
		
		return null;
	}
	

	@Override
	public boolean sendMailByLandlord(Mail mail) {
		 boolean status = false;
		if(mail != null){
			Conversation conversationObj = conversationManager.loadConversationById(mail.getConversationId());
			  if(conversationObj != null){
				  String emailIdTo;
				  String emailIdFrom;
				  if(conversationObj.getActorOneObjectTypeId()  == ObjectType.LANDLORD.id()){
					  emailIdTo = conversationObj.getMailId2();
					  emailIdFrom = conversationObj.getMailId1();
				  }else{
					  emailIdTo = conversationObj.getMailId1();
					  emailIdFrom = conversationObj.getMailId2();
				  }
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper;
				try {
					mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					mimeMessageHelper.setTo(emailIdTo);
					mimeMessageHelper.setSubject(conversationObj.getConversationIdentity());
					mimeMessageHelper.setText(mail.getMailBody(), true); 
					mailSender.send(mimeMessage);
					status = true;
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				if(status){
					  mail.setMailTo(emailIdTo);
					  mail.setMailFrom(emailIdFrom);
					  mail.setSubject(conversationObj.getConversationIdentity());
					  mail.setMailOrigin(applicationSettings.getControlEmailId());
					  mail.setMailFlowType((short)MailFlowType.SEND.id());
					  mail.setMailEventActor((short)MailEventActor.LANDLORD.id());
					  mail.setMailEventType((short)MailEventType.SEND_QUOTATION.id());
					  mail.setAttachmentCount(0);
					  mail.setMailMessageId(null);
					  mail.setMailMessageReference(null);
					  mail.setConversationId(conversationObj.getId());
					  mailDAO.saveMail(mail);
					  logger.info("Mail has been sent to : " + mail.getMailTo());
				}
			  }
		}
		return status;
	}
	
	@Override
	public boolean sendMailByPropertyDeveloper(Mail mail) {
		 boolean status = false;
		if(mail != null){
			Conversation conversationObj = conversationManager.loadConversationById(mail.getConversationId());
			  if(conversationObj != null){
				  String emailIdTo;
				  String emailIdFrom;
				  if(conversationObj.getActorOneObjectTypeId()  == ObjectType.PROPERTY_DEVELOPER.id()){
					  emailIdTo = conversationObj.getMailId2();
					  emailIdFrom = conversationObj.getMailId1();
				  }else{
					  emailIdTo = conversationObj.getMailId1();
					  emailIdFrom = conversationObj.getMailId2();
				  }
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper;
				try {
					mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					mimeMessageHelper.setTo(emailIdTo);
					mimeMessageHelper.setSubject(conversationObj.getConversationIdentity());
					mimeMessageHelper.setText(mail.getMailBody(), true); 
					mailSender.send(mimeMessage);
					status = true;
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				if(status){
					  mail.setMailTo(emailIdTo);
					  mail.setMailFrom(emailIdFrom);
					  mail.setSubject(conversationObj.getConversationIdentity());
					  mail.setMailOrigin(applicationSettings.getControlEmailId());
					  mail.setMailFlowType((short)MailFlowType.SEND.id());
					  mail.setMailEventActor((short)MailEventActor.PROPERTY_DEVELOPER.id());
					  mail.setMailEventType((short)MailEventType.CONVERSATION.id());
					  mail.setAttachmentCount(0);
					  mail.setMailMessageId(null);
					  mail.setMailMessageReference(null);
					  mail.setConversationId(conversationObj.getId());
					  mailDAO.saveMail(mail);
					  logger.info("Mail has been sent to : " + mail.getMailTo());
				}
			  }
		}
		return status;
	}
	
	@Override
	public boolean sendMailByContractor(Mail mail) {
		 boolean status = false;
		if(mail != null){
			Conversation conversationObj = conversationManager.loadConversationById(mail.getConversationId());
			  if(conversationObj != null){
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper;
				try {
					mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					mimeMessageHelper.setTo(conversationObj.getMailId1());
					mimeMessageHelper.setSubject(conversationObj.getConversationIdentity());
					mimeMessageHelper.setText(mail.getMailBody(), true); 
					mailSender.send(mimeMessage);
					status = true;
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				if(status){
					  mail.setMailTo(conversationObj.getMailId1());
					  mail.setMailFrom(conversationObj.getMailId2());
					  mail.setSubject(conversationObj.getConversationIdentity());
					  mail.setMailOrigin(applicationSettings.getControlEmailId());
					  mail.setMailFlowType((short)MailFlowType.SEND.id());
					  mail.setMailEventActor((short)MailEventActor.CONTRACTOR.id());
					  mail.setMailEventType((short)MailEventType.SEND_QUOTATION.id());
					  mail.setAttachmentCount(0);
					  mail.setMailMessageId(null);
					  mail.setMailMessageReference(null);
					  mail.setConversationId(conversationObj.getId());
					  mailDAO.saveMail(mail);
					  logger.info("Mail has been sent to : " + mail.getMailTo());
				}
			  }else{
				  
			  }
		}
		return status;
	}
	
	@Override
	public boolean sendMailByPMC(Mail mail) {
		 boolean status = false;
		if(mail != null){
			Conversation conversationObj = conversationManager.loadConversationById(mail.getConversationId());
			  if(conversationObj != null){
				  MimeMessage mimeMessage = mailSender.createMimeMessage();
				  MimeMessageHelper mimeMessageHelper;
				try {
					mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
					mimeMessageHelper.setTo(conversationObj.getMailId2());
					mimeMessageHelper.setSubject(conversationObj.getConversationIdentity());
					mimeMessageHelper.setText(mail.getMailBody(), true); 
					mailSender.send(mimeMessage);
					status = true;
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				if(status){
					  mail.setMailTo(conversationObj.getMailId2());
					  mail.setMailFrom(conversationObj.getMailId1());
					  mail.setSubject(conversationObj.getConversationIdentity());
					  mail.setMailOrigin(applicationSettings.getControlEmailId());
					  mail.setMailFlowType((short)MailFlowType.SEND.id());
					 // mail.setMailEventActor((short)MailEventActor.PMC_ADMIN.id());
					  if(mail.getMailEventType() == null)
						  mail.setMailEventType((short)MailEventType.SEND_QUOTATION.id());
					  mail.setAttachmentCount(0);
					  mail.setMailMessageId(null);
					  mail.setMailMessageReference(null);
					  mail.setConversationId(conversationObj.getId());
					  mailDAO.saveMail(mail);
					  logger.info("Mail has been sent to : " + mail.getMailTo());
				}
			  }
		}
		return status;
	}

	
	public ApplicationSettings getApplicationSettings() {
		return applicationSettings;
	}

	public void setApplicationSettings(ApplicationSettings applicationSettings) {
		this.applicationSettings = applicationSettings;
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public SpringTemplateEngine getTemplateEngine() {
		return templateEngine;
	}

	public void setTemplateEngine(SpringTemplateEngine templateEngine) {
		this.templateEngine = templateEngine;
	}

	public LandLordManager getLandLordManager() {
		return landLordManager;
	}

	public void setLandLordManager(LandLordManager landLordManager) {
		this.landLordManager = landLordManager;
	}

	public ContractorManager getContractorManager() {
		return contractorManager;
	}

	public void setContractorManager(ContractorManager contractorManager) {
		this.contractorManager = contractorManager;
	}

	public PropertyManager getPropertyManager() {
		return propertyManager;
	}

	public void setPropertyManager(PropertyManager propertyManager) {
		this.propertyManager = propertyManager;
	}

	public ConversationManager getConversationManager() {
		return conversationManager;
	}

	public void setConversationManager(ConversationManager conversationManager) {
		this.conversationManager = conversationManager;
	}

	public MailDAO getMailDAO() {
		return mailDAO;
	}

	public void setMailDAO(MailDAO mailDAO) {
		this.mailDAO = mailDAO;
	}
}
