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
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.FunctionalityCostMatrix;
import com.pcs.perpetualRents.business.bean.TurnOverDetails;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.DevelopmentSettings;
import com.pcs.perpetualRents.dao.ContractorDAO;
import com.pcs.perpetualRents.dao.mapper.ContractorExpertiseMapper;
import com.pcs.perpetualRents.dao.mapper.ContractorMapper;
import com.pcs.perpetualRents.dao.mapper.ContractorRegisterationStep2Mapper;
import com.pcs.perpetualRents.dao.mapper.ContractorRegisterationStep3Mapper;
import com.pcs.perpetualRents.dao.mapper.ContractorRegisterationStep4Mapper;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.Status;

@Repository
public class ContractorDAOImpl implements ContractorDAO {
	
	private static Logger logger = ApplicationSettings.getLogger(ContractorDAOImpl.class.getName());

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private DevelopmentSettings developmentSettings;
	
	@Override
	public Long createContractor(final Contractor infoObj, final Long createdUserId){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + Contractor.TABLE_NAME + "( "+ Contractor.UNIQUE_REFERENCE + ", " + Contractor.COMPANY_NAME
						+ ", " + Contractor.BUSINESS_NATURE + ", " + Contractor.CONTACT_PERSON + ", " + Contractor.TRADING_COMMENCEMENT_DATE
						+ ", " + Contractor.COMPANY_REGISTERATION_DATE  + ", " + Contractor.VAT_NO + ", " + Contractor.USER_LOGIN_ID
						+ ", " + Contractor.STATUS_ID  + ", " + Contractor.CREATED_USER_ID
						+ " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setString(1, infoObj.getUniqueReference());
					psObj.setString(2, infoObj.getCompanyName());
					psObj.setString(3, infoObj.getBusinessNature());
					if(infoObj.getContactPerson() != null)
						psObj.setString(4, infoObj.getContactPerson());
					else
						psObj.setNull(4, Types.NULL);
					psObj.setString(5, infoObj.getTradingCommencementDate());
					psObj.setString(6, infoObj.getCompanyRegisterationDate());
					if(infoObj.getVatNo() != null)
						psObj.setString(7, infoObj.getVatNo());
					else
						psObj.setNull(7, Types.NULL);
					
					psObj.setLong(8, infoObj.getUserLoginId());
					psObj.setShort(9, infoObj.getStatusId());
					psObj.setLong(10, createdUserId);
				return psObj;
			}
		}, keyHolder);
		
		return keyHolder.getKey().longValue();
	}
	
	@Override
	public Long saveContractorRegisterationStep2(final ContractorRegisterationStep2 infoObj, final Long createdUserId){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + ContractorRegisterationStep2.TABLE_NAME + "( "
						+ ContractorRegisterationStep2.COMPANY_TYPE_ID + ", " + ContractorRegisterationStep2.OTHER_COMPANY_TYPE
						+ ", " + ContractorRegisterationStep2.CONTRACTOR_ID + ", " + ContractorRegisterationStep2.PARENT_COMPANY_ADDRESS
						+ ", " + ContractorRegisterationStep2.COMPANY_REGISTERATION_NUMBER  + ", " + ContractorRegisterationStep2.REGISTERED_WITH_TRADEBODIES + ", " + ContractorRegisterationStep2.REGISTERATION_NUMBER
						+ ", " + ContractorRegisterationStep2.QUALITY_MARKS  + ", " + ContractorRegisterationStep2.QUALITY_MARKS_DETAILS + ", " + ContractorRegisterationStep2.REGISTERED_WITH_CONSTRUCTION_LINE
						+ ", " + ContractorRegisterationStep2.CONSTRUCTION_LINE_REGISTERATION_NUMBER  + ", " + ContractorRegisterationStep2.EMPLOYEE_COUNT + ", " + ContractorRegisterationStep2.EMPLOYEES_TRADE
						+ ", " + ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS  + ", " + ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS_REGISTERATION_NUMBER  + ", " + ContractorRegisterationStep2.TAX_OFFICE_ADDRESS + ", " + ContractorRegisterationStep2.TAX_REFERECNE_NUMBER
						+ ", " + ContractorRegisterationStep2.INSURER_NAME_ADDRESS  + ", " + ContractorRegisterationStep2.POLICY_NUMBER + ", " + ContractorRegisterationStep2.EMPLOYERS_LIABILITY
						+ ", " + ContractorRegisterationStep2.PUBLIC_LIABILITY  + ", " + ContractorRegisterationStep2.PROFFESSIONAL_INDEMNITY + ", " + ContractorRegisterationStep2.INSURANCE_COVER_EXPIRY_DATE
						+ ", " + ContractorRegisterationStep2.OFFICE_ADDRESS_ID + ", " + ContractorRegisterationStep2.CORRESPONDENCE_ADDRESS_ID  + ", " + ContractorRegisterationStep2.CREATED_USER_ID
						
						+ ", " + ContractorRegisterationStep2.ALL_DIRECTOR_DETAILS + ", " + ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS  + ", " + ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS_COMMENTS
						+ ", " + ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE + ", " + ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE_COMMENTS  + ", " + ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH
						+ ", " + ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH_COMMENTS
						
						+ " ) VALUES (?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, infoObj.getCompanyTypeId());
					if(infoObj.getOtherCompanyType() != null)
						psObj.setString(2, infoObj.getOtherCompanyType());
					else
						psObj.setNull(2, Types.NULL);
					psObj.setLong(3, infoObj.getContractorId());
					
					if(infoObj.getParentCompanyAddress() != null)
						psObj.setString(4, infoObj.getParentCompanyAddress());
					else
						psObj.setNull(4, Types.NULL);
					if(infoObj.getCompanyRegisterationNumber()!= null)
						psObj.setString(5, infoObj.getCompanyRegisterationNumber());
					else
						psObj.setNull(5, Types.NULL);
					if(infoObj.getRegisteredWithTradeBodies() != null)
						psObj.setString(6, infoObj.getRegisteredWithTradeBodies());
					else
						psObj.setNull(6, Types.NULL);
					if(infoObj.getRegisterationNumber() != null)
						psObj.setString(7, infoObj.getRegisterationNumber());
					else
						psObj.setNull(7, Types.NULL);
					if(infoObj.getQualityMarks() != null)
						psObj.setString(8, infoObj.getQualityMarks());
					else
						psObj.setNull(8, Types.NULL);
					if(infoObj.getQualityMarksDetails() != null)
						psObj.setString(9, infoObj.getQualityMarksDetails());
					else
						psObj.setNull(9, Types.NULL);
					if(infoObj.getRegisteredWithConstructionLine() != null)
						psObj.setString(10, infoObj.getRegisteredWithConstructionLine());
					else
						psObj.setNull(10, Types.NULL);
					if(infoObj.getConstructionLineRegisterationNumber() != null)
						psObj.setString(11, infoObj.getConstructionLineRegisterationNumber());
					else
						psObj.setNull(11, Types.NULL);
					if(infoObj.getEmployeesCount() != null)
						psObj.setString(12, infoObj.getEmployeesCount());
					else
						psObj.setNull(12, Types.NULL);
					if(infoObj.getEmployeesTrade() != null)
						psObj.setString(13, infoObj.getEmployeesTrade());
					else
						psObj.setNull(13, Types.NULL);
					if(infoObj.getEmploySubcontractors() != null)
						psObj.setString(14, infoObj.getEmploySubcontractors());
					else
						psObj.setNull(14, Types.NULL);
					if(infoObj.getEmploySubcontractors() != null)
						psObj.setString(15, infoObj.getEmploySubContractorRegisterationNumber());
					else
						psObj.setNull(15, Types.NULL);
					if(infoObj.getTaxOfficeAddress() != null)
						psObj.setString(16, infoObj.getTaxOfficeAddress());
					else
						psObj.setNull(16, Types.NULL);
					if(infoObj.getTaxReferenceNumber() != null)
						psObj.setString(17, infoObj.getTaxReferenceNumber());
					else
						psObj.setNull(17, Types.NULL);
					if(infoObj.getInsurerNameandAddress() != null)
						psObj.setString(18, infoObj.getInsurerNameandAddress());
					else
						psObj.setNull(18, Types.NULL);
					if(infoObj.getPolicyNumber() != null)
						psObj.setString(19, infoObj.getPolicyNumber());
					else
						psObj.setNull(19, Types.NULL);
					if(infoObj.getEmployersLiability() != null)
						psObj.setString(20, infoObj.getEmployersLiability());
					else
						psObj.setNull(20, Types.NULL);
					if(infoObj.getPublicLiability() != null)
						psObj.setString(21, infoObj.getPublicLiability());
					else
						psObj.setNull(21, Types.NULL);
					if(infoObj.getProffessionalIndemnity() != null)
						psObj.setString(22, infoObj.getProffessionalIndemnity());
					else
						psObj.setNull(22, Types.NULL);
					if(infoObj.getInsauranceCoverExpiryDate() != null)
						psObj.setString(23, infoObj.getInsauranceCoverExpiryDate());
					else
						psObj.setNull(23, Types.NULL);
					psObj.setLong(24, infoObj.getOfficeAddressId());
					psObj.setLong(25, infoObj.getCorrespondenceAddressId());
					psObj.setLong(26, createdUserId);
					
					if(infoObj.getAllDirectorsOfCompany() != null)
						psObj.setString(27, infoObj.getAllDirectorsOfCompany());
					else
						psObj.setNull(27, Types.NULL);
					
					if(infoObj.getBankruptcyProceedings() != null)
						psObj.setString(28, infoObj.getBankruptcyProceedings());
					else
						psObj.setNull(28, Types.NULL);
					
					if(infoObj.getBankruptcyProceedingsComments() != null)
						psObj.setString(29, infoObj.getBankruptcyProceedingsComments());
					else
						psObj.setNull(29, Types.NULL);
					
					if(infoObj.getConvictedToCriminalOffence() != null)
						psObj.setString(30, infoObj.getConvictedToCriminalOffence());
					else
						psObj.setNull(30, Types.NULL);
					
					if(infoObj.getConvictedToCriminalOffenceComments() != null)
						psObj.setString(31, infoObj.getConvictedToCriminalOffenceComments());
					else
						psObj.setNull(31, Types.NULL);
					
					if(infoObj.getTrusteeOfAshantiDutch() != null)
						psObj.setString(32, infoObj.getTrusteeOfAshantiDutch());
					else
						psObj.setNull(32, Types.NULL);
					
					if(infoObj.getTrusteeOfAshantiDutchComments() != null)
						psObj.setString(33, infoObj.getTrusteeOfAshantiDutchComments());
					else
						psObj.setNull(33, Types.NULL);
				return psObj;
			}
		}, keyHolder);
		
		return keyHolder.getKey().longValue();
	}
	
	public Long saveContractorRegisterationStep3(final ContractorRegisterationStep3 infoObj, final Long createdUserId){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + ContractorRegisterationStep3.TABLE_NAME + "( "
						+ ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY + ", " + ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_COMMENTS 
						+ ", " + ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_FILE_ID
						+ ", " + ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE + ", " + ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE_COMMENTS
						+ ", " + ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY  + ", " + ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY_COMMENTS 
						+ ", " + ContractorRegisterationStep3.YEAR_ENDINGS1  + ", " + ContractorRegisterationStep3.FATAL_ACCIDENTS1 + ", " + ContractorRegisterationStep3.REPORTABLE_INJURIES1
						+ ", " + ContractorRegisterationStep3.ACCIDENT_RATE1  + ", " + ContractorRegisterationStep3.NON_REPORTABLE_INJURIES1
						+ ", " + ContractorRegisterationStep3.YEAR_ENDINGS2  + ", " + ContractorRegisterationStep3.FATAL_ACCIDENTS2 + ", " + ContractorRegisterationStep3.REPORTABLE_INJURIES2
						+ ", " + ContractorRegisterationStep3.ACCIDENT_RATE2  + ", " + ContractorRegisterationStep3.NON_REPORTABLE_INJURIES2
						+ ", " + ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY  + ", " + ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY_COMMENTS
						+ ", " + ContractorRegisterationStep3.SAFETY_ACCREDIATION  + ", " + ContractorRegisterationStep3.SAFETY_ACCREDIATION_COMMENTS
						+ ", " + ContractorRegisterationStep3.EQUALITY_POLICY  + ", " + ContractorRegisterationStep3.EQUALITY_POLICY_COMMENTS
						+ ", " + ContractorRegisterationStep3.EQUALITY_POLICY_FILE_ID
						+ ", " + ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION + ", " + ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION_COMMENTS
						+ ", " + ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION + ", " + ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION_COMMENTS
						+ ", " + ContractorRegisterationStep3.WILLING_TO_ABIDE_BY_CHARITIES + ", " + ContractorRegisterationStep3.ADDITIONAL_INFORMATION_COST
						+ ", " + ContractorRegisterationStep3.CONTRACTOR_ID
						+ ", " + ContractorRegisterationStep3.CREATED_USER_ID
						+ " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					if(infoObj.getWrittenHealthPolicy() != null)
						psObj.setString(1, infoObj.getWrittenHealthPolicy());
					else
						psObj.setNull(1, Types.NULL);
					if(infoObj.getWrittenHealthPolicyYesComments() != null)
						psObj.setString(2, infoObj.getWrittenHealthPolicyYesComments());
					else
						psObj.setNull(2, Types.NULL);
					
					if(infoObj.getWrittenHealthPolicyFileId() != null)
						psObj.setLong(3, infoObj.getWrittenHealthPolicyFileId());
					else
						psObj.setNull(3, Types.NULL);
					if(infoObj.getCompetentHealthAndSafetyAdvice() != null)
						psObj.setString(4, infoObj.getCompetentHealthAndSafetyAdvice());
					else
						psObj.setNull(4, Types.NULL);
					if(infoObj.getCompetentHealthAndSafetyAdviceComments()!= null)
						psObj.setString(5, infoObj.getCompetentHealthAndSafetyAdviceComments());
					else
						psObj.setNull(5, Types.NULL);
					if(infoObj.getReceivedHealthAndSafety() != null)
						psObj.setString(6, infoObj.getReceivedHealthAndSafety());
					else
						psObj.setNull(6, Types.NULL);
					if(infoObj.getReceivedHealthAndSafetyComments() != null)
						psObj.setString(7, infoObj.getReceivedHealthAndSafetyComments());
					else
						psObj.setNull(7, Types.NULL);
					if(infoObj.getYearEnding1() != null)
						psObj.setString(8, infoObj.getYearEnding1());
					else
						psObj.setNull(8, Types.NULL);
					if(infoObj.getFatalAccidents1() != null)
						psObj.setString(9, infoObj.getFatalAccidents1());
					else
						psObj.setNull(9, Types.NULL);
					if(infoObj.getReportableInjuries1() != null)
						psObj.setString(10, infoObj.getReportableInjuries1());
					else
						psObj.setNull(10, Types.NULL);
					if(infoObj.getAccidentRate1() != null)
						psObj.setString(11, infoObj.getAccidentRate1());
					else
						psObj.setNull(11, Types.NULL);
					if(infoObj.getNonReportableInjuries1() != null)
						psObj.setString(12, infoObj.getNonReportableInjuries1());
					else
						psObj.setNull(12, Types.NULL);
					
					if(infoObj.getYearEnding2() != null)
						psObj.setString(13, infoObj.getYearEnding2());
					else
						psObj.setNull(13, Types.NULL);
					if(infoObj.getFatalAccidents2() != null)
						psObj.setString(14, infoObj.getFatalAccidents2());
					else
						psObj.setNull(14, Types.NULL);
					if(infoObj.getReportableInjuries2() != null)
						psObj.setString(15, infoObj.getReportableInjuries2());
					else
						psObj.setNull(15, Types.NULL);
					if(infoObj.getAccidentRate2() != null)
						psObj.setString(16, infoObj.getAccidentRate2());
					else
						psObj.setNull(16, Types.NULL);
					if(infoObj.getNonReportableInjuries2() != null)
						psObj.setString(17, infoObj.getNonReportableInjuries2());
					else
						psObj.setNull(17, Types.NULL);
					
					if(infoObj.getEnforcementNoticeforHealthSafety() != null)
						psObj.setString(18, infoObj.getEnforcementNoticeforHealthSafety());
					else
						psObj.setNull(18, Types.NULL);
					if(infoObj.getEnforcementNoticeforHealthSafetyComments() != null)
						psObj.setString(19, infoObj.getEnforcementNoticeforHealthSafetyComments());
					else
						psObj.setNull(19, Types.NULL);
					if(infoObj.getSafetyAccreditation() != null)
						psObj.setString(20, infoObj.getSafetyAccreditation());
					else
						psObj.setNull(20, Types.NULL);
					if(infoObj.getSafetyAccreditationComments() != null)
						psObj.setString(21, infoObj.getSafetyAccreditationComments());
					else
						psObj.setNull(21, Types.NULL);
					
					if(infoObj.getEqualityPolicy() != null)
						psObj.setString(22, infoObj.getEqualityPolicy());
					else
						psObj.setNull(22, Types.NULL);
					if(infoObj.getEqualityPolicyComments() != null)
						psObj.setString(23, infoObj.getEqualityPolicyComments());
					else
						psObj.setNull(23, Types.NULL);
					if(infoObj.getEqualityPolicyFileId() != null)
						psObj.setLong(24, infoObj.getEqualityPolicyFileId());
					else
						psObj.setNull(24, Types.NULL);
					
					if(infoObj.getAnyunlawfulDiscrimination() != null)
						psObj.setString(25, infoObj.getAnyunlawfulDiscrimination());
					else
						psObj.setNull(25, Types.NULL);
					if(infoObj.getAnyunlawfulDiscriminationComments() != null)
						psObj.setString(26, infoObj.getAnyunlawfulDiscriminationComments());
					else
						psObj.setNull(26, Types.NULL);
					
					if(infoObj.getSubjectOfFormalInvestigation() != null)
						psObj.setString(27, infoObj.getSubjectOfFormalInvestigation());
					else
						psObj.setNull(27, Types.NULL);
					if(infoObj.getSubjectOfFormalInvestigationComments() != null)
						psObj.setString(28, infoObj.getSubjectOfFormalInvestigationComments());
					else
						psObj.setNull(28, Types.NULL);
					
					if(infoObj.getWillingToAbideByCharities() != null)
						psObj.setString(29, infoObj.getWillingToAbideByCharities());
					else
						psObj.setNull(29, Types.NULL);
					
					if(infoObj.getAdditionalInformationOfCost() != null)
						psObj.setString(30, infoObj.getAdditionalInformationOfCost());
					else
						psObj.setNull(30, Types.NULL);
					
					psObj.setLong(31, infoObj.getContractorId());
					psObj.setLong(32, createdUserId);
					
				return psObj;
			}
		}, keyHolder);
		
		return keyHolder.getKey().longValue();
	}
	
	public Long saveContractorRegisterationStep4(final ContractorRegisterationStep4 infoObj, final Long createdUserId){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + ContractorRegisterationStep4.TABLE_NAME + "( "
						+ ContractorRegisterationStep4.REFERENCE_ADDRSS1 + ", " + ContractorRegisterationStep4.REFERENCE_CONTACT1 + ", " + ContractorRegisterationStep4.DESCRIPTION1
						+ ", " + ContractorRegisterationStep4.REFERENCE_ADDRSS2 + ", " + ContractorRegisterationStep4.REFERENCE_CONTACT2 + ", " + ContractorRegisterationStep4.DESCRIPTION2
						+ ", " + ContractorRegisterationStep4.REFERENCE_ADDRSS3 + ", " + ContractorRegisterationStep4.REFERENCE_CONTACT3 + ", " + ContractorRegisterationStep4.DESCRIPTION3
						+ ", " + ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION  + ", " + ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION_COMMENTS
						+ ", " + ContractorRegisterationStep4.ADDITIONAL_INFORMATION
						+ ", " + ContractorRegisterationStep4.SIGNED_BY + ", " + ContractorRegisterationStep4.SIGNED_DATE + ", " + ContractorRegisterationStep4.SIGNEE_NAME
						+ ", " + ContractorRegisterationStep4.SIGNEE_POSITION + ", " + ContractorRegisterationStep4.SIGNEE_PHONE_NUMBER
						+ ", " + ContractorRegisterationStep4.SIGNEE_ALTERNATE_PHONE_NUMBER + ", " + ContractorRegisterationStep4.SIGNEE_EMAIL_ADDRESS
						+ ", " + ContractorRegisterationStep4.CONTACT_PERSON_NAME + ", " + ContractorRegisterationStep4.CONTACT_PERSON_POSITION + ", " + ContractorRegisterationStep4.CONTACT_PERSON_TELEPHONE_NUMBER 
						+ ", " + ContractorRegisterationStep4.CONTACT_PERSON_EMAIL_ADDRESS
						+ ", " + ContractorRegisterationStep4.CONTRACTOR_ID
						+ ", " + ContractorRegisterationStep4.CREATED_USER_ID
						+ " ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					if(infoObj.getReferenceAddress1() != null)
						psObj.setString(1, infoObj.getReferenceAddress1());
					else
						psObj.setNull(1, Types.NULL);
					if(infoObj.getReferenceContact1() != null)
						psObj.setString(2, infoObj.getReferenceContact1());
					else
						psObj.setNull(2, Types.NULL);
					if(infoObj.getDescription1() != null)
						psObj.setString(3, infoObj.getDescription1());
					else
						psObj.setNull(3, Types.NULL);
					if(infoObj.getReferenceAddress2() != null)
						psObj.setString(4, infoObj.getReferenceAddress2());
					else
						psObj.setNull(4, Types.NULL);
					if(infoObj.getReferenceContact2() != null)
						psObj.setString(5, infoObj.getReferenceContact2());
					else
						psObj.setNull(5, Types.NULL);
					if(infoObj.getDescription2()!= null)
						psObj.setString(6, infoObj.getDescription2());
					else
						psObj.setNull(6, Types.NULL);
					if(infoObj.getReferenceAddress3() != null)
						psObj.setString(7, infoObj.getReferenceAddress3());
					else
						psObj.setNull(7, Types.NULL);
					if(infoObj.getReferenceContact3() != null)
						psObj.setString(8, infoObj.getReferenceContact3());
					else
						psObj.setNull(8, Types.NULL);
					if(infoObj.getDescription3()!= null)
						psObj.setString(9, infoObj.getDescription3());
					else
						psObj.setNull(9, Types.NULL);
					if(infoObj.getExternalHealthAndSafetyAccrediation() != null)
						psObj.setString(10, infoObj.getExternalHealthAndSafetyAccrediation());
					else
						psObj.setNull(10, Types.NULL);
					if(infoObj.getExternalHealthAndSafetyAccrediationComments() != null)
						psObj.setString(11, infoObj.getExternalHealthAndSafetyAccrediationComments());
					else
						psObj.setNull(11, Types.NULL);

					if(infoObj.getAdditionalInformation() != null)
						psObj.setString(12, infoObj.getAdditionalInformation());
					else
						psObj.setNull(12, Types.NULL);
					if(infoObj.getSignedBy() != null)
						psObj.setString(13, infoObj.getSignedBy());
					else
						psObj.setNull(13, Types.NULL);
					if(infoObj.getSignedDate() != null)
						psObj.setString(14, infoObj.getSignedDate());
					else
						psObj.setNull(14, Types.NULL);
					if(infoObj.getSigneeName() != null)
						psObj.setString(15, infoObj.getSigneeName());
					else
						psObj.setNull(15, Types.NULL);
					if(infoObj.getSigneePosition() != null)
						psObj.setString(16, infoObj.getSigneePosition());
					else
						psObj.setNull(16, Types.NULL);
					if(infoObj.getSigneePhoneNumber() != null)
						psObj.setString(17, infoObj.getSigneePhoneNumber());
					else
						psObj.setNull(17, Types.NULL);
					if(infoObj.getSigneeAlternatePhoneNumber() != null)
						psObj.setString(18, infoObj.getSigneeAlternatePhoneNumber());
					else
						psObj.setNull(18, Types.NULL);

					if(infoObj.getSigneeEmailAddress() != null)
						psObj.setString(19, infoObj.getSigneeEmailAddress());
					else
						psObj.setNull(19, Types.NULL);
					if(infoObj.getContactPersonName() != null)
						psObj.setString(20, infoObj.getContactPersonName());
					else
						psObj.setNull(20, Types.NULL);
					if(infoObj.getContactPersonPosition() != null)
						psObj.setString(21, infoObj.getContactPersonPosition());
					else
						psObj.setNull(21, Types.NULL);
					if(infoObj.getContactPersonTelephoneNumber() != null)
						psObj.setString(22, infoObj.getContactPersonTelephoneNumber());
					else
						psObj.setNull(22, Types.NULL);
					if(infoObj.getContactPersonEmailAddress() != null)
						psObj.setString(23, infoObj.getContactPersonEmailAddress());
					else
						psObj.setNull(23, Types.NULL);
					
					psObj.setLong(24, infoObj.getContractorId());
					psObj.setLong(25, createdUserId);
					
				return psObj;
			}
		}, keyHolder);
		
		return keyHolder.getKey().longValue();
	}
	
	@Override
	public Contractor findContractorByLoginId(Long userLoginId){
		
		String sql = "SELECT ua." + Contractor.ID + ", ua." + Contractor.UNIQUE_REFERENCE + ", ua." + Contractor.COMPANY_NAME + ", ua." + Contractor.BUSINESS_NATURE
				+ ", ua." + Contractor.CONTACT_PERSON + ", ua." + Contractor.TRADING_COMMENCEMENT_DATE + ", ua." + Contractor.COMPANY_REGISTERATION_DATE + ", ua." + Contractor.VAT_NO
				+ ", ua." + Contractor.USER_LOGIN_ID + ", ua." + Contractor.STATUS_ID
				+ ", ua." + Contractor.CREATED_ON + ", ua." + Contractor.MODIFIED_ON + " , ua." + Contractor.USER_LOGIN_ID
				+ ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.HINT_QUESTION + ", x1." + UserLogin.HINT_ANSWER  + ", x1." + UserLogin.ENABLE
				+ ", x2." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				+ ", x3." + UserLogin.USERNAME + " AS " + Contractor.MODIFIED_BY 
				+ " FROM " + Contractor.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.USER_LOGIN_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.CREATED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x3 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x3." + UserLogin.ID
				+ " WHERE ua." + Contractor.USER_LOGIN_ID  + " = " + userLoginId;
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<Contractor> contractorList = jdbcTemplate.query(sql, new ContractorMapper());
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList.get(0);
			
		return null;
	}
	
	@Override
	public ContractorRegisterationStep2 loadContractorStep2Info(Long contractorId){
		
		String sql = "SELECT ua." + ContractorRegisterationStep2.ID + ", ua." + ContractorRegisterationStep2.OFFICE_ADDRESS_ID + ", ua." + ContractorRegisterationStep2.CORRESPONDENCE_ADDRESS_ID + ", ua." + ContractorRegisterationStep2.COMPANY_TYPE_ID
				+ ", ua." + ContractorRegisterationStep2.OTHER_COMPANY_TYPE + ", ua." + ContractorRegisterationStep2.CONTRACTOR_ID
				+ ", ua." + ContractorRegisterationStep2.PARENT_COMPANY_ADDRESS + ", ua." + ContractorRegisterationStep2.COMPANY_REGISTERATION_NUMBER + ", ua." + ContractorRegisterationStep2.REGISTERED_WITH_TRADEBODIES
				+ ", ua." + ContractorRegisterationStep2.REGISTERATION_NUMBER + ", ua." + ContractorRegisterationStep2.QUALITY_MARKS + ", ua." + ContractorRegisterationStep2.QUALITY_MARKS_DETAILS
				+ ", ua." + ContractorRegisterationStep2.REGISTERED_WITH_CONSTRUCTION_LINE + ", ua." + ContractorRegisterationStep2.CONSTRUCTION_LINE_REGISTERATION_NUMBER + ", ua." + ContractorRegisterationStep2.EMPLOYEE_COUNT
				+ ", ua." + ContractorRegisterationStep2.EMPLOYEES_TRADE + ", ua." + ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS + ", ua." + ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS_REGISTERATION_NUMBER
				+ ", ua." + ContractorRegisterationStep2.TAX_OFFICE_ADDRESS + ", ua." + ContractorRegisterationStep2.TAX_REFERECNE_NUMBER + ", ua." + ContractorRegisterationStep2.INSURER_NAME_ADDRESS
				+ ", ua." + ContractorRegisterationStep2.POLICY_NUMBER + ", ua." + ContractorRegisterationStep2.EMPLOYERS_LIABILITY + ", ua." + ContractorRegisterationStep2.PUBLIC_LIABILITY
				+ ", ua." + ContractorRegisterationStep2.PROFFESSIONAL_INDEMNITY + ", ua." + ContractorRegisterationStep2.INSURANCE_COVER_EXPIRY_DATE
				+ ", ua." + ContractorRegisterationStep2.ALL_DIRECTOR_DETAILS + ", ua." + ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS + ", ua." + ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS_COMMENTS
				+ ", ua." + ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE + ", ua." + ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE_COMMENTS + ", ua." + ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH
				+ ", ua." + ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH_COMMENTS
				+ ", ua." + ContractorRegisterationStep2.CREATED_ON + ", ua." + ContractorRegisterationStep2.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + Contractor.MODIFIED_BY 
				+ " FROM " + ContractorRegisterationStep2.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + ContractorRegisterationStep2.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + ContractorRegisterationStep2.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + ContractorRegisterationStep2.CONTRACTOR_ID  + " = " + contractorId;
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<ContractorRegisterationStep2> contractorList = jdbcTemplate.query(sql, new ContractorRegisterationStep2Mapper());
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList.get(0);
			
		return null;
	}
	
	@Override
	public ContractorRegisterationStep3 loadContractorStep3Info(Long contractorId){
		
		String sql = "SELECT ua." + ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY + ", ua." + ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_FILE_ID
				+ ", ua." + ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE + ", ua." + ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY + ", ua." + ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.YEAR_ENDINGS1 + ", ua." + ContractorRegisterationStep3.FATAL_ACCIDENTS1 + ", ua." + ContractorRegisterationStep3.REPORTABLE_INJURIES1
				+ ", ua." + ContractorRegisterationStep3.ACCIDENT_RATE1 + ", ua." + ContractorRegisterationStep3.NON_REPORTABLE_INJURIES1
				+ ", ua." + ContractorRegisterationStep3.YEAR_ENDINGS2 + ", ua." + ContractorRegisterationStep3.FATAL_ACCIDENTS2 + ", ua." + ContractorRegisterationStep3.REPORTABLE_INJURIES2
				+ ", ua." + ContractorRegisterationStep3.ACCIDENT_RATE2 + ", ua." + ContractorRegisterationStep3.NON_REPORTABLE_INJURIES2
				+ ", ua." + ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY + ", ua." + ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.SAFETY_ACCREDIATION + ", ua." + ContractorRegisterationStep3.SAFETY_ACCREDIATION_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.EQUALITY_POLICY + ", ua." + ContractorRegisterationStep3.EQUALITY_POLICY_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.EQUALITY_POLICY_FILE_ID
				+ ", ua." + ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION + ", ua." + ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION_COMMENTS
				+ ", ua." + ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION + ", ua." + ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION_COMMENTS 
				+ ", ua." + ContractorRegisterationStep3.WILLING_TO_ABIDE_BY_CHARITIES + ", ua." + ContractorRegisterationStep3.ADDITIONAL_INFORMATION_COST
				+ ", ua." + ContractorRegisterationStep3.CONTRACTOR_ID + ", ua." + ContractorRegisterationStep3.ID
				+ ", ua." + ContractorRegisterationStep3.CREATED_ON + ", ua." + ContractorRegisterationStep3.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + ContractorRegisterationStep3.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + ContractorRegisterationStep3.MODIFIED_BY 
				+ " FROM " + ContractorRegisterationStep3.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + ContractorRegisterationStep3.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + ContractorRegisterationStep3.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + ContractorRegisterationStep3.CONTRACTOR_ID  + " = " + contractorId;
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<ContractorRegisterationStep3> contractorList = jdbcTemplate.query(sql, new ContractorRegisterationStep3Mapper());
	 
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList.get(0);
			
		return null;
	}
	
	@Override
	public ContractorRegisterationStep4 loadContractorStep4Info(Long contractorId){
		
		String sql = "SELECT ua." + ContractorRegisterationStep4.REFERENCE_ADDRSS1 + ", ua." + ContractorRegisterationStep4.REFERENCE_CONTACT1 + ", ua." + ContractorRegisterationStep4.DESCRIPTION1
				+ ", ua." + ContractorRegisterationStep4.REFERENCE_ADDRSS2 + ", ua." + ContractorRegisterationStep4.REFERENCE_CONTACT2 + ", ua." + ContractorRegisterationStep4.DESCRIPTION2
				+ ", ua." + ContractorRegisterationStep4.REFERENCE_ADDRSS3 + ", ua." + ContractorRegisterationStep4.REFERENCE_CONTACT3 + ", ua." + ContractorRegisterationStep4.DESCRIPTION3
				+ ", ua." + ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION + ", ua." + ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION_COMMENTS
				+ ", ua." + ContractorRegisterationStep4.ADDITIONAL_INFORMATION + ", ua." + ContractorRegisterationStep4.SIGNED_BY
				+ ", ua." + ContractorRegisterationStep4.SIGNED_DATE + ", ua." + ContractorRegisterationStep4.SIGNEE_NAME + ", ua." + ContractorRegisterationStep4.SIGNEE_POSITION
				+ ", ua." + ContractorRegisterationStep4.SIGNEE_PHONE_NUMBER 
				+ ", ua." + ContractorRegisterationStep4.SIGNEE_ALTERNATE_PHONE_NUMBER 
				+ ", ua." + ContractorRegisterationStep4.SIGNEE_EMAIL_ADDRESS
				+ ", ua." + ContractorRegisterationStep4.CONTACT_PERSON_NAME + ", ua." + ContractorRegisterationStep4.CONTACT_PERSON_POSITION  + ", ua." + ContractorRegisterationStep4.CONTACT_PERSON_TELEPHONE_NUMBER
				+ ", ua." + ContractorRegisterationStep4.CONTACT_PERSON_EMAIL_ADDRESS
				+ ", ua." + ContractorRegisterationStep4.CONTRACTOR_ID
				+ ", ua." + ContractorRegisterationStep4.CREATED_ON + ", ua." + ContractorRegisterationStep4.MODIFIED_ON
				+ ", x1." + UserLogin.USERNAME + " AS " + ContractorRegisterationStep4.CREATED_BY
				+ ", x2." + UserLogin.USERNAME + " AS " + ContractorRegisterationStep4.MODIFIED_BY 
				+ " FROM " + ContractorRegisterationStep4.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + ContractorRegisterationStep4.CREATED_USER_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + ContractorRegisterationStep4.MODIFIED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " WHERE ua." + ContractorRegisterationStep4.CONTRACTOR_ID  + " = " + contractorId;
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<ContractorRegisterationStep4> contractorList = jdbcTemplate.query(sql, new ContractorRegisterationStep4Mapper());
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList.get(0);
			
		return null;
	}
	
	@Override
	public Contractor loadContractorById(Long id){
		
		String sql = "SELECT ua." + Contractor.ID + ", ua." + Contractor.UNIQUE_REFERENCE + ", ua." + Contractor.COMPANY_NAME + ", ua." + Contractor.BUSINESS_NATURE
				+ ", ua." + Contractor.CONTACT_PERSON + ", ua." + Contractor.TRADING_COMMENCEMENT_DATE + ", ua." + Contractor.COMPANY_REGISTERATION_DATE + ", ua." + Contractor.VAT_NO
				+ ", ua." + Contractor.USER_LOGIN_ID + ", ua." + Contractor.STATUS_ID
				+ ", ua." + Contractor.CREATED_ON + ", ua." + Contractor.MODIFIED_ON + " , ua." + Contractor.USER_LOGIN_ID
				+ ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.HINT_QUESTION + ", x1." + UserLogin.HINT_ANSWER  + ", x1." + UserLogin.ENABLE  
				+ ", x2." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				+ ", x3." + UserLogin.USERNAME + " AS " + Contractor.MODIFIED_BY 
				+ " FROM " + Contractor.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.USER_LOGIN_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.CREATED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x3 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x3." + UserLogin.ID
				+ " WHERE ua." + Contractor.ID  + " = " + id;
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<Contractor> contractorList = jdbcTemplate.query(sql, new ContractorMapper());
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList.get(0);
			
		return null;
	}
	
	@Override
	public List<Contractor> loadAll(Integer start, Integer limit) {
		
		String sql = "SELECT ua." + Contractor.ID + ", ua." + Contractor.UNIQUE_REFERENCE + ", ua." + Contractor.COMPANY_NAME + ", ua." + Contractor.BUSINESS_NATURE
				+ ", ua." + Contractor.CONTACT_PERSON + ", ua." + Contractor.TRADING_COMMENCEMENT_DATE + ", ua." + Contractor.COMPANY_REGISTERATION_DATE + ", ua." + Contractor.VAT_NO
				+ ", ua." + Contractor.USER_LOGIN_ID + ", ua." + Contractor.STATUS_ID
				+ ", ua." + Contractor.CREATED_ON + ", ua." + Contractor.MODIFIED_ON + " , ua." + Contractor.USER_LOGIN_ID
				+ ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.HINT_QUESTION + ", x1." + UserLogin.HINT_ANSWER   
				+ ", x2." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				+ ", x3." + UserLogin.USERNAME + " AS " + Contractor.MODIFIED_BY 
				+ " FROM " + Contractor.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.USER_LOGIN_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.CREATED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x3 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x3." + UserLogin.ID
				+ " ORDER BY " + Contractor.CREATED_ON + " DESC";
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
		 List<Contractor> contractorList = jdbcTemplate.query(sql, new ContractorMapper());
		 if(contractorList != null && !contractorList.isEmpty())
			 return contractorList;
			 
		return null;
	}

	public boolean updateContractorDetails(final Contractor contractorObj){/*
		
		String sql = "UPDATE " + Contractor.TABLE_NAME + " SET " + Contractor.COMPANY_NAME + " = ?, " + Contractor.CONTACT_PERSON + " = ?, " + Contractor.VAT_NO + " = ?, "
				+ Contractor.WEB_URL + " = ? " 
				+ " WHERE " + Contractor.ID + " = ? ";
	
		if(developmentSettings.isShowSQL())
			logger.info(sql);
		
	jdbcTemplate.update(sql, new PreparedStatementSetter() {
		@Override
		public void setValues(PreparedStatement psObj) throws SQLException {
			psObj.setString(1 , contractorObj.getCompanyName());
			psObj.setString(2 , contractorObj.getContactPerson());
			if(contractorObj.getVatNo() != null)
				psObj.setString(3, contractorObj.getVatNo());
			else
				psObj.setNull(3, Types.NULL);
			if(contractorObj.getWeburl() != null)
				psObj.setString(4, contractorObj.getWeburl());
			else
				psObj.setNull(4, Types.NULL);
			psObj.setLong(5, contractorObj.getId());
		}
	});
		return true;
	*/ return true;
		}
	
	public List<Contractor> loadContractorByExpertise(ContractorFunctionality functionality, String city){
		
		String sql = "SELECT ua." + Contractor.ID + ", ua." + Contractor.UNIQUE_REFERENCE + ", ua." + Contractor.COMPANY_NAME + ", ua." + Contractor.BUSINESS_NATURE
				+ ", ua." + Contractor.CONTACT_PERSON + ", ua." + Contractor.TRADING_COMMENCEMENT_DATE + ", ua." + Contractor.COMPANY_REGISTERATION_DATE + ", ua." + Contractor.VAT_NO
				+ ", ua." + Contractor.USER_LOGIN_ID + ", ua." + Contractor.STATUS_ID
				+ ", ua." + Contractor.CREATED_ON + ", ua." + Contractor.MODIFIED_ON
				+ ", x1." + UserLogin.ID
				+ ", x1." + UserLogin.USERNAME + ", x1." + UserLogin.PASSWORD + ", x1." + UserLogin.HINT_QUESTION + ", x1." + UserLogin.HINT_ANSWER   
				+ ", x2." + UserLogin.USERNAME + " AS " + Contractor.CREATED_BY
				+ ", x3." + UserLogin.USERNAME + " AS " + Contractor.MODIFIED_BY 
				+ ", x4." + Expertise.FUNCTIONALITY_ID
				+ ", x4." + Expertise.QUALIFICATION + ", x5." + City.CITY
				+ " FROM " + Contractor.TABLE_NAME + " ua " 
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x1 ON ua." + Contractor.USER_LOGIN_ID + " = " + " x1." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x2 ON ua." + Contractor.CREATED_USER_ID + " = " + " x2." + UserLogin.ID
				+ " LEFT JOIN " + UserLogin.TABLE_NAME  + " x3 ON ua." + Contractor.MODIFIED_USER_ID + " = " + " x3." + UserLogin.ID
				+ " LEFT JOIN " + Expertise.TABLE_NAME  + " x4 ON ua." + Contractor.ID + " = " + " x4." + Expertise.CONTRACTOR_ID
				+ " LEFT JOIN " + City.TABLE_NAME       + " x5 ON ua." + Contractor.ID + " = " + " x5." + City.OBJECT_ID
				+ " WHERE x1." + UserLogin.ENABLE + " = 1 " + " AND x4." + Expertise.ENABLE + " = 1 " + " AND ua." + Contractor.STATUS_ID + " =  " + Status.APPROVED.id()
				+ " AND x4." + Expertise.FUNCTIONALITY_ID + " = " + functionality.id()
				+ " AND x5." + City.OBJECT_TYPE + " = " + ObjectType.CONTRACTOR_FUNCTIONALITY.id()
				+ " AND x5." + City.CITY + " = '" + city + "'";
				
				
	if(developmentSettings.isShowSQL())
		logger.info(sql);
	
	 List<Contractor> contractorList = jdbcTemplate.query(sql, new ContractorExpertiseMapper());
	 if(contractorList != null && !contractorList.isEmpty())
		 return contractorList;
		
		return null;
	}
	
	@Override
	public void approveContractor(final Contractor contractorObj, final Long userId) {
		
		final String sql = "UPDATE " + Contractor.TABLE_NAME + " SET " + Contractor.STATUS_ID + " = 5, "
		           + Contractor.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Contractor.MODIFIED_USER_ID + " = ? "
		           + " WHERE " + Contractor.ID + " = ?";

	
		if(developmentSettings.isShowSQL())
				logger.info(sql);
	
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(1, userId);
				psObj.setLong(2, contractorObj.getId());
			}
		});
	}

	@Override
	public void disapproveContractor(final Contractor contractorObj, final Long userId) {
		
		final String sql = "UPDATE " + Contractor.TABLE_NAME + " SET " + Contractor.STATUS_ID + " = 6, "
		           + Contractor.MODIFIED_ON + " =CURRENT_TIMESTAMP, " + Contractor.MODIFIED_USER_ID + " = ? "
		           + " WHERE " + Contractor.ID + " = ?";

	
		if(developmentSettings.isShowSQL())
				logger.info(sql);
	
		jdbcTemplate.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement psObj) throws SQLException {
				psObj.setLong(1, userId);
				psObj.setLong(2, contractorObj.getId());
			}
		});
		
	}
	
	@Override
	public boolean deleteContractor(Long objId) {
		boolean status = false;
		if(objId!=null){
		String sql = "DELETE FROM " + Contractor.TABLE_NAME + " WHERE " + Contractor.ID + " = " + objId;
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			try{
			jdbcTemplate.update(sql);
			status = true;
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return status;
	}

	@Override
	public int updatePassword(Long userLoginId, String updatedPassword) {
		
		String sql = "UPDATE " + UserLogin.TABLE_NAME + " SET " + UserLogin.PASSWORD +  " = '" + updatedPassword + "'"+
					" WHERE " + UserLogin.ID + " = " + userLoginId;
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
			int status = jdbcTemplate.update(sql);
			
		return status;
	}

	@Override
	public void saveFunctionalityCostMatrix(final FunctionalityCostMatrix costObj){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + FunctionalityCostMatrix.TABLE_NAME + "( "
						+ FunctionalityCostMatrix.FUNCTIONALITY_ID + ", " + FunctionalityCostMatrix.CALL_OUT_MON_TO_FRI + ", " + FunctionalityCostMatrix.CALL_OUT_WEEKENDS
						+ ", " + FunctionalityCostMatrix.HOURLY_RATES
						+ ", " + FunctionalityCostMatrix.HOURLY_RATE_WEEKENDS + ", " + FunctionalityCostMatrix.OBJECT_ID + ", " + FunctionalityCostMatrix.CONTRACTOR_ID
						+ " ) VALUES (?, ?, ?, ?, ?, ?, ? )";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, costObj.getFunctionalityId());
					psObj.setString(2, costObj.getCallOutMonToFri());
					psObj.setString(3, costObj.getCallOutWeekends());
					psObj.setString(4, costObj.getHourlyRate());
					psObj.setString(5, costObj.getHourlyRateWeekends());
					psObj.setLong(6, costObj.getObjectId());
					psObj.setLong(7, costObj.getContractorId());
				return psObj;
			}
		}, keyHolder);
		
	}
	
	public List<FunctionalityCostMatrix> loadFunctionalityCostMatrix(Long contractorId){
		String sql = "SELECT " + FunctionalityCostMatrix.CONTRACTOR_ID + ", " + FunctionalityCostMatrix.FUNCTIONALITY_ID + ", " + FunctionalityCostMatrix.CALL_OUT_MON_TO_FRI
				 + ", " + FunctionalityCostMatrix.HOURLY_RATES + ", " + FunctionalityCostMatrix.CALL_OUT_WEEKENDS + ", " + FunctionalityCostMatrix.HOURLY_RATE_WEEKENDS
				 + ", " + FunctionalityCostMatrix.OBJECT_ID + " FROM " +FunctionalityCostMatrix.TABLE_NAME +" WHERE " + FunctionalityCostMatrix.CONTRACTOR_ID + " = " + contractorId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);

		List<FunctionalityCostMatrix> costList = jdbcTemplate.query(sql, new RowMapper<FunctionalityCostMatrix>() {
	
			@Override
			public FunctionalityCostMatrix mapRow(ResultSet rst, int arg1)throws SQLException {
				FunctionalityCostMatrix obj = new FunctionalityCostMatrix();
					obj.setContractorId(rst.getLong(FunctionalityCostMatrix.CONTRACTOR_ID));;
					obj.setFunctionalityId(rst.getLong(FunctionalityCostMatrix.FUNCTIONALITY_ID));;
					obj.setCallOutMonToFri(rst.getString(FunctionalityCostMatrix.CALL_OUT_MON_TO_FRI));
					obj.setHourlyRate(rst.getString(FunctionalityCostMatrix.HOURLY_RATES));
					obj.setCallOutWeekends(rst.getString(FunctionalityCostMatrix.CALL_OUT_WEEKENDS));
					obj.setHourlyRateWeekends(rst.getString(FunctionalityCostMatrix.HOURLY_RATE_WEEKENDS));
					obj.setObjectId(rst.getLong(FunctionalityCostMatrix.OBJECT_ID));
				return obj;
			}
		});
		
		if(costList != null)
			return costList;
		
		return null;
		
	}
	
	public void deleteFunctionalityCostMatrix(Long contractorId){
		
		String sql = "DELETE FROM " + FunctionalityCostMatrix.TABLE_NAME + " WHERE " + FunctionalityCostMatrix.CONTRACTOR_ID + "=" + contractorId;
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
		
			jdbcTemplate.update(sql);
	}
	
	@Override
	public void saveTurnover(final TurnOverDetails turnOverObj){
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final String sql = "INSERT INTO " + TurnOverDetails.TABLE_NAME + "( "
						+ TurnOverDetails.CONTRACTOR_ID + ", " + TurnOverDetails.FINANCIAL_YEAR + ", " + TurnOverDetails.TURNOVER
						+ " ) VALUES (?, ?, ? )";
		
		if(developmentSettings.isShowSQL()){
			logger.info(sql);
		}
			
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
					psObj.setLong(1, turnOverObj.getContractorId());
					psObj.setString(2, turnOverObj.getFinancialYear());
					psObj.setString(3, turnOverObj.getTurnOver());
				return psObj;
			}
		}, keyHolder);
	}
	
	@Override
	public List<TurnOverDetails> loadTurnOver(Long contractorId){
		
		String sql = "SELECT " + TurnOverDetails.CONTRACTOR_ID + ", " + TurnOverDetails.FINANCIAL_YEAR + ", " + TurnOverDetails.TURNOVER + " FROM " + TurnOverDetails.TABLE_NAME + 
							" WHERE " + TurnOverDetails.CONTRACTOR_ID + " = " + contractorId + " ORDER BY "	+ TurnOverDetails.FINANCIAL_YEAR ;

	
		if(developmentSettings.isShowSQL())
				logger.info(sql);
	
		List<TurnOverDetails> turnOverList = jdbcTemplate.query(sql, new RowMapper<TurnOverDetails>() {

			@Override
			public TurnOverDetails mapRow(ResultSet rst, int arg1)throws SQLException {
				TurnOverDetails obj = new TurnOverDetails();
					obj.setContractorId(rst.getLong(TurnOverDetails.CONTRACTOR_ID));
					obj.setFinancialYear(rst.getString(TurnOverDetails.FINANCIAL_YEAR));
					obj.setTurnOver(rst.getString(TurnOverDetails.TURNOVER));
				return obj;
			}
		});
		
		if(turnOverList != null)
			return turnOverList;
		
		return null;
	}
	
	@Override
	public boolean checkContractorData(String tableName, Long contractorId){
		String sql = "SELECT contractorId FROM " + tableName + " WHERE contractorId = " + contractorId;
		
		if(developmentSettings.isShowSQL())
			logger.info(sql);

	List<Long> contractorIdList = jdbcTemplate.query(sql, new RowMapper<Long>() {

		@Override
		public Long mapRow(ResultSet rst, int arg1)throws SQLException {
			return new Long(rst.getLong("contractorId"));
		}
	});
	
	if(contractorIdList != null && contractorIdList.size() > 0)
		return true;
		
		return false;
	}
	
	@Override
	public Long insertContractorData(String tableName, String[] fields, String[] values, String contractorField, Long contractorId){
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		
		final StringBuilder sql = new StringBuilder("INSERT INTO " + tableName)  ;
		
		if(fields != null && values != null){
			StringBuilder fieldsStr = new StringBuilder();
			String delim = "";
			for (String field : fields) {
				fieldsStr.append(delim).append(field);
				delim = ", ";
			}
			System.out.println(fieldsStr);
			sql.append("(").append(fieldsStr).append(", " + contractorField).append(") VALUES "); 
			
			fieldsStr = new StringBuilder();
			
			String vDelim = "";
			for (String value : values) {
				fieldsStr.append(vDelim).append("'"+value+"'");
				vDelim = ", ";
			}
			
			sql.append("(").append(fieldsStr).append("," + contractorId).append(")"); 
		}else{
			sql.append("(" + contractorField + ")").append(" VALUES (" + contractorId + ") ");
		}
		
		System.out.println(sql.toString());
		
		if(developmentSettings.isShowSQL())
			logger.info(sql.toString());
		
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement psObj = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
				return psObj;
			}
		}, keyHolder);
		
		if(keyHolder.getKey() != null){
			return keyHolder.getKey().longValue();
		}
		
		return null;
	}
	
	@Override
	public void update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues){
		String sql = "UPDATE " + tableName + " SET ";
		int counter = 0;
		String delim = "";
		   for (String value : values) {
			sql +=  delim + fields[counter++].trim() + " = '" + value.trim() + "'"; 
			delim = ", ";
		   } 
		   if(whereCondition != null){
			   int wCounter = 0;
			   sql += " WHERE ";
			   String wDelim = "";
			   for (String value : whereValues) {
				   sql += wDelim  + whereCondition[wCounter++].trim() + " = '" + value.trim() + "'";
				   wDelim = " AND ";
			   	}
		   }
		   
		   if(developmentSettings.isShowSQL())
			   logger.info(sql);
		   
		   jdbcTemplate.update(sql);
		   
	}
	
}
