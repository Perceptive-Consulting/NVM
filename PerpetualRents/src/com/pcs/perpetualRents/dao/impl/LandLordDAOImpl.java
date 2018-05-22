package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.LandLordDAO;
import com.pcs.perpetualRents.dao.mapper.LandLordMapper;

@Repository
public class LandLordDAOImpl implements LandLordDAO{

	private static Logger logger = ApplicationSettings.getLogger(LandLordDAOImpl.class.getName());
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long createLandLord(final LandLord landlordObj, final Long userId) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + LandLord.TABLE_NAME + " ( " + LandLord.FIRST_NAME + ", " + LandLord.LAST_NAME + ", " + LandLord.PRIMARY_EMAIL_ID
							+ ", " + LandLord.SECONDARY_EMAIL_ID + ", " + LandLord.PRIMARY_PHONE_NUMBER + ", " + LandLord.SECONDARY_PHONE_NUMBER + ", " + LandLord.CREATED_USER_ID
							+ ", " + LandLord.USER_LOGIN_ID + ", " + LandLord.UNIQUE_REFERENCE
							+ " ) "
							+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, landlordObj.getFirstName());
					psObj.setString(2, landlordObj.getLastName());
					psObj.setString(3, landlordObj.getPrimaryEmailId());
					if(landlordObj.getSecondaryEmailId() != null)
						psObj.setString(4, landlordObj.getSecondaryEmailId());
					else
						psObj.setNull(4, Types.NULL);
					psObj.setString(5, landlordObj.getPrimaryPhoneNumber());
					if(landlordObj.getSecondaryPhoneNumber() != null)
						psObj.setString(6, landlordObj.getSecondaryPhoneNumber());
					else
						psObj.setNull(6, Types.NULL);
					if(landlordObj.getCreatedUserId() != null)
						psObj.setLong(7, userId);
					else
						psObj.setNull(7, Types.NULL);
					psObj.setLong(8, landlordObj.getUserLoginId());
					psObj.setString(9, landlordObj.getUniqueReference());
				return psObj;
			}
		}, keyHolder);
		
				
		return keyHolder.getKey().longValue();
		
	}
	
	public boolean updateLandLord(final LandLord landLordObj){
			String sql = "UPDATE " + LandLord.TABLE_NAME + " SET " + LandLord.FIRST_NAME + " = ?, " + LandLord.LAST_NAME + " = ?, " + LandLord.PRIMARY_EMAIL_ID + " = ?, "
					+ LandLord.PRIMARY_PHONE_NUMBER + " = ?, " + LandLord.SECONDARY_EMAIL_ID + " = ?, " + LandLord.SECONDARY_PHONE_NUMBER + " = ? "
					+ " WHERE " + LandLord.ID + " = ? ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setString(1 , landLordObj.getFirstName());
				psObj.setString(2 , landLordObj.getLastName());
				psObj.setString(3, landLordObj.getPrimaryEmailId());
				psObj.setString(4, landLordObj.getPrimaryPhoneNumber());
				if(landLordObj.getSecondaryEmailId() != null)
					psObj.setString(5, landLordObj.getSecondaryEmailId());
				else
					psObj.setNull(5, Types.NULL);
				if(landLordObj.getSecondaryPhoneNumber() != null)
					psObj.setString(6, landLordObj.getSecondaryPhoneNumber());
				else
					psObj.setNull(6, Types.NULL);
				psObj.setLong(7, landLordObj.getId());
			}
		});
			return true;
	}
	
	@Override
	public List<LandLord> loadAllLandLord(Integer start, Integer limit, Long createdUserId) {
		String sql = "SELECT ua.id, ua." + LandLord.UNIQUE_REFERENCE + ", ua." + LandLord.FIRST_NAME + ", ua." + LandLord.LAST_NAME + ", ua." + LandLord.PRIMARY_EMAIL_ID + ", ua." + 
					LandLord.SECONDARY_EMAIL_ID + ", ua." + LandLord.PRIMARY_PHONE_NUMBER + ", ua." + LandLord.SECONDARY_PHONE_NUMBER + 
					", ua." + LandLord.CREATED_ON + ", x2." + UserLogin.USERNAME + " AS createdBy , ua." + UserLogin.MODIFIED_ON + ", ua." + LandLord.USER_LOGIN_ID + ", x3." + UserLogin.USERNAME + " AS modifiedBy,"
				+" x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." +LandLord.ID
				+", ( SELECT COUNT(*) FROM " + Property.TABLE_NAME + " WHERE " + Property.LANDLORD_ID + " = ua." + LandLord.ID + " ) AS " + LandLord.PROPERTY_COUNT 
				+" FROM " + LandLord.TABLE_NAME + " ua "
				+" LEFT JOIN users x1 ON ua." + LandLord.USER_LOGIN_ID + "= x1." + LandLord.ID
				+" LEFT JOIN users x2 ON ua." + LandLord.CREATED_USER_ID + "= x2." + LandLord.ID
				+" LEFT JOIN users x3 ON ua." + LandLord.MODIFIED_USER_ID + "= x3." + LandLord.ID;
				
				if(createdUserId != null){
					sql += " WHERE ua." + LandLord.CREATED_USER_ID + " = " + createdUserId;
				}
				
				sql += " ORDER BY ua." + LandLord.CREATED_ON  + " DESC ";
				
				if(developmentSettings.isShowSQL())
					logger.info(sql);

		List<LandLord> landLordList = jdbcTemplate.query(sql, new LandLordMapper());
		
		if(landLordList != null && !landLordList.isEmpty())
			return landLordList;
		
		return null;
	}

	@Override
	public LandLord loadLandLordByLoginId(Long userLoginId) {
		
			String sql = "SELECT ua." + LandLord.ID + ", ua." + LandLord.FIRST_NAME + ", ua." + LandLord.LAST_NAME + ", ua." + LandLord.PRIMARY_EMAIL_ID + ", ua." + LandLord.SECONDARY_EMAIL_ID
				     + ", ua." + LandLord.PRIMARY_PHONE_NUMBER + ", ua." + LandLord.SECONDARY_PHONE_NUMBER + ", ua." + LandLord.UNIQUE_REFERENCE
				     + ", ua." + LandLord.USER_LOGIN_ID 
				     + ", ua." + LandLord.CREATED_ON + ", ua." + LandLord.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + LandLord.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + LandLord.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
				     +", ( SELECT COUNT(*) FROM " + Property.TABLE_NAME + " WHERE " + Property.LANDLORD_ID + " = ua." + LandLord.ID + " ) AS " + LandLord.PROPERTY_COUNT 
				     + " FROM " + LandLord.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + LandLord.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + LandLord.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + LandLord.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE " + LandLord.USER_LOGIN_ID + " = " + userLoginId;
	
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<LandLord> landLordList = jdbcTemplate.query(sql, new LandLordMapper());
	
			if(landLordList != null && !landLordList.isEmpty())
				return landLordList.get(0);
	
				return null;
				
	}
	

	@Override
	public LandLord loadLandLordById(final Long id) {
		
		String sql = "SELECT ua." + LandLord.ID + ", ua." + LandLord.FIRST_NAME + ", ua." + LandLord.LAST_NAME + ", ua." + LandLord.PRIMARY_EMAIL_ID + ", ua." + LandLord.SECONDARY_EMAIL_ID
			     + ", ua." + LandLord.PRIMARY_PHONE_NUMBER + ", ua." + LandLord.SECONDARY_PHONE_NUMBER + ", ua." + LandLord.UNIQUE_REFERENCE
			     + ", ua." + LandLord.USER_LOGIN_ID 
			     + ", ua." + LandLord.CREATED_ON + ", ua." + LandLord.MODIFIED_ON
			     + ", x2." + UserLogin.USERNAME + " AS " + LandLord.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + LandLord.MODIFIED_BY
			     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
			     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + LandLord.USER_LOGIN_ID
			     +", ( SELECT COUNT(*) FROM " + Property.TABLE_NAME + " WHERE " + Property.LANDLORD_ID + " = ua." + LandLord.ID + " ) AS " + LandLord.PROPERTY_COUNT 
			     + " FROM " + LandLord.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + LandLord.USER_LOGIN_ID + " = x1." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + LandLord.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + LandLord.MODIFIED_USER_ID + " = x3." + UserLogin.ID
			     + " WHERE ua." + LandLord.ID + " = ?";

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<LandLord> landLordList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
	
				@Override
				public void setValues(PreparedStatement arg0) throws SQLException {
					arg0.setLong(1, id);
				}
			},	new LandLordMapper());
		
		if(landLordList != null && !landLordList.isEmpty())
			return landLordList.get(0);

		return null;
	}

	
	@Override
	public List<LandLord> searchLandLord(String[] fieldNames, String[] values, String[] condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteLandLord(Long objId) {
		if(objId!=null){
				try{
					jdbcTemplate.update("DELETE FROM " + LandLord.TABLE_NAME + " WHERE id=" + objId);
					return true;
				}
				catch (Exception e) {
					e.printStackTrace();
					return false;
				}
		}
		return false;
	}
	
	
	public boolean validateEmailId(final String emailId){
		
		String sql = "SELECT ua." + LandLord.ID + ", ua." + LandLord.FIRST_NAME + ", ua." + LandLord.LAST_NAME + ", ua." + LandLord.PRIMARY_EMAIL_ID + ", ua." + LandLord.SECONDARY_EMAIL_ID
			     + ", ua." + LandLord.PRIMARY_PHONE_NUMBER + ", ua." + LandLord.SECONDARY_PHONE_NUMBER + ", ua." + LandLord.UNIQUE_REFERENCE
			     + ", ua." + LandLord.USER_LOGIN_ID 
			     + ", ua." + LandLord.CREATED_ON + ", ua." + LandLord.MODIFIED_ON
			     + ", x2." + UserLogin.USERNAME + " AS " + LandLord.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + LandLord.MODIFIED_BY
			     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
			     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + LandLord.USER_LOGIN_ID
			     +", ( SELECT COUNT(*) FROM " + Property.TABLE_NAME + " WHERE " + Property.LANDLORD_ID + " = ua." + LandLord.ID + " ) AS " + LandLord.PROPERTY_COUNT 
			     + " FROM " + LandLord.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + LandLord.USER_LOGIN_ID + " = x1." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + LandLord.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + LandLord.MODIFIED_USER_ID + " = x3." + UserLogin.ID
			     + " WHERE ua." + LandLord.PRIMARY_EMAIL_ID + " = ? OR ua." + LandLord.SECONDARY_EMAIL_ID + " = ?";

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<LandLord> landLordList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
	
				@Override
				public void setValues(PreparedStatement stmt) throws SQLException {
					stmt.setString(1, emailId.trim());
					stmt.setString(2, emailId.trim());
				}
			},	new LandLordMapper());
		
		if(landLordList != null && !landLordList.isEmpty())
			return true;

		return false;
	}
	
	@Override	
	public LandLord  loadUserLoginCredentials(final String emailId){
			
			String sql = "SELECT ua." + LandLord.ID + ", ua." + LandLord.FIRST_NAME + ", ua." + LandLord.LAST_NAME + ", ua." + LandLord.PRIMARY_EMAIL_ID + ", ua." + LandLord.SECONDARY_EMAIL_ID
				     + ", ua." + LandLord.PRIMARY_PHONE_NUMBER + ", ua." + LandLord.SECONDARY_PHONE_NUMBER + ", ua." + LandLord.UNIQUE_REFERENCE
				     + ", ua." + LandLord.USER_LOGIN_ID 
				     + ", ua." + LandLord.CREATED_ON + ", ua." + LandLord.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + LandLord.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + LandLord.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + LandLord.USER_LOGIN_ID
				     +", ( SELECT COUNT(*) FROM " + Property.TABLE_NAME + " WHERE " + Property.LANDLORD_ID + " = ua." + LandLord.ID + " ) AS " + LandLord.PROPERTY_COUNT 
				     + " FROM " + LandLord.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + LandLord.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + LandLord.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + LandLord.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE ua." + LandLord.PRIMARY_EMAIL_ID + " = ? ";

			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<LandLord> landLordList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
		
					@Override
					public void setValues(PreparedStatement stmt) throws SQLException {
						stmt.setString(1, emailId.trim());
						
					}
				},	new LandLordMapper());
			
			if(landLordList != null && !landLordList.isEmpty())
				return landLordList.get(0);

			return null;
		}
			
}
