package com.pcs.perpetualRents.manager.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.dao.PropertyQuestionsDAO;
import com.pcs.perpetualRents.dao.PropertyResponseDAO;
import com.pcs.perpetualRents.enm.ADPL2Page;
import com.pcs.perpetualRents.manager.PropertyResponseManager;

@Component
@Transactional
public class PropertyResponseManagerImpl implements PropertyResponseManager {
	
	@Autowired
	private PropertyResponseDAO propertyResponseDAO;
	@Autowired
	private PropertyQuestionsDAO propertyQuestionsDAO;
	
	private Map<Long, PropertyQuestions> radioGroupMap;
	
	@Override
	public PropertyQuestions loadPropertyQuestionByFieldName(String fieldName) {
		
		return null;
	}
	
	@Override
	public List<PropertyQuestions> loadQuestionByADPL(ADPL2Page adpl2Page){
		List<PropertyQuestions> questionList = new ArrayList<PropertyQuestions>();
		String[] groupId = adpl2Page.group().split(",");
		for (String id : groupId) {
				List<PropertyQuestions> tList = propertyResponseDAO.loadQuestionByGroupId(Long.valueOf(id.trim()));
				questionList.addAll(tList);
		}
		
		if(questionList != null && !questionList.isEmpty())
			return questionList;
		
		return null;
		
	}
	
	
	@Override
	public List<PropertyQuestions> loadQuestionByGroupId(Long groupId) {
		
		return null;
	}
	
	@Override
	public Map<String, PropertyQuestions> getQuestionMap(List<PropertyQuestions> questionList){
		Map<String, PropertyQuestions> map = new HashMap<String, PropertyQuestions>();
		if(questionList != null && !questionList.isEmpty()){
			for (PropertyQuestions _quesObj : questionList) {
				map.put(_quesObj.getFieldName(), _quesObj);
			}
		}
		
		return map;
	}
	
	@Override
	public List<PropertyQuestions> loadQuestionsByRadioGroup(final String radioGroupName){
		return propertyQuestionsDAO.loadQuestionsByRadioGroup(radioGroupName);
	}
	
	public void addInGroup(List<PropertyQuestions> radioGroupList ){
		radioGroupMap = new HashMap<Long, PropertyQuestions>();
		if(radioGroupList != null){
			for (PropertyQuestions tRadioObj : radioGroupList) {
				radioGroupMap.put(tRadioObj.getId(), tRadioObj);
			}
		}
	}
	
}
