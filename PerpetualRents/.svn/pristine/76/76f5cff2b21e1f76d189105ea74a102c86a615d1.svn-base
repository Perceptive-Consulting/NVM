package com.pcs.perpetualRents.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.dao.MailEventDAO;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.manager.MailEventManager;

@Service
@Transactional
public class MailEventManagerImpl implements MailEventManager {
	
	@Autowired
	private MailEventDAO mailEventDAO;
	
	@Override
	public Long createMailEvent(MailEventConfiguration confObj, Long userId) {
			Long confId = mailEventDAO.createMailEvent(confObj, userId);
		return confId;
	}

	@Override
	public List<MailEventConfiguration> loadMailEventByEventType(MailEventType eventType, MailEventActor actorType) {
		
		List<MailEventConfiguration> confList = mailEventDAO.loadMailEventByEventType(eventType, actorType);
		
		if(confList != null && !confList.isEmpty())
			return confList;
		
		return null;
	}
	
	public MailEventDAO getMailEventDAO() {
		return mailEventDAO;
	}

	public void setMailEventDAO(MailEventDAO mailEventDAO) {
		this.mailEventDAO = mailEventDAO;
	}
	
}
