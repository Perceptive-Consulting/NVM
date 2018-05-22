package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface UserAdminDAO {
	
	public Long createAdmin(Admin userObj, Long createdUserId);
	
	public List<Admin> loadAll(Integer start, Integer limit);
	
	public Admin loadAdminById(Long id , Boolean enable);
	
	public List<Admin> search(String[] fieldNames, String[] values, String[] condition);
	
	public boolean disableUser(Long userObjId);
	
	public boolean enableUser(Long userObjId);
	
	public boolean updateUser(Admin userObj, Long modifiedUserId);
	
	public List<Admin> loadUsersByAdminId(Long loginId);
	
	public Admin loadAdminByLoginObj(UserLogin loginObj);
	
	public String updatePassword(Admin userObj);
	
}
