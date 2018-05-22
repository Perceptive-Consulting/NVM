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
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.ConversationDAO;
import com.pcs.perpetualRents.dao.mapper.ConversationMapper;
import com.pcs.perpetualRents.enm.ObjectType;

@Repository
public class ConversationDAOImpl implements ConversationDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(ConversationDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	@Override
	public Long createConversation(final Conversation convObj, final Long userId) {
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + Conversation.TABLE_NAME + " ( " + Conversation.CONVERSATION_IDENTITY + ", " + Conversation.ACTOR_ONE_ID + ", " + Conversation.ACTOR_TWO_ID
						  + ", " + Conversation.ACTOR_ONE_OBJECTTYPE_ID + ", " + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", " + Conversation.CREATED_USER_ID
						  + ", " + Conversation.PROPERTY_ID + ", " + Conversation.PROPERTY_TYPE_ID
						  + ", " + Conversation.MAIL1_ID + ", " + Conversation.MAIL2_ID + ", " + Conversation.FUNCTIONALITY_ID + ", " + Conversation.JOB_DESCRIPTION
						  + " ) "
						  + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			if(developmentSettings.isShowSQL())
				logger.info(sql);
	
	jdbcTemplate.update(new PreparedStatementCreator() {
		
		@Override
		public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				psObj.setString(1, convObj.getConversationIdentity());
				psObj.setLong(2, convObj.getActorOneId());
				psObj.setLong(3, convObj.getActorTwoId());
				psObj.setShort(4, convObj.getActorOneObjectTypeId());
				psObj.setShort(5, convObj.getActorTwoObjectTypeId());
				psObj.setLong(6, userId);
				psObj.setLong(7, convObj.getPropertyId());
				psObj.setLong(8, convObj.getPropertyTypeId());
				psObj.setString(9, convObj.getMailId1());
				psObj.setString(10, convObj.getMailId2());
				if(convObj.getFunctionalityId() != null)
					psObj.setLong(11, convObj.getFunctionalityId());
				else
					psObj.setNull(11, Types.NULL);
				if(convObj.getJobsDescription() != null)
					psObj.setString(12, convObj.getJobsDescription());
				else
					psObj.setNull(12, Types.NULL);
				
			return psObj;
		}
	}, keyHolder);
	
		return keyHolder.getKey().longValue();
	}
	
	public Conversation loadConversationByConvIdentity(final String conversationIdentity){
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.PROPERTY_TYPE_ID + ", ua." + Conversation.FUNCTIONALITY_ID 
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.CONVERSATION_IDENTITY  + " = '" + conversationIdentity +"'";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList.get(0);
			
			return null;
	
		
	}
	
	@Override
	public Conversation loadConversationByConvIdentityAndPropertyId(final String conversationIdentity, Long propertyId, Integer propertyTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.CONVERSATION_IDENTITY  + " = '" + conversationIdentity +"'" 
				 + " AND ua." + Conversation.PROPERTY_ID + " = " + propertyId
		          + " AND ua." + Conversation.PROPERTY_TYPE_ID + " = " + propertyTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList.get(0);
			
			return null;
	}

	@Override
	public Conversation loadConversationById(Long id) {
		
		String sql = "SELECT ua." + Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID 
				 + ", ua." + Conversation.PROPERTY_TYPE_ID  + ", ua." + Conversation.FUNCTIONALITY_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ID  + " = '" + id +"'" ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
			
		List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
		
		if(convList != null && !convList.isEmpty())
			return convList.get(0);
		return null;
	}

	@Override
	public List<Conversation> loadConversationByPropertyId(final Long propertyId, final Integer propertyTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.PROPERTY_ID  + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID + " = " + propertyTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
			
			return null;	
		}

	@Override
	public Conversation loadConversationByContractorAndProperty(final Long contractorId, final Long propertyId, final Integer propertyTypeId){
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_TWO_ID  + " = " + contractorId
				 + " AND ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID  + " = " + ObjectType.CONTRACTOR.id()
				 + " AND ua." + Conversation.PROPERTY_ID  + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID  + " = " + propertyTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList.get(0);
			
			return null;
	}
	
	@Override
	public Conversation loadConversationByContractorPropertyAndFunctionality(final Long contractorId, final Long propertyId, final Integer propertyTypeId, final Long functionalityId){
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_TWO_ID  + " = " + contractorId
				 + " AND ua." + Conversation.PROPERTY_ID  + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID  + " = " + propertyTypeId
				 + " AND ua." + Conversation.FUNCTIONALITY_ID  + " = " + functionalityId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList.get(0);
			
			return null;
	}
	
	@Override
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId, final Long propertyId, final Integer propertyTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.PROPERTY_TYPE_ID + ", ua." + Conversation.FUNCTIONALITY_ID  
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_ONE_ID  + " = " + actorOneId 
				 + " AND ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID  + " = " + actorOneObjectTypeId 
				 + " AND ua." + Conversation.PROPERTY_ID + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID + " = " + propertyTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
		
		return null;
	}
	
	@Override
	public List<Conversation> loadConversationByActorOne(Long actorOneId, final Long actorOneObjectTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID  
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_ONE_ID  + " = " + actorOneId 
				 + " AND ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID  + " = " + actorOneObjectTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
		
		return null;
	}

	@Override
	public List<Conversation> loadConversationByActorTwo(Long actorTwoId, final Long actorTwoObjectTypeId, final Long propertyId, final Integer propertyTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.PROPERTY_TYPE_ID + ", ua." + Conversation.FUNCTIONALITY_ID 
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_TWO_ID  + " = " + actorTwoId 
				 + " AND ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + " = " + actorTwoObjectTypeId 
				 + " AND ua." + Conversation.PROPERTY_ID + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID + " = " + propertyTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
		
		return null;
	}
	
	@Override
	public List<Conversation> loadConversationByActorTwo(Long actorTwoId, final Long actorTwoObjectTypeId) {
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID  
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_TWO_ID  + " = " + actorTwoId 
				 + " AND ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + " = " + actorTwoObjectTypeId ;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
		
		return null;
	}
	
	public List<Conversation> loadConversationByPropertyAndFunctionality(final Long propertyId, final Integer propertyTypeId, final Long functionalityId){
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.PROPERTY_ID  + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID  + " = " + propertyTypeId
				 + " AND ua." + Conversation.FUNCTIONALITY_ID  + " = " + functionalityId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
			
			return null;
	}
	
	public List<Conversation> loadConversationByPropertyAndActorOneTypeId(final Long propertyId, final Integer propertyTypeId, final Long... actorOneTypeId){
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID
				 + ", ua." + Conversation.PROPERTY_TYPE_ID + ", ua." + Conversation.FUNCTIONALITY_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.PROPERTY_ID  + " = " + propertyId
				 + " AND ua." + Conversation.PROPERTY_TYPE_ID  + " = " + propertyTypeId;
				 
		
				String delim = "  AND ( ";
				for(int j = 0; j < actorOneTypeId.length; j++){
					sql +=  delim + " ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID + " = " + actorOneTypeId[j];
						delim = " OR ";
				}
				sql += " ) ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			return jdbcTemplate.query(sql, new ConversationMapper());
	}
	
	@Override
	public List<Conversation> loadConversationByActorOneAndActorTwo(Long actorOneId, Long actorOneObjectTypeId, Long actorTwoId, final Long actorTwoObjectTypeId){
		
		String sql = "SELECT ua." +Conversation.ID + ", ua." + Conversation.CONVERSATION_IDENTITY + ", ua." + Conversation.ACTOR_ONE_ID 
				 + ", ua." + Conversation.ACTOR_TWO_ID  + ", ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID
				 + ", ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID + ", ua." + Conversation.PROPERTY_ID 
				 + ", ua." + Conversation.FUNCTIONALITY_ID + ", ua." + Conversation.PROPERTY_TYPE_ID
				 + ", ua." + Conversation.MAIL1_ID  + ", ua." + Conversation.MAIL2_ID + ", ua." + Conversation.CREATED_ON
				 + ", ua." + Conversation.JOB_DESCRIPTION
				 + ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				 + " FROM "+ Conversation.TABLE_NAME +" ua "
				 + " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				 + " WHERE ua." + Conversation.ACTOR_ONE_ID  + " = " + actorOneId
				 + " AND ua." + Conversation.ACTOR_ONE_OBJECTTYPE_ID  + " = " + actorOneObjectTypeId
				 + " AND ua." + Conversation.ACTOR_TWO_ID  + " = " + actorTwoId
				 + " AND ua." + Conversation.ACTOR_TWO_OBJECTTYPE_ID  + " = " + actorTwoObjectTypeId;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
				
			List<Conversation> convList =  jdbcTemplate.query(sql, new ConversationMapper());
			
			if(convList != null && !convList.isEmpty())
				return convList;
			
			return null;
	}
	
}
