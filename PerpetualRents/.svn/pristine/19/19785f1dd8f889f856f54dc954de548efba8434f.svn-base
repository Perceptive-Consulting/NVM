package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.enm.MailFlowType;

public interface MailDAO {
	
	public Long saveMail(Mail mail);
	
	public Mail getLastMailByFlowStatus(MailFlowType mailFlowType);
	
	public Mail getMailByMessageReference(String messageReference);
	
	public List<Mail> loadMailByconversationId(final Long conversationId);
	
}	
