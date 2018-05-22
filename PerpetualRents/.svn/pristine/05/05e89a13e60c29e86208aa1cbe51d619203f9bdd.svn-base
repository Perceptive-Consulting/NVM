package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Authorities;
import com.pcs.perpetualRents.business.bean.EditPassword;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface UserLoginDAO {
	
	public Long createLoginUser(UserLogin loginObj, final Long createdUserId);
	
	public boolean createAuthority(Authorities authorityObj); 
	
	public boolean updateAuthority(Authorities authorityObj, String newUserName);
	
	public List<UserLogin> loadAllLoginUser(Integer start, Integer limit);
	
	public UserLogin findLoginUserById(Long id);
	
	public UserLogin findLoginUserByUserName(String username);
	
	public List<UserLogin> searchLoginUser(String[] fieldNames, String[] values, String[] condition);
	
	public boolean updatePassowrd(EditPassword passwordObj);
	
	public boolean deleteLoginUser(Long landLordObjId);
	
	public void enableUser(final Long userId, final Long modifierUserId);
	
	public void disableUser(final Long userId, final Long modifierUserId);
	
	public boolean validateUser(String userName);
	
}
