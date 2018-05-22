package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface PMCDAO {

	public Long createPMC(final Charity charityObj, final Long userId);
	
	public boolean updatePMC(final Charity charityObj, final Long userId);
	
	public Charity loadPMCById(Long pmcId);
	
	public List<Charity> loadAllPMC(Integer start, Integer limit, Long userId);
	
	public void enablePMC(final Charity charityObj, final Long userId);
	
	public void disablePMC(final Charity charityObj, final Long userId);
	
	public Charity loadCharityByUserLogin(UserLogin loginObj);
	
	public String updatePassword(Charity charityObj);	
}