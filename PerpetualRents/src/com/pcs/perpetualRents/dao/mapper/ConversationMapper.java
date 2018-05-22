package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;

public class ConversationMapper implements RowMapper<Conversation>{

	@Override
	public Conversation mapRow(ResultSet rst, int arg1) throws SQLException {
		Conversation obj = null;
		try{
			obj = new Conversation();
			obj.setId(rst.getLong(Contractor.ID));
			obj.setPropertyId(rst.getLong(Conversation.PROPERTY_ID));
			obj.setPropertyTypeId(rst.getInt(Conversation.PROPERTY_TYPE_ID));
			obj.setFunctionalityId(rst.getLong(Conversation.FUNCTIONALITY_ID));
			obj.setConversationIdentity(rst.getString(Conversation.CONVERSATION_IDENTITY));
			obj.setActorOneId(rst.getLong(Conversation.ACTOR_ONE_ID));
			obj.setActorTwoId(rst.getLong(Conversation.ACTOR_TWO_ID));
			obj.setActorOneObjectTypeId(rst.getShort(Conversation.ACTOR_ONE_OBJECTTYPE_ID));
			obj.setActorTwoObjectTypeId(rst.getShort(Conversation.ACTOR_TWO_OBJECTTYPE_ID));
			obj.setMailId1(rst.getString(Conversation.MAIL1_ID));
			obj.setMailId2(rst.getString(Conversation.MAIL2_ID));
			obj.setJobsDescription(rst.getString(Conversation.JOB_DESCRIPTION));
			
			obj.setCreatedOn(rst.getDate(Contractor.CREATED_ON));
			obj.setCreatedBy(rst.getString(Contractor.CREATED_BY));
			
			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}