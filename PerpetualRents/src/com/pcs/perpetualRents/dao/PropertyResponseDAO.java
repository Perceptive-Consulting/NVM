package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.PropertyQuestions;

public interface PropertyResponseDAO {

	public PropertyQuestions loadPropertyQuestionByFieldName(String fieldName);
	
	public List<PropertyQuestions> loadQuestionByGroupId(Long groupId);
	
}
