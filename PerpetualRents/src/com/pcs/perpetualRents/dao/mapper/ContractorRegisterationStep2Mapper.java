package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;

public class ContractorRegisterationStep2Mapper implements RowMapper<ContractorRegisterationStep2>{
	
	@Override
	public ContractorRegisterationStep2 mapRow(ResultSet rst, int arg1) throws SQLException {
		ContractorRegisterationStep2 obj = null;
		try{
			obj = new ContractorRegisterationStep2();
				obj.setId(rst.getLong(ContractorRegisterationStep2.ID));
				obj.setOfficeAddressId(rst.getLong(ContractorRegisterationStep2.OFFICE_ADDRESS_ID));
				obj.setCorrespondenceAddressId(rst.getLong(ContractorRegisterationStep2.CORRESPONDENCE_ADDRESS_ID));
				obj.setCompanyTypeId(rst.getShort(ContractorRegisterationStep2.COMPANY_TYPE_ID));
				obj.setOtherCompanyType(rst.getString(ContractorRegisterationStep2.OTHER_COMPANY_TYPE));
				obj.setContractorId(rst.getLong(ContractorRegisterationStep2.CONTRACTOR_ID));
				
				obj.setAllDirectorsOfCompany(rst.getString(ContractorRegisterationStep2.ALL_DIRECTOR_DETAILS));
				obj.setBankruptcyProceedings(rst.getString(ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS));
				obj.setBankruptcyProceedingsComments(rst.getString(ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS_COMMENTS));
				obj.setConvictedToCriminalOffence(rst.getString(ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE));
				obj.setConvictedToCriminalOffenceComments(rst.getString(ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE_COMMENTS));
				obj.setTrusteeOfAshantiDutch(rst.getString(ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH));
				obj.setTrusteeOfAshantiDutchComments(rst.getString(ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH_COMMENTS));
				
				obj.setParentCompanyAddress(rst.getString(ContractorRegisterationStep2.PARENT_COMPANY_ADDRESS));
				obj.setCompanyRegisterationNumber(rst.getString(ContractorRegisterationStep2.COMPANY_REGISTERATION_NUMBER));
				obj.setRegisteredWithTradeBodies(rst.getString(ContractorRegisterationStep2.REGISTERED_WITH_TRADEBODIES));
				obj.setRegisterationNumber(rst.getString(ContractorRegisterationStep2.REGISTERATION_NUMBER));
				obj.setQualityMarks(rst.getString(ContractorRegisterationStep2.QUALITY_MARKS));
				obj.setQualityMarksDetails(rst.getString(ContractorRegisterationStep2.QUALITY_MARKS_DETAILS));
				obj.setRegisteredWithConstructionLine(rst.getString(ContractorRegisterationStep2.REGISTERED_WITH_CONSTRUCTION_LINE));
				obj.setConstructionLineRegisterationNumber(rst.getString(ContractorRegisterationStep2.CONSTRUCTION_LINE_REGISTERATION_NUMBER));
				obj.setEmployeesCount(rst.getString(ContractorRegisterationStep2.EMPLOYEE_COUNT));
				obj.setEmployeesTrade(rst.getString(ContractorRegisterationStep2.EMPLOYEES_TRADE));
				obj.setEmploySubcontractors(rst.getString(ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS));
				obj.setEmploySubContractorRegisterationNumber(rst.getString(ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS_REGISTERATION_NUMBER));
				obj.setTaxOfficeAddress(rst.getString(ContractorRegisterationStep2.TAX_OFFICE_ADDRESS));
				obj.setTaxReferenceNumber(rst.getString(ContractorRegisterationStep2.TAX_REFERECNE_NUMBER));
				obj.setInsurerNameandAddress(rst.getString(ContractorRegisterationStep2.INSURER_NAME_ADDRESS));
				obj.setPolicyNumber(rst.getString(ContractorRegisterationStep2.POLICY_NUMBER));
				obj.setEmployersLiability(rst.getString(ContractorRegisterationStep2.EMPLOYERS_LIABILITY));
				obj.setPublicLiability(rst.getString(ContractorRegisterationStep2.PUBLIC_LIABILITY));
				obj.setProffessionalIndemnity(rst.getString(ContractorRegisterationStep2.PROFFESSIONAL_INDEMNITY));
				obj.setInsauranceCoverExpiryDate(rst.getString(ContractorRegisterationStep2.INSURANCE_COVER_EXPIRY_DATE));
				
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