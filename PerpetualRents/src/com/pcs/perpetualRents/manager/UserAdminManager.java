package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AdminUploadDocuments;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface UserAdminManager {
	
	public boolean createUserAdmin(Admin userObj, Long createdUserId);
	
	public List<Admin> loadAll(Integer start, Integer limit);
	
	public Admin loadAdminById(Long id);
	
	public List<Documents> loadDocumentsByAssignModel(final Long assignModelId);
	
	public boolean disableUser(Long adminId, Long userId);
	
	public boolean enableUser(Long adminId, Long userId);
	
	public boolean updateAdminUser(Admin adminObj, UserLogin loginObj);
	
	public boolean updateAdmin(Admin userObj, UserLogin loginObj);
	
	public boolean uploadFiles(File fileObj, Long userId, Integer adminDocumentId);
	
	public List<Admin> loadUsersByAdminId(Long loginId);
	
	public Admin loadUserByLoginObj(UserLogin loginObj);
	
	public String resetPassword(Long id);
	
	public boolean updateAdminCities(String[] cityIdArr , Long id);
	
	public List<PerpetualCity> loadAllCities();
	
	public  List<AdminUploadDocuments> loadAllUploadedDocuments();
	
	public AdminUploadDocuments loadByDocumentId(final Long documentId);

}
