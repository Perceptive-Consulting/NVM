package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Lead;

public interface LeadDAO {

public Long createLead(Lead leadObj);
	
	public List<Lead> loadAllLead(Integer start, Integer limit);
	
	public Lead loadLeadById(Long leadId);
	
	public boolean deleteLead(Long leadObjId);
	
	public List<Lead> searchLead(String[] fieldNames, String[] values, String[] condition);
}
