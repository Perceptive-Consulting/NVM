package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.FunctionalityCostMatrix;
import com.pcs.perpetualRents.business.bean.TurnOverDetails;
import com.pcs.perpetualRents.enm.ContractorFunctionality;

public interface ContractorDAO {
	
	public Long createContractor(Contractor infoObj, Long createdUserId);
	
	public Long saveContractorRegisterationStep2(ContractorRegisterationStep2 infoObj, Long createdUserId);
	
	public Long saveContractorRegisterationStep3(ContractorRegisterationStep3 infoObj, Long createdUserId);
	
	public Long saveContractorRegisterationStep4(ContractorRegisterationStep4 infoObj, Long createdUserId);
	
	public List<Contractor> loadAll(Integer start, Integer limit);
	
	public Contractor findContractorByLoginId(Long id);
	
	public Contractor loadContractorById(Long id);
	
	public ContractorRegisterationStep2 loadContractorStep2Info(Long contractorId);
	
	public ContractorRegisterationStep3 loadContractorStep3Info(Long contractorId);
	
	public ContractorRegisterationStep4 loadContractorStep4Info(Long contractorId);
	
	public boolean updateContractorDetails(Contractor contractorObj);
	
	public List<Contractor> loadContractorByExpertise(ContractorFunctionality functionality, String city);
	
	public boolean deleteContractor(Long contractorObjId);
	
	public void approveContractor(final Contractor contractorObj, final Long userId);
	
	public void disapproveContractor(final Contractor contractorObj, final Long userId);
	
	public int updatePassword(Long userLoginId, String updatedPassword);
	
	public void saveFunctionalityCostMatrix(FunctionalityCostMatrix costObj);
	
	public List<FunctionalityCostMatrix> loadFunctionalityCostMatrix(Long contractorId);
	
	public void deleteFunctionalityCostMatrix(Long contractorId);
	
	public void saveTurnover(TurnOverDetails turnOverObj);
	
	public List<TurnOverDetails> loadTurnOver(Long contractorId);
	
	public boolean checkContractorData(String tableName, Long contractorId);
	
	public Long insertContractorData(String tableName, String[] fields, String[] values, String contractorField, Long contractorId);
	
	public void update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues);
	
}
