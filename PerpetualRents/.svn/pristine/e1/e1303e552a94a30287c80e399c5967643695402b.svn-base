package com.pcs.perpetualRents.manager.impl;


import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.swing.SwingUtilities;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSession;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.ApplicationSessionDAO;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.enm.SessionStatus;
import com.pcs.perpetualRents.manager.ApplicationSessionManager;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.MailEventManager;
import com.pcs.perpetualRents.manager.PropertyDeveloperManager;
import com.pcs.perpetualRents.manager.PropertyManager;
import com.pcs.perpetualRents.util.mail.ContractorMailUtility;
import com.pcs.perpetualRents.util.mail.PropertyDeveloperMailUtility;
import com.pcs.perpetualRents.util.mail.PropertyMailUtility;

@Service
public class ApplicationSessionManagerImpl implements ApplicationSessionManager{
	
	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private JavaMailSender mailSenderObj;
	@Autowired
	private SpringTemplateEngine templateEngine;
	@Autowired
	private MailEventManager mailEventManager;
	@Autowired
	private CommonManager commonManager;
	@Autowired
	private ApplicationSessionDAO applicationSessionDAO;
	@Autowired
	private PropertyDeveloperManager propertyDeveloperManager;
	
	@SuppressWarnings("unchecked")
	@Override
	public void destroySession(String sessionIdentity, HttpSession sessionObj, SessionStatus status) {
		
		Set<Long> createpropertySet = (Set<Long>) sessionObj.getAttribute("createpropertySet");
		
		UserLogin loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(createpropertySet != null){
			for (Long propId : createpropertySet) {
				Property propertyObj = propertyManager.loadPropertyById(propId);
				if(propertyObj != null){
					LandLord landLordObj = landLordManager.loadLandlordById(propertyObj.getLandlordId());
					if(landLordObj != null){
						propertyObj.setLandLordObj(landLordObj);
						propertyObj.setStatusPercentage(Integer.parseInt(propertyManager.getStatus(propertyObj.getId())));
						SwingUtilities.invokeLater(new PropertyMailUtility(propertyObj, applicationSettings, mailSenderObj, MailEventType.REGISTER, mailEventManager, templateEngine, commonManager, loginObj));
					}
				}
			}
		}
		
		
	
		Set<Long> editpropertySet = (Set<Long>) sessionObj.getAttribute("editpropertySet");
		if(editpropertySet != null){
			for (Long propId : editpropertySet) {
				Property propertyObj = propertyManager.loadPropertyById(propId);
				if(propertyObj != null){
					LandLord landLordObj = landLordManager.loadLandlordById(propertyObj.getLandlordId());
					if(landLordObj != null){
						propertyObj.setLandLordObj(landLordObj);
						propertyObj.setStatusPercentage(Integer.parseInt(propertyManager.getStatus(propertyObj.getId())));
						SwingUtilities.invokeLater(new PropertyMailUtility(propertyObj, applicationSettings, mailSenderObj, MailEventType.EDIT, mailEventManager, templateEngine, commonManager, loginObj));
					}
				}
			}
		}
		
		String isContractorEdit = (String) sessionObj.getAttribute("isContractorEdit");
		if(isContractorEdit != null){
			loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			if(loginObj != null){
				Contractor contractorObj = contractorManager.getContractorByUserLogin(loginObj);
				if(contractorObj != null){
					SwingUtilities.invokeLater(new ContractorMailUtility(contractorObj, contractorManager, applicationSettings, mailSenderObj, MailEventType.PROFILE_EDIT, mailEventManager, templateEngine, commonManager));
				}
			}
		}
		

		Boolean isuploadDocuments=(Boolean) sessionObj.getAttribute("uploadPdDocuments");
		Boolean isEditDocuments=(Boolean) sessionObj.getAttribute("editingPDDocument");
		
		if(isuploadDocuments != null && isuploadDocuments) {
			Long propertyId = (Long) sessionObj.getAttribute("propertyId");
			loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			if(loginObj != null){
				PropertyDeveloper propertyDeveloperObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(loginObj);
				if(propertyDeveloperObj != null){
					PDProperty propertyObj1 = propertyDeveloperManager.loadPDPropertyById(propertyId);
					
					if(propertyObj1 != null)
						SwingUtilities.invokeLater(new  PropertyDeveloperMailUtility(propertyDeveloperObj,propertyObj1,applicationSettings,mailSenderObj, MailEventType.UPLOAD, mailEventManager, templateEngine, commonManager, loginObj));
				}
			}
		}
		
		if(isEditDocuments != null && isEditDocuments) {
			Long propertyId = (Long) sessionObj.getAttribute("propertyId");
			loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			if(loginObj != null){
				PropertyDeveloper propertyDeveloperObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(loginObj);
				if(propertyDeveloperObj != null){
					PDProperty propertyObj1 = propertyDeveloperManager.loadPDPropertyById(propertyId);
					if(propertyObj1 != null)
						SwingUtilities.invokeLater(new  PropertyDeveloperMailUtility(propertyDeveloperObj,propertyObj1,applicationSettings,mailSenderObj, MailEventType.EDIT, mailEventManager, templateEngine, commonManager, loginObj));
				}
			}
		}
		applicationSessionDAO.destroySession(sessionIdentity, status);
		
	}
	
	@Override
	public boolean createSession(final ApplicationSession sessionObj){
		return applicationSessionDAO.createSession(sessionObj);
	}
	
	
	public JavaMailSender getMailSenderObj() {
		return mailSenderObj;
	}
	public void setMailSenderObj(JavaMailSender mailSenderObj) {
		this.mailSenderObj = mailSenderObj;
	}
	public SpringTemplateEngine getTemplateEngine() {
		return templateEngine;
	}
	public void setTemplateEngine(SpringTemplateEngine templateEngine) {
		this.templateEngine = templateEngine;
	}
	
}
