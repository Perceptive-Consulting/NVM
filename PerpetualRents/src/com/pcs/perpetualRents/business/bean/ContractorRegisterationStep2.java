package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.CompanyType;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ContractorRegisterationStep2 extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + ContractorRegisterationStep2.class.getSimpleName().toLowerCase();
	
	public static final String OFFICE_ADDRESS_ID = "officeAddressId";
	public static final String CORRESPONDENCE_ADDRESS_ID = "correspondenceAddressId";
	public static final String COMPANY_TYPE_ID = "companyTypeId";
	public static final String OTHER_COMPANY_TYPE = "otherCompanyType";
	public static final String CONTRACTOR_ID = "contractorId";
	
	public static final String ALL_DIRECTOR_DETAILS = "allDirectorsOfCompany";
	public static final String BANKRUPTCY_PROCEEDINGS = "bankruptcyProceedings";
	public static final String BANKRUPTCY_PROCEEDINGS_COMMENTS = "bankruptcyProceedingsComments";
	public static final String CONVICTED_TO_CRIMINAL_OFFENCE = "convictedToCriminalOffence";
	public static final String CONVICTED_TO_CRIMINAL_OFFENCE_COMMENTS = "convictedToCriminalOffenceComments";
	public static final String TRUSTEE_OF_ASHANTI_DUTCH = "trusteeOfAshantiDutch";
	public static final String TRUSTEE_OF_ASHANTI_DUTCH_COMMENTS = "trusteeOfAshantiDutchComments";
	
	
	public static final String PARENT_COMPANY_ADDRESS = "parentCompanyAddress";
	public static final String COMPANY_REGISTERATION_NUMBER = "companyRegisterationNumber";
	public static final String REGISTERED_WITH_TRADEBODIES = "registeredWithTradeBodies";
	public static final String REGISTERATION_NUMBER = "registerationNumber";
	public static final String QUALITY_MARKS = "qualityMarks";
	public static final String QUALITY_MARKS_DETAILS = "qualityMarksDetails";
	public static final String REGISTERED_WITH_CONSTRUCTION_LINE = "registeredWithConstructionLine";
	public static final String CONSTRUCTION_LINE_REGISTERATION_NUMBER = "constructionLineRegisterationNumber";
	public static final String EMPLOYEE_COUNT = "employeesCount";
	public static final String EMPLOYEES_TRADE = "employeesTrade";
	public static final String EMPLOY_SUBCONTRACTORS = "employSubcontractors";
	public static final String EMPLOY_SUBCONTRACTORS_REGISTERATION_NUMBER = "employSubContractorRegisterationNumber";
	public static final String TAX_OFFICE_ADDRESS = "taxOfficeAddress";
	public static final String TAX_REFERECNE_NUMBER = "taxReferenceNumber";
	public static final String INSURER_NAME_ADDRESS = "insurerNameandAddress";
	public static final String POLICY_NUMBER = "policyNumber";
	public static final String EMPLOYERS_LIABILITY = "employersLiability";
	public static final String PUBLIC_LIABILITY = "publicLiability";
	public static final String PROFFESSIONAL_INDEMNITY = "proffessionalIndemnity";
	public static final String INSURANCE_COVER_EXPIRY_DATE = "insauranceCoverExpiryDate";
	
	private Address officeAddObj;
	private Address correspondenceAddObj;
	private Short companyTypeId;
	private String otherCompanyType;
	
	private Long contractorId;
	private Long officeAddressId;
	private Long correspondenceAddressId;
	
	private String allDirectorsOfCompany;
	private String bankruptcyProceedings;
	private String bankruptcyProceedingsComments;
	private String convictedToCriminalOffence;
	private String convictedToCriminalOffenceComments;
	private String trusteeOfAshantiDutch;
	private String trusteeOfAshantiDutchComments;
	
	private String parentCompanyAddress;
	private String companyRegisterationNumber;
	private String registeredWithTradeBodies;
	private String registerationNumber;
	private String qualityMarks;
	private String qualityMarksDetails;
	private String registeredWithConstructionLine;
	private String constructionLineRegisterationNumber;
	private String employeesCount;
	private String employeesTrade;
	private String employSubcontractors;
	private String employSubContractorRegisterationNumber;
	private String taxOfficeAddress;
	private String taxReferenceNumber;
	private String insurerNameandAddress;
	private String policyNumber;
	private String employersLiability;
	private String publicLiability;
	private String proffessionalIndemnity;
	private String insauranceCoverExpiryDate;
	
	
	public String getAllDirectorsOfCompany() {
		return allDirectorsOfCompany;
	}
	public void setAllDirectorsOfCompany(String allDirectorsOfCompany) {
		this.allDirectorsOfCompany = allDirectorsOfCompany;
	}
	public String getBankruptcyProceedings() {
		return bankruptcyProceedings;
	}
	public void setBankruptcyProceedings(String bankruptcyProceedings) {
		this.bankruptcyProceedings = bankruptcyProceedings;
	}
	public String getBankruptcyProceedingsComments() {
		return bankruptcyProceedingsComments;
	}
	public void setBankruptcyProceedingsComments(
			String bankruptcyProceedingsComments) {
		this.bankruptcyProceedingsComments = bankruptcyProceedingsComments;
	}
	public String getConvictedToCriminalOffence() {
		return convictedToCriminalOffence;
	}
	public void setConvictedToCriminalOffence(String convictedToCriminalOffence) {
		this.convictedToCriminalOffence = convictedToCriminalOffence;
	}
	public String getConvictedToCriminalOffenceComments() {
		return convictedToCriminalOffenceComments;
	}
	public void setConvictedToCriminalOffenceComments(
			String convictedToCriminalOffenceComments) {
		this.convictedToCriminalOffenceComments = convictedToCriminalOffenceComments;
	}
	public String getTrusteeOfAshantiDutch() {
		return trusteeOfAshantiDutch;
	}
	public void setTrusteeOfAshantiDutch(String trusteeOfAshantiDutch) {
		this.trusteeOfAshantiDutch = trusteeOfAshantiDutch;
	}
	public String getTrusteeOfAshantiDutchComments() {
		return trusteeOfAshantiDutchComments;
	}
	public void setTrusteeOfAshantiDutchComments(
			String trusteeOfAshantiDutchComments) {
		this.trusteeOfAshantiDutchComments = trusteeOfAshantiDutchComments;
	}
	public String getEmploySubContractorRegisterationNumber() {
		return employSubContractorRegisterationNumber;
	}
	public void setEmploySubContractorRegisterationNumber(
			String employSubContractorRegisterationNumber) {
		this.employSubContractorRegisterationNumber = employSubContractorRegisterationNumber;
	}
	public Long getOfficeAddressId() {
		return officeAddressId;
	}
	public void setOfficeAddressId(Long officeAddressId) {
		this.officeAddressId = officeAddressId;
	}
	public Long getCorrespondenceAddressId() {
		return correspondenceAddressId;
	}
	public void setCorrespondenceAddressId(Long correspondenceAddressId) {
		this.correspondenceAddressId = correspondenceAddressId;
	}
	public Address getOfficeAddObj() {
		return officeAddObj;
	}
	public void setOfficeAddObj(Address officeAddObj) {
		this.officeAddObj = officeAddObj;
	}
	public Address getCorrespondenceAddObj() {
		return correspondenceAddObj;
	}
	public void setCorrespondenceAddObj(Address correspondenceAddObj) {
		this.correspondenceAddObj = correspondenceAddObj;
	}
	public Short getCompanyTypeId() {
		return companyTypeId;
	}
	public void setCompanyTypeId(Short companyTypeId) {
		this.companyTypeId = companyTypeId;
	}
	public String getOtherCompanyType() {
		return otherCompanyType;
	}
	public void setOtherCompanyType(String otherCompanyType) {
		this.otherCompanyType = otherCompanyType;
	}
	public Long getContractorId() {
		return contractorId;
	}
	public void setContractorId(Long contractorId) {
		this.contractorId = contractorId;
	}
	public String getParentCompanyAddress() {
		return parentCompanyAddress;
	}
	public void setParentCompanyAddress(String parentCompanyAddress) {
		this.parentCompanyAddress = parentCompanyAddress;
	}
	public String getCompanyRegisterationNumber() {
		return companyRegisterationNumber;
	}
	public void setCompanyRegisterationNumber(String companyRegisterationNumber) {
		this.companyRegisterationNumber = companyRegisterationNumber;
	}
	public String getRegisteredWithTradeBodies() {
		return registeredWithTradeBodies;
	}
	public void setRegisteredWithTradeBodies(String registeredWithTradeBodies) {
		this.registeredWithTradeBodies = registeredWithTradeBodies;
	}
	public String getRegisterationNumber() {
		return registerationNumber;
	}
	public void setRegisterationNumber(String registerationNumber) {
		this.registerationNumber = registerationNumber;
	}
	public String getQualityMarks() {
		return qualityMarks;
	}
	public void setQualityMarks(String qualityMarks) {
		this.qualityMarks = qualityMarks;
	}
	public String getQualityMarksDetails() {
		return qualityMarksDetails;
	}
	public void setQualityMarksDetails(String qualityMarksDetails) {
		this.qualityMarksDetails = qualityMarksDetails;
	}
	public String getRegisteredWithConstructionLine() {
		return registeredWithConstructionLine;
	}
	public void setRegisteredWithConstructionLine(
			String registeredWithConstructionLine) {
		this.registeredWithConstructionLine = registeredWithConstructionLine;
	}
	public String getConstructionLineRegisterationNumber() {
		return constructionLineRegisterationNumber;
	}
	public void setConstructionLineRegisterationNumber(
			String constructionLineRegisterationNumber) {
		this.constructionLineRegisterationNumber = constructionLineRegisterationNumber;
	}
	public String getEmployeesCount() {
		return employeesCount;
	}
	public void setEmployeesCount(String employeesCount) {
		this.employeesCount = employeesCount;
	}
	public String getEmployeesTrade() {
		return employeesTrade;
	}
	public void setEmployeesTrade(String employeesTrade) {
		this.employeesTrade = employeesTrade;
	}
	public String getEmploySubcontractors() {
		return employSubcontractors;
	}
	public void setEmploySubcontractors(String employSubcontractors) {
		this.employSubcontractors = employSubcontractors;
	}
	public String getTaxOfficeAddress() {
		return taxOfficeAddress;
	}
	public void setTaxOfficeAddress(String taxOfficeAddress) {
		this.taxOfficeAddress = taxOfficeAddress;
	}
	public String getTaxReferenceNumber() {
		return taxReferenceNumber;
	}
	public void setTaxReferenceNumber(String taxReferenceNumber) {
		this.taxReferenceNumber = taxReferenceNumber;
	}
	public String getInsurerNameandAddress() {
		return insurerNameandAddress;
	}
	public void setInsurerNameandAddress(String insurerNameandAddress) {
		this.insurerNameandAddress = insurerNameandAddress;
	}
	public String getPolicyNumber() {
		return policyNumber;
	}
	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}
	public String getEmployersLiability() {
		return employersLiability;
	}
	public void setEmployersLiability(String employersLiability) {
		this.employersLiability = employersLiability;
	}
	public String getPublicLiability() {
		return publicLiability;
	}
	public void setPublicLiability(String publicLiability) {
		this.publicLiability = publicLiability;
	}
	public String getProffessionalIndemnity() {
		return proffessionalIndemnity;
	}
	public void setProffessionalIndemnity(String proffessionalIndemnity) {
		this.proffessionalIndemnity = proffessionalIndemnity;
	}
	public String getInsauranceCoverExpiryDate() {
		return insauranceCoverExpiryDate;
	}
	public void setInsauranceCoverExpiryDate(String insauranceCoverExpiryDate) {
		this.insauranceCoverExpiryDate = insauranceCoverExpiryDate;
	}
	
	@Override
	public String toString() {
		return "ContractorRegisterationStep2 [officeAddObj=" + officeAddObj
				+ ", correspondenceAddObj=" + correspondenceAddObj
				+ ", companyTypeId=" + companyTypeId + ", otherCompanyType="
				+ otherCompanyType + ", contractorId=" + contractorId
				+ ", officeAddressId=" + officeAddressId
				+ ", correspondenceAddressId=" + correspondenceAddressId
				+ ", allDirectorsOfCompany=" + allDirectorsOfCompany
				+ ", bankruptcyProceedings=" + bankruptcyProceedings
				+ ", bankruptcyProceedingsComments="
				+ bankruptcyProceedingsComments
				+ ", convictedToCriminalOffence=" + convictedToCriminalOffence
				+ ", convictedToCriminalOffenceComments="
				+ convictedToCriminalOffenceComments
				+ ", trusteeOfAshantiDutch=" + trusteeOfAshantiDutch
				+ ", trusteeOfAshantiDutchComments="
				+ trusteeOfAshantiDutchComments + ", parentCompanyAddress="
				+ parentCompanyAddress + ", companyRegisterationNumber="
				+ companyRegisterationNumber + ", registeredWithTradeBodies="
				+ registeredWithTradeBodies + ", registerationNumber="
				+ registerationNumber + ", qualityMarks=" + qualityMarks
				+ ", qualityMarksDetails=" + qualityMarksDetails
				+ ", registeredWithConstructionLine="
				+ registeredWithConstructionLine
				+ ", constructionLineRegisterationNumber="
				+ constructionLineRegisterationNumber + ", employeesCount="
				+ employeesCount + ", employeesTrade=" + employeesTrade
				+ ", employSubcontractors=" + employSubcontractors
				+ ", employSubContractorRegisterationNumber="
				+ employSubContractorRegisterationNumber
				+ ", taxOfficeAddress=" + taxOfficeAddress
				+ ", taxReferenceNumber=" + taxReferenceNumber
				+ ", insurerNameandAddress=" + insurerNameandAddress
				+ ", policyNumber=" + policyNumber + ", employersLiability="
				+ employersLiability + ", publicLiability=" + publicLiability
				+ ", proffessionalIndemnity=" + proffessionalIndemnity
				+ ", insauranceCoverExpiryDate=" + insauranceCoverExpiryDate
				+ "]";
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(ContractorRegisterationStep2.COMPANY_TYPE_ID, this.companyTypeId);
			System.out.println("otherCompanyType " + this.otherCompanyType);
			jObj.put("companyTypeStr", this.companyTypeId == CompanyType.OTHER.id() ? this.otherCompanyType : CompanyType.get(this.companyTypeId).value());
			
			jObj.put(ContractorRegisterationStep2.ALL_DIRECTOR_DETAILS, this.allDirectorsOfCompany);
			jObj.put(ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS, this.bankruptcyProceedings);
			jObj.put(ContractorRegisterationStep2.BANKRUPTCY_PROCEEDINGS_COMMENTS, this.bankruptcyProceedingsComments);
			jObj.put(ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE, this.convictedToCriminalOffence);
			jObj.put(ContractorRegisterationStep2.CONVICTED_TO_CRIMINAL_OFFENCE_COMMENTS, this.convictedToCriminalOffenceComments);
			jObj.put(ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH, this.trusteeOfAshantiDutch);
			jObj.put(ContractorRegisterationStep2.TRUSTEE_OF_ASHANTI_DUTCH_COMMENTS, this.trusteeOfAshantiDutchComments);
			
			jObj.put(ContractorRegisterationStep2.PARENT_COMPANY_ADDRESS, this.parentCompanyAddress);
			jObj.put(ContractorRegisterationStep2.COMPANY_REGISTERATION_NUMBER, this.companyRegisterationNumber);
			jObj.put(ContractorRegisterationStep2.REGISTERED_WITH_TRADEBODIES, this.registeredWithTradeBodies);
			jObj.put(ContractorRegisterationStep2.REGISTERATION_NUMBER, this.registerationNumber);
			jObj.put(ContractorRegisterationStep2.QUALITY_MARKS, this.qualityMarks);
			jObj.put(ContractorRegisterationStep2.QUALITY_MARKS_DETAILS, this.qualityMarksDetails);
			jObj.put(ContractorRegisterationStep2.REGISTERED_WITH_CONSTRUCTION_LINE, this.registeredWithConstructionLine);
			jObj.put(ContractorRegisterationStep2.CONSTRUCTION_LINE_REGISTERATION_NUMBER, this.constructionLineRegisterationNumber);
			jObj.put(ContractorRegisterationStep2.EMPLOYEE_COUNT, this.employeesCount);
			jObj.put(ContractorRegisterationStep2.EMPLOYEES_TRADE, this.employeesTrade);
			jObj.put(ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS, this.employSubcontractors);
			jObj.put(ContractorRegisterationStep2.EMPLOY_SUBCONTRACTORS_REGISTERATION_NUMBER, this.employSubContractorRegisterationNumber);
			jObj.put(ContractorRegisterationStep2.TAX_OFFICE_ADDRESS, this.taxOfficeAddress);
			jObj.put(ContractorRegisterationStep2.TAX_REFERECNE_NUMBER, this.taxReferenceNumber);
			jObj.put(ContractorRegisterationStep2.INSURER_NAME_ADDRESS, this.insurerNameandAddress);
			jObj.put(ContractorRegisterationStep2.POLICY_NUMBER, this.policyNumber);
			jObj.put(ContractorRegisterationStep2.EMPLOYERS_LIABILITY, this.employersLiability);
			jObj.put(ContractorRegisterationStep2.PUBLIC_LIABILITY, this.publicLiability);
			jObj.put(ContractorRegisterationStep2.PROFFESSIONAL_INDEMNITY, this.proffessionalIndemnity);
			jObj.put(ContractorRegisterationStep2.INSURANCE_COVER_EXPIRY_DATE, this.insauranceCoverExpiryDate);
		
		return jObj;
	}
	
	
	
	}
