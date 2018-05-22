package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.enm.MailFlowType;

public interface MailManager {

	public List<Contractor> contractorQuotationFromLandlord(String[] contractorIdArr,UserLogin loginObj,String propertyId, String functionalityId, String jobsDescription);
	
	public Mail getLastMailByFlowStatus(MailFlowType mailFlowType);
	
	public Mail getMailByMessageReference(String messageReference);
	
	public List<Mail> loadMailBySubject(String conversationIdentity);
	
	public List<Mail> loadMailByConversationId(final Long conversationId);
	
	public boolean sendMailByLandlord(Mail mailObj);
	
	public boolean sendMailByPropertyDeveloper(Mail mail);
	
	public boolean sendMailByContractor(Mail mail);
	
	public boolean sendMailByPMC(Mail mail);
	
	public Long createPMCConversation(Mail mailObj, Charity charityObj, UserLogin loginObj, Long propertyId, Integer propertyTypeId);
	
	public Long createPropertyDeveloperConversation(Mail mailObj, Charity charityObj, UserLogin loginObj, Long pdPropertyId);
	
}
