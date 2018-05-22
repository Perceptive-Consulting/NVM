package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Mail;

public class MailMapper implements RowMapper<Mail> {

	@Override
	public Mail mapRow(ResultSet rst, int arg1) throws SQLException {
		Mail mail =  null;
		try{
				mail = new Mail();
				
				mail.setId(rst.getLong(Mail.ID));
				mail.setSubject(rst.getString(Mail.SUBJECT));
				mail.setMailBody(rst.getString(Mail.BODY));
				mail.setMailTo(rst.getString(Mail.MAIL_TO));
				mail.setMailFrom(rst.getString(Mail.MAIL_FROM));
				mail.setMailOrigin(rst.getString(Mail.MAIL_ORIGIN));
				mail.setMailMessageId(rst.getString(Mail.MAIL_MESSAGEID));
				mail.setMailMessageReference(rst.getString(Mail.MAIL_MESSAGE_REFERENCE));
				mail.setMailEventActor(rst.getShort(Mail.MAIL_EVENTACTOR));
				mail.setMailEventType(rst.getShort(Mail.MAIL_EVENTTYPE));
				mail.setMailFlowType(rst.getShort(Mail.MAIL_FLOWTYPE));
				mail.setCreatedOn(rst.getString(Mail.CREATED_ON));
				mail.setAttachmentCount(rst.getInt(Mail.ATTACHMENT_COUNT));
				mail.setReceivedOn(rst.getString(Mail.RECEIVED_ON));
				mail.setCreatedOn(rst.getString(Mail.CREATED_ON));
				mail.setConversationId(rst.getLong(Mail.CONVERSATION_ID));
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
		}
		return mail;
	}

}
