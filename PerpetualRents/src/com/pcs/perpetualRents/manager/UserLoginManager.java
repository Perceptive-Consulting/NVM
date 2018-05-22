package com.pcs.perpetualRents.manager;

import com.pcs.perpetualRents.business.bean.EditPassword;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface UserLoginManager {
	
	public UserLogin findLoginUserByName(String username);
	
	public boolean updatePassword(EditPassword passwordObj);
	
	public boolean validateUser(String userName);
	
}
