package com.pcs.perpetualRents.manager;

import java.util.List;
import java.util.Map;

import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.enm.ADPL2Page;

public interface PropertyResponseManager {
	
	public PropertyQuestions loadPropertyQuestionByFieldName(String fieldName);
	
	public List<PropertyQuestions> loadQuestionByADPL(ADPL2Page adpl2Page);
	
	public List<PropertyQuestions> loadQuestionByGroupId(Long groupId);
	
	public Map<String, PropertyQuestions> getQuestionMap(List<PropertyQuestions> questionList);
	
	public List<PropertyQuestions> loadQuestionsByRadioGroup(final String radioGroupName);
}
