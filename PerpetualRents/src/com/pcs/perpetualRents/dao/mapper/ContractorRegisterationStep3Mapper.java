package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;

public class ContractorRegisterationStep3Mapper implements RowMapper<ContractorRegisterationStep3>{
	
	@Override
	public ContractorRegisterationStep3 mapRow(ResultSet rst, int arg1) throws SQLException {
		ContractorRegisterationStep3 obj = null;
		try{
			obj = new ContractorRegisterationStep3();
				obj.setId(rst.getLong(ContractorRegisterationStep3.ID));
				obj.setWrittenHealthPolicy(rst.getString(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY));
				obj.setWrittenHealthPolicyYesComments(rst.getString(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_COMMENTS));
				obj.setWrittenHealthPolicyFileId(rst.getLong(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_FILE_ID));
				
				obj.setCompetentHealthAndSafetyAdvice(rst.getString(ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE));
				obj.setCompetentHealthAndSafetyAdviceComments(rst.getString(ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE_COMMENTS));
				
				obj.setReceivedHealthAndSafety(rst.getString(ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY));
				obj.setReceivedHealthAndSafetyComments(rst.getString(ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY_COMMENTS));
				
				obj.setYearEnding1(rst.getString(ContractorRegisterationStep3.YEAR_ENDINGS1));
				obj.setFatalAccidents1(rst.getString(ContractorRegisterationStep3.FATAL_ACCIDENTS1));
				obj.setReportableInjuries1(rst.getString(ContractorRegisterationStep3.REPORTABLE_INJURIES1));
				obj.setAccidentRate1(rst.getString(ContractorRegisterationStep3.ACCIDENT_RATE1));
				obj.setNonReportableInjuries1(rst.getString(ContractorRegisterationStep3.NON_REPORTABLE_INJURIES1));
				
				obj.setYearEnding2(rst.getString(ContractorRegisterationStep3.YEAR_ENDINGS2));
				obj.setFatalAccidents2(rst.getString(ContractorRegisterationStep3.FATAL_ACCIDENTS2));
				obj.setReportableInjuries2(rst.getString(ContractorRegisterationStep3.REPORTABLE_INJURIES2));
				obj.setAccidentRate2(rst.getString(ContractorRegisterationStep3.ACCIDENT_RATE2));
				obj.setNonReportableInjuries2(rst.getString(ContractorRegisterationStep3.NON_REPORTABLE_INJURIES2));
				
				obj.setEnforcementNoticeforHealthSafety(rst.getString(ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY));
				obj.setEnforcementNoticeforHealthSafetyComments(rst.getString(ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY_COMMENTS));
				
				obj.setSafetyAccreditation(rst.getString(ContractorRegisterationStep3.SAFETY_ACCREDIATION));
				obj.setSafetyAccreditationComments(rst.getString(ContractorRegisterationStep3.SAFETY_ACCREDIATION_COMMENTS));
				
				obj.setEqualityPolicy(rst.getString(ContractorRegisterationStep3.EQUALITY_POLICY));
				obj.setEqualityPolicyComments(rst.getString(ContractorRegisterationStep3.EQUALITY_POLICY_COMMENTS));
				obj.setEqualityPolicyFileId(rst.getLong(ContractorRegisterationStep3.EQUALITY_POLICY_FILE_ID));
				
				obj.setAnyunlawfulDiscrimination(rst.getString(ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION));
				obj.setAnyunlawfulDiscriminationComments(rst.getString(ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION_COMMENTS));
				
				obj.setSubjectOfFormalInvestigation(rst.getString(ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION));
				obj.setSubjectOfFormalInvestigationComments(rst.getString(ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION_COMMENTS));
				
				obj.setWillingToAbideByCharities(rst.getString(ContractorRegisterationStep3.WILLING_TO_ABIDE_BY_CHARITIES));
				obj.setContractorId(rst.getLong(ContractorRegisterationStep3.CONTRACTOR_ID));
				obj.setAdditionalInformationOfCost(rst.getString(ContractorRegisterationStep3.ADDITIONAL_INFORMATION_COST));
				
				obj.setCreatedOn(rst.getDate(Contractor.CREATED_ON));
				obj.setCreatedBy(rst.getString(Contractor.CREATED_BY));
				obj.setModifiedOn(rst.getDate(Contractor.MODIFIED_ON));
				obj.setModifiedBy(rst.getString(Contractor.MODIFIED_BY));
			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}