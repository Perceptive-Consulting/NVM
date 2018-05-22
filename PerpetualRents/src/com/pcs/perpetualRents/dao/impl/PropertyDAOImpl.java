package com.pcs.perpetualRents.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Statement;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDocument;
import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.PropertyDAO;
import com.pcs.perpetualRents.dao.mapper.PropertMarketingInformationMapper;
import com.pcs.perpetualRents.enm.PdDocumentsStatus;
import com.pcs.perpetualRents.enm.Status;
import com.pcs.perpetualRents.manager.FileManager;

@Repository
public class PropertyDAOImpl implements PropertyDAO{
	
	private static Logger logger = ApplicationSettings.getLogger(PropertyDAOImpl.class.getName()); 
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	@Autowired
	FileManager fileManager;
	
	@Override
	public Long savePropertyDetails(final Property propertyObj, final Long createdUserId) {
		try{
			KeyHolder keyHolder = new GeneratedKeyHolder();
			
			final String sql = "INSERT INTO " + Property.TABLE_NAME + "( " + Property.UNIQUE_REFERENCE + ", " + Property.CONTACT_PERSON + ", " + Property.AGENT_NAME + ", " + Property.AGENT_CONTACT_NUMBER + ", " + Property.AGENT_ADDRESS_LINE
					 + ", " + Property.STATUS_PERCENTAGE + ", " + Property.LANDLORD_ID + ", " + Property.CREATED_USER_ID + ", " + Property.STATUS_ID
					 + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						psObj.setString(1, propertyObj.getUniqueReference());
						psObj.setString(2, propertyObj.getContactPerson());
						if(propertyObj.getAgentName() != null)
							psObj.setString(3, propertyObj.getAgentName());
						else
							psObj.setNull(3, Types.NULL);
						if(propertyObj.getAgentContactNumber() != null)
							psObj.setString(4, propertyObj.getAgentContactNumber());
						else
							psObj.setNull(4, Types.NULL);
						if(propertyObj.getAgentAddressLine() != null)
							psObj.setString(5, propertyObj.getAgentAddressLine());
						else
							psObj.setNull(5, Types.NULL);
							psObj.setInt(6, propertyObj.getStatusPercentage());
							psObj.setLong(7, propertyObj.getLandlordId());
							psObj.setLong(8, createdUserId);
							psObj.setShort(9, propertyObj.getStatusId());
						
					return psObj;
				}
			}, keyHolder);
			
			if(keyHolder.getKey() != null)
				return keyHolder.getKey().longValue();
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	@Override
	public int updatePDPropertyStatus(final Long documentId) {

		String sql = " UPDATE " + PropertyDocument.TABLE_NAME + " SET " + PropertyDocument.STATUS_ID + " = ?"
				+ " WHERE " + PropertyDocument.ID + " = ?"; 

		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
       int i =	jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setInt(1, PdDocumentsStatus.ALREADY_READ.id());
				psObj.setLong(2 , documentId);
	
			}
		});

       return i;
	}
	
	
	@Override
	public boolean savePropertyResponse(final PropertyResponse responseObj, final Long createdUserId) {//9541240006
		try{
			final String sql = "INSERT INTO " + PropertyResponse.TABLE_NAME + "( " + PropertyResponse.PROPERTY_ID + ", " + PropertyResponse.QUESTION_ID + ", " + PropertyResponse.COMMENTS + ", " + PropertyResponse.RESPONSE
					 + ", " + PropertyResponse.FIELD_NAME + ", " + PropertyResponse.DOCUMENT_ID + ", " + PropertyResponse.CREATED_USER_ID + " ) VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						psObj.setLong(1, responseObj.getPropertyId());
						psObj.setLong(2, responseObj.getQuestionId());
						if(responseObj.getComments() != null)
							psObj.setString(3, responseObj.getComments());
						else
							psObj.setNull(3, Types.NULL);
						if(responseObj.getResponse() != null)
							psObj.setString(4, responseObj.getResponse());
						else
							psObj.setNull(4, Types.NULL);
						psObj.setString(5, responseObj.getFieldName());
						if(responseObj.getDocumentId() != null)
							psObj.setLong(6, responseObj.getDocumentId());
						else
							psObj.setNull(6, Types.NULL);
						psObj.setLong(7, createdUserId);
					return psObj;
				}
			});
			
			return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean deletePropertyDocumentById(final Long propertyDocumentId){
		if(propertyDocumentId == null)
			return false;
		
		PropertyDocument docObj = loadPropertyDocumentsById(propertyDocumentId);
		if(docObj == null)
			return false;
		if(docObj.getFileId() == 0l){
			removeDocument(propertyDocumentId);
			return true;
		}
		
		removeDocument(docObj.getId());
		fileManager.deleteFileById(docObj.getFileId());
		
		return true;
	}
	
	private boolean removeDocument(final Long propertyDocumentId) {
		final String sql = "DELETE FROM " + PropertyDocument.TABLE_NAME + " WHERE " + PropertyDocument.ID + " = " + propertyDocumentId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(sql);
		
		return true;
	}
	
	@Override
	public PropertyDocument loadPropertyDocumentsById(final Long propertyDocumentId){
		
		String sql = " SELECT ua." + PropertyDocument.ID + ", ua." + PropertyDocument.LANDLORD_ID + ", ua." + PropertyDocument.PROPERTY_ID 
			     + ", ua." + PropertyDocument.FILE_ID + ", ua." + PropertyDocument.DOCUMENT_TYPE_ID  + ", ua." + PropertyDocument.FILE_NAME + ", ua." + PropertyDocument.STATUS_ID
			     + ", ua." + PropertyDocument.CREATED_ON +  ", ua." + PropertyDocument.MODIFIED_ON  + ", ua." + PropertyDocument.DESCRIPTION
			     + ", x1." + UserLogin.USERNAME + " AS "+ PropertyDocument.CREATED_BY
			     + ", x2." + UserLogin.USERNAME + " AS "+ PropertyDocument.MODIFIED_BY
			     + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE + 
			     ", x3." + File.OBJECT_ID + ", x3." + File.FILE_PATH + 
			     ", x3." + File.CONTENT_TYPE + ", x3." + File.DOCUMENT_TYPE_ID
			     + " FROM " + PropertyDocument.TABLE_NAME + " ua "
				 +" LEFT JOIN users x1 ON ua." + PropertyDocument.CREATED_USER_ID + "= x1." + UserLogin.ID
				 +" LEFT JOIN users x2 ON ua." + PropertyDocument.MODIFIED_USER_ID + "= x2." + UserLogin.ID
				 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PropertyDocument.FILE_ID + "= x3." + File.ID + " WHERE ua." + PropertyDocument.ID + " = " + propertyDocumentId + "";
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyDocument> documentList = jdbcTemplate.query(sql, new RowMapper<PropertyDocument>() {
	
			@Override
			public PropertyDocument mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyDocument obj = new PropertyDocument();
					obj.setId(rst.getLong(PropertyDocument.ID));
					obj.setLandlordId(rst.getLong(PropertyDocument.LANDLORD_ID));
					obj.setPropertyId(rst.getLong(PropertyDocument.PROPERTY_ID));
					obj.setFileName(rst.getString(PropertyDocument.FILE_NAME));
					obj.setFileId(rst.getShort(PropertyDocument.FILE_ID));
					obj.setDocumentTypeId(rst.getLong(PropertyDocument.DOCUMENT_TYPE_ID));
					obj.setStatusId(rst.getInt(PropertyDocument.STATUS_ID));
					
					obj.setCreatedOn(rst.getDate(PropertyDocument.CREATED_ON));
					obj.setModifiedOn(rst.getDate(PropertyDocument.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(PropertyDocument.CREATED_BY));
					obj.setModifiedBy(rst.getString(PropertyDocument.MODIFIED_BY));
					obj.setDescription(rst.getString(PropertyDocument.DESCRIPTION));
				return obj;
			}
		});
		
		if(documentList != null && documentList.size() != 0)
			return documentList.get(0);
		
		return null;
	}
	
	@Override
	public void loadAdminUploadDocument(final Property tPropertyObj){
		
		String sql = " SELECT ua." + PropertyDocument.ID + ", ua." + PropertyDocument.LANDLORD_ID + ", ua." + PropertyDocument.PROPERTY_ID 
			     + ", ua." + PropertyDocument.FILE_ID + ", ua." + PropertyDocument.DOCUMENT_TYPE_ID  + ", ua." + PropertyDocument.FILE_NAME + ", ua." + PropertyDocument.STATUS_ID
			     + ", ua." + PropertyDocument.CREATED_ON +  ", ua." + PropertyDocument.MODIFIED_ON  + ", ua." + PropertyDocument.DESCRIPTION
			     + ", x1." + UserLogin.USERNAME + " AS "+ PropertyDocument.CREATED_BY
			     + ", x2." + UserLogin.USERNAME + " AS "+ PropertyDocument.MODIFIED_BY
			     + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE + 
			     ", x3." + File.OBJECT_ID + ", x3." + File.FILE_PATH + 
			     ", x3." + File.CONTENT_TYPE + ", x3." + File.DOCUMENT_TYPE_ID
			     + " FROM " + PropertyDocument.TABLE_NAME + " ua "
				 +" LEFT JOIN users x1 ON ua." + PropertyDocument.CREATED_USER_ID + "= x1." + UserLogin.ID
				 +" LEFT JOIN users x2 ON ua." + PropertyDocument.MODIFIED_USER_ID + "= x2." + UserLogin.ID
				 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PropertyDocument.FILE_ID + "= x3." + File.ID + " WHERE ua." + PropertyDocument.PROPERTY_ID + " = " + tPropertyObj.getId() + "";
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyDocument> documentList = jdbcTemplate.query(sql, new RowMapper<PropertyDocument>() {
	
			@Override
			public PropertyDocument mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyDocument obj = new PropertyDocument();
					obj.setId(rst.getLong(PropertyDocument.ID));
					obj.setLandlordId(rst.getLong(PropertyDocument.LANDLORD_ID));
					obj.setPropertyId(rst.getLong(PropertyDocument.PROPERTY_ID));
					obj.setFileName(rst.getString(PropertyDocument.FILE_NAME));
					obj.setFileId(rst.getShort(PropertyDocument.FILE_ID));
					obj.setDocumentTypeId(rst.getLong(PropertyDocument.DOCUMENT_TYPE_ID));
					obj.setStatusId(rst.getInt(PropertyDocument.STATUS_ID));
					
					obj.setCreatedOn(rst.getDate(PropertyDocument.CREATED_ON));
					obj.setModifiedOn(rst.getDate(PropertyDocument.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(PropertyDocument.CREATED_BY));
					obj.setModifiedBy(rst.getString(PropertyDocument.MODIFIED_BY));
					obj.setDescription(rst.getString(PropertyDocument.DESCRIPTION));
					
					File fileObj = new File();
						fileObj.setId(rst.getLong(PropertyDocument.FILE_ID));
						fileObj.setFileName(rst.getString(File.FILE_NAME));
						fileObj.setSize(rst.getLong(File.SIZE));
						fileObj.setObjectType(rst.getLong(File.OBJECT_TYPE));
						fileObj.setObjectId(rst.getLong(File.OBJECT_ID));
						fileObj.setDocumentType(rst.getLong(File.DOCUMENT_TYPE_ID));
						fileObj.setFilePath(rst.getString(File.FILE_PATH));
						fileObj.setContentType(rst.getString(File.CONTENT_TYPE));
						
				
				obj.setFileObj(fileObj);
				
				return obj;
			}
		});
		
		tPropertyObj.setDocuments(documentList);
	}
	
	
	@Override
	public List<PropertyDocument> loadPropertyAdminUploadDocument(final Property tPropertyObj){
		
		String sql = " SELECT ua." + PropertyDocument.ID + ", ua." + PropertyDocument.LANDLORD_ID + ", ua." + PropertyDocument.PROPERTY_ID 
			     + ", ua." + PropertyDocument.FILE_ID + ", ua." + PropertyDocument.DOCUMENT_TYPE_ID  + ", ua." + PropertyDocument.FILE_NAME + ", ua." + PropertyDocument.STATUS_ID
			     + ", ua." + PropertyDocument.CREATED_ON +  ", ua." + PropertyDocument.MODIFIED_ON  + ", ua." + PropertyDocument.DESCRIPTION
			     + ", x1." + UserLogin.USERNAME + " AS "+ PropertyDocument.CREATED_BY
			     + ", x2." + UserLogin.USERNAME + " AS "+ PropertyDocument.MODIFIED_BY
			     + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE + 
			     ", x3." + File.OBJECT_ID + ", x3." + File.FILE_PATH + 
			     ", x3." + File.CONTENT_TYPE + ", x3." + File.DOCUMENT_TYPE_ID
			     + " FROM " + PropertyDocument.TABLE_NAME + " ua "
				 +" LEFT JOIN users x1 ON ua." + PropertyDocument.CREATED_USER_ID + "= x1." + UserLogin.ID
				 +" LEFT JOIN users x2 ON ua." + PropertyDocument.MODIFIED_USER_ID + "= x2." + UserLogin.ID
				 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PropertyDocument.FILE_ID + "= x3." + File.ID + " WHERE ua." + PropertyDocument.PROPERTY_ID + " = " + tPropertyObj.getId() + "";
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyDocument> documentList = jdbcTemplate.query(sql, new RowMapper<PropertyDocument>() {
	
			@Override
			public PropertyDocument mapRow(ResultSet rst, int arg1) throws SQLException {
				PropertyDocument obj = new PropertyDocument();
					obj.setId(rst.getLong(PropertyDocument.ID));
					obj.setLandlordId(rst.getLong(PropertyDocument.LANDLORD_ID));
					obj.setPropertyId(rst.getLong(PropertyDocument.PROPERTY_ID));
					obj.setFileName(rst.getString(PropertyDocument.FILE_NAME));
					obj.setFileId(rst.getShort(PropertyDocument.FILE_ID));
					obj.setDocumentTypeId(rst.getLong(PropertyDocument.DOCUMENT_TYPE_ID));
					obj.setStatusId(rst.getInt(PropertyDocument.STATUS_ID));
					
					obj.setCreatedOn(rst.getDate(PropertyDocument.CREATED_ON));
					obj.setModifiedOn(rst.getDate(PropertyDocument.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(PropertyDocument.CREATED_BY));
					obj.setModifiedBy(rst.getString(PropertyDocument.MODIFIED_BY));
					obj.setDescription(rst.getString(PropertyDocument.DESCRIPTION));
					
					File fileObj = new File();
						fileObj.setId(rst.getLong(PropertyDocument.FILE_ID));
						fileObj.setFileName(rst.getString(File.FILE_NAME));
						fileObj.setSize(rst.getLong(File.SIZE));
						fileObj.setObjectType(rst.getLong(File.OBJECT_TYPE));
						fileObj.setObjectId(rst.getLong(File.OBJECT_ID));
						fileObj.setDocumentType(rst.getLong(File.DOCUMENT_TYPE_ID));
						fileObj.setFilePath(rst.getString(File.FILE_PATH));
						fileObj.setContentType(rst.getString(File.CONTENT_TYPE));
						
				
				obj.setFileObj(fileObj);
				
				return obj;
			}
		});
		if(documentList != null && !documentList.isEmpty())
			return documentList;
		
			return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public boolean savePropertyDocuments(final PropertyDocument documentsObj, final Long createdUserId) {
			KeyHolder keyHolder = new GeneratedKeyHolder();
			final String sql = "INSERT INTO " + PropertyDocument.TABLE_NAME + "( " + PropertyDocument.LANDLORD_ID
					       + ", " + PropertyDocument.PROPERTY_ID +  ", " + PropertyDocument.FILE_ID
					       + ", " + PropertyDocument.DOCUMENT_TYPE_ID + ", " + PropertyDocument.FILE_NAME + ", " + PropertyDocument.STATUS_ID 
					       + ", " + PropertyDocument.CREATED_USER_ID  + ", " + PropertyDocument.DESCRIPTION
					       + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
							psObj.setLong(1, documentsObj.getLandlordId());
							psObj.setLong(2, documentsObj.getPropertyId());
							psObj.setLong(3, documentsObj.getFileId());  
							psObj.setLong(4, documentsObj.getDocumentTypeId());
							psObj.setString(5, documentsObj.getFileName());
							psObj.setInt(6, documentsObj.getStatusId());
							psObj.setLong(7, createdUserId);
							if(documentsObj.getDescription() != null && documentsObj.getDescription().trim().length() != 0)
								psObj.setString(8, documentsObj.getDescription());
							else
								psObj.setNull(8, Types.NULL);
						
					return psObj;
				}
				
			}, keyHolder);
			
			if(keyHolder.getKey() != null){
				documentsObj.setId(keyHolder.getKey().longValue());
				return true;
			}
			
			return false;
	}
	
	@Override
	public Long saveMarketingInfo(final PropertyMarketingInformation infoObj) {
		try{
			KeyHolder keyHolder = new GeneratedKeyHolder();
			
			final String sql = "INSERT INTO " + PropertyMarketingInformation.TABLE_NAME + "( " + PropertyMarketingInformation.AVAILABILITY + ", " + PropertyMarketingInformation.RENT_AMOUNT
								+ ", " + PropertyMarketingInformation.PROPERTY_TYPE + ", " + PropertyMarketingInformation.PROPERTY_OTHER_TYPE + ", " + PropertyMarketingInformation.RENT_PERIOD
								+", " + PropertyMarketingInformation.RENT_REASON_COMMENT
								+ ", " + PropertyMarketingInformation.BEDROOM_COUNT + ", " + PropertyMarketingInformation.BATHROOM_COUNT + ", " + PropertyMarketingInformation.SEPERATE_WC
								+ ", " + PropertyMarketingInformation.FURNISHED
								+ ", " + PropertyMarketingInformation.FLOORING + ", " + PropertyMarketingInformation.FLOORING_COMMENTS
								+ ", " + PropertyMarketingInformation.CURTAIN + ", " + PropertyMarketingInformation.CURTAIN_COMMENTS
								+ ", " + PropertyMarketingInformation.FRONT_GARDEN + ", " + PropertyMarketingInformation.FRONT_GARDEN_COMMENTS
								+ ", " + PropertyMarketingInformation.REAR_GARDEN + ", " + PropertyMarketingInformation.REAR_GARDEN_COMMENTS
								+ ", " + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS + ", " + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS_COMMENTS
								+ ", " + PropertyMarketingInformation.EXTRA_STAIR + ", " + PropertyMarketingInformation.EXTRA_STAIR_COMMENTS + ", " + PropertyMarketingInformation.OTHER_PROPERTY_INFORMATION
								+ ", " + PropertyMarketingInformation.PROPERTY_ID + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						psObj.setString(1, infoObj.getAvailability());
						psObj.setString(2, infoObj.getRentAmount());
						psObj.setString(3, infoObj.getPropertyType());
						if(infoObj.getPropertyOtherType() != null)
							psObj.setString(4, infoObj.getPropertyOtherType());
						else
							psObj.setNull(4, Types.NULL);
						psObj.setString(5, infoObj.getRentPeriod());
						
						if(infoObj.getRentReasonComment() != null)
							psObj.setString(6, infoObj.getRentReasonComment());
						else
							psObj.setNull(6, Types.NULL);
						
						psObj.setShort(7, infoObj.getBedroomCount());
						psObj.setShort(8, infoObj.getBathroomCount());
						psObj.setShort(9, infoObj.getSeprateWC());
						psObj.setBoolean(10, infoObj.isFurnished());
						
						psObj.setBoolean(11, infoObj.isFlooring());
						if(infoObj.getFlooringComments() != null)
							psObj.setString(12, infoObj.getFlooringComments());
						else
							psObj.setNull(12, Types.NULL);
						
						psObj.setBoolean(13, infoObj.isCurtains());
						if(infoObj.getCurtainsComments() != null)
							psObj.setString(14, infoObj.getCurtainsComments());
						else
							psObj.setNull(14, Types.NULL);
						
						psObj.setBoolean(15, infoObj.isFrontGarden());
						if(infoObj.getFrontGardenComments() != null)
							psObj.setString(16, infoObj.getFrontGardenComments());
						else
							psObj.setNull(16, Types.NULL);
						
						psObj.setBoolean(17, infoObj.isRearGarden());
						if(infoObj.getRearGardenComments() != null)
							psObj.setString(18, infoObj.getRearGardenComments());
						else
							psObj.setNull(18, Types.NULL);
						
						psObj.setBoolean(19, infoObj.isWheelChairAccess());
						if(infoObj.getWheelChairAccessComments() != null)
							psObj.setString(20, infoObj.getWheelChairAccessComments());
						else
							psObj.setNull(20, Types.NULL);
						
						psObj.setBoolean(21, infoObj.isExtraStairs());
						if(infoObj.getExtraStairsComments() != null)
							psObj.setString(22, infoObj.getExtraStairsComments());
						else
							psObj.setNull(22, Types.NULL);
						
						if(infoObj.getOtherPropertyInformation() != null)
							psObj.setString(23, infoObj.getOtherPropertyInformation());
						else
							psObj.setNull(23, Types.NULL);
						psObj.setLong(24, infoObj.getPropertyId());
						
						
					return psObj;
				}
			}, keyHolder);
			
			if(keyHolder.getKey() != null)
				return keyHolder.getKey().longValue();
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@Override
	public Long updateMarketingInfo(final PropertyMarketingInformation infoObj) {
		try{

			final String sql = "UPDATE " + PropertyMarketingInformation.TABLE_NAME + " SET " + PropertyMarketingInformation.AVAILABILITY + " = ? , " + PropertyMarketingInformation.RENT_AMOUNT + " = ? , "
			 					 + PropertyMarketingInformation.PROPERTY_TYPE + " = ? , " + PropertyMarketingInformation.PROPERTY_OTHER_TYPE + " = ? , " + PropertyMarketingInformation.RENT_PERIOD + " = ? , "
			 					+ PropertyMarketingInformation.RENT_REASON_COMMENT + " = ? , "
			 					 + PropertyMarketingInformation.BEDROOM_COUNT + " = ? , " + PropertyMarketingInformation.BATHROOM_COUNT + " = ? , " + PropertyMarketingInformation.SEPERATE_WC + " = ? , "
						         + PropertyMarketingInformation.FURNISHED + " = ? , "
						         + PropertyMarketingInformation.FLOORING + " = ? , " + PropertyMarketingInformation.FLOORING_COMMENTS + " = ? , "
						         + PropertyMarketingInformation.CURTAIN + " = ? , " + PropertyMarketingInformation.CURTAIN_COMMENTS + " = ? , "
						         + PropertyMarketingInformation.FRONT_GARDEN + " = ? , " + PropertyMarketingInformation.FRONT_GARDEN_COMMENTS + " = ? , "
						         + PropertyMarketingInformation.REAR_GARDEN + " = ? , " + PropertyMarketingInformation.REAR_GARDEN_COMMENTS + " = ? , "
						         + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS + " = ? , " + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS_COMMENTS + " = ? , "
						         + PropertyMarketingInformation.EXTRA_STAIR + " = ? , " + PropertyMarketingInformation.EXTRA_STAIR_COMMENTS + " = ? , " + PropertyMarketingInformation.OTHER_PROPERTY_INFORMATION + " = ? "
						         + " WHERE " 
						         + PropertyMarketingInformation.PROPERTY_ID + " = ?";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						psObj.setString(1, infoObj.getAvailability());
						psObj.setString(2, infoObj.getRentAmount());
						psObj.setString(3, infoObj.getPropertyType());
						if(infoObj.getPropertyOtherType() != null)
							psObj.setString(4, infoObj.getPropertyOtherType());
						else
							psObj.setNull(4, Types.NULL);
						
						psObj.setString(5, infoObj.getRentPeriod());
						
						if(infoObj.getRentReasonComment() != null)
							psObj.setString(6, infoObj.getRentReasonComment());
						else
							psObj.setNull(6, Types.NULL);
						
						psObj.setShort(7, infoObj.getBedroomCount());
						psObj.setShort(8, infoObj.getBathroomCount());
						psObj.setShort(9, infoObj.getSeprateWC());
						psObj.setBoolean(10, infoObj.isFurnished());
						
						psObj.setBoolean(11, infoObj.isFlooring());
						if(infoObj.getFlooringComments() != null)
							psObj.setString(12, infoObj.getFlooringComments());
						else
							psObj.setNull(12, Types.NULL);
						
						psObj.setBoolean(13, infoObj.isCurtains());
						if(infoObj.getCurtainsComments() != null)
							psObj.setString(14, infoObj.getCurtainsComments());
						else
							psObj.setNull(14, Types.NULL);
						
						psObj.setBoolean(15, infoObj.isFrontGarden());
						if(infoObj.getFrontGardenComments() != null)
							psObj.setString(16, infoObj.getFrontGardenComments());
						else
							psObj.setNull(16, Types.NULL);
						
						psObj.setBoolean(17, infoObj.isRearGarden());
						if(infoObj.getRearGardenComments() != null)
							psObj.setString(18, infoObj.getRearGardenComments());
						else
							psObj.setNull(18, Types.NULL);
						
						psObj.setBoolean(19, infoObj.isWheelChairAccess());
						if(infoObj.getWheelChairAccessComments() != null)
							psObj.setString(20, infoObj.getWheelChairAccessComments());
						else
							psObj.setNull(20, Types.NULL);
						
						psObj.setBoolean(21, infoObj.isExtraStairs());
						if(infoObj.getExtraStairsComments() != null)
							psObj.setString(22, infoObj.getExtraStairsComments());
						else
							psObj.setNull(22, Types.NULL);
						
						if(infoObj.getOtherPropertyInformation() != null)
							psObj.setString(23, infoObj.getOtherPropertyInformation());
						else
							psObj.setNull(23, Types.NULL);
						
						psObj.setLong(24, infoObj.getPropertyId());
						
					return psObj;
				}
			});
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	@Override
	public boolean updatePropertyDetails(final Property propertyObj, final Long modifiedUserId){
		try{
			String sql = "UPDATE " + Property.TABLE_NAME + " SET " + Property.CONTACT_PERSON + " = ?, " + Property.AGENT_NAME + " = ?, " + Property.AGENT_CONTACT_NUMBER + " = ?, "
					 + Property.AGENT_ADDRESS_LINE + " = ?, "
					+ Property.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Property.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + Property.ID + " = ? ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setString(1 , propertyObj.getContactPerson());
				if(propertyObj.getAgentName() != null)
					psObj.setString(2 , propertyObj.getAgentName());
				else
					psObj.setNull(2, Types.NULL);
				if(propertyObj.getAgentContactNumber() != null)
					psObj.setString(3 , propertyObj.getAgentContactNumber());
				else
					psObj.setNull(3, Types.NULL);
				if(propertyObj.getAgentAddressLine() != null)
					psObj.setString(4 , propertyObj.getAgentAddressLine());
				else
					psObj.setNull(4, Types.NULL);
				psObj.setLong(5, modifiedUserId);
				psObj.setLong(6, propertyObj.getId());
			}
		});
		 		return true;
		}catch (Exception e) {
			e.printStackTrace(); 
			return false;
		}
	}
	
	@Override
	public boolean updatePropertyResponse(final PropertyResponse responseObj, final Long modifiedUserId){
		try{
			String sql = "UPDATE " + PropertyResponse.TABLE_NAME + " SET " + PropertyResponse.COMMENTS + " = ?, " + PropertyResponse.DOCUMENT_ID + " = ?, " + PropertyResponse.RESPONSE + " = ?, "
					+ PropertyResponse.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PropertyResponse.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + PropertyResponse.PROPERTY_ID + " = ? AND " + PropertyResponse.FIELD_NAME + " = ? ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql + " FieldName : " + responseObj.getFieldName() + " PropertyId : " + 17);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				if(responseObj.getComments() != null)
					psObj.setString(1 , responseObj.getComments());
				else
					psObj.setNull(1, Types.NULL);
				if(responseObj.getDocumentId() != null)
					psObj.setLong(2 , responseObj.getDocumentId());
				else
					psObj.setNull(2, Types.NULL);
				if(responseObj.getResponse() != null)
					psObj.setString(3, responseObj.getResponse());
				else
					psObj.setNull(3, Types.NULL);
				psObj.setLong(4, modifiedUserId);
				psObj.setLong(5, responseObj.getPropertyId());
				psObj.setString(6, responseObj.getFieldName());
			}
		});
		 		return true;
		}catch (Exception e) {
			e.printStackTrace(); 
			return false;
		}
	}
	
	@Override
	public boolean updatePropertyFile(final PropertyResponse responseObj, final Long modifiedUserId){
		try{
			String sql = "UPDATE " + PropertyResponse.TABLE_NAME + " SET " + PropertyResponse.DOCUMENT_ID + " = ?, " 
					+ PropertyResponse.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PropertyResponse.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + PropertyResponse.PROPERTY_ID + " = ? AND " + PropertyResponse.FIELD_NAME + " = ? ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql + " FieldName : " + responseObj.getFieldName() + " PropertyId : " + 17);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setLong(1 , responseObj.getDocumentId());
					psObj.setLong(2, modifiedUserId);
					psObj.setLong(3, responseObj.getPropertyId());
					psObj.setString(4, responseObj.getFieldName());
			}
		});
		 		return true;
		}catch (Exception e) {
			e.printStackTrace(); 
			return false;
		}
	}
	
	public boolean updateFile(final PropertyResponse responseObj, final Long modifiedUserId){
		try{
			String sql = "UPDATE " + PropertyResponse.TABLE_NAME + " SET " + PropertyResponse.DOCUMENT_ID + " = ?, " 
					+ PropertyResponse.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PropertyResponse.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + PropertyResponse.FIELD_NAME + " = ? AND " + PropertyResponse.ID + " = ?";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql + " FieldName : " + responseObj.getFieldName() + " PropertyId : " + 17);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				if(responseObj.getDocumentId() != null)
					psObj.setLong(1 , responseObj.getDocumentId());
				else
					psObj.setNull(1, Types.NULL);
				psObj.setLong(2, modifiedUserId);
				psObj.setLong(3, responseObj.getId());
			}
		});
		 		return true;
		}catch (Exception e) {
			e.printStackTrace(); 
			return false;
		}
	}

	@Override
	public void approveProperty(final Property propertyObj,final Long userId) {
		System.out.println(propertyObj.toString());
		String sql = "UPDATE " + Property.TABLE_NAME + " SET " + Property.STATUS_ID + " = ?, " 
					+ Property.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Property.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + Property.ID  + " = ? " ;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(1, Status.APPROVED.id());
				psObj.setLong(2, userId);
				psObj.setLong(3, propertyObj.getId());
				
			}
		});
	}
	
	@Override
	public void disApproveProperty(final Property propertyObj,final Long userId) {
		String sql = "UPDATE " + Property.TABLE_NAME + " SET " + Property.STATUS_ID + " = ?, " 
					+ Property.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Property.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + Property.ID  + " = ? ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(1, Status.UNAPPROVED.id());
				psObj.setLong(2, userId);
				psObj.setLong(3, propertyObj.getId());
			}
		});
	}
	
	@Override
	public Property loadPropertyById(Long id){
		
		String sql = " SELECT ua." + Property.ID + ", ua." + Property.UNIQUE_REFERENCE + ", ua." + Property.CONTACT_PERSON + ", ua." + Property.AGENT_NAME+ ", ua." + Property.AGENT_ADDRESS_LINE
				     + ", ua." + Property.AGENT_CONTACT_NUMBER + ", ua." + Property.STATUS_ID  + ", ua." + Property.CREATED_ON +  ", ua." + Property.MODIFIED_ON
				     + ", ua." + Property.STATUS_PERCENTAGE + ", ua." + Property.LANDLORD_ID
				     + ", x1." + UserLogin.USERNAME + " AS "+ Property.CREATED_BY
				     + ", x2." + UserLogin.USERNAME + " AS "+ Property.MODIFIED_BY
				     + " FROM " + Property.TABLE_NAME + " ua "
					 +" LEFT JOIN users x1 ON ua." + Property.CREATED_USER_ID + "= x1." + UserLogin.ID
					 +" LEFT JOIN users x2 ON ua." + Property.MODIFIED_USER_ID + "= x2." + UserLogin.ID
				     + " WHERE ua." + Property.ID + " = " + id;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Property> propertyList = jdbcTemplate.query(sql, new RowMapper<Property>() {
	
			@Override
			public Property mapRow(ResultSet rst, int arg1) throws SQLException {
				Property obj = new Property();
					obj.setId(rst.getLong(Property.ID));
					obj.setUniqueReference(rst.getString(Property.UNIQUE_REFERENCE));
					obj.setContactPerson(rst.getString(Property.CONTACT_PERSON));
					obj.setStatusId(rst.getShort(Property.STATUS_ID));
					obj.setAgentName(rst.getString(Property.AGENT_NAME));
					obj.setAgentAddressLine(rst.getString(Property.AGENT_ADDRESS_LINE));
					obj.setAgentContactNumber(rst.getString(Property.AGENT_CONTACT_NUMBER));
					obj.setStatusPercentage(rst.getInt(Property.STATUS_PERCENTAGE));
					obj.setLandlordId(rst.getLong(Property.LANDLORD_ID));
					obj.setCreatedOn(rst.getDate(Property.CREATED_ON));
					obj.setModifiedOn(rst.getDate(Property.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(Property.CREATED_BY));
					obj.setModifiedBy(rst.getString(Property.MODIFIED_BY));
					
					
				return obj;
			}
		});
	
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList.get(0);
	
		return null;
	}
	
	public boolean isPropertyApproved(Long propertyId){
		String sql = " SELECT ua." + Property.ID + ", ua." + Property.UNIQUE_REFERENCE + ", ua." + Property.CONTACT_PERSON + ", ua." + Property.AGENT_NAME+ ", ua." + Property.AGENT_ADDRESS_LINE
				     + ", ua." + Property.AGENT_CONTACT_NUMBER + ", ua." + Property.STATUS_ID  + ", ua." + Property.CREATED_ON +  ", ua." + Property.MODIFIED_ON
				     + ", ua." + Property.STATUS_PERCENTAGE + ", ua." + Property.LANDLORD_ID
				     + ", x1." + UserLogin.USERNAME + " AS "+ Property.CREATED_BY
				     + ", x2." + UserLogin.USERNAME + " AS "+ Property.MODIFIED_BY
				     + " FROM " + Property.TABLE_NAME + " ua "
					 +" LEFT JOIN users x1 ON ua." + Property.CREATED_USER_ID + "= x1." + UserLogin.ID
					 +" LEFT JOIN users x2 ON ua." + Property.MODIFIED_USER_ID + "= x2." + UserLogin.ID
				     + " WHERE ua." + Property.ID + " = " + propertyId  + " AND ua." + Property.STATUS_ID + " = " + Status.APPROVED.id();
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Property> propertyList = jdbcTemplate.query(sql, new RowMapper<Property>() {
	
			@Override
			public Property mapRow(ResultSet rst, int arg1) throws SQLException {
				Property obj = new Property();
					obj.setId(rst.getLong(Property.ID));
					obj.setUniqueReference(rst.getString(Property.UNIQUE_REFERENCE));
					obj.setContactPerson(rst.getString(Property.CONTACT_PERSON));
					obj.setStatusId(rst.getShort(Property.STATUS_ID));
					obj.setAgentName(rst.getString(Property.AGENT_NAME));
					obj.setAgentAddressLine(rst.getString(Property.AGENT_ADDRESS_LINE));
					obj.setAgentContactNumber(rst.getString(Property.AGENT_CONTACT_NUMBER));
					obj.setStatusPercentage(rst.getInt(Property.STATUS_PERCENTAGE));
					obj.setLandlordId(rst.getLong(Property.LANDLORD_ID));
					obj.setCreatedOn(rst.getDate(Property.CREATED_ON));
					obj.setModifiedOn(rst.getDate(Property.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(Property.CREATED_BY));
					obj.setModifiedBy(rst.getString(Property.MODIFIED_BY));
					
				return obj;
			}
		});
	
	System.out.println("propertyList  =========     "+propertyList);	
	
	if(propertyList != null && !propertyList.isEmpty())
		return true;
	else
		return false;
	}
	
	
	
	@Override
	public List<Property> loadAll(Integer start, Integer limit){
		
		String sql = " SELECT ua." + Property.ID + ", ua." + Property.UNIQUE_REFERENCE + ", ua." + Property.CONTACT_PERSON + ", ua." + Property.AGENT_NAME+ ", ua." + Property.AGENT_ADDRESS_LINE
			     + ", ua." + Property.AGENT_CONTACT_NUMBER + ", ua." + Property.STATUS_ID  + ", ua." + Property.CREATED_ON +  ", ua." + Property.MODIFIED_ON
			     + ", ua." + Property.STATUS_PERCENTAGE + ", ua." + Property.LANDLORD_ID
			     + ", x1." + UserLogin.USERNAME + " AS "+ Property.CREATED_BY
			     + ", x2." + UserLogin.USERNAME + " AS "+ Property.MODIFIED_BY
			     + " FROM " + Property.TABLE_NAME + " ua "
				 + " LEFT JOIN users x1 ON ua." + Property.CREATED_USER_ID + "= x1." + UserLogin.ID
				 + " LEFT JOIN users x2 ON ua." + Property.MODIFIED_USER_ID + "= x2." + UserLogin.ID;
		
				if(start != null && limit != null){
					sql += " LIMIT ( " + start + ", " + limit + " ) ";
				}
				
				sql += " ORDER BY ua." + Property.CREATED_ON + " DESC ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Property> propertyList = jdbcTemplate.query(sql, new RowMapper<Property>() {
	
			@Override
			public Property mapRow(ResultSet rst, int arg1) throws SQLException {
				Property obj = new Property();
					obj.setId(rst.getLong(Property.ID));
					obj.setUniqueReference(rst.getString(Property.UNIQUE_REFERENCE));
					obj.setContactPerson(rst.getString(Property.CONTACT_PERSON));
					obj.setAgentName(rst.getString(Property.AGENT_NAME));
					obj.setAgentAddressLine(rst.getString(Property.AGENT_ADDRESS_LINE));
					obj.setAgentContactNumber(rst.getString(Property.AGENT_CONTACT_NUMBER));
					obj.setStatusPercentage(rst.getInt(Property.STATUS_PERCENTAGE));
					obj.setLandlordId(rst.getLong(Property.LANDLORD_ID));
					obj.setStatusId(rst.getShort(Property.STATUS_ID));
					obj.setCreatedOn(rst.getDate(Property.CREATED_ON));
					obj.setModifiedOn(rst.getDate(Property.MODIFIED_ON));
					obj.setCreatedBy(rst.getString(Property.CREATED_BY));
					obj.setModifiedBy(rst.getString(Property.MODIFIED_BY));
				return obj;
			}
		});
		
	if(propertyList != null && !propertyList.isEmpty())
		return propertyList;
	
		return null;
	}
	
	@Override
	public PropertyMarketingInformation loadMarketingInfoByPropertyId(Long propertyId){
		
		String sql = " SELECT ua." + PropertyMarketingInformation.ID + ", ua." + PropertyMarketingInformation.AVAILABILITY + ", ua." + PropertyMarketingInformation.RENT_AMOUNT + ", ua." + PropertyMarketingInformation.PROPERTY_TYPE
				     + ", ua." + PropertyMarketingInformation.PROPERTY_OTHER_TYPE + ", ua." + PropertyMarketingInformation.RENT_PERIOD
				     + ", ua." + PropertyMarketingInformation.RENT_REASON_COMMENT
 				     + ", ua." + PropertyMarketingInformation.BEDROOM_COUNT + ", ua." + PropertyMarketingInformation.BATHROOM_COUNT + ", ua." + PropertyMarketingInformation.SEPERATE_WC
				     + ", ua." + PropertyMarketingInformation.FURNISHED
				     + ", ua." + PropertyMarketingInformation.FLOORING + ", ua." + PropertyMarketingInformation.FLOORING_COMMENTS
				     + ", ua." + PropertyMarketingInformation.CURTAIN + ", ua." + PropertyMarketingInformation.CURTAIN_COMMENTS
				     + ", ua." + PropertyMarketingInformation.FRONT_GARDEN + ", ua." + PropertyMarketingInformation.FRONT_GARDEN_COMMENTS
				     + ", ua." + PropertyMarketingInformation.REAR_GARDEN + ", ua." + PropertyMarketingInformation.REAR_GARDEN_COMMENTS
				     + ", ua." + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS + ", ua." + PropertyMarketingInformation.WHEEL_CHAIR_ACCESS_COMMENTS
				     + ", ua." + PropertyMarketingInformation.EXTRA_STAIR + ", ua." + PropertyMarketingInformation.EXTRA_STAIR_COMMENTS + ", ua." + PropertyMarketingInformation.OTHER_PROPERTY_INFORMATION
				     + " FROM " + PropertyMarketingInformation.TABLE_NAME + " ua WHERE " + PropertyMarketingInformation.PROPERTY_ID + " = " + propertyId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<PropertyMarketingInformation> infoList = jdbcTemplate.query(sql, new PropertMarketingInformationMapper());	
		
	if(infoList != null && !infoList.isEmpty())
		return infoList.get(0);
	
		return null;
	}
	
	@Override
	public List<Property> loadPropertyByLandlord(LandLord landlord){
		
		String sql = " SELECT ua." + Property.ID + ", ua." + Property.UNIQUE_REFERENCE + ", ua." + Property.CONTACT_PERSON + ", ua." + Property.AGENT_NAME+ ", ua." + Property.AGENT_ADDRESS_LINE
				     + ", ua." + Property.AGENT_CONTACT_NUMBER + ", ua." + Property.STATUS_PERCENTAGE + ", ua." + Property.STATUS_ID
				     + ", ua." + Property.LANDLORD_ID  + " FROM " + Property.TABLE_NAME + " ua WHERE " + Property.LANDLORD_ID + " = " +landlord.getId()
		             + " ORDER BY " + Property.CREATED_ON + " DESC ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		List<Property> propertyList = jdbcTemplate.query(sql, new RowMapper<Property>() {
	
			@Override
			public Property mapRow(ResultSet rst, int arg1) throws SQLException {
				Property obj = new Property();
					obj.setId(rst.getLong(Property.ID));
					obj.setUniqueReference(rst.getString(Property.UNIQUE_REFERENCE));
					obj.setContactPerson(rst.getString(Property.CONTACT_PERSON));
					obj.setAgentName(rst.getString(Property.AGENT_NAME));
					obj.setAgentAddressLine(rst.getString(Property.AGENT_ADDRESS_LINE));
					obj.setAgentContactNumber(rst.getString(Property.AGENT_CONTACT_NUMBER));
					obj.setStatusPercentage(rst.getInt(Property.STATUS_PERCENTAGE));
					obj.setLandlordId(rst.getLong(Property.LANDLORD_ID));
					obj.setStatusId(rst.getShort(Property.STATUS_ID));
				return obj;
			}
		});
		
	if(propertyList != null && !propertyList.isEmpty())
		return propertyList;
	
		return null;
	}
	
	public PropertyResponse loadPropertyResponseByFieldName(Long propertyId, String fieldName){
		String sql = "SELECT ua." + PropertyResponse.ID + ", ua." + PropertyResponse.COMMENTS + ", ua." + PropertyResponse.DOCUMENT_ID + ", ua." + PropertyResponse.FIELD_NAME
			 	+ ", ua." + PropertyResponse.RESPONSE 
			 	+ ", x1." + File.FILE_NAME + ", x1." + File.SIZE + ", x1." + File.CONTENT_TYPE + ", x1." + File.ID  + " AS fileId" + ", x1." + File.FILE_PATH
			 	+" FROM " + PropertyResponse.TABLE_NAME + " ua "
			 	+ " LEFT JOIN " + File.TABLE_NAME + " x1 ON ua." +PropertyResponse.DOCUMENT_ID + " = x1." + File.ID 
				+ " WHERE " + PropertyResponse.PROPERTY_ID + " = " + propertyId + " AND " + PropertyResponse.FIELD_NAME + " = '" + fieldName + "'";
	
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	List<PropertyResponse> responseList = jdbcTemplate.query(sql, new RowMapper<PropertyResponse>() {
		
		@Override
		public PropertyResponse mapRow(ResultSet rst, int arg1) throws SQLException {
			PropertyResponse obj = new PropertyResponse();
				obj.setId(rst.getLong(PropertyResponse.ID));
				obj.setComments(rst.getString(PropertyResponse.COMMENTS));
				obj.setResponse(rst.getString(PropertyResponse.RESPONSE));
				obj.setFieldName(rst.getString(PropertyResponse.FIELD_NAME));
				obj.setDocumentId(rst.getLong(PropertyResponse.DOCUMENT_ID));
				
				File fileObj = new File();
					fileObj.setFilePath(rst.getString(File.FILE_PATH));
					fileObj.setFileName(rst.getString(File.FILE_NAME));
					fileObj.setId(rst.getLong("fileId"));
					fileObj.setSize(rst.getLong(File.SIZE));
					fileObj.setContentType(rst.getString(File.CONTENT_TYPE));
				obj.setFileObj(fileObj);
					
			return obj;
		}
	});
	
	if(responseList != null && !responseList.isEmpty())
		return responseList.get(0);
	
	return null;
	}
	
	@Override
	public boolean disableProperty(final Long propertyId){
		
		String sql = "UPDATE " + Property.TABLE_NAME + " SET " + Property.ENABLE + " = ? WHERE " + Property.ID  + " = ? ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setBoolean(1, false);
				psObj.setLong(2, propertyId);
			}
		});
	 		return true;
		
	}
	
	public boolean enableProperty(final Long propertyId){
		String sql = "UPDATE " + Property.TABLE_NAME + " SET " + Property.ENABLE + " = ? WHERE " + Property.ID  + " = ? ";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setBoolean(1, true);
				psObj.setLong(2, propertyId);
			}
		});
	 		return true;
		
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
	public boolean deleteProperty(Long propertyObjId){
		boolean status = false;
		String sql = "DELETE FROM " + Property.TABLE_NAME + " WHERE " + Property.ID + " = " + propertyObjId;
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		try{
			jdbcTemplate.update(sql);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
			status = false;
		}
		return status;
	}

}
