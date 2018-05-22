package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.PMCDAO;
import com.pcs.perpetualRents.dao.mapper.PMCMapper;

@Repository
public class PMCDAOImpl implements PMCDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	private static Logger logger = ApplicationSettings.getLogger(PMCDAOImpl.class.getName()); 
	
	@Override
	public Long createPMC(final Charity charityObj, final Long userId) {

		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + Charity.TABLE_NAME + " ( " + Charity.COMPANY_NAME + ", " + Charity.AUTHORISED_PERSON + ", " + Charity.UNIQUE_REFERENCE
							+ ", " + Charity.WEB_URL + ", " + Charity.USER_LOGIN_ID
							+ ", " + Charity.CREATED_USER_ID 
							+ " ) "
							+ " VALUES (?, ?, ?, ?, ?, ?)";

	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, charityObj.getCompanyName());
					psObj.setString(2, charityObj.getAuthorisedPerson());
					psObj.setString(3, charityObj.getUniqueReference());
					psObj.setString(4, charityObj.getWeburl());
					psObj.setLong(5, charityObj.getUserLoginId());
					psObj.setLong(6, userId);
					
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null){
			charityObj.setId(keyHolder.getKey().longValue());
			return keyHolder.getKey().longValue();
		}
		
		return null;
	}

	@Override
	public boolean updatePMC(final Charity charityObj, final Long userId) {
		
		final String sql = "UPDATE " + Charity.TABLE_NAME + " SET " + Charity.AUTHORISED_PERSON + " = ?, " + Charity.WEB_URL + " = ?, " + Charity.COMPANY_NAME + " = ?, " + Charity.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Charity.MODIFIED_USER_ID + " = ? "
						+ " WHERE " + Charity.ID + " = ?";
		           
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
			
		int status = jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setString(1 , charityObj.getAuthorisedPerson());
					psObj.setString(2, charityObj.getWeburl());
					psObj.setString(3, charityObj.getCompanyName());
					psObj.setLong(4, userId);
					psObj.setLong(5, charityObj.getId());
				}
			});
		if(status == 1)
			return true;
		else
			return false;
	}
	
	@Override
	public Charity loadPMCById(Long pmcId) {
		
		String sql = "SELECT ua." + Charity.ID + ", ua." + Charity.COMPANY_NAME + ", ua." + Charity.AUTHORISED_PERSON + ", ua." + Charity.UNIQUE_REFERENCE + ", ua." + Charity.WEB_URL
				 + ", ua." + Charity.ENABLE + ", ua." + Charity.USER_LOGIN_ID
				 + ", ua." + Charity.CREATED_ON + ", ua." + Charity.MODIFIED_ON
			     + ", x2." + UserLogin.USERNAME + " AS " + Charity.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + Charity.MODIFIED_BY
			     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
			     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
			     + " FROM " + Charity.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + Charity.USER_LOGIN_ID + " = x1." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + Charity.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + Charity.MODIFIED_USER_ID + " = x3." + UserLogin.ID
			     + " WHERE ua." + Charity.ID + " = " + pmcId ;
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
		List<Charity> pmcList = jdbcTemplate.query(sql, new PMCMapper());
		if(pmcList != null && !pmcList.isEmpty())
			return pmcList.get(0);
		
		return null;
	}
	
	@Override
	public List<Charity> loadAllPMC(Integer start, Integer limit,	Long userId) {
		String sql = "SELECT ua." + Charity.ID + ", ua." + Charity.COMPANY_NAME + ", ua." + Charity.AUTHORISED_PERSON + ", ua." + Charity.UNIQUE_REFERENCE + ", ua." + Charity.WEB_URL
				 + ", ua." + Charity.ENABLE + ", ua." + Charity.USER_LOGIN_ID
				 + ", ua." + Charity.CREATED_ON + ", ua." + Charity.MODIFIED_ON
			     + ", x2." + UserLogin.USERNAME + " AS " + Charity.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + Charity.MODIFIED_BY
			     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
			     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
			     + " FROM " + Charity.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + Charity.USER_LOGIN_ID + " = x1." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + Charity.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + Charity.MODIFIED_USER_ID + " = x3." + UserLogin.ID ;
			     
			     if(userId != null)
			    	 sql += " WHERE ua." + Charity.CREATED_USER_ID + " = " + userId ;
			     
			     sql += " ORDER BY ua." + Charity.CREATED_ON  + " DESC"; 
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		return jdbcTemplate.query(sql, new PMCMapper());
	}	
	@Override
	public Charity loadCharityByUserLogin(UserLogin loginObj) {
		String sql = "SELECT ua." + Charity.ID + ", ua." + Charity.COMPANY_NAME + ", ua." + Charity.AUTHORISED_PERSON + ", ua." + Charity.UNIQUE_REFERENCE + ", ua." + Charity.WEB_URL
				 + ", ua." + Charity.ENABLE + ", ua." + Charity.USER_LOGIN_ID
				 + ", ua." + Charity.CREATED_ON + ", ua." + Charity.MODIFIED_ON
			     + ", x2." + UserLogin.USERNAME + " AS " + Charity.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + Charity.MODIFIED_BY
			     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
			     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
			     + " FROM " + Charity.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + Charity.USER_LOGIN_ID + " = x1." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + Charity.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + Charity.MODIFIED_USER_ID + " = x3." + UserLogin.ID 
			     + " WHERE ua." + Charity.USER_LOGIN_ID + " = " + loginObj.getId() ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Charity> pmcList = jdbcTemplate.query(sql, new PMCMapper());

		if(pmcList != null && !pmcList.isEmpty())
			return pmcList.get(0);
		
		return null;
	}

	@Override
	public void enablePMC(final Charity charityObj, final Long userId) {
		
		final String sql = "UPDATE " + Charity.TABLE_NAME + " SET " + Charity.ENABLE + " = 1, "
				           + Charity.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Charity.MODIFIED_USER_ID + " = ? "
				           + " WHERE " + Charity.ID + " = ?";
           
			if(developmentSettings.isShowSQL())
					logger.info(sql);
	
		 jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setLong(1, userId);
					psObj.setLong(2, charityObj.getId());
				}
			});
		
	}

	@Override
	public void disablePMC(final Charity charityObj, final Long userId) {
		final String sql = "UPDATE " + Charity.TABLE_NAME + " SET " + Charity.ENABLE + " = 1, "
		           + Charity.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Charity.MODIFIED_USER_ID + " = ? "
		           + " WHERE " + Charity.ID + " = ?";


	if(developmentSettings.isShowSQL())
			logger.info(sql);

	jdbcTemplate.update(sql, new PreparedStatementSetter() {
		@Override
		public void setValues(PreparedStatement psObj) throws SQLException {
			psObj.setLong(1, userId);
			psObj.setLong(2, charityObj.getId());
			
		}
	});

		
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public DevelopmentSettings getDevelopmentSettings() {
		return developmentSettings;
	}

	public void setDevelopmentSettings(DevelopmentSettings developmentSettings) {
		this.developmentSettings = developmentSettings;
	}

	@Override
	public String updatePassword(Charity charityObj) {
		String password = null;
		String sql = "UPDATE " + UserLogin.TABLE_NAME + 
				" SET " + UserLogin.PASSWORD +  " = '" + 
					charityObj.getLoginObj().getPassword() + "'"+
					" WHERE " + UserLogin.ID + " = " + charityObj.getUserLoginId();
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			try{
			jdbcTemplate.update(sql);
			password = charityObj.getLoginObj().getPassword();
			}
			catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		return password;
	}
	
}
