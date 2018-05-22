package com.pcs.perpetualRents.util.mail;

import org.springframework.mail.javamail.JavaMailSender;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.MailEventManager;

@SuppressWarnings("unused")
public class EvaluationUtility implements Runnable {

	private JavaMailSender mailSender;
	private Contractor contractorObj;
	private ApplicationSettings applicationSettings;
	private MailEventType mailEventType;
	private SpringTemplateEngine templateEngine;
	private MailEventManager eventManager;  
	private CommonManager commonManager;
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
	}

}
