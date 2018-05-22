package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Expertise;

public interface ExpertiseDAO {
	
	public Long createExpertise(Expertise expertiseObj, final Long createdUserId);
	
	public List<Expertise> loadAllExpertise(Integer start, Integer limit);
	
	public Expertise loadExpertiseByContractorAndCity(Long contractorId, Long functionalityId);
	
	public List<Expertise> findByContractorId(Long id);
	
	public void deleteExpertiseObj(Long contractorObjId);
	
	public Expertise loadExpertiseById(Long id);
	
	public List<Expertise> loadExpertiseByContractorId(Long contractorId);
	
}
