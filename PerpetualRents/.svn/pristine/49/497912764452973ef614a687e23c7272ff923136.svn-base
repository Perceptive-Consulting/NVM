package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.FunctionalityCostMatrix;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.Status;

public interface ContractorManager {
	
	public boolean createContractor(Contractor infoObj, Long createdUserId);
	
	public boolean saveContractorRegisterationStep2(ContractorRegisterationStep2 infoObj, Long createdUserId);
	
	public boolean saveContractorRegisterationStep3(ContractorRegisterationStep3 infoObj, Long createdUserId);
	
	public boolean saveContractorRegisterationStep4(ContractorRegisterationStep4 infoObj, Long createdUserId);
	
	public Contractor getContractorByUserLogin(UserLogin loginObj);
	
	public Contractor loadContractorById(Long id);
	
	public ContractorRegisterationStep2 loadContractorStep2Info(Long contractorId);
	
	public ContractorRegisterationStep3 loadContractorStep3Info(Long contractorId);
	
	public ContractorRegisterationStep4 loadContractorStep4Info(Long contractorId);
	
	public boolean updateContractorDetails(Contractor contractorObj, Long modifiedUserId);
	
	public boolean updateContractorFiles(Long lastFileId, File fileObj, Long userId);
	
	public List<Contractor> loadContractorByExpertise(ContractorFunctionality functionality, Long propertyId);
	
	public List<Contractor> loadAll(Integer start, Integer limit, UserLogin loginObj);
	
	public List<Status> loadStatus(Long assignModelId);
	
	public List<Property> loadJobsByStatus(Long contractorId, Long... statusId);
	
	public Expertise loadExpertiseByContractorAndCity(Long contractorId, Long functionalityId);
	
	public List<Contractor> contractorList(Integer start, Integer limit);
	
	public boolean deleteContractor(Contractor contractorObj, Long objectType);
	
	public List<PerpetualCity> loadAllPerpetualCity();
	
	public List<AssignModel> loadAssignModelByContractorAndProperty(Long contractorId, Long propertyId);
	
	public void approveContractor(final Contractor contractorObj, final Long userId);
	
	public void disapproveContractor(final Contractor contractorObj, final Long userId);
	
	public boolean updateAssignModelStatus(Long assignModelId, Long statusId, Long userId, String remarks);
	
	public boolean uploadFiles(final Documents docObj , final Long userId);
	
	public List<Documents> loadDocumentsByContractorsJob(final Long assignModelId);
	
	public List<Contractor> loadContractorsByCity(Integer start, Integer limit, String city);
	
	public String resetPassword(Long id);
	
	public boolean update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues, Long contractorId);
	
	public boolean updateAddress(Address addressObj, Long userId, Long contractorId);
	
	public boolean updateFunctionaltyCostMatrix(List<FunctionalityCostMatrix> costMatrixList, Long contractorId);
	
	public Long insertContractorData(String tableName, String[] fields, String[] values, String contractorField, Long contractorId);
	
	public boolean updateContractorFunctionality(List<Expertise> functionalities, Long contractorId);
	
	public boolean updateContractorCities(String[] cityIdArr , Long contractorId);

	public List<File> loadContracotrFile();
	
}
