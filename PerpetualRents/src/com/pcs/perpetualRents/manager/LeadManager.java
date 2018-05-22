package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Lead;

public interface LeadManager {
	
		public boolean createLead(Lead obj);
		
		public boolean deleteLead(Long Lead);
		
		public List<Lead> loadAllLead(Integer start, Integer limit);
		
		public Lead loadLeadById(Long leadId);
		
	}

