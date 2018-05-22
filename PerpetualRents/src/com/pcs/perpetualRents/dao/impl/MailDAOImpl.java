package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.MailDAO;
import com.pcs.perpetualRents.dao.mapper.MailMapper;
import com.pcs.perpetualRents.enm.MailFlowType;

@Repository
public class MailDAOImpl implements MailDAO{
	
	private static Logger logger = ApplicationSettings.getLogger(MailDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	
	@Override
	public Long saveMail(final Mail mail) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		final String sql = "INSERT INTO " + Mail.TABLE_NAME + " ( " + Mail.SUBJECT + ", "  + Mail.BODY + ", " + Mail.MAIL_FROM + ", " + Mail.MAIL_TO + ", " + Mail.MAIL_ORIGIN
		 	       + ", " + Mail.MAIL_EVENTACTOR + ", " + Mail.MAIL_FLOWTYPE + ", " + Mail.ATTACHMENT_COUNT + ", " + Mail.MAIL_EVENTTYPE + ", " + Mail.MAIL_MESSAGEID + ", " + Mail.MAIL_MESSAGE_REFERENCE 
		 	      + ", " + Mail.RECEIVED_ON + ", " + Mail.CONVERSATION_ID
		 	       + " ) "
		           + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
		
	
		jdbcTemplate.update(new PreparedStatementCreator() {
		
		@Override
		public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				
				psObj.setString(1, mail.getSubject());
				psObj.setString(2, mail.getMailBody());
				psObj.setString(3, mail.getMailFrom());
				psObj.setString(4, mail.getMailTo());
				psObj.setString(5, mail.getMailOrigin());
				psObj.setShort(6, mail.getMailEventActor());
				psObj.setShort(7, mail.getMailFlowType());
				psObj.setInt(8, mail.getAttachmentCount());
				psObj.setShort(9, mail.getMailEventType());
				psObj.setString(10, mail.getMailMessageId());
				psObj.setString(11, mail.getMailMessageReference());
				psObj.setString(12, mail.getReceivedOn());
				psObj.setLong(13, mail.getConversationId());
			return psObj;
		}
	}, keyHolder);
	
	
		if(keyHolder.getKey() != null)
			return keyHolder.getKey().longValue();
		
		return null;
	}
	
	@Override
	public Mail getLastMailByFlowStatus(MailFlowType mailFlowType) {
		
		String sql = null;
		Mail  mail = null;
		
		System.out.println( mailFlowType.id());
		
		if(mailFlowType.id() == MailFlowType.ALL.id()){
			sql =  "SELECT * FROM " +  Mail.TABLE_NAME + " ua ";
		}else{
			sql =  "SELECT * FROM " +  Mail.TABLE_NAME + " ua WHERE ua."+Mail.MAIL_FLOWTYPE +" = "+ mailFlowType.id() ;
		}
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Mail> mailList = jdbcTemplate.query(sql, new MailMapper()); 
		
		
		if(mailList != null && mailList.size() > 0)
			mail = mailList.get(mailList.size()-1);
		
		return mail;
	}
	
	@Override
	public Mail getMailByMessageReference(String messageReference){
		
		Mail  mail = null;
		
		final String sql = "SELECT * FROM " +  Mail.TABLE_NAME + " ua WHERE ua."+Mail.MAIL_MESSAGE_REFERENCE +" = '"+messageReference+"' ORDER BY "+ Mail.ID +" DESC";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Mail> mailList = jdbcTemplate.query(sql, new MailMapper()); 
		if(mailList != null && !mailList.isEmpty())
			return mailList.get(0);
		
		return mail;
	}
	

	@Override
	public List<Mail> loadMailByconversationId(Long conversationId) {
		
		final String sql = "SELECT * FROM " +  Mail.TABLE_NAME + " ua WHERE ua."+Mail.CONVERSATION_ID +" = '"+conversationId+"' ORDER BY "+ Mail.ID +" DESC";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Mail> mailList = jdbcTemplate.query(sql, new MailMapper()); 
		if(mailList != null && !mailList.isEmpty())
			return mailList;
		
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
