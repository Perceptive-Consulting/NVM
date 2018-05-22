package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.Property;

public interface CommonManager {
	
	public List<Property> loadPropertyByAdmin(Admin adminObj);
	
	public List<Contractor> loadContractorByAdmin(Admin adminObj);
	
	public List<LandLord> loadLandlordByAdmin(Admin adminObj);
	
	public List<Charity> loadPMCByAdmin(Admin adminObj);
	
	public List<Admin> loadAdminByProperty(Long propertyId);
	
	public List<Admin> loadAdminByContractor(Long contractorId);
	
	public List<Admin> loadAdminByLandlord(Long landlordId);
	
	public List<Admin> loadAdminByPMC(Long charityId);
	
	public List<Property> loadPropertyByPMC(Charity pmcObj);
	
	public List<AssignModel> loadJobsByAdmin(Admin adminObj);
	
	public Admin loadsuperAdmin();
	
	public boolean validateEmailId(String emailId);

	public List<PDProperty> loadProposedPropertyByPMC(Charity pmcObj);
	
	public void sendMailAtLoginUser(String username,String password,String emailId);
	
	public boolean validateForgetPasswordEmailId(String emailId);
	
	
}	
