package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;

public interface MailEventManager {
	
	public Long createMailEvent(final MailEventConfiguration confObj, final Long userId);
	
	public List<MailEventConfiguration> loadMailEventByEventType(MailEventType eventType, MailEventActor actorType);
	
}
