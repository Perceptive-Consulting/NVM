package com.pcs.perpetualRents.manager;

import javax.servlet.http.HttpSession;

import com.pcs.perpetualRents.common.bean.ApplicationSession;
import com.pcs.perpetualRents.enm.SessionStatus;


public interface ApplicationSessionManager {
	
	public boolean createSession(final ApplicationSession sessionObj);
	
	public void destroySession(String sessionIdentity, HttpSession session, SessionStatus status);
	
}
