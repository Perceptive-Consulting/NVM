package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.ContactDetailsDAO;

@Repository
public class ContactDetailsDAOImpl implements ContactDetailsDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(ContactDetailsDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;


	@Override
	public Long createContactDetails(final ContactDetails detailsObj, final Long createdUserId) {
		final String sql = "INSERT INTO " + ContactDetails.TABLE_NAME + "( " + ContactDetails.EMAIL_ID + ", " + ContactDetails.PHONE_NUMBER
				+ ", " + ContactDetails.LANDLINE_PHONE_NUMBER + ", " + ContactDetails.OBJECT_TYPE + ", " + ContactDetails.OBJECT_ID 
				+ ", " + ContactDetails.CREATED_USER_ID  + ")"
				+ " VALUES (?, ?, ?, ?, ?, ?)";

			KeyHolder keyHolder = new GeneratedKeyHolder();
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
						PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
							psObj.setString(1, detailsObj.getEmailId());
						if(detailsObj.getPhoneNumber() != null)
							psObj.setString(2, detailsObj.getPhoneNumber());
						else
							psObj.setNull(2, Types.NULL);
						if(detailsObj.getLandlinePhoneNumber() != null)
							psObj.setString(3, detailsObj.getLandlinePhoneNumber());
						else
							psObj.setNull(3, Types.NULL);
						psObj.setLong(4, detailsObj.getObjectType());
						psObj.setLong(5, detailsObj.getObjectId());
						if(createdUserId != null)
							psObj.setLong(6, createdUserId);
						else
							psObj.setNull(6, Types.NULL);
							
					return psObj;
				}
			}, keyHolder);
			
		detailsObj.setId(keyHolder.getKey().longValue());
		return keyHolder.getKey().longValue();
	}


	@Override
	public boolean updateContactDetails(final ContactDetails detailsObj, final Long modifiedUserId) {
		
		String sql = "UPDATE " + ContactDetails.TABLE_NAME + " SET " + ContactDetails.EMAIL_ID + " = ?, " + ContactDetails.PHONE_NUMBER + " = ?, " 
					+ ContactDetails.LANDLINE_PHONE_NUMBER + " = ?, "
					+ ContactDetails.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + ContactDetails.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + ContactDetails.OBJECT_TYPE + " = ? AND " + ContactDetails.OBJECT_ID + " = ?";
	
				if(developmentSettings.isShowSQL())
						logger.info(sql);
		
				int status = jdbcTemplate.update(sql, new PreparedStatementSetter() {
					@Override
					public void setValues(PreparedStatement psObj) throws SQLException {
						psObj.setString(1 , detailsObj.getEmailId());
						psObj.setString(2 , detailsObj.getPhoneNumber());
						if(detailsObj.getLandlinePhoneNumber() != null)
							psObj.setString(3, detailsObj.getLandlinePhoneNumber());
						else
							psObj.setNull(3, Types.NULL);
						psObj.setLong(4, modifiedUserId);
						psObj.setLong(5, detailsObj.getObjectType());
						psObj.setLong(6, detailsObj.getObjectId());
						
					}
				});
			if(status == 1)
				return true;
			else
				return false;
			
		}
	
	
	@Override
	public List<ContactDetails> loadById(Long objectType, Long objectId) {
		final String sql = "SELECT ua." + ContactDetails.CREATED_ON + ", ua." + ContactDetails.MODIFIED_ON + ", ua." + ContactDetails.CREATED_USER_ID + ", ua." + ContactDetails.MODIFIED_USER_ID 
				 + ", ua." + ContactDetails.EMAIL_ID + ", ua." + ContactDetails.PHONE_NUMBER  + ", ua." + ContactDetails.LANDLINE_PHONE_NUMBER
				 + " FROM " + ContactDetails.TABLE_NAME + " ua WHERE ua." + ContactDetails.OBJECT_TYPE + " = " + objectType 
				 + " AND " + ContactDetails.OBJECT_ID + " = " + objectId;

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<ContactDetails> detailsList = jdbcTemplate.query(sql, new RowMapper<ContactDetails>() {

			@Override
			public ContactDetails mapRow(ResultSet rst, int arg1)throws SQLException {
				
				ContactDetails obj = new ContactDetails();
					obj.setCreatedOn(rst.getDate(ContactDetails.CREATED_ON));
					obj.setModifiedOn(rst.getDate(ContactDetails.MODIFIED_ON));
					obj.setCreatedUserId(rst.getLong(ContactDetails.CREATED_USER_ID));
					obj.setModifiedUserId(rst.getLong(ContactDetails.MODIFIED_USER_ID));
					obj.setEmailId(rst.getString(ContactDetails.EMAIL_ID));
					obj.setPhoneNumber(rst.getString(ContactDetails.PHONE_NUMBER));
					obj.setLandlinePhoneNumber(rst.getString(ContactDetails.LANDLINE_PHONE_NUMBER));
					
				return obj;
			}
			
		});
		
		if(detailsList != null && !detailsList.isEmpty())
				return detailsList;
		
		return null;
	}
		
	@Override
	public void update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues){
		String sql = "UPDATE " + tableName + " SET ";
		int counter = 0;
		String delim = "";
		   for (String value : values) {
			sql +=  delim + fields[counter++] + " = '" + value + "'"; 
			delim = ", ";
		   } 
		   if(whereCondition != null){
			   int wCounter = 0;
			   sql += " WHERE ";
			   String wDelim = "";
			   for (String value : whereValues) {
				   sql += wDelim  + whereCondition[wCounter++] + " = '" + value + "'";
				   wDelim = " AND ";
			   	}
		   }
		   
		   if(developmentSettings.isShowSQL())
			   logger.info(sql);
		   
		   jdbcTemplate.update(sql);
		   
	}

	public boolean validateEmailId(String emailId){
		
		final String sql = "SELECT ua." + ContactDetails.CREATED_ON + ", ua." + ContactDetails.MODIFIED_ON + ", ua." + ContactDetails.CREATED_USER_ID + ", ua." + ContactDetails.MODIFIED_USER_ID 
				 + ", ua." + ContactDetails.EMAIL_ID + ", ua." + ContactDetails.PHONE_NUMBER  + ", ua." + ContactDetails.LANDLINE_PHONE_NUMBER
				 + " FROM " + ContactDetails.TABLE_NAME + " ua WHERE ua." + ContactDetails.EMAIL_ID + " = '" + emailId.trim() + "'";

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<ContactDetails> detailsList = jdbcTemplate.query(sql, new RowMapper<ContactDetails>() {

			@Override
			public ContactDetails mapRow(ResultSet rst, int arg1)throws SQLException {
				
				ContactDetails obj = new ContactDetails();
					obj.setCreatedOn(rst.getDate(ContactDetails.CREATED_ON));
					obj.setModifiedOn(rst.getDate(ContactDetails.MODIFIED_ON));
					obj.setCreatedUserId(rst.getLong(ContactDetails.CREATED_USER_ID));
					obj.setModifiedUserId(rst.getLong(ContactDetails.MODIFIED_USER_ID));
					obj.setEmailId(rst.getString(ContactDetails.EMAIL_ID));
					obj.setPhoneNumber(rst.getString(ContactDetails.PHONE_NUMBER));
					obj.setLandlinePhoneNumber(rst.getString(ContactDetails.LANDLINE_PHONE_NUMBER));
					
				return obj;
			}
			
		});
		
		if(detailsList != null && !detailsList.isEmpty())
				return true;
		
		return false;
	}
	
	
public ContactDetails retrieveContactDetails(String emailId){
		
		final String sql = "SELECT ua." + ContactDetails.CREATED_ON + ", ua." + ContactDetails.MODIFIED_ON + ", ua." + ContactDetails.CREATED_USER_ID + ", ua." + ContactDetails.MODIFIED_USER_ID 
				 + ", ua." + ContactDetails.EMAIL_ID + ", ua." + ContactDetails.PHONE_NUMBER  + ", ua." + ContactDetails.LANDLINE_PHONE_NUMBER +", ua."+ContactDetails.OBJECT_TYPE+", ua."+ContactDetails.OBJECT_ID
				 + " FROM " + ContactDetails.TABLE_NAME + " ua WHERE ua." + ContactDetails.EMAIL_ID + " = '" + emailId.trim() + "'";

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<ContactDetails> detailsList = jdbcTemplate.query(sql, new RowMapper<ContactDetails>() {

			@Override
			public ContactDetails mapRow(ResultSet rst, int arg1)throws SQLException {
				
				ContactDetails obj = new ContactDetails();
					obj.setCreatedOn(rst.getDate(ContactDetails.CREATED_ON));
					obj.setModifiedOn(rst.getDate(ContactDetails.MODIFIED_ON));
					obj.setCreatedUserId(rst.getLong(ContactDetails.CREATED_USER_ID));
					obj.setModifiedUserId(rst.getLong(ContactDetails.MODIFIED_USER_ID));
					obj.setEmailId(rst.getString(ContactDetails.EMAIL_ID));
					obj.setPhoneNumber(rst.getString(ContactDetails.PHONE_NUMBER));
					obj.setLandlinePhoneNumber(rst.getString(ContactDetails.LANDLINE_PHONE_NUMBER));
					obj.setObjectType(rst.getLong(ContactDetails.OBJECT_TYPE));
					obj.setObjectId(rst.getLong(ContactDetails.OBJECT_ID));
				return obj;
			}
			
		});
		
		if(detailsList != null && !detailsList.isEmpty())
				return detailsList.get(0);
		
		return null;
	}	
	
}
