package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface PMCManager {
	
	public boolean createPMC(final Charity charityObj, final Long userId);
	
	public boolean updatePMC(final Charity charityObj, final Long userId);
	
	public Charity loadPMCById(Long pmcId);
	
	public List<Charity> loadAllPMC(Integer start, Integer limit, UserLogin loginObj);
	
	public List<PerpetualCity> loadAllCities();
	
	public List<City> loadPMCCities(Long pmcId);
	
	public void enablePMC(final Charity charityObj, final Long userId);
	
	public void disablePMC(final Charity charityObj, final Long userId);
	
	public Charity loadCharityByUserLogin(UserLogin loginObj);
	
	// public boolean updatePMCCities(String[] cityIdArr , Long id);
	
	public String resetPassword(Long id);
	
	public boolean updatePMCCities(String[] cityIdArr , Long id, UserLogin userLoginObj);
	
}
