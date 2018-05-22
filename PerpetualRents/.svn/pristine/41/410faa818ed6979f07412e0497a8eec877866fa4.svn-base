package com.pcs.perpetualRents.dao;

import com.pcs.perpetualRents.common.bean.ApplicationSession;
import com.pcs.perpetualRents.enm.SessionStatus;

public interface ApplicationSessionDAO {
	
	public void destroySession(final String sessionIdentity, SessionStatus sessionStatus);
	
	public boolean createSession(final ApplicationSession sessionObj);
	
	public boolean getSession(final ApplicationSession sessionObj);
	
}
