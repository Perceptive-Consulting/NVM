package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Charity;

public interface CharityDAO {
	
	public Long create(Charity charityObj);
	
	public List<Charity> loadAll(Integer start, Integer limit);
	
	public Charity findById(Long id);
	
	public List<Charity> search(String[] fieldNames, String[] values, String[] condition);
	
}
