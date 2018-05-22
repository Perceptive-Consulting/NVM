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
import com.pcs.perpetualRents.business.bean.PDDocuments;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.PropertyDeveloperDAO;
import com.pcs.perpetualRents.dao.mapper.PropertyDeveloperMapper;
import com.pcs.perpetualRents.enm.PdDocumentsStatus;
import com.pcs.perpetualRents.enm.Status;

@Repository
public class PropertyDeveloperDAOImpl implements PropertyDeveloperDAO {

	private static Logger logger = ApplicationSettings.getLogger(PropertyDeveloperDAOImpl.class.getName());
		@Autowired
		private JdbcTemplate jdbcTemplate;
		@Autowired
		private DevelopmentSettings developmentSettings;
		
		@Override
		public Long createPropertyDeveloper(final PropertyDeveloper propertyDeveloperObj, final Long userId) {
			
			KeyHolder keyHolder = new GeneratedKeyHolder();
			final String sql = "INSERT INTO " + PropertyDeveloper.TABLE_NAME + " ( " + PropertyDeveloper.FIRST_NAME + ", " + PropertyDeveloper.LAST_NAME + ", " + PropertyDeveloper.PRIMARY_EMAIL_ID
								+ ", " + PropertyDeveloper.SECONDARY_EMAIL_ID + ", " + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", " + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", " + PropertyDeveloper.CREATED_USER_ID
								+ ", " + PropertyDeveloper.USER_LOGIN_ID + ", " + PropertyDeveloper.UNIQUE_REFERENCE
								+ " ) "
								+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				
				@Override
				public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
					PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
						psObj.setString(1, propertyDeveloperObj.getFirstName());
						psObj.setString(2, propertyDeveloperObj.getLastName());
						psObj.setString(3, propertyDeveloperObj.getPrimaryEmailId());
						if(propertyDeveloperObj.getSecondaryEmailId() != null)
							psObj.setString(4, propertyDeveloperObj.getSecondaryEmailId());
						else
							psObj.setNull(4, Types.NULL);
						psObj.setString(5, propertyDeveloperObj.getPrimaryPhoneNumber());
						if(propertyDeveloperObj.getSecondaryPhoneNumber() != null)
							psObj.setString(6, propertyDeveloperObj.getSecondaryPhoneNumber());
						else
							psObj.setNull(6, Types.NULL);
						if(propertyDeveloperObj.getCreatedUserId() != null)
							psObj.setLong(7, userId);
						else
							psObj.setNull(7, Types.NULL);
						psObj.setLong(8, propertyDeveloperObj.getUserLoginId());
						psObj.setString(9, propertyDeveloperObj.getUniqueReference());
					return psObj;
				}
			}, keyHolder);
			
			return keyHolder.getKey().longValue();
		}


		@Override
		public PropertyDeveloper loadPropertyDeveloperById(final Long id) {
			
				String sql = "SELECT ua." + PropertyDeveloper.ID + ", ua." + PropertyDeveloper.FIRST_NAME + ", ua." + PropertyDeveloper.LAST_NAME + ", ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + ", ua." + PropertyDeveloper.SECONDARY_EMAIL_ID
					     + ", ua." + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.UNIQUE_REFERENCE
					     + ", ua." + PropertyDeveloper.USER_LOGIN_ID 
					     + ", ua." + PropertyDeveloper.CREATED_ON + ", ua." + PropertyDeveloper.MODIFIED_ON
					     + ", x2." + UserLogin.USERNAME + " AS " + PropertyDeveloper.CREATED_BY
					     + ", x3." + UserLogin.USERNAME + " AS " + PropertyDeveloper.MODIFIED_BY
					     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
					     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + PropertyDeveloper.USER_LOGIN_ID
					     +", ( SELECT COUNT(*) FROM " + PDProperty.TABLE_NAME + " WHERE " + PDProperty.PROPERTYDEVELOPER_ID + " = ua." + PropertyDeveloper.ID + " ) AS " + PropertyDeveloper.PROPERTY_COUNT 
					     + " FROM " + PropertyDeveloper.TABLE_NAME + " ua "
					     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + PropertyDeveloper.USER_LOGIN_ID + " = x1." + UserLogin.ID
					     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + PropertyDeveloper.CREATED_USER_ID + " = x2." + UserLogin.ID
					     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + PropertyDeveloper.MODIFIED_USER_ID + " = x3." + UserLogin.ID
					     + " WHERE ua." + PropertyDeveloper.ID + " = ?";

				if(developmentSettings.isShowSQL())
					logger.info(sql);
				
				List<PropertyDeveloper> PropertyDeveloperList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
			
						@Override
						public void setValues(PreparedStatement arg0) throws SQLException {
							arg0.setLong(1, id);
						}
					},	new PropertyDeveloperMapper());
				
				if(PropertyDeveloperList != null && !PropertyDeveloperList.isEmpty())
					return PropertyDeveloperList.get(0);

				return null;
			}

		@Override
		public PropertyDeveloper loadPropertyDeveloperObjByLoginId(Long userLoginId) {
			String sql = "SELECT ua." + PropertyDeveloper.ID + ", ua." + PropertyDeveloper.FIRST_NAME + ", ua." + PropertyDeveloper.LAST_NAME + ", ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + ", ua." + PropertyDeveloper.SECONDARY_EMAIL_ID
				     + ", ua." + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.UNIQUE_REFERENCE
				     + ", ua." + PropertyDeveloper.USER_LOGIN_ID 
				     + ", ua." + PropertyDeveloper.CREATED_ON + ", ua." + PropertyDeveloper.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + PropertyDeveloper.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + PropertyDeveloper.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
				     +", ( SELECT COUNT(*) FROM " + PDProperty.TABLE_NAME + " WHERE " + PDProperty.PROPERTYDEVELOPER_ID + " = ua." + PropertyDeveloper.ID + " ) AS " + PropertyDeveloper.PROPERTY_COUNT 
				     + " FROM " + PropertyDeveloper.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + PropertyDeveloper.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + PropertyDeveloper.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + PropertyDeveloper.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE " + PropertyDeveloper.USER_LOGIN_ID + " = " + userLoginId;
	
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PropertyDeveloper> propertyDeveloperList = jdbcTemplate.query(sql, new PropertyDeveloperMapper());
			if(propertyDeveloperList != null && !propertyDeveloperList.isEmpty())
				return propertyDeveloperList.get(0);
	
			return null;
	    }

		@Override
		public boolean updatePropertyDeveloper(final PropertyDeveloper propertyDeveloperObj) {
			String sql = "UPDATE " + PropertyDeveloper.TABLE_NAME + " SET " + PropertyDeveloper.FIRST_NAME + " = ?, " + PropertyDeveloper.LAST_NAME + " = ?, " + PropertyDeveloper.PRIMARY_EMAIL_ID + " = ?, "
					+ PropertyDeveloper.PRIMARY_PHONE_NUMBER + " = ?, " + PropertyDeveloper.SECONDARY_EMAIL_ID + " = ?, " + PropertyDeveloper.SECONDARY_PHONE_NUMBER + " = ? "
					+ " WHERE " + PropertyDeveloper.ID + " = ? ";
		
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setString(1 , propertyDeveloperObj.getFirstName());
				psObj.setString(2 , propertyDeveloperObj.getLastName());
				psObj.setString(3, propertyDeveloperObj.getPrimaryEmailId());
				psObj.setString(4, propertyDeveloperObj.getPrimaryPhoneNumber());
				if(propertyDeveloperObj.getSecondaryEmailId() != null)
					psObj.setString(5, propertyDeveloperObj.getSecondaryEmailId());
				else
					psObj.setNull(5, Types.NULL);
				if(propertyDeveloperObj.getSecondaryPhoneNumber() != null)
					psObj.setString(6, propertyDeveloperObj.getSecondaryPhoneNumber());
				else
					psObj.setNull(6, Types.NULL);
				psObj.setLong(7, propertyDeveloperObj.getId());
			}
		});
			return true;
		}

		@Override
		public PropertyDeveloper loadPropertyDeveloperByLoginId(Long userLoginId) {
		
			String sql = "SELECT ua." + PropertyDeveloper.ID + ", ua." + PropertyDeveloper.FIRST_NAME + ", ua." + PropertyDeveloper.LAST_NAME + ", ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + ", ua." + PropertyDeveloper.SECONDARY_EMAIL_ID
				     + ", ua." + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.UNIQUE_REFERENCE
				     + ", ua." + PropertyDeveloper.USER_LOGIN_ID 
				     + ", ua." + PropertyDeveloper.CREATED_ON + ", ua." + PropertyDeveloper.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + PropertyDeveloper.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + PropertyDeveloper.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID
				     +", ( SELECT COUNT(*) FROM " + PDProperty.TABLE_NAME + " WHERE " + PDProperty.PROPERTYDEVELOPER_ID + " = ua." + PropertyDeveloper.ID + " ) AS " + PropertyDeveloper.PROPERTY_COUNT 
				     + " FROM " + PropertyDeveloper.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + PropertyDeveloper.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + PropertyDeveloper.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + PropertyDeveloper.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE " + PropertyDeveloper.USER_LOGIN_ID + " = " + userLoginId;
	
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PropertyDeveloper> propertyDeveloperList = jdbcTemplate.query(sql, new PropertyDeveloperMapper());
	
			if(propertyDeveloperList != null && !propertyDeveloperList.isEmpty())
				return propertyDeveloperList.get(0);
	
				return null;
		}

		@Override
		public Long savePropertyDetails(final PDProperty pdPropertyObj, final Long createdUserId) {
				KeyHolder keyHolder = new GeneratedKeyHolder();
				final String sql = "INSERT INTO " + PDProperty.TABLE_NAME + "( " + PDProperty.UNIQUE_REFERENCE
						       + ", " + PDProperty.CONTACT_PERSON +  ", " + PDProperty.PROPERTYDEVELOPER_ID
						       + ", " + PDProperty.STATUS_ID + ", " + PDProperty.TYPE_OF_PROPOSED_PROPERTY 
						       + ", " + PDProperty.NUMBER_OF_UNITS + ", " + PDProperty.ENERGY_SAVING_FEATURES
						       + ", " + PDProperty.ESTIMATED_START_DATE + ", " + PDProperty.TIME_TO_COMPLETE_SCEME
						       + ", " + PDProperty.CREATED_USER_ID + ", " + PDProperty.DESCRIPTION
						       + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
				if(developmentSettings.isShowSQL())
					logger.info(sql);
				
				jdbcTemplate.update(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
						PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
								psObj.setString(1, pdPropertyObj.getUniqueReference());
								psObj.setString(2, pdPropertyObj.getContactPerson());
								psObj.setLong(3, pdPropertyObj.getPropertyDeveloperId());  
								psObj.setLong(4, pdPropertyObj.getStatusId());
								psObj.setString(5, pdPropertyObj.getTypeOfProposedProp());
								psObj.setString(6, pdPropertyObj.getNoOfUnits());  
								psObj.setString(7, pdPropertyObj.getEnergySavingFeatures());
								psObj.setString(8, pdPropertyObj.getEstimatedStartDate());
								psObj.setString(9, pdPropertyObj.getTimeToCompleteSceme());
								psObj.setLong(10, createdUserId);
								psObj.setString(11,  pdPropertyObj.getDescription());
							
						return psObj;
					}
				}, keyHolder);
				
				if(keyHolder.getKey() != null)
					return keyHolder.getKey().longValue();
				
				return null;
		}
		
		@Override
		public Long savePropertyDocuments(final PDDocuments documentsObj, final Long createdUserId) {
				KeyHolder keyHolder = new GeneratedKeyHolder();
				final String sql = "INSERT INTO " + PDDocuments.TABLE_NAME + "( " + PDDocuments.PROPERTYDEVELOPER_ID
						       + ", " + PDDocuments.PROPERTY_ID +  ", " + PDDocuments.FILE_ID
						       + ", " + PDDocuments.DOCUMENT_TYPE_ID + ", " + PDDocuments.FILE_NAME + ", " + PDDocuments.STATUS_ID 
						       + ", " + PDProperty.CREATED_USER_ID  + ", " + PDProperty.DESCRIPTION
						       + " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				
				if(developmentSettings.isShowSQL())
					logger.info(sql);
				
				jdbcTemplate.update(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
						PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
								psObj.setLong(1, documentsObj.getPropertyDeveloperId());
								psObj.setLong(2, documentsObj.getPropertyId());
								psObj.setLong(3, documentsObj.getFileId());  
								psObj.setLong(4, documentsObj.getDocumentTypeId());
								psObj.setString(5, documentsObj.getFileName());
								psObj.setInt(6, documentsObj.getStatusId());
								psObj.setLong(7, createdUserId);
								psObj.setString(8, documentsObj.getDescription());
							
						return psObj;
					}
					
				}, keyHolder);
				
				if(keyHolder.getKey() != null){
					documentsObj.setId(keyHolder.getKey().longValue());
					return keyHolder.getKey().longValue();
				}
				
				return null;
		}
		
		
		@Override
		public PDProperty loadPDPropertyById(Long id){
			
			String sql = " SELECT ua." + PDProperty.ID + ", ua." + PDProperty.UNIQUE_REFERENCE + ", ua." + PDProperty.CONTACT_PERSON + ", ua." + PDProperty.PROPERTYDEVELOPER_ID
					     + ", ua." + PDProperty.STATUS_ID + ", ua." + PDProperty.TYPE_OF_PROPOSED_PROPERTY  + ", ua." + PDProperty.CREATED_ON +  ", ua." + PDProperty.MODIFIED_ON
					     + ", ua." + PDProperty.NUMBER_OF_UNITS + ", ua." + PDProperty.ENERGY_SAVING_FEATURES
					     + ", ua." + PDProperty.ESTIMATED_START_DATE + ", ua." + PDProperty.TIME_TO_COMPLETE_SCEME + ", ua." + PDProperty.DESCRIPTION
					     + ", ua." + PDProperty.IS_JOINT_VENTURE + ", ua." + PDProperty.PERMISSION_TO_CARRYOUT  + ", ua." + PDProperty.EMERGENCY_CONTACT_NO +  ", ua." + PDProperty.NAME_OF_OTHER_PARTNER
					     + ", ua." + PDProperty.COMPANY_NAME + ", ua." + PDProperty.NDA_STATUS
					     + ", ua." + PDProperty.NDA_COMPLETION_DATE + ", ua." + PDProperty.EXPECTED_RENTAL_LEVEL + ", ua." + PDProperty.ACCOMODATION_TYPE
					     + ", ua." + PDProperty.HMO_DEDUCTION + ", ua." + PDProperty.HAVE_ITS_OWM_METERIAL_SUPPLY  + ", ua." + PDProperty.RATEABLE_VALUE +  ", ua." + PDProperty.WATER_RATES_VALUE
					     + ", ua." + PDProperty.NUMBER_OF_STUDIOFLATES + ", ua." + PDProperty.IS_REFURBISHMENT_PROJECT
					     + ", ua." + PDProperty.SUSTAINABLE_FEATURES+", ua." + PDProperty.EXPECTED_EPC_RATING + ", ua." + PDProperty.ESTIMATED_HANDOVER_DATE + ", ua." + PDProperty.INSURANCE_POLICY_NUMBER
					    
					     + ", ua." + PDProperty.IS_WINDOWS_UPVC_LOCKABLE + ", ua." + PDProperty.IS_UPVC_EXTERNAL_DOORS + ", ua." + PDProperty.IS_SOLIDWOOD_INTERNAL_DOORS
					     + ", ua." + PDProperty.IS_KITCHEN_FACILITIES + ", ua." + PDProperty.IS_TOILET_FACILITIES  + ", ua." + PDProperty.IS_PAINTED +  ", ua." + PDProperty.IS_WALLS_IN_CONTEMPORARY_PAINTED
					     + ", ua." + PDProperty.IS_CARPETED_THROUGHOUT + ", ua." + PDProperty.IS_OUTDOOR_COMMUNALDEVICE
					     + ", ua." + PDProperty.CHECK_FOR_UPLOAD_DOCUMENTS  + ", ua." + PDProperty.CHECK_FOR_ADMIN_UPLOAD_DOCUMENTS
					     
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + " FROM " + PDProperty.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDProperty.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDProperty.MODIFIED_USER_ID + "= x2." + UserLogin.ID
					     + " WHERE ua." + PDProperty.ID + " = " + id;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDProperty> propertyList = jdbcTemplate.query(sql, new RowMapper<PDProperty>() {
		
				@Override
				public PDProperty mapRow(ResultSet rst, int arg1) throws SQLException {
					PDProperty obj = new PDProperty();
						obj.setId(rst.getLong(PDProperty.ID));
						obj.setUniqueReference(rst.getString(PDProperty.UNIQUE_REFERENCE));
						obj.setContactPerson(rst.getString(PDProperty.CONTACT_PERSON));
						obj.setPropertyDeveloperId(rst.getLong(PDProperty.PROPERTYDEVELOPER_ID));
						obj.setStatusId(rst.getShort(PDProperty.STATUS_ID));
						obj.setTypeOfProposedProp(rst.getString(PDProperty.TYPE_OF_PROPOSED_PROPERTY));
						obj.setTimeToCompleteSceme(rst.getString(PDProperty.TIME_TO_COMPLETE_SCEME));
						obj.setNoOfUnits(rst.getString(PDProperty.NUMBER_OF_UNITS));
						obj.setDescription(rst.getString(PDProperty.DESCRIPTION));
						obj.setEnergySavingFeatures(rst.getString(PDProperty.ENERGY_SAVING_FEATURES));
						obj.setEstimatedStartDate(rst.getString(PDProperty.ESTIMATED_START_DATE));
						obj.setCreatedOn(rst.getDate(PDProperty.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						obj.setIsJointVenture(rst.getString(PDProperty.IS_JOINT_VENTURE));
						obj.setPermissionToCarryOut(rst.getString(PDProperty.PERMISSION_TO_CARRYOUT));
						obj.setEmergencyContactNo(rst.getString(PDProperty.EMERGENCY_CONTACT_NO));
						obj.setNameOfOtherPartners(rst.getString(PDProperty.NAME_OF_OTHER_PARTNER));
						obj.setCompanyName(rst.getString(PDProperty.COMPANY_NAME));
						obj.setNdaStatus(rst.getString(PDProperty.NDA_STATUS));
						obj.setNdaCompletionDate(rst.getString(PDProperty.NDA_COMPLETION_DATE));
						obj.setExpectedRentalLevel(rst.getString(PDProperty.EXPECTED_RENTAL_LEVEL));
						obj.setAccommodationType(rst.getString(PDProperty.ACCOMODATION_TYPE));
						obj.setHmoDeductions(rst.getString(PDProperty.HMO_DEDUCTION));
						obj.setHaveItsOwnMeteringSupply(rst.getString(PDProperty.HAVE_ITS_OWM_METERIAL_SUPPLY));
						obj.setRateableValue(rst.getString(PDProperty.RATEABLE_VALUE));
						obj.setWaterRatesValue(rst.getString(PDProperty.WATER_RATES_VALUE));
						obj.setNumberOfStudioFlates(rst.getString(PDProperty.NUMBER_OF_STUDIOFLATES));
						obj.setIsRefurbishmentProject(rst.getString(PDProperty.IS_REFURBISHMENT_PROJECT));
						obj.setSustainableFeatures(rst.getString(PDProperty.SUSTAINABLE_FEATURES));
						obj.setExpectedEpcRating(rst.getString(PDProperty.EXPECTED_EPC_RATING));
						obj.setEstimatedHandoverDate(rst.getString(PDProperty.ESTIMATED_HANDOVER_DATE));
						obj.setInsurancePolicyNumber(rst.getString(PDProperty.INSURANCE_POLICY_NUMBER));
						
						
						obj.setIsWindowsUPVCLockable(rst.getString(PDProperty.IS_WINDOWS_UPVC_LOCKABLE));
						obj.setIsUPVCExternalDoors(rst.getString(PDProperty.IS_UPVC_EXTERNAL_DOORS));
						obj.setIsSolidWoodInternalDoors(rst.getString(PDProperty.IS_SOLIDWOOD_INTERNAL_DOORS));
						obj.setIsKitchenFacilities(rst.getString(PDProperty.IS_KITCHEN_FACILITIES));
						obj.setIsToiletFacilities(rst.getString(PDProperty.IS_TOILET_FACILITIES));
						obj.setIsPainted(rst.getString(PDProperty.IS_PAINTED));
						obj.setIsWallsInContemporaryPainted(rst.getString(PDProperty.IS_WALLS_IN_CONTEMPORARY_PAINTED));
						obj.setIsCarpetedThroughout(rst.getString(PDProperty.IS_CARPETED_THROUGHOUT));
						obj.setIsOutdoorCommunalDevice(rst.getString(PDProperty.IS_OUTDOOR_COMMUNALDEVICE));
						obj.setCheckForUploadDocuments(rst.getString(PDProperty.CHECK_FOR_UPLOAD_DOCUMENTS));
						obj.setCheckForAdminUploadDocuments(rst.getString(PDProperty.CHECK_FOR_ADMIN_UPLOAD_DOCUMENTS));
						
					return obj;
				}
			});
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList.get(0);
		
			return null;
		}
		
		/*@Override
		public PDProperty loadPDPropertyById(Long id){
			
			String sql = " SELECT ua." + PDProperty.ID + ", ua." + PDProperty.UNIQUE_REFERENCE + ", ua." + PDProperty.CONTACT_PERSON + ", ua." + PDProperty.PROPERTYDEVELOPER_ID
					     + ", ua." + PDProperty.STATUS_ID + ", ua." + PDProperty.TYPE_OF_PROPOSED_PROPERTY  + ", ua." + PDProperty.CREATED_ON +  ", ua." + PDProperty.MODIFIED_ON
					     + ", ua." + PDProperty.NUMBER_OF_UNITS + ", ua." + PDProperty.ENERGY_SAVING_FEATURES
					     + ", ua." + PDProperty.ESTIMATED_START_TIME + ", ua." + PDProperty.TIME_TO_COMPLETE_SCEME + ", ua." + PDProperty.DESCRIPTION
					     + ", ua." + PDProperty.IS_JOINT_VENTURE + ", ua." + PDProperty.PERMISSION_TO_CARRYOUT  + ", ua." + PDProperty.EMERGENCY_CONTACT_NO +  ", ua." + PDProperty.NAME_OF_OTHER_PARTNER
					     + ", ua." + PDProperty.COMPANY_NAME + ", ua." + PDProperty.NDA_STATUS
					     + ", ua." + PDProperty.NDA_COMPLETION_DATE + ", ua." + PDProperty.EXPECTED_RENTAL_LEVEL + ", ua." + PDProperty.ACCOMODATION_TYPE
					     + ", ua." + PDProperty.HMO_DEDUCTION + ", ua." + PDProperty.HAVE_ITS_OWM_METERIAL_SUPPLY  + ", ua." + PDProperty.RATEABLE_VALUE +  ", ua." + PDProperty.WATER_RATES_VALUE
					     + ", ua." + PDProperty.NUMBER_OF_STUDIOFLATES + ", ua." + PDProperty.IS_REFURBISHMENT_PROJECT
					     + ", ua." + PDProperty.SUSTAINABLE_FEATURES + ", ua." + PDProperty.ESTIMATED_HANDOVER_DATE + ", ua." + PDProperty.INSURANCE_POLICY_NUMBER
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + " FROM " + PDProperty.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDProperty.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDProperty.MODIFIED_USER_ID + "= x2." + UserLogin.ID
					     + " WHERE ua." + PDProperty.ID + " = " + id;
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDProperty> propertyList = jdbcTemplate.query(sql, new RowMapper<PDProperty>() {
		
				@Override
				public PDProperty mapRow(ResultSet rst, int arg1) throws SQLException {
					PDProperty obj = new PDProperty();
						obj.setId(rst.getLong(PDProperty.ID));
						obj.setUniqueReference(rst.getString(PDProperty.UNIQUE_REFERENCE));
						obj.setContactPerson(rst.getString(PDProperty.CONTACT_PERSON));
						obj.setPropertyDeveloperId(rst.getLong(PDProperty.PROPERTYDEVELOPER_ID));
						obj.setStatusId(rst.getShort(PDProperty.STATUS_ID));
						obj.setTypeOfProposedProp(rst.getString(PDProperty.TYPE_OF_PROPOSED_PROPERTY));
						obj.setTimeToCompleteSceme(rst.getString(PDProperty.TIME_TO_COMPLETE_SCEME));
						obj.setDescription(rst.getString(PDProperty.DESCRIPTION));
						obj.setEnergySavingFeatures(rst.getString(PDProperty.ENERGY_SAVING_FEATURES));
						obj.setEstimatedStartDate(rst.getString(PDProperty.ESTIMATED_START_TIME));
						obj.setCreatedOn(rst.getDate(PDProperty.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						obj.setIsJointVenture(rst.getString(PDProperty.IS_JOINT_VENTURE));
						obj.setPermissionToCarryOut(rst.getString(PDProperty.PERMISSION_TO_CARRYOUT));
						obj.setEmergencyContactNo(rst.getString(PDProperty.EMERGENCY_CONTACT_NO));
						obj.setNameOfOtherPartners(rst.getString(PDProperty.NAME_OF_OTHER_PARTNER));
						obj.setCompanyName(rst.getString(PDProperty.COMPANY_NAME));
						obj.setNdaStatus(rst.getString(PDProperty.NDA_STATUS));
						obj.setNdaCompletionDate(rst.getString(PDProperty.NDA_COMPLETION_DATE));
						obj.setExpectedRentalLevel(rst.getString(PDProperty.EXPECTED_RENTAL_LEVEL));
						obj.setAccommodationType(rst.getString(PDProperty.ACCOMODATION_TYPE));
						obj.setHmoDeductions(rst.getString(PDProperty.HMO_DEDUCTION));
						obj.setHaveItsOwnMeteringSupply(rst.getString(PDProperty.HAVE_ITS_OWM_METERIAL_SUPPLY));
						obj.setRateableValue(rst.getString(PDProperty.RATEABLE_VALUE));
						obj.setWaterRatesValue(rst.getString(PDProperty.WATER_RATES_VALUE));
						obj.setNumberOfStudioFlates(rst.getString(PDProperty.NUMBER_OF_STUDIOFLATES));
						obj.setIsRefurbishmentProject(rst.getString(PDProperty.IS_REFURBISHMENT_PROJECT));
						obj.setSustainableFeatures(rst.getString(PDProperty.SUSTAINABLE_FEATURES));
						obj.setEstimatedHandoverDate(rst.getString(PDProperty.ESTIMATED_HANDOVER_DATE));
						obj.setInsurancePolicyNumber(rst.getString(PDProperty.INSURANCE_POLICY_NUMBER));
		
						
					return obj;
				}
			});
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList.get(0);
		
			return null;
		}*/
		
		@Override
		public PDDocuments loadPDDocuments(Long documentId){
			
			String sql = " SELECT ua." + PDDocuments.ID + ", ua." + PDDocuments.PROPERTYDEVELOPER_ID + ", ua." + PDDocuments.PROPERTY_ID 
					     + ", ua." + PDDocuments.FILE_NAME 
					     + ", ua." + PDDocuments.FILE_ID + ", ua." + PDDocuments.DOCUMENT_TYPE_ID  + ", ua." + PDDocuments.STATUS_ID
					     + ", ua." + PDDocuments.CREATED_ON +  ", ua." + PDDocuments.MODIFIED_ON
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + ", x3." + File.FILE_NAME + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE
					     + ", x3." + File.OBJECT_ID + ", x3." + File.DOCUMENT_TYPE_ID 
					     + ", x3." + File.FILE_PATH + ", x3." + File.CONTENT_TYPE
					     + " FROM " + PDDocuments.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDDocuments.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDDocuments.MODIFIED_USER_ID + "= x2." + UserLogin.ID
						 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PDDocuments.FILE_ID + "= x3." + File.ID
					     + " WHERE ua." + PDDocuments.ID + " = " + documentId;
			 			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDDocuments> propertyList = jdbcTemplate.query(sql, new RowMapper<PDDocuments>() {
		
				@Override
				public PDDocuments mapRow(ResultSet rst, int arg1) throws SQLException {
					PDDocuments obj = new PDDocuments();
						obj.setId(rst.getLong(PDDocuments.ID));
						obj.setPropertyDeveloperId(rst.getLong(PDDocuments.PROPERTYDEVELOPER_ID));
						obj.setPropertyId(rst.getLong(PDDocuments.PROPERTY_ID));
						obj.setFileName(rst.getString(PDDocuments.FILE_NAME));
						obj.setFileId(rst.getShort(PDDocuments.FILE_ID));
						obj.setDocumentTypeId(rst.getLong(PDDocuments.DOCUMENT_TYPE_ID));
						obj.setStatusId(rst.getInt(PDDocuments.STATUS_ID));
						
						obj.setCreatedOn(rst.getDate(PDDocuments.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						
						File fileObj = new File();
							fileObj.setId(rst.getLong(PDDocuments.FILE_ID));
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
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList.get(0);
		
			return null;
		}
		
		@Override
		public List<PDDocuments> loadPDPropertyDocuments(Long propertyDeveloperId, Long propertyId, Long documentsTypeId, Long userId){
			
			String sql = " SELECT ua." + PDDocuments.ID + ", ua." + PDDocuments.PROPERTYDEVELOPER_ID + ", ua." + PDDocuments.PROPERTY_ID 
					     + ", ua." + PDDocuments.FILE_NAME 
					     + ", ua." + PDDocuments.FILE_ID + ", ua." + PDDocuments.DOCUMENT_TYPE_ID  + ", ua." + PDDocuments.STATUS_ID
					     + ", ua." + PDDocuments.CREATED_ON +  ", ua." + PDDocuments.MODIFIED_ON  + ", ua." + PDDocuments.DESCRIPTION
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + ", x3." + File.FILE_NAME + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE
					     + ", x3." + File.OBJECT_ID + ", x3." + File.DOCUMENT_TYPE_ID 
					     + ", x3." + File.FILE_PATH + ", x3." + File.CONTENT_TYPE
					     + " FROM " + PDDocuments.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDDocuments.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDDocuments.MODIFIED_USER_ID + "= x2." + UserLogin.ID
						 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PDDocuments.FILE_ID + "= x3." + File.ID
					     + " WHERE ua." + PDDocuments.PROPERTYDEVELOPER_ID + " = " + propertyDeveloperId
					     +" AND ua." + PDDocuments.PROPERTY_ID + " = " + propertyId;
			
			 			if(userId != null){
			 				sql += " AND ua." + PDDocuments.CREATED_USER_ID+ " = " + userId;
			 			}
						if(documentsTypeId != null){
							sql += " AND ua." + PDDocuments.DOCUMENT_TYPE_ID + " = " + documentsTypeId;
						}
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDDocuments> propertyList = jdbcTemplate.query(sql, new RowMapper<PDDocuments>() {
		
				@Override
				public PDDocuments mapRow(ResultSet rst, int arg1) throws SQLException {
					PDDocuments obj = new PDDocuments();
						obj.setId(rst.getLong(PDDocuments.ID));
						obj.setPropertyDeveloperId(rst.getLong(PDDocuments.PROPERTYDEVELOPER_ID));
						obj.setPropertyId(rst.getLong(PDDocuments.PROPERTY_ID));
						obj.setFileName(rst.getString(PDDocuments.FILE_NAME));
						obj.setFileId(rst.getShort(PDDocuments.FILE_ID));
						obj.setDocumentTypeId(rst.getLong(PDDocuments.DOCUMENT_TYPE_ID));
						obj.setStatusId(rst.getInt(PDDocuments.STATUS_ID));
						
						obj.setCreatedOn(rst.getDate(PDDocuments.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						obj.setDescription(rst.getString(PDDocuments.DESCRIPTION));
						
						File fileObj = new File();
							fileObj.setId(rst.getLong(PDDocuments.FILE_ID));
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
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList;
		
			return null;
		}
		
		public PDDocuments loadPDPropertyDocumentsById(Long documentId){
			
			String sql = " SELECT ua." + PDDocuments.ID + ", ua." + PDDocuments.PROPERTYDEVELOPER_ID + ", ua." + PDDocuments.PROPERTY_ID 
					     + ", ua." + PDDocuments.FILE_NAME 
					     + ", ua." + PDDocuments.FILE_ID + ", ua." + PDDocuments.DOCUMENT_TYPE_ID  + ", ua." + PDDocuments.STATUS_ID
					     + ", ua." + PDDocuments.CREATED_ON +  ", ua." + PDDocuments.MODIFIED_ON
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + ", x3." + File.FILE_NAME + ", x3." + File.SIZE + ", x3." + File.OBJECT_TYPE
					     + ", x3." + File.OBJECT_ID + ", x3." + File.DOCUMENT_TYPE_ID 
					     + ", x3." + File.FILE_PATH + ", x3." + File.CONTENT_TYPE
					     + " FROM " + PDDocuments.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDDocuments.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDDocuments.MODIFIED_USER_ID + "= x2." + UserLogin.ID
						 +" LEFT JOIN "+ File.TABLE_NAME +" x3 ON ua." + PDDocuments.FILE_ID + "= x3." + File.ID
					     + " WHERE ua." + PDDocuments.ID + " = " + documentId;
					    
			
				
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDDocuments> propertyList = jdbcTemplate.query(sql, new RowMapper<PDDocuments>() {
		
				@Override
				public PDDocuments mapRow(ResultSet rst, int arg1) throws SQLException {
					PDDocuments obj = new PDDocuments();
						obj.setId(rst.getLong(PDDocuments.ID));
						obj.setPropertyDeveloperId(rst.getLong(PDDocuments.PROPERTYDEVELOPER_ID));
						obj.setPropertyId(rst.getLong(PDDocuments.PROPERTY_ID));
						obj.setFileName(rst.getString(PDDocuments.FILE_NAME));
						obj.setFileId(rst.getShort(PDDocuments.FILE_ID));
						obj.setDocumentTypeId(rst.getLong(PDDocuments.DOCUMENT_TYPE_ID));
						obj.setStatusId(rst.getInt(PDDocuments.STATUS_ID));
						
						obj.setCreatedOn(rst.getDate(PDDocuments.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						
						File fileObj = new File();
							fileObj.setId(rst.getLong(PDDocuments.FILE_ID));
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
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList.get(0);
		
			return null;
		}
		
		@Override
		public void removeDocument(final Long documentId){
				
				final String sql = "DELETE FROM " + PDDocuments.TABLE_NAME + " WHERE " + PDDocuments.ID + " = ?";
				
				if(developmentSettings.isShowSQL())
					logger.info(sql);
				
				jdbcTemplate.update(new PreparedStatementCreator() {
					
					@Override
					public PreparedStatement createPreparedStatement(Connection connection)throws SQLException {
						PreparedStatement psObj = connection.prepareStatement(sql);
							psObj.setLong(1, documentId);
							
						return psObj;
					}
				});
		}

		@Override
		public List<PDProperty> loadPropertyByPropertyDeveloper(PropertyDeveloper propertyDeveloperObj) {
			
			String sql = " SELECT ua." + PDProperty.ID + ", ua." + PDProperty.UNIQUE_REFERENCE + ", ua." + PDProperty.CONTACT_PERSON + ", ua." + PDProperty.STATUS_ID
					     + ", ua." + PDProperty.TYPE_OF_PROPOSED_PROPERTY + ", ua." + PDProperty.NUMBER_OF_UNITS + ", ua." + PDProperty.ENERGY_SAVING_FEATURES
					     + ", ua." + PDProperty.ESTIMATED_START_DATE  + ", ua." + PDProperty.PROPERTYDEVELOPER_ID +  " FROM " + PDProperty.TABLE_NAME + " ua WHERE " + PDProperty.PROPERTYDEVELOPER_ID + " = " +propertyDeveloperObj.getId()
			             + " ORDER BY " + PDProperty.CREATED_ON + " DESC ";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDProperty> propertyList = jdbcTemplate.query(sql, new RowMapper<PDProperty>() {
		
				@Override
				public PDProperty mapRow(ResultSet rst, int arg1) throws SQLException {
					PDProperty obj = new PDProperty();
						obj.setId(rst.getLong(PDProperty.ID));
						obj.setUniqueReference(rst.getString(PDProperty.UNIQUE_REFERENCE));
						obj.setContactPerson(rst.getString(PDProperty.CONTACT_PERSON));
						obj.setStatusId(rst.getShort(PDProperty.STATUS_ID));
						obj.setTypeOfProposedProp(rst.getString(PDProperty.TYPE_OF_PROPOSED_PROPERTY));
						obj.setNoOfUnits(rst.getString(PDProperty.NUMBER_OF_UNITS));
						obj.setEnergySavingFeatures(rst.getString(PDProperty.ENERGY_SAVING_FEATURES));
						obj.setEstimatedStartDate(rst.getString(PDProperty.ESTIMATED_START_DATE));
						obj.setPropertyDeveloperId(rst.getLong(PDProperty.PROPERTYDEVELOPER_ID));
					return obj;
				}
			});
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList;
		
			return null;
		}

		@Override
		public void updatePDProperty(final PDProperty tPDPropertyObj) {
			String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.CONTACT_PERSON + " = ?, " + PDProperty.TYPE_OF_PROPOSED_PROPERTY + " = ?, " + PDProperty.NUMBER_OF_UNITS + " = ?, "
					+ PDProperty.ENERGY_SAVING_FEATURES + " = ?, " + PDProperty.ESTIMATED_START_DATE + " = ?, "+ PDProperty.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PDProperty.DESCRIPTION + " = ?"
					+ " WHERE " + PDProperty.ID + " = ?"; 

			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
	jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(7, tPDPropertyObj.getId());
				psObj.setString(1 , tPDPropertyObj.getContactPerson());
				psObj.setString(2 , tPDPropertyObj.getTypeOfProposedProp());
				psObj.setString(3, tPDPropertyObj.getNoOfUnits());
				psObj.setString(4, tPDPropertyObj.getEnergySavingFeatures());
				psObj.setString(5, tPDPropertyObj.getEstimatedStartDate());
				psObj.setString(6, tPDPropertyObj.getDescription());
				
				
			}
		});

	 }
		
		
/*========================================================*/
		@Override
		public List<PDProperty> loadAllProperty(Integer start, Integer limit) {
			
			String sql = " SELECT ua." + PDProperty.ID + 
					", ua." + PDProperty.UNIQUE_REFERENCE + 
					", ua." + PDProperty.CONTACT_PERSON + 
					", ua." + PDProperty.STATUS_ID  +
				     ", ua." + PDProperty.CREATED_ON + 
				     ", ua." + PDProperty.MODIFIED_ON+
				     ", ua." + PDProperty.PROPERTYDEVELOPER_ID+
				     ", ua." + PDProperty.TYPE_OF_PROPOSED_PROPERTY+
				     ", ua." + PDProperty.NUMBER_OF_UNITS+
				     ", ua." + PDProperty.ENERGY_SAVING_FEATURES+
				     ", ua." + PDProperty.ESTIMATED_START_DATE+
				     ", ua." + PDProperty.TIME_TO_COMPLETE_SCEME+
				     ", ua." + PDProperty.DESCRIPTION+
				     ", x1." + UserLogin.USERNAME +
				     " AS "+ PDProperty.CREATED_BY+ 
				     ", x2." + UserLogin.USERNAME +
				     " AS "+ PDProperty.MODIFIED_BY
				     + " FROM " + PDProperty.TABLE_NAME + " ua "
					 + " LEFT JOIN users x1 ON ua." + PDProperty.CREATED_USER_ID + "= x1." + UserLogin.ID
					 + " LEFT JOIN users x2 ON ua." + PDProperty.MODIFIED_USER_ID + "= x2." + UserLogin.ID;
			
					if(start != null && limit != null){
						sql += " LIMIT ( " + start + ", " + limit + " ) ";
					}
					
					sql += " ORDER BY ua." + Property.CREATED_ON + " DESC ";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDProperty> propertyList = jdbcTemplate.query(sql, new RowMapper<PDProperty>() {
				 
			   	@Override
				public PDProperty mapRow(ResultSet rst, int arg1) throws SQLException {
					PDProperty obj = new PDProperty();
						obj.setId(rst.getLong(PDProperty.ID));
						obj.setUniqueReference(rst.getString(PDProperty.UNIQUE_REFERENCE));
						obj.setContactPerson(rst.getString(PDProperty.CONTACT_PERSON));
						obj.setStatusId(rst.getShort(PDProperty.STATUS_ID));
						obj.setPropertyDeveloperId(rst.getLong(PDProperty.PROPERTYDEVELOPER_ID));
						obj.setTypeOfProposedProp(rst.getString(PDProperty.TYPE_OF_PROPOSED_PROPERTY));
						obj.setNoOfUnits(rst.getString(PDProperty.NUMBER_OF_UNITS));
						obj.setEnergySavingFeatures(rst.getString(PDProperty.ENERGY_SAVING_FEATURES));
						obj.setEstimatedStartDate(rst.getString(PDProperty.ESTIMATED_START_DATE));
						obj.setTimeToCompleteSceme(rst.getString(PDProperty.TIME_TO_COMPLETE_SCEME));
						obj.setCreatedOn(rst.getDate(PDProperty.CREATED_ON));
						obj.setModifiedOn(rst.getDate(PDProperty.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(PDProperty.CREATED_BY));
						obj.setModifiedBy(rst.getString(PDProperty.MODIFIED_BY));
						obj.setDescription(rst.getString(PDProperty.DESCRIPTION));
					return obj;
				}
			});
			
		if(propertyList != null && !propertyList.isEmpty())
			return propertyList;
		
			return null;
		}

		@Override
		public void disApproveProperty(final PDProperty propertyObj, final Long userId) {
		String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.STATUS_ID + " = ?, " 
					+ PDProperty.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PDProperty.MODIFIED_USER_ID + " = ? "
					+ " WHERE " + PDProperty.ID  + " = ? ";
		
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
		public void approveProperty(final PDProperty propertyObj, final Long userId) {

			System.out.println(propertyObj.toString());
			String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.STATUS_ID + " = ?, " 
						+ PDProperty.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + PDProperty.MODIFIED_USER_ID + " = ? "
						+ " WHERE " + PDProperty.ID  + " = ? " ;
			
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
		
/*	===============================	savePDPropertySecond== [second jsp details to save]=========================================== */
		
		@Override
		public void savePDPropertySecond(final PDProperty tPDPropertyObj) {		
			String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.IS_JOINT_VENTURE + " = ?, " + PDProperty.PERMISSION_TO_CARRYOUT + " = ?, " + PDProperty.EMERGENCY_CONTACT_NO + " = ?, "
					+ PDProperty.NAME_OF_OTHER_PARTNER + " = ?,  "+ PDProperty.COMPANY_NAME + " = ?, " + PDProperty.NDA_STATUS + " = ?, "
					+ PDProperty.NDA_COMPLETION_DATE + " = ?, " + PDProperty.EXPECTED_RENTAL_LEVEL + " = ?, " + PDProperty.ACCOMODATION_TYPE + " = ?, "
					+ PDProperty.HMO_DEDUCTION + " = ?, " + PDProperty.HAVE_ITS_OWM_METERIAL_SUPPLY + " = ?, " + PDProperty.RATEABLE_VALUE + " = ?, "
					+ PDProperty.WATER_RATES_VALUE + " = ?, " + PDProperty.NUMBER_OF_STUDIOFLATES + " = ?, " + PDProperty.IS_REFURBISHMENT_PROJECT + " = ?, "
					+ PDProperty.SUSTAINABLE_FEATURES + " = ?, "+PDProperty.EXPECTED_EPC_RATING + " = ?, " + PDProperty.ESTIMATED_HANDOVER_DATE + " = ?, "+ PDProperty.INSURANCE_POLICY_NUMBER + " = ?,"+ PDProperty.IS_WINDOWS_UPVC_LOCKABLE +" = ?, "+PDProperty.IS_UPVC_EXTERNAL_DOORS +" = ?, "+PDProperty.IS_SOLIDWOOD_INTERNAL_DOORS +" = ?, "+PDProperty.IS_KITCHEN_FACILITIES +" = ?,"+PDProperty.IS_TOILET_FACILITIES +" = ?,"
					+ PDProperty.IS_PAINTED +" = ?, " + PDProperty.IS_WALLS_IN_CONTEMPORARY_PAINTED +" = ?,"+PDProperty.IS_CARPETED_THROUGHOUT +" = ?,"+PDProperty.IS_OUTDOOR_COMMUNALDEVICE +" = ?"
					+ " WHERE " + PDProperty.ID + " = ?"; 
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			jdbcTemplate.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement psObj) throws SQLException {
					psObj.setString(1 , tPDPropertyObj.getIsJointVenture());
					psObj.setString(2 , tPDPropertyObj.getPermissionToCarryOut());
					psObj.setString(3, tPDPropertyObj.getEmergencyContactNo());
					psObj.setString(4, tPDPropertyObj.getNameOfOtherPartners());
					psObj.setString(5, tPDPropertyObj.getCompanyName());
					psObj.setString(6, tPDPropertyObj.getNdaStatus());
					psObj.setString(7 , tPDPropertyObj.getNdaCompletionDate());
					psObj.setString(8 , tPDPropertyObj.getExpectedRentalLevel());
					psObj.setString(9, tPDPropertyObj.getAccommodationType());
					psObj.setString(10, tPDPropertyObj.getHmoDeductions());
					psObj.setString(11, tPDPropertyObj.getHaveItsOwnMeteringSupply());
					psObj.setString(12, tPDPropertyObj.getRateableValue());
					psObj.setString(13 , tPDPropertyObj.getWaterRatesValue());
					psObj.setString(14 , tPDPropertyObj.getNumberOfStudioFlates());
					psObj.setString(15, tPDPropertyObj.getIsRefurbishmentProject());
					psObj.setString(16, tPDPropertyObj.getSustainableFeatures());
					psObj.setString(17, tPDPropertyObj.getExpectedEpcRating());
					psObj.setString(18, tPDPropertyObj.getEstimatedHandoverDate());
					psObj.setString(19, tPDPropertyObj.getInsurancePolicyNumber());
					
					psObj.setString(20, tPDPropertyObj.getIsWindowsUPVCLockable());
					psObj.setString(21, tPDPropertyObj.getIsUPVCExternalDoors());
					psObj.setString(22, tPDPropertyObj.getIsSolidWoodInternalDoors());
					psObj.setString(23, tPDPropertyObj.getIsKitchenFacilities());
					psObj.setString(24, tPDPropertyObj.getIsToiletFacilities());
					psObj.setString(25, tPDPropertyObj.getIsPainted());
					psObj.setString(26, tPDPropertyObj.getIsWallsInContemporaryPainted());
					psObj.setString(27, tPDPropertyObj.getIsCarpetedThroughout());
					psObj.setString(28, tPDPropertyObj.getIsOutdoorCommunalDevice());
					psObj.setLong(29, tPDPropertyObj.getId());
					//psObj.setString(28, tPDPropertyObj.getIsWindowsUPVCLockable());
					
				}
			});
		}
		
		@Override
		public boolean validateEmailId(final String emailId){
			
			String sql = "SELECT ua." + PropertyDeveloper.ID + ", ua." + PropertyDeveloper.FIRST_NAME + ", ua." + PropertyDeveloper.LAST_NAME + ", ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + ", ua." + PropertyDeveloper.SECONDARY_EMAIL_ID
				     + ", ua." + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.UNIQUE_REFERENCE
				     + ", ua." + PropertyDeveloper.USER_LOGIN_ID 
				     + ", ua." + PropertyDeveloper.CREATED_ON + ", ua." + PropertyDeveloper.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + PropertyDeveloper.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + PropertyDeveloper.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + PropertyDeveloper.USER_LOGIN_ID
				     +", ( SELECT COUNT(*) FROM " + PDProperty.TABLE_NAME + " WHERE " + PDProperty.PROPERTYDEVELOPER_ID+ " = ua." + PropertyDeveloper.ID + " ) AS " + PropertyDeveloper.PROPERTY_COUNT 
				     + " FROM " + PropertyDeveloper.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + PropertyDeveloper.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + PropertyDeveloper.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + PropertyDeveloper.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + " = ? OR ua." + PropertyDeveloper.SECONDARY_EMAIL_ID + " = ?";

			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PropertyDeveloper> propertyDeveloperList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
		
					@Override
					public void setValues(PreparedStatement stmt) throws SQLException {
						stmt.setString(1, emailId.trim());
						stmt.setString(2, emailId.trim());
					}
				},	new PropertyDeveloperMapper());
			
			if(propertyDeveloperList != null && !propertyDeveloperList.isEmpty())
				return true;

			return false;
		}
		
		@Override
		public  PropertyDeveloper loadUserLoginCredentials(final String emailId)
		{
			String sql = "SELECT ua." + PropertyDeveloper.ID + ", ua." + PropertyDeveloper.FIRST_NAME + ", ua." + PropertyDeveloper.LAST_NAME + ", ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + ", ua." + PropertyDeveloper.SECONDARY_EMAIL_ID
				     + ", ua." + PropertyDeveloper.PRIMARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.SECONDARY_PHONE_NUMBER + ", ua." + PropertyDeveloper.UNIQUE_REFERENCE
				     + ", ua." + PropertyDeveloper.USER_LOGIN_ID 
				     + ", ua." + PropertyDeveloper.CREATED_ON + ", ua." + PropertyDeveloper.MODIFIED_ON
				     + ", x2." + UserLogin.USERNAME + " AS " + PropertyDeveloper.CREATED_BY
				     + ", x3." + UserLogin.USERNAME + " AS " + PropertyDeveloper.MODIFIED_BY
				     + ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.ENABLE + ", x1." + UserLogin.HINT_QUESTION
				     + ", x1." + UserLogin.HINT_ANSWER + ", x1." + UserLogin.USER_TYPE_ID + ", x1." + UserLogin.ID + " AS " + PropertyDeveloper.USER_LOGIN_ID
				     +", ( SELECT COUNT(*) FROM " + PDProperty.TABLE_NAME + " WHERE " + PDProperty.PROPERTYDEVELOPER_ID+ " = ua." + PropertyDeveloper.ID + " ) AS " + PropertyDeveloper.PROPERTY_COUNT 
				     + " FROM " + PropertyDeveloper.TABLE_NAME + " ua "
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x1 ON ua." + PropertyDeveloper.USER_LOGIN_ID + " = x1." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x2 ON ua." + PropertyDeveloper.CREATED_USER_ID + " = x2." + UserLogin.ID
				     + " LEFT JOIN " + UserLogin.TABLE_NAME + " x3 ON ua." + PropertyDeveloper.MODIFIED_USER_ID + " = x3." + UserLogin.ID
				     + " WHERE ua." + PropertyDeveloper.PRIMARY_EMAIL_ID + " = ? ";

			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PropertyDeveloper> propertyDeveloperList = jdbcTemplate.query(sql, new PreparedStatementSetter() {
		
					@Override
					public void setValues(PreparedStatement stmt) throws SQLException {
						stmt.setString(1, emailId.trim());		
					}
				},	new PropertyDeveloperMapper());
			
			if(propertyDeveloperList != null && !propertyDeveloperList.isEmpty())
				return propertyDeveloperList.get(0);

			return null;
		}		
		
		public boolean isPropertyApproved(Long propertyId){

			
			String sql = " SELECT ua." + PDProperty.ID + ", ua." + PDProperty.UNIQUE_REFERENCE + ", ua." + PDProperty.CONTACT_PERSON 
						 + ", ua." + PDProperty.STATUS_ID  + ", ua." + PDProperty.CREATED_ON +  ", ua." + PDProperty.MODIFIED_ON
					     + ", ua." + PDProperty.PROPERTYDEVELOPER_ID
					     + ", x1." + UserLogin.USERNAME + " AS "+ PDProperty.CREATED_BY
					     + ", x2." + UserLogin.USERNAME + " AS "+ PDProperty.MODIFIED_BY
					     + " FROM " + PDProperty.TABLE_NAME + " ua "
						 +" LEFT JOIN users x1 ON ua." + PDProperty.CREATED_USER_ID + "= x1." + UserLogin.ID
						 +" LEFT JOIN users x2 ON ua." + PDProperty.MODIFIED_USER_ID + "= x2." + UserLogin.ID
					     + " WHERE ua." + PDProperty.ID + " = " + propertyId  + " AND ua." + PDProperty.STATUS_ID + " = " + Status.APPROVED.id();
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDProperty> propertyList = jdbcTemplate.query(sql, new RowMapper<PDProperty>() {
		
				@Override
				public PDProperty mapRow(ResultSet rst, int arg1) throws SQLException {
					PDProperty obj = new PDProperty();
						obj.setId(rst.getLong(Property.ID));
						obj.setUniqueReference(rst.getString(Property.UNIQUE_REFERENCE));
						obj.setContactPerson(rst.getString(Property.CONTACT_PERSON));
						obj.setStatusId(rst.getShort(Property.STATUS_ID));
						obj.setCreatedOn(rst.getDate(Property.CREATED_ON));
						obj.setModifiedOn(rst.getDate(Property.MODIFIED_ON));
						obj.setCreatedBy(rst.getString(Property.CREATED_BY));
						obj.setModifiedBy(rst.getString(Property.MODIFIED_BY));
						
					return obj;
				}
			});
		
		
		if(propertyList != null && !propertyList.isEmpty())
			return true;
		else
			return false;
		}


	/*	@Override
		public List<File> loadAdminUploadedFile(Long propertyId) {
			
			String sql = "Select "+File.ID+ ", ua "+File.FILE_PATH +", ua "+File.FILE_NAME +", ua "+File.SIZE +", ua "+File.CREATED_ON + " from " + File.TABLE_NAME + " where ua."+File.CREATED_USER_ID + " = 1"+ " and ua."+File.OBJECT_ID +" = ?";
						 
			
			return null;
		}
*/

		@Override
		public int updatePDPropertyStatus(final Long documentId) {

			String sql = " UPDATE " + PDDocuments.TABLE_NAME + " SET " + PDDocuments.STATUS_ID + " = ?"
					+ " WHERE " + PDProperty.ID + " = ?"; 

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
		
		public int updateDocumentStatusInPDProperty(final PDProperty pdPropertyObj, final String editCheck){
			final String addEditCheck = editCheck;
			String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.CHECK_FOR_UPLOAD_DOCUMENTS +  " = ?" +" where "+ PDProperty.ID+ " = ?";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
	       int i =	jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setString(1, addEditCheck);
				psObj.setLong(2 , pdPropertyObj.getId());

			  }
	       });

		return i;
		}
		
		
		public int updateForAdminUploadedDocumentStatus(final PDProperty pdPropertyObj, final String editCheck){
			final String addEditCheck = editCheck;
			String sql = "UPDATE " + PDProperty.TABLE_NAME + " SET " + PDProperty.CHECK_FOR_ADMIN_UPLOAD_DOCUMENTS +  " = ?" +" where "+ PDProperty.ID+ " = ?";
			
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
	       int i =	jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setString(1, addEditCheck);
				psObj.setLong(2 , pdPropertyObj.getId());

			  }
	       });

		return i;
		}


		
		
		@Override
		public String loadDescriptionFromPDDocuments(Long propertyDeveloperId, Long propertyId, Long documentsTypeId){
			
			String sql = " SELECT ua." + PDDocuments.ID + ", ua." + PDDocuments.PROPERTYDEVELOPER_ID + ", ua." + PDDocuments.PROPERTY_ID 
					     + ", ua." + PDDocuments.CREATED_ON +  ", ua." + PDDocuments.DESCRIPTION
					     
					     + " FROM " + PDDocuments.TABLE_NAME + " ua "
					     + " WHERE ua." + PDDocuments.PROPERTYDEVELOPER_ID + " = " + propertyDeveloperId
					     +" AND ua." + PDDocuments.PROPERTY_ID + " = " + propertyId;
			 			
						if(documentsTypeId != null){
							sql += " AND ua." + PDDocuments.DOCUMENT_TYPE_ID + " = " + documentsTypeId;
						}
						sql += " ORDER BY " +PDDocuments.CREATED_ON;
						
			if(developmentSettings.isShowSQL())
				logger.info(sql);
			
			List<PDDocuments> pdDoc =  jdbcTemplate.query(sql, new RowMapper<PDDocuments>() {
		
				@Override
				public PDDocuments mapRow(ResultSet rst, int arg1) throws SQLException {
					PDDocuments obj = new PDDocuments();
						obj.setId(rst.getLong(PDDocuments.ID));
						obj.setPropertyDeveloperId(rst.getLong(PDDocuments.PROPERTYDEVELOPER_ID));
						obj.setPropertyId(rst.getLong(PDDocuments.PROPERTY_ID));
						obj.setCreatedOn(rst.getDate(PDDocuments.CREATED_ON));
						obj.setDescription(rst.getString(PDDocuments.DESCRIPTION));
						
					return obj;
				}
			});
			String pdDescription = null;
			for (PDDocuments pdDocuments : pdDoc) {
				pdDescription = pdDocuments.getDescription();
			}
			
			return pdDescription;
		}
		
	}
