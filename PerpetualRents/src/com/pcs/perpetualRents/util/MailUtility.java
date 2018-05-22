package com.pcs.perpetualRents.util;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.mail.MailSender;

import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;

@SuppressWarnings("unused")
public class MailUtility implements Runnable {
	
	private static Logger logger = ApplicationSettings.getLogger(MailUtility.class.getName()); 
	
	private MailSender mailSender;
	private LandLord landlordObj;
	private ApplicationSettings settingsObj;
	private MailEventType mailEventType;
	private MailEventActor mailEventActor;
	
	public MailUtility() {
		super();
	}
	
	public MailUtility(final LandLord landlordObj, final ApplicationSettings settingsObj, final MailSender mailSender, MailEventType mailEventType, MailEventActor mailEventActor) {
		this.mailSender = mailSender;
		this.landlordObj = landlordObj;
		this.settingsObj = settingsObj;
		this.mailEventType = mailEventType;
		this.mailEventActor = mailEventActor;
	}

	@Override 
	public void run() {
		try{
			logger.info("MAIL-THREAD has been started.");
			if(mailEventType.equals(MailEventType.REGISTER) && mailEventActor.equals(MailEventActor.LANDLORD))
						landlordRegisteration();
			logger.info("MAIL has been successfully sent to " );
		}catch (Exception e) {
			e.printStackTrace();
			logger.log(Level.SEVERE, "Some error has been occured" + e.getMessage());
		}
		
	}
	
   public void landlordRegisteration(){
	  
   }
	
}
