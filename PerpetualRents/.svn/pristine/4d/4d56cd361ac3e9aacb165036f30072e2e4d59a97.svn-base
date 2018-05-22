package com.pcs.perpetualRents.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.PropertyResponseDAO;

@Repository
public class PropertyResponseDAOImpl implements PropertyResponseDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(PropertyResponseDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	
	@Override
	public PropertyQuestions loadPropertyQuestionByFieldName(String fieldName) {
		String sql = "SELECT " +PropertyQuestions.ID + ", " + PropertyQuestions.DESCRIPTION + ", " + PropertyQuestions.AFFIRMATIVE_ANS 
				+ ", " + PropertyQuestions.CONSIDERABLE + ", " + PropertyQuestions.DOCUMENT_SUPPORTED
				+ ", " + PropertyQuestions.FIELD_NAME + ", " + PropertyQuestions.GROUP_ID + ", " + PropertyQuestions.QUESTION + " FROM " + PropertyQuestions.TABLE_NAME
				+ " WHERE " + PropertyQuestions.FIELD_NAME  + " = " + fieldName;
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
	
		List<PropertyQuestions> questionList = jdbcTemplate.query(sql, new RowMapper<PropertyQuestions>() {

				@Override
				public PropertyQuestions mapRow(ResultSet rst, int arg1) throws SQLException {
					PropertyQuestions obj = new PropertyQuestions();
						obj.setConsiderable(rst.getBoolean(PropertyQuestions.CONSIDERABLE));
						obj.setAffirmativeAns(rst.getBoolean(PropertyQuestions.AFFIRMATIVE_ANS));
						obj.setDescription(rst.getString(PropertyQuestions.DESCRIPTION));
						obj.setDocumentSupported(rst.getBoolean(PropertyQuestions.DOCUMENT_SUPPORTED));
						obj.setFieldName(rst.getString(PropertyQuestions.FIELD_NAME));
						obj.setId(rst.getLong(PropertyQuestions.ID));
						obj.setQuestion(rst.getString(PropertyQuestions.QUESTION));
						
					return obj;
				}
			});
		
		if(questionList != null && !questionList.isEmpty())
			return questionList.get(0);

	return null;
		
	}
	
	@Override
	public List<PropertyQuestions> loadQuestionByGroupId(Long groupId){


		String sql = " SELECT ua." + PropertyQuestions.ID + ", ua." + PropertyQuestions.GROUP_ID + ", ua." + PropertyQuestions.QUESTION + ", ua." + PropertyQuestions.FIELD_NAME
				     + ", ua." + PropertyQuestions.DESCRIPTION + ", ua." + PropertyQuestions.CONSIDERABLE
				     + ", ua." + PropertyQuestions.AFFIRMATIVE_ANS
				     + ", ua." + PropertyQuestions.DOCUMENT_SUPPORTED  + " FROM " + PropertyQuestions.TABLE_NAME + " ua WHERE " + PropertyQuestions.GROUP_ID + " = " +groupId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyQuestions> questionList = jdbcTemplate.query(sql, new RowMapper<PropertyQuestions>() {

			@Override
			public PropertyQuestions mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyQuestions obj = new PropertyQuestions();
					obj.setId(rst.getLong(PropertyQuestions.ID));
					obj.setConsiderable(rst.getBoolean(PropertyQuestions.CONSIDERABLE));
					obj.setAffirmativeAns(rst.getBoolean(PropertyQuestions.AFFIRMATIVE_ANS));
					obj.setDescription(rst.getString(PropertyQuestions.DESCRIPTION));
					obj.setDocumentSupported(rst.getBoolean(PropertyQuestions.DOCUMENT_SUPPORTED));
					obj.setFieldName(rst.getString(PropertyQuestions.FIELD_NAME));
					obj.setQuestion(rst.getString(PropertyQuestions.QUESTION));
				return obj;
			}
		});
		
		if(questionList != null && !questionList.isEmpty())
			return questionList;
		
		return null;
	
	}
	
}
