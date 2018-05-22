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
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.DocumentsDAO;
import com.pcs.perpetualRents.dao.mapper.DocumentsMapper;

@Repository
public class DocumentsDAOImpl implements DocumentsDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(DocumentsDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;

	@Override
	public Long saveDocuments(final Documents documents, final Long userId) throws Exception {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + Documents.TABLE_NAME + "( " + Documents.CONTRACTOR_ID + ", " + Documents.DOCUMENT_TYPE_ID
						+ ", " + Documents.FILE_NAME  + ", " + Documents.FUNCTIONALITY_ID   + ", " + Documents.STATUS_ID  
						+ ", " + Documents.FILE_ID + ", " + Documents.PROPERTY_ID + ", " + Documents.CREATED_USER_ID
						+ " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, documents.getContractorId());
					psObj.setLong(2, documents.getDocumentTypeId());
					psObj.setString(3, documents.getFileName());
					if(documents.getFunctionalityId() != null)
						psObj.setLong(4, documents.getFunctionalityId());
					else
						psObj.setNull(4, Types.NULL);
					
					psObj.setLong(5, documents.getStatusId());
					psObj.setLong(6, documents.getFileId());
					psObj.setLong(7, documents.getPropertyId());
					psObj.setLong(8, userId);
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null){
			documents.setId(keyHolder.getKey().longValue());
			return keyHolder.getKey().longValue();
		}
		
		return null;
	}
	
	@Override
	public Documents loadDocumentById(Long id) {
		
		String sql = "SELECT ua." +Documents.ID + ", ua." + Documents.CREATED_ON + ", ua." + Documents.CONTRACTOR_ID + ", ua." + Documents.DOCUMENT_TYPE_ID
				+ ", ua." + Documents.FILE_NAME + ", ua." + Documents.FUNCTIONALITY_ID + ", ua." + Documents.STATUS_ID 
				+ ", ua." + Documents.FILE_ID + ", ua." + Documents.PROPERTY_ID
				+ ", ua." + Documents.CREATED_ON + ", ua." + Documents.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + Documents.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + Documents.MODIFIED_BY
				+ " FROM " + Documents.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE " + Documents.ID  + " = " + id ;
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Documents> documentsList = jdbcTemplate.query(sql, new DocumentsMapper());
		
		if(documentsList != null && !documentsList.isEmpty())
			return documentsList.get(0);

		return null;
	}

	@Override
	public void deleteDocumentsById(final Long id){
		
		final String sql = "DELETE FROM " + Documents.TABLE_NAME + " WHERE " + Documents.ID + " = ?";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql);
					psObj.setLong(1, id);
					
				return psObj;
			}
		});
	}
	
	@Override
	public List<Documents> loadDocumentsByContractorFunctionalityAndPropertyId(final Long contractorId, final Long functionalityId, final Long propertyId){
		
		String sql = "SELECT ua." +Documents.ID + ", ua." + Documents.CREATED_ON + ", ua." + Documents.CONTRACTOR_ID + ", ua." + Documents.DOCUMENT_TYPE_ID
				+ ", ua." + Documents.FILE_NAME + ", ua." + Documents.FUNCTIONALITY_ID + ", ua." + Documents.STATUS_ID 
				+ ", ua." + Documents.FILE_ID + ", ua." + Documents.PROPERTY_ID
				+ ", ua." + Documents.CREATED_ON + ", ua." + Documents.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + Documents.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + Documents.MODIFIED_BY
				+ " FROM " + Documents.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE " + Documents.CONTRACTOR_ID  + " = " + contractorId 
				+" AND " + Documents.FUNCTIONALITY_ID + " = " + functionalityId
				+" AND " + Documents.PROPERTY_ID + " = " + propertyId;
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Documents> documentsList = jdbcTemplate.query(sql, new DocumentsMapper());
		if(documentsList != null && !documentsList.isEmpty())
			return documentsList;

		return null;
	}
	
	public List<Documents> loadDocumentsByPropertyAndFunctionalityId(final Long propertyId, final Long functionalityId){
		
		String sql = "SELECT ua." + Documents.ID + ", ua." + Documents.CREATED_ON + ", ua." + Documents.CONTRACTOR_ID + ", ua." + Documents.DOCUMENT_TYPE_ID
				+ ", ua." + Documents.FILE_NAME + ", ua." + Documents.FUNCTIONALITY_ID + ", ua." + Documents.STATUS_ID 
				+ ", ua." + Documents.FILE_ID + ", ua." + Documents.PROPERTY_ID
				+ ", ua." + Documents.CREATED_ON + ", ua." + Documents.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + Documents.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + Documents.MODIFIED_BY
				+ " FROM " + Documents.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE " + Documents.PROPERTY_ID  + " = " + propertyId 
				+" AND " + Documents.FUNCTIONALITY_ID + " = " + functionalityId;
	
		List<Documents> documentsList = jdbcTemplate.query(sql, new DocumentsMapper());
		
		if(documentsList != null && !documentsList.isEmpty())
			return documentsList;

		return null;
	}
	
	public List<Documents> loadDocumentsByPropertyId(final Long propertyId){
		
		String sql = "SELECT ua." +Documents.ID + ", ua." + Documents.CREATED_ON + ", ua." + Documents.CONTRACTOR_ID + ", ua." + Documents.DOCUMENT_TYPE_ID
				+ ", ua." + Documents.FILE_NAME + ", ua." + Documents.FUNCTIONALITY_ID + ", ua." + Documents.STATUS_ID 
				+ ", ua." + Documents.FILE_ID + ", ua." + Documents.PROPERTY_ID
				+ ", ua." + Documents.CREATED_ON + ", ua." + Documents.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + Documents.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + Documents.MODIFIED_BY
				+ " FROM " + Documents.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE " + Documents.PROPERTY_ID  + " = " + propertyId ;
	
		List<Documents> documentsList = jdbcTemplate.query(sql, new DocumentsMapper());
		if(documentsList != null && !documentsList.isEmpty())
			return documentsList;

		return null;
	}
	
	@Override
	public boolean updateStatus(final Documents documents, final Long userId){
		
		String sql = "UPDATE " + Documents.TABLE_NAME + " SET " + Documents.STATUS_ID + " = ?, " 
					+ Documents.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Documents.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + Documents.ID + " = ? ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
			
		int status = jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setLong(1 , documents.getStatusId());
					psObj.setLong(2, userId);
					psObj.setLong(3 , documents.getId());
				}
			});
		if(status == 1)
			return true;
		else
			return false;
	}
}
