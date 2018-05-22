package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.ContactDetails;

public interface ContactDetailsDAO {
	
	public Long createContactDetails(final ContactDetails detailsObj, final Long createdUserId);
	
	public boolean updateContactDetails(final ContactDetails detailsObj, final Long createdUserId);
	
	public List<ContactDetails> loadById(Long objectType, Long objectTypeId);
	
	public void update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues);
	
	public boolean validateEmailId(String emailId);
	public ContactDetails retrieveContactDetails(String emailId);
}
