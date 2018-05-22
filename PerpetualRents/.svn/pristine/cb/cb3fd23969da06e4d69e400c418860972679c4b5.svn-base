package com.pcs.perpetualRents.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.pcs.perpetualRents.business.bean.Lead;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.LeadDAO;
import com.pcs.perpetualRents.manager.LeadManager;

@Service
@Transactional
public class LeadManagerImpl implements LeadManager{
	
	@Autowired
	private DevelopmentSettings developmentSettings;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private LeadDAO leadDAO;

	
	@Override
	public boolean createLead(final Lead obj) {
		try{
				if(obj == null){
					System.out.println("Object is Null");
					return false;
				}
				leadDAO.createLead(obj);
				return true;
		}catch (DuplicateKeyException e) {
			System.out.println("UserName already exist, Please try with different username");
			return false;
		}
	}
	
	
	
	@Override
	public List<Lead> loadAllLead(Integer start, Integer limit) {
		List<Lead> leadList = leadDAO.loadAllLead(start, limit);
		if(leadList != null && !leadList.isEmpty()){
			return leadList;
		}
		else{
		return null;
		}
	}
	
	@Override
	public boolean deleteLead(Long leadId) {
		boolean status = false;
		Long leadObjId = leadId;
		status = leadDAO.deleteLead(leadObjId);
		return status;
	}
	
	public DevelopmentSettings getDevelopmentSettings() {
		return developmentSettings;
	}

	public void setDevelopmentSettings(DevelopmentSettings developmentSettings) {
		this.developmentSettings = developmentSettings;
	}
	public ApplicationSettings getApplicationSettings() {
		return applicationSettings;
	}

	public void setApplicationSettings(ApplicationSettings applicationSettings) {
		this.applicationSettings = applicationSettings;
	}



	@Override
	public Lead loadLeadById(Long leadId) {
		Lead leadObj = leadDAO.loadLeadById(leadId);
		return leadObj;
	}

}
