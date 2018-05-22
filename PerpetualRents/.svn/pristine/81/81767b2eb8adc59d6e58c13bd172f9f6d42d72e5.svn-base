package com.pcs.perpetualRents.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.QuestionGroup;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.PropertyQuestionsDAO;

@Repository
public class PropertyQuestionsDAOImpl implements PropertyQuestionsDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(PropertyQuestionsDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long getQuestionIdByFieldName(String fieldName){
		
		String sql = "SELECT " + PropertyQuestions.ID + " FROM " + PropertyQuestions.TABLE_NAME + " WHERE " + PropertyQuestions.FIELD_NAME + " = '" + fieldName + "';";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyQuestions> questionList = jdbcTemplate.query(sql, new RowMapper<PropertyQuestions>() {
			
			@Override
			public PropertyQuestions mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyQuestions obj = new PropertyQuestions();
					obj.setId(rst.getLong(PropertyQuestions.ID));
					
				return obj;
			}
		});
		
		if(questionList != null && !questionList.isEmpty())
			return questionList.get(0).getId();
		
		return null;
	}
	
	@Override
	public List<PropertyResponse> loadResponseByPropertyAndQuestion(Long properyId, List<PropertyQuestions> questionList){
		
		String sql = "SELECT ua." + PropertyResponse.ID + ", ua." + PropertyResponse.COMMENTS + ", ua." + PropertyResponse.DOCUMENT_ID + ", ua." + PropertyResponse.FIELD_NAME
				 	+ ", ua." + PropertyResponse.RESPONSE + ", ua." + PropertyResponse.PROPERTY_ID + ", ua." + PropertyResponse.QUESTION_ID  
				 	+ ", x1." + File.FILE_NAME + ", x1." + File.SIZE + ", x1." + File.FILE_PATH + ", x1." + File.ID + ", x1." + File.CONTENT_TYPE
				 	+ " FROM " + PropertyResponse.TABLE_NAME + " ua "
				 	+ " LEFT JOIN " + File.TABLE_NAME + " x1 ON ua." +PropertyResponse.DOCUMENT_ID + " = x1." + File.ID  
					+ " WHERE " + PropertyResponse.PROPERTY_ID + " = " + properyId ;
		
		if(questionList != null && !questionList.isEmpty()){
			String query = " ( ";
			String delim = "";
			for (PropertyQuestions quesObj : questionList) {
				query +=  delim + quesObj.getId() ;
				delim = ", ";
			}
			query += " ) ";
			sql += " AND " + PropertyResponse.QUESTION_ID  + " IN " + query;
		}
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyResponse> responseList = jdbcTemplate.query(sql, new RowMapper<PropertyResponse>() {
			
			@Override
			public PropertyResponse mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyResponse obj = new PropertyResponse();
					obj.setId(rst.getLong(PropertyResponse.ID));
					obj.setComments(rst.getString(PropertyResponse.COMMENTS));
					obj.setResponse(rst.getString(PropertyResponse.RESPONSE));
					obj.setFieldName(rst.getString(PropertyResponse.FIELD_NAME));
					obj.setDocumentId(rst.getLong(PropertyResponse.DOCUMENT_ID));
					obj.setPropertyId(rst.getLong(PropertyResponse.PROPERTY_ID));
					obj.setQuestionId(rst.getLong(PropertyResponse.QUESTION_ID));
					
					if(rst.getString(File.FILE_NAME) != null){
						File fileObj = new File();
						fileObj.setFilePath(rst.getString(File.FILE_PATH));
						fileObj.setFileName(rst.getString(File.FILE_NAME));
						fileObj.setContentType(rst.getString(File.CONTENT_TYPE));
						fileObj.setId(rst.getLong(File.ID));
						fileObj.setSize(rst.getLong(File.SIZE));
					obj.setFileObj(fileObj);
					}
					
						
				return obj;
			}
		});
		
		if(responseList != null && !responseList.isEmpty())
			return responseList;
		
		return null;
	}
	
	@Override
	public List<PropertyQuestions> loadPropertyQuestionByPropertyGroup(Long groupId){

		String sql = " SELECT ua." + PropertyQuestions.ID + ", ua." + PropertyQuestions.GROUP_ID + ", ua." + PropertyQuestions.QUESTION + ", ua." + PropertyQuestions.FIELD_NAME
				     + ", ua." + PropertyQuestions.DESCRIPTION + ", ua." + PropertyQuestions.DOCUMENT_SUPPORTED 
				     + " FROM " + PropertyQuestions.TABLE_NAME + " ua WHERE " + PropertyQuestions.GROUP_ID + " = " +groupId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyQuestions> questionList = jdbcTemplate.query(sql, new RowMapper<PropertyQuestions>() {

			@Override
			public PropertyQuestions mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyQuestions obj = new PropertyQuestions();
					obj.setId(rst.getLong(PropertyQuestions.ID));
					obj.setGroupId(rst.getLong(PropertyQuestions.GROUP_ID));
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

	@Override
	public List<QuestionGroup> loadAllPropertyQuestionsGroup() {
		
		String sql = "SELECT * FROM " + QuestionGroup.TABLE_NAME ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<QuestionGroup> questionList = jdbcTemplate.query(sql, new RowMapper<QuestionGroup>() {
			
			@Override
			public QuestionGroup mapRow(ResultSet rst, int arg1) throws SQLException {
				QuestionGroup obj = new QuestionGroup();
					obj.setId(rst.getLong(QuestionGroup.ID));
					obj.setGroupName(rst.getString(QuestionGroup.GROUP_NAME));
					obj.setCriteriaStr(rst.getString(QuestionGroup.CRITERIA_STR));
					obj.setGroupDetail(rst.getString(QuestionGroup.GROUP_DETAILS));
				return obj;
			}
		});
		
		if(questionList != null && !questionList.isEmpty())
			return questionList;
		
		return null;
	}
	
	public List<PropertyQuestions> loadQuestionsByRadioGroup(final String radioGroupName){

		String sql = " SELECT ua." + PropertyQuestions.ID + ", ua." + PropertyQuestions.GROUP_ID + ", ua." + PropertyQuestions.QUESTION + ", ua." + PropertyQuestions.FIELD_NAME
				     + ", ua." + PropertyQuestions.DESCRIPTION + ", ua." + PropertyQuestions.DOCUMENT_SUPPORTED 
				     + " FROM " + PropertyQuestions.TABLE_NAME + " ua WHERE " + PropertyQuestions.GROUP_ID + " = " +radioGroupName;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyQuestions> questionList = jdbcTemplate.query(sql, new RowMapper<PropertyQuestions>() {

			@Override
			public PropertyQuestions mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyQuestions obj = new PropertyQuestions();
					obj.setId(rst.getLong(PropertyQuestions.ID));
					obj.setGroupId(rst.getLong(PropertyQuestions.GROUP_ID));
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
