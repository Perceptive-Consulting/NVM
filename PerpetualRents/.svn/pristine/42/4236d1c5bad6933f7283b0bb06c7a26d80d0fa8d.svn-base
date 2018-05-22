package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.AdminUploadDocuments;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.PerpetualCounty;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.AdminDocumentDAO;

@Repository
public class AdminDocumentsDAOImpl implements AdminDocumentDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(AdminDocumentsDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	public Long saveDocuments(final AdminUploadDocuments documents, final Long userId){
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + AdminUploadDocuments.TABLE_NAME + "( " + AdminUploadDocuments.FILE_NAME + ", " + AdminUploadDocuments.ADMIN_DOCUMENT_ID
						+ ", " + AdminUploadDocuments.FILE_ID  + ", " + AdminUploadDocuments.DOCUMENT_TYPE_ID
						+ ", " + AdminUploadDocuments.CREATED_USER_ID
						+ " ) VALUES (?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, documents.getFileName());
					psObj.setLong(2, documents.getAdminDocumentId());
					psObj.setLong(3, documents.getFileId());
					psObj.setLong(4, documents.getDocumentTypeId());
					psObj.setLong(5, userId);
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null)
			return keyHolder.getKey().longValue();
		
		return null;
	}
	
	@Override
	public AdminUploadDocuments loadByDocumentId(final Long documentId){
		
		String sql = "SELECT ua." +AdminUploadDocuments.ID + ", ua." + AdminUploadDocuments.CREATED_ON + ", ua." + AdminUploadDocuments.CREATED_USER_ID 
				+ ", ua." + AdminUploadDocuments.FILE_NAME + ", ua." + AdminUploadDocuments.ADMIN_DOCUMENT_ID + ", ua." + AdminUploadDocuments.FILE_ID 
				+ ", ua." + AdminUploadDocuments.DOCUMENT_TYPE_ID
				+ ", ua." + AdminUploadDocuments.CREATED_ON 
				+ ", x1." + UserLogin.USERNAME + " AS " + Documents.CREATED_BY
				+ " FROM " + AdminUploadDocuments.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + AdminUploadDocuments.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " WHERE " + AdminUploadDocuments.ADMIN_DOCUMENT_ID  + " = " + documentId ;
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<AdminUploadDocuments> documentsList = jdbcTemplate.query(sql, new RowMapper<AdminUploadDocuments>() {

			@Override
			public AdminUploadDocuments mapRow(ResultSet rst, int arg1)throws SQLException {
				
				AdminUploadDocuments obj = new AdminUploadDocuments();
					obj.setAdminDocumentId(rst.getInt(AdminUploadDocuments.ADMIN_DOCUMENT_ID));
					obj.setCreatedOn(rst.getDate(AdminUploadDocuments.CREATED_ON));
					obj.setDocumentTypeId(rst.getInt(AdminUploadDocuments.DOCUMENT_TYPE_ID));
					obj.setFileId(rst.getLong(AdminUploadDocuments.FILE_ID));
					obj.setFileName(rst.getString(AdminUploadDocuments.FILE_NAME));
					obj.setId(rst.getLong(AdminUploadDocuments.ID));
					
				return obj;
			}
		});
		
		if(documentsList != null && !documentsList.isEmpty())
			return documentsList.get(0);

		return null;
	}
	
	@Override
	public boolean deleteFileById(final Long adminDocumentId) {
		
		final String sql = "DELETE FROM " + AdminUploadDocuments.TABLE_NAME + " WHERE " + AdminUploadDocuments.ADMIN_DOCUMENT_ID + " = ?";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		

		jdbcTemplate.update(new PreparedStatementCreator() {
		@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql);
					psObj.setLong(1, adminDocumentId);
					
				return psObj;
			}
		});
		
		return true;
	}

	@Override
	public List<AdminUploadDocuments> loadAllDocuments() {
		
			final String sql = "SELECT ua." + AdminUploadDocuments.FILE_ID + ", ua." + AdminUploadDocuments.FILE_NAME + ", ua." + AdminUploadDocuments.ADMIN_DOCUMENT_ID + 
								", ua." + AdminUploadDocuments.DOCUMENT_TYPE_ID + ", ua." +  AdminUploadDocuments.ID + ", ua." + AdminUploadDocuments.CREATED_ON +
								 ", ua." + AdminUploadDocuments.CREATED_BY +
								" FROM " + AdminUploadDocuments.TABLE_NAME ;
	
			if(developmentSettings.isShowSQL())
					logger.info(sql);
	
			List<AdminUploadDocuments> uploadedDocumentList = jdbcTemplate.query(sql, new RowMapper<AdminUploadDocuments>() {
			
				@Override
				public AdminUploadDocuments mapRow(ResultSet rst, int arg1)throws SQLException {
					
					AdminUploadDocuments obj = new AdminUploadDocuments();
						obj.setId(rst.getLong(PerpetualCounty.ID));
						obj.setFileId(rst.getLong(AdminUploadDocuments.FILE_ID));
						obj.setFileName(rst.getString(AdminUploadDocuments.TABLE_NAME));
						obj.setAdminDocumentId(rst.getInt(AdminUploadDocuments.ADMIN_DOCUMENT_ID));
						obj.setDocumentTypeId(rst.getInt(AdminUploadDocuments.DOCUMENT_TYPE_ID));
						obj.setCreatedOn(new Date(rst.getInt(AdminUploadDocuments.CREATED_ON)));
						obj.setCreatedBy(rst.getString(AdminUploadDocuments.CREATED_BY));
						
					return obj;
				}
			});
	
		if(uploadedDocumentList != null && !uploadedDocumentList.isEmpty())
			return uploadedDocumentList;
		
		return null;
	}

}
