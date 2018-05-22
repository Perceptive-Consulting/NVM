package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.MailEventConfiguration;

public class MailEventConfigurationMapper implements RowMapper<MailEventConfiguration>{

	@Override
	public MailEventConfiguration mapRow(ResultSet rst, int arg1) throws SQLException {
		MailEventConfiguration obj = null;
		try{
			obj = new MailEventConfiguration();
				obj.setId(rst.getLong(MailEventConfiguration.ID));
				obj.setCreatedBy(rst.getString(MailEventConfiguration.CREATED_BY));
				obj.setCreatedOn(rst.getDate(MailEventConfiguration.CREATED_ON));
				obj.setModifiedBy(rst.getString(MailEventConfiguration.MODIFIED_BY));
				obj.setModifiedOn(rst.getDate(MailEventConfiguration.MODIFIED_ON));
				obj.setActorTypeId(rst.getShort(MailEventConfiguration.ACTOR_TYPE_ID));
				obj.setDocumentId(rst.getLong(MailEventConfiguration.DOCUMENT_ID));
				obj.setMailEventActorId(rst.getLong(MailEventConfiguration.MAIL_EVENT_ACTOR_ID));
				obj.setMailEventTypeId(rst.getLong(MailEventConfiguration.MAIL_EVENT_TYPE_ID));
				obj.setEnable(rst.getBoolean(MailEventConfiguration.ENABLE));
				
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
