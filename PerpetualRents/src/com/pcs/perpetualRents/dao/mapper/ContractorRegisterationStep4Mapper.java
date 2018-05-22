package com.pcs.perpetualRents.dao.mapper;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;

public class ContractorRegisterationStep4Mapper implements RowMapper<ContractorRegisterationStep4>{
	
	@Override
	public ContractorRegisterationStep4 mapRow(ResultSet rst, int arg1) throws SQLException {
		ContractorRegisterationStep4 obj = null;
		try{
			obj = new ContractorRegisterationStep4();
				
				obj.setReferenceAddress1(rst.getString(ContractorRegisterationStep4.REFERENCE_ADDRSS1));
				obj.setReferenceContact1(rst.getString(ContractorRegisterationStep4.REFERENCE_CONTACT1));
				obj.setDescription1(rst.getString(ContractorRegisterationStep4.DESCRIPTION1));
				
				obj.setReferenceAddress2(rst.getString(ContractorRegisterationStep4.REFERENCE_ADDRSS2));
				obj.setReferenceContact2(rst.getString(ContractorRegisterationStep4.REFERENCE_CONTACT2));
				obj.setDescription2(rst.getString(ContractorRegisterationStep4.DESCRIPTION2));
				
				obj.setReferenceAddress3(rst.getString(ContractorRegisterationStep4.REFERENCE_ADDRSS3));
				obj.setReferenceContact3(rst.getString(ContractorRegisterationStep4.REFERENCE_CONTACT3));
				obj.setDescription3(rst.getString(ContractorRegisterationStep4.DESCRIPTION3));
				
				obj.setExternalHealthAndSafetyAccrediation(rst.getString(ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION));
				obj.setExternalHealthAndSafetyAccrediationComments(rst.getString(ContractorRegisterationStep4.EXTERNAL_HEALTH_AND_SAFETY_ACCEREDIATION_COMMENTS));

				obj.setAdditionalInformation(rst.getString(ContractorRegisterationStep4.ADDITIONAL_INFORMATION));
				
				obj.setSignedBy(rst.getString(ContractorRegisterationStep4.SIGNED_BY));
				obj.setSignedDate(rst.getString(ContractorRegisterationStep4.SIGNED_DATE));
				obj.setSigneeName(rst.getString(ContractorRegisterationStep4.SIGNEE_NAME));
				obj.setSigneePosition(rst.getString(ContractorRegisterationStep4.SIGNEE_POSITION));
				obj.setSigneePhoneNumber(rst.getString(ContractorRegisterationStep4.SIGNEE_PHONE_NUMBER));
				obj.setSigneeAlternatePhoneNumber(rst.getString(ContractorRegisterationStep4.SIGNEE_ALTERNATE_PHONE_NUMBER));
				
				obj.setSigneeEmailAddress(rst.getString(ContractorRegisterationStep4.SIGNEE_EMAIL_ADDRESS));
				
				obj.setContactPersonName(rst.getString(ContractorRegisterationStep4.CONTACT_PERSON_NAME));
				obj.setContactPersonPosition(rst.getString(ContractorRegisterationStep4.CONTACT_PERSON_POSITION));
				obj.setContactPersonTelephoneNumber(rst.getString(ContractorRegisterationStep4.CONTACT_PERSON_TELEPHONE_NUMBER));
				obj.setContactPersonEmailAddress(rst.getString(ContractorRegisterationStep4.CONTACT_PERSON_EMAIL_ADDRESS));
				
				obj.setCreatedOn(rst.getDate(ContractorRegisterationStep4.CREATED_ON));
				obj.setCreatedBy(rst.getString(ContractorRegisterationStep4.CREATED_BY));
				obj.setModifiedOn(rst.getDate(ContractorRegisterationStep4.MODIFIED_ON));
				obj.setModifiedBy(rst.getString(ContractorRegisterationStep4.MODIFIED_BY));
			
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

}