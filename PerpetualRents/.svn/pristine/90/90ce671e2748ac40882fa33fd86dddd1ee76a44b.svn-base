package com.pcs.perpetualRents.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pcs.perpetualRents.common.bean.ApplicationSession;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.ApplicationSessionDAO;
import com.pcs.perpetualRents.enm.SessionStatus;

@Repository
public class ApplicationSessionDAOImpl implements ApplicationSessionDAO{
	
	private static Logger logger = ApplicationSettings.getLogger(ApplicationSessionDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	@Override
	public boolean getSession(final ApplicationSession sessionObj) {
		String sql = "SELECT " + ApplicationSession.USERNAME + ", " + ApplicationSession.IP_ADDRESS + ", " + ApplicationSession.CREATED_ON + ", " + 
				ApplicationSession.SESSION_STATUS + " FROM " + ApplicationSession.TABLE_NAME + " WHERE " + ApplicationSession.SESSION_IDENTITY +
				" = '" + sessionObj.getSessionIdentity() + "';" ;
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
		
		try {
			List<ApplicationSession> sessionList = jdbcTemplate.query(sql, new RowMapper<ApplicationSession>() {

				@Override
				public ApplicationSession mapRow(ResultSet rst, int arg1) throws SQLException {
					ApplicationSession obj = new ApplicationSession();
						obj.setCreatedOn(rst.getDate(ApplicationSession.CREATED_ON));
						obj.setIPAddress(rst.getString(ApplicationSession.IP_ADDRESS));
						obj.setSessionStatus(rst.getLong(ApplicationSession.SESSION_STATUS));
						obj.setUsername(rst.getString(ApplicationSession.USERNAME));
					return obj;
				}
			});
			
			if(sessionList != null && sessionList.size() != 0)
				return true;
			else 
				return false;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean createSession(final ApplicationSession sessionObj) {
		
		if(getSession(sessionObj)){
			logger.info("Session Already exists : " + sessionObj.getSessionIdentity());
			return true;
		}
			
		
		String sql = "INSERT INTO " + ApplicationSession.TABLE_NAME + "(" + 
				ApplicationSession.USERNAME + ", " + ApplicationSession.IP_ADDRESS + ", " + ApplicationSession.SESSION_IDENTITY + ", " + 
				ApplicationSession.SESSION_STATUS +   
				") VALUES (?, ?, ?, ? )";
		
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
		
		try {
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setString(1, sessionObj.getUsername());
					psObj.setString(2, sessionObj.getIPAddress());
					psObj.setString(3, sessionObj.getSessionIdentity());
					psObj.setLong(4, sessionObj.getSessionStatus());
					
				}
			});
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public void destroySession(final String sessionIdentity, SessionStatus sessionStatus) {
		try {
			String sql = " UPDATE " + ApplicationSession.TABLE_NAME + " SET " +
						ApplicationSession.DESTROYED_ON + "= CURRENT_TIMESTAMP, " + ApplicationSession.SESSION_STATUS + " = " + sessionStatus.id() + " WHERE " + ApplicationSession.SESSION_IDENTITY + "=?";
		
				if(developmentSettings.isShowSQL())
					logger.info(sql);
			
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setString(1 , sessionIdentity);
				}
			});
			
		} catch(Exception e) {
			if (developmentSettings.isShowStackTrace())
				e.printStackTrace();
		}
	}

	public DevelopmentSettings getDevelopmentSettings() {
		return developmentSettings;
	}

	public void setDevelopmentSettings(DevelopmentSettings developmentSettings) {
		this.developmentSettings = developmentSettings;
	}
	
}
