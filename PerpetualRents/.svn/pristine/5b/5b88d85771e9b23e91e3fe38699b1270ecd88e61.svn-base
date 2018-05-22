package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.QuestionGroup;

public interface PropertyQuestionsDAO {
	
	public Long getQuestionIdByFieldName(String fieldName);
	
	public List<PropertyResponse> loadResponseByPropertyAndQuestion(Long properyId, List<PropertyQuestions> questionList);
	
	public List<PropertyQuestions> loadPropertyQuestionByPropertyGroup(Long groupId);
	
	public List<QuestionGroup> loadAllPropertyQuestionsGroup();
	
	public List<PropertyQuestions> loadQuestionsByRadioGroup(final String radioGroupName);
	
}
