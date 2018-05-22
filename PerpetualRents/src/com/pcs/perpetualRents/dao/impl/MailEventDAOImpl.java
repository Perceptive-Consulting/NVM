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
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.MailEventConfiguration;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.MailEventDAO;
import com.pcs.perpetualRents.dao.mapper.MailEventConfigurationMapper;
import com.pcs.perpetualRents.enm.MailEventActor;
import com.pcs.perpetualRents.enm.MailEventType;

@Repository
public class MailEventDAOImpl implements MailEventDAO {
	private static Logger logger = ApplicationSettings.getLogger(PMCDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long createMailEvent(final MailEventConfiguration confObj, final Long userId) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + MailEventConfiguration.TABLE_NAME + " ( " + MailEventConfiguration.MAIL_EVENT_TYPE_ID
				+ ", " + MailEventConfiguration.MAIL_EVENT_ACTOR_ID + ", " + MailEventConfiguration.ACTOR_TYPE_ID 
				 + ", " + MailEventConfiguration.DOCUMENT_ID + ", " + MailEventConfiguration.CREATED_USER_ID
				+ " VALUES (?, ?, ?, ?, ? )";

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	jdbcTemplate.update(new PreparedStatementCreator() {
		
		@Override
		public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				psObj.setShort(1, Short.valueOf(confObj.getMailEventTypeId().toString()));
				psObj.setShort(2, Short.valueOf(confObj.getMailEventActorId().toString()));
				psObj.setShort(3, Short.valueOf(confObj.getActorTypeId().toString()));
				if(confObj.getDocumentId() != null)
					psObj.setLong(4, confObj.getDocumentId());
				else
					psObj.setNull(4, Types.NULL);
				psObj.setLong(5, userId);
				
			return psObj;
		}
	}, keyHolder);
	
	if(keyHolder.getKey() != null)
		return keyHolder.getKey().longValue();
	
		return null;
		
	}

	@Override
	public List<MailEventConfiguration> loadMailEventByEventType(MailEventType eventType, MailEventActor actorType) {

		String sql = "SELECT ua." + MailEventConfiguration.ID + ", ua." + MailEventConfiguration.ACTOR_TYPE_ID
				 + ", ua." + MailEventConfiguration.DOCUMENT_ID + ", ua." + MailEventConfiguration.MAIL_EVENT_ACTOR_ID
				 + ", ua." + MailEventConfiguration.MAIL_EVENT_TYPE_ID + ", ua." + MailEventConfiguration.CREATED_ON
				 + ", ua." + MailEventConfiguration.MODIFIED_ON + ", ua." + MailEventConfiguration.ENABLE
			     + ", x2." + UserLogin.USERNAME + " AS " + MailEventConfiguration.CREATED_BY
			     + ", x3." + UserLogin.USERNAME + " AS " + MailEventConfiguration.MODIFIED_BY
			     + " FROM " + MailEventConfiguration.TABLE_NAME + " ua "
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + MailEventConfiguration.CREATED_USER_ID + " = x2." + UserLogin.ID
			     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + MailEventConfiguration.MODIFIED_USER_ID + " = x3." + UserLogin.ID
			     + " WHERE ua." + MailEventConfiguration.MAIL_EVENT_TYPE_ID + " = " + eventType.id()
			     + " AND " + MailEventConfiguration.MAIL_EVENT_ACTOR_ID + " = " + actorType.id()
				 + " AND " + MailEventConfiguration.ENABLE + " = 1";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
		List<MailEventConfiguration> confList = jdbcTemplate.query(sql, new MailEventConfigurationMapper());
		if(confList != null && !confList.isEmpty())
			return confList;
		return null;
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
	
}
