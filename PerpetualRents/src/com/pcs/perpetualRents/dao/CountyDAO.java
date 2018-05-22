package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.PerpetualCounty;

public interface CountyDAO {
	
	public List<PerpetualCounty> loadAllPerpetualCounty();
	
}
