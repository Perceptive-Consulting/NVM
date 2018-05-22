package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.LandLord;

public interface LandLordDAO {
	
	public Long createLandLord(LandLord landLordObj, final Long userId);
	
	public List<LandLord> loadAllLandLord(Integer start, Integer limit, Long createdUserId);
	
	public LandLord loadLandLordByLoginId(Long id);
	
	public LandLord loadLandLordById(Long id);
	
	public boolean updateLandLord(LandLord landLordObj);
	
	public boolean deleteLandLord(Long landLordObjId);
	
	public List<LandLord> searchLandLord(String[] fieldNames, String[] values, String[] condition);
	
	public boolean validateEmailId(String emailId);
	
	public LandLord  loadUserLoginCredentials(final String emailId);
}
