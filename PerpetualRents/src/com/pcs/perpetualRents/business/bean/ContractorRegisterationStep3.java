package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class ContractorRegisterationStep3 extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + ContractorRegisterationStep3.class.getSimpleName().toLowerCase();
	
	public static final String WRITTEN_HEALTH_POLICY = "writtenHealthPolicy";
	public static final String WRITTEN_HEALTH_POLICY_COMMENTS = "writtenHealthPolicyComments";
	public static final String WRITTEN_HEALTH_POLICY_FILE_ID = "writtenHealthPolicyFileId";
	
	public static final String COMPETENT_HEALTH_AND_SAFETY_ADVICE = "competentHealthAndSafetyAdvice";
	public static final String COMPETENT_HEALTH_AND_SAFETY_ADVICE_COMMENTS = "competentHealthAndSafetyAdviceComments";
	
	public static final String RECEIVED_HEALTH_AND_SAFETY = "receivedHealthAndSafety";
	public static final String RECEIVED_HEALTH_AND_SAFETY_COMMENTS = "receivedHealthAndSafetyComments";
	
	public static final String YEAR_ENDINGS1 = "yearEnding1";
	public static final String FATAL_ACCIDENTS1 = "fatalAccidents1";
	public static final String REPORTABLE_INJURIES1 = "reportableInjuries1";
	public static final String ACCIDENT_RATE1 = "accidentRate1";
	public static final String NON_REPORTABLE_INJURIES1 = "nonReportableInjuries1";
	public static final String YEAR_ENDINGS2 = "yearEnding2";
	public static final String FATAL_ACCIDENTS2 = "fatalAccidents2";
	public static final String REPORTABLE_INJURIES2 = "reportableInjuries2";
	public static final String ACCIDENT_RATE2 = "accidentRate2";
	public static final String NON_REPORTABLE_INJURIES2 = "nonReportableInjuries2";
	
	public static final String ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY = "enforcementNoticeforHealthSafety";
	public static final String ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY_COMMENTS = "enforcementNoticeforHealthSafetyComments";
	
	public static final String SAFETY_ACCREDIATION = "safetyAccreditation";
	public static final String SAFETY_ACCREDIATION_COMMENTS = "safetyAccreditationComments";
	
	public static final String EQUALITY_POLICY = "equalityPolicy";
	public static final String EQUALITY_POLICY_COMMENTS = "equalityPolicyComments";
	public static final String EQUALITY_POLICY_FILE_ID = "equalityPolicyFileId";
	
	public static final String ANY_UNLAWFUL_DESCRIMINATION = "anyunlawfulDiscrimination";
	public static final String ANY_UNLAWFUL_DESCRIMINATION_COMMENTS = "anyunlawfulDiscriminationComments";
	
	public static final String SUBJECT_FORMAL_INVESTIGATION = "subjectOfFormalInvestigation";
	public static final String SUBJECT_FORMAL_INVESTIGATION_COMMENTS = "subjectOfFormalInvestigationComments";
	
	public static final String WILLING_TO_ABIDE_BY_CHARITIES = "willingToAbideByCharities";
	public static final String ADDITIONAL_INFORMATION_COST = "additionalInformationOfCost";
	
	
	public static final String CONTRACTOR_ID = "contractorId";
	
	private String writtenHealthPolicy;
	private String writtenHealthPolicyYesComments;
	private Long writtenHealthPolicyFileId;
	private File writtenHealthPolicyFile;
	
	private String competentHealthAndSafetyAdvice;
	private String competentHealthAndSafetyAdviceComments;
	
	private String receivedHealthAndSafety;
	private String receivedHealthAndSafetyComments;
	
	private String yearEnding1;
	private String fatalAccidents1;
	private String reportableInjuries1;
	private String accidentRate1;
	private String nonReportableInjuries1;
	private String yearEnding2;
	private String fatalAccidents2;
	private String reportableInjuries2;
	private String accidentRate2;
	private String nonReportableInjuries2;
	
	private String enforcementNoticeforHealthSafety;
	private String enforcementNoticeforHealthSafetyComments;
	
	private String safetyAccreditation;
	private String safetyAccreditationComments;
	
	private String equalityPolicy;
	private String equalityPolicyComments;
	private Long equalityPolicyFileId;
	private File equalityPolicyFile;
	
	private String anyunlawfulDiscrimination;
	private String anyunlawfulDiscriminationComments;
	
	private String subjectOfFormalInvestigation;
	private String subjectOfFormalInvestigationComments;
	
	private String willingToAbideByCharities;
	private Long contractorId;
	
	private List<FunctionalityCostMatrix> costSheet;
	private List<Expertise> expertiseList;
	
	private String additionalInformationOfCost;
	
	private String writtenPolicyFileName;
	private String equalityPolicyFileName;
	
	public List<Expertise> getExpertiseList() {
		return expertiseList;
	}
	public void setExpertiseList(List<Expertise> expertiseList) {
		this.expertiseList = expertiseList;
	}
	public String getWrittenPolicyFileName() {
		return writtenPolicyFileName;
	}
	public void setWrittenPolicyFileName(String writtenPolicyFileName) {
		this.writtenPolicyFileName = writtenPolicyFileName;
	}
	public String getEqualityPolicyFileName() {
		return equalityPolicyFileName;
	}
	public void setEqualityPolicyFileName(String equalityPolicyFileName) {
		this.equalityPolicyFileName = equalityPolicyFileName;
	}
	public File getWrittenHealthPolicyFile() {
		return writtenHealthPolicyFile;
	}
	public void setWrittenHealthPolicyFile(File writtenHealthPolicyFile) {
		this.writtenHealthPolicyFile = writtenHealthPolicyFile;
	}
	public File getEqualityPolicyFile() {
		return equalityPolicyFile;
	}
	public void setEqualityPolicyFile(File equalityPolicyFile) {
		this.equalityPolicyFile = equalityPolicyFile;
	}
	public Long getContractorId() {
		return contractorId;
	}
	public void setContractorId(Long contractorId) {
		this.contractorId = contractorId;
	}
	public List<FunctionalityCostMatrix> getCostSheet() {
		return costSheet;
	}
	public void setCostSheet(List<FunctionalityCostMatrix> costSheet) {
		this.costSheet = costSheet;
	}
	public Long getWrittenHealthPolicyFileId() {
		return writtenHealthPolicyFileId;
	}
	public void setWrittenHealthPolicyFileId(Long writtenHealthPolicyFileId) {
		this.writtenHealthPolicyFileId = writtenHealthPolicyFileId;
	}
	public Long getEqualityPolicyFileId() {
		return equalityPolicyFileId;
	}

	public void setEqualityPolicyFileId(Long equalityPolicyFileId) {
		this.equalityPolicyFileId = equalityPolicyFileId;
	}

	public String getWrittenHealthPolicy() {
		return writtenHealthPolicy;
	}

	public void setWrittenHealthPolicy(String writtenHealthPolicy) {
		this.writtenHealthPolicy = writtenHealthPolicy;
	}

	public String getWrittenHealthPolicyYesComments() {
		return writtenHealthPolicyYesComments;
	}

	public void setWrittenHealthPolicyYesComments(
			String writtenHealthPolicyYesComments) {
		this.writtenHealthPolicyYesComments = writtenHealthPolicyYesComments;
	}


	public String getCompetentHealthAndSafetyAdvice() {
		return competentHealthAndSafetyAdvice;
	}

	public void setCompetentHealthAndSafetyAdvice(
			String competentHealthAndSafetyAdvice) {
		this.competentHealthAndSafetyAdvice = competentHealthAndSafetyAdvice;
	}


	public String getReceivedHealthAndSafety() {
		return receivedHealthAndSafety;
	}

	public void setReceivedHealthAndSafety(String receivedHealthAndSafety) {
		this.receivedHealthAndSafety = receivedHealthAndSafety;
	}

	public String getYearEnding1() {
		return yearEnding1;
	}

	public void setYearEnding1(String yearEnding1) {
		this.yearEnding1 = yearEnding1;
	}

	public String getFatalAccidents1() {
		return fatalAccidents1;
	}

	public void setFatalAccidents1(String fatalAccidents1) {
		this.fatalAccidents1 = fatalAccidents1;
	}

	public String getReportableInjuries1() {
		return reportableInjuries1;
	}

	public void setReportableInjuries1(String reportableInjuries1) {
		this.reportableInjuries1 = reportableInjuries1;
	}

	public String getAccidentRate1() {
		return accidentRate1;
	}

	public void setAccidentRate1(String accidentRate1) {
		this.accidentRate1 = accidentRate1;
	}

	public String getNonReportableInjuries1() {
		return nonReportableInjuries1;
	}

	public void setNonReportableInjuries1(String nonReportableInjuries1) {
		this.nonReportableInjuries1 = nonReportableInjuries1;
	}

	public String getYearEnding2() {
		return yearEnding2;
	}

	public void setYearEnding2(String yearEnding2) {
		this.yearEnding2 = yearEnding2;
	}

	public String getFatalAccidents2() {
		return fatalAccidents2;
	}

	public void setFatalAccidents2(String fatalAccidents2) {
		this.fatalAccidents2 = fatalAccidents2;
	}

	public String getReportableInjuries2() {
		return reportableInjuries2;
	}

	public void setReportableInjuries2(String reportableInjuries2) {
		this.reportableInjuries2 = reportableInjuries2;
	}

	public String getAccidentRate2() {
		return accidentRate2;
	}

	public void setAccidentRate2(String accidentRate2) {
		this.accidentRate2 = accidentRate2;
	}

	public String getNonReportableInjuries2() {
		return nonReportableInjuries2;
	}
	public void setNonReportableInjuries2(String nonReportableInjuries2) {
		this.nonReportableInjuries2 = nonReportableInjuries2;
	}
	public String getEnforcementNoticeforHealthSafety() {
		return enforcementNoticeforHealthSafety;
	}

	public void setEnforcementNoticeforHealthSafety(
			String enforcementNoticeforHealthSafety) {
		this.enforcementNoticeforHealthSafety = enforcementNoticeforHealthSafety;
	}

	public String getCompetentHealthAndSafetyAdviceComments() {
		return competentHealthAndSafetyAdviceComments;
	}
	public void setCompetentHealthAndSafetyAdviceComments(
			String competentHealthAndSafetyAdviceComments) {
		this.competentHealthAndSafetyAdviceComments = competentHealthAndSafetyAdviceComments;
	}
	public String getReceivedHealthAndSafetyComments() {
		return receivedHealthAndSafetyComments;
	}
	public void setReceivedHealthAndSafetyComments(
			String receivedHealthAndSafetyComments) {
		this.receivedHealthAndSafetyComments = receivedHealthAndSafetyComments;
	}
	public String getEnforcementNoticeforHealthSafetyComments() {
		return enforcementNoticeforHealthSafetyComments;
	}
	public void setEnforcementNoticeforHealthSafetyComments(
			String enforcementNoticeforHealthSafetyComments) {
		this.enforcementNoticeforHealthSafetyComments = enforcementNoticeforHealthSafetyComments;
	}
	public String getSafetyAccreditation() {
		return safetyAccreditation;
	}
	public void setSafetyAccreditation(String safetyAccreditation) {
		this.safetyAccreditation = safetyAccreditation;
	}
	public String getSafetyAccreditationComments() {
		return safetyAccreditationComments;
	}
	public void setSafetyAccreditationComments(String safetyAccreditationComments) {
		this.safetyAccreditationComments = safetyAccreditationComments;
	}
	public String getEqualityPolicy() {
		return equalityPolicy;
	}
	public void setEqualityPolicy(String equalityPolicy) {
		this.equalityPolicy = equalityPolicy;
	}
	public String getEqualityPolicyComments() {
		return equalityPolicyComments;
	}
	public void setEqualityPolicyComments(String equalityPolicyComments) {
		this.equalityPolicyComments = equalityPolicyComments;
	}
	public String getAnyunlawfulDiscrimination() {
		return anyunlawfulDiscrimination;
	}
	public void setAnyunlawfulDiscrimination(String anyunlawfulDiscrimination) {
		this.anyunlawfulDiscrimination = anyunlawfulDiscrimination;
	}
	public String getAnyunlawfulDiscriminationComments() {
		return anyunlawfulDiscriminationComments;
	}
	public void setAnyunlawfulDiscriminationComments(
			String anyunlawfulDiscriminationComments) {
		this.anyunlawfulDiscriminationComments = anyunlawfulDiscriminationComments;
	}
	public String getSubjectOfFormalInvestigation() {
		return subjectOfFormalInvestigation;
	}
	public void setSubjectOfFormalInvestigation(String subjectOfFormalInvestigation) {
		this.subjectOfFormalInvestigation = subjectOfFormalInvestigation;
	}
	public String getSubjectOfFormalInvestigationComments() {
		return subjectOfFormalInvestigationComments;
	}
	public void setSubjectOfFormalInvestigationComments(
			String subjectOfFormalInvestigationComments) {
		this.subjectOfFormalInvestigationComments = subjectOfFormalInvestigationComments;
	}
	public String getWillingToAbideByCharities() {
		return willingToAbideByCharities;
	}
	public void setWillingToAbideByCharities(String willingToAbideByCharities) {
		this.willingToAbideByCharities = willingToAbideByCharities;
	}
	public String getAdditionalInformationOfCost() {
		return additionalInformationOfCost;
	}
	public void setAdditionalInformationOfCost(String additionalInformationOfCost) {
		this.additionalInformationOfCost = additionalInformationOfCost;
	}
	
	@Override
	public String toString() {
		return "ContractorRegisterationStep3 [writtenHealthPolicy="
				+ writtenHealthPolicy + ", writtenHealthPolicyYesComments="
				+ writtenHealthPolicyYesComments
				+ ", writtenHealthPolicyFileId=" + writtenHealthPolicyFileId
				+ ", writtenHealthPolicyFile=" + writtenHealthPolicyFile
				+ ", competentHealthAndSafetyAdvice="
				+ competentHealthAndSafetyAdvice
				+ ", competentHealthAndSafetyAdviceComments="
				+ competentHealthAndSafetyAdviceComments
				+ ", receivedHealthAndSafety=" + receivedHealthAndSafety
				+ ", receivedHealthAndSafetyComments="
				+ receivedHealthAndSafetyComments + ", yearEnding1="
				+ yearEnding1 + ", fatalAccidents1=" + fatalAccidents1
				+ ", reportableInjuries1=" + reportableInjuries1
				+ ", accidentRate1=" + accidentRate1
				+ ", nonReportableInjuries1=" + nonReportableInjuries1
				+ ", yearEnding2=" + yearEnding2 + ", fatalAccidents2="
				+ fatalAccidents2 + ", reportableInjuries2="
				+ reportableInjuries2 + ", accidentRate2=" + accidentRate2
				+ ", nonReportableInjuries2=" + nonReportableInjuries2
				+ ", enforcementNoticeforHealthSafety="
				+ enforcementNoticeforHealthSafety
				+ ", enforcementNoticeforHealthSafetyComments="
				+ enforcementNoticeforHealthSafetyComments
				+ ", safetyAccreditation=" + safetyAccreditation
				+ ", safetyAccreditationComments="
				+ safetyAccreditationComments + ", equalityPolicy="
				+ equalityPolicy + ", equalityPolicyComments="
				+ equalityPolicyComments + ", equalityPolicyFileId="
				+ equalityPolicyFileId + ", equalityPolicyFile="
				+ equalityPolicyFile + ", anyunlawfulDiscrimination="
				+ anyunlawfulDiscrimination
				+ ", anyunlawfulDiscriminationComments="
				+ anyunlawfulDiscriminationComments
				+ ", subjectOfFormalInvestigation="
				+ subjectOfFormalInvestigation
				+ ", subjectOfFormalInvestigationComments="
				+ subjectOfFormalInvestigationComments
				+ ", willingToAbideByCharities=" + willingToAbideByCharities
				+ ", contractorId=" + contractorId + ", costSheet=" + costSheet
				+ ", additionalInformationOfCost="
				+ additionalInformationOfCost + "]";
	}
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY, this.writtenHealthPolicy);
			jObj.put(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_COMMENTS, this.writtenHealthPolicyYesComments == null ? "" : this.writtenHealthPolicyYesComments);
			jObj.put(ContractorRegisterationStep3.WRITTEN_HEALTH_POLICY_FILE_ID, this.writtenHealthPolicyFileId);
			jObj.put("writtenPolicyFileName", this.writtenPolicyFileName);
			jObj.put(ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE, this.competentHealthAndSafetyAdvice);
			jObj.put(ContractorRegisterationStep3.COMPETENT_HEALTH_AND_SAFETY_ADVICE_COMMENTS, this.competentHealthAndSafetyAdviceComments == null ? "" : this.competentHealthAndSafetyAdviceComments);
			jObj.put(ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY, this.receivedHealthAndSafety);
			jObj.put(ContractorRegisterationStep3.RECEIVED_HEALTH_AND_SAFETY_COMMENTS, this.receivedHealthAndSafetyComments == null ? "" : this.receivedHealthAndSafetyComments);
			jObj.put(ContractorRegisterationStep3.YEAR_ENDINGS1, this.yearEnding1 == null ? "" : this.yearEnding1);
			jObj.put(ContractorRegisterationStep3.FATAL_ACCIDENTS1, this.fatalAccidents1 == null ? "" : this.fatalAccidents1);
			jObj.put(ContractorRegisterationStep3.REPORTABLE_INJURIES1, this.reportableInjuries1 == null ? "" : this.reportableInjuries1);
			jObj.put(ContractorRegisterationStep3.ACCIDENT_RATE1, this.accidentRate1 == null ? "" : this.accidentRate1);
			jObj.put(ContractorRegisterationStep3.NON_REPORTABLE_INJURIES1, this.nonReportableInjuries1 == null ? "" : this.nonReportableInjuries1);
			jObj.put(ContractorRegisterationStep3.YEAR_ENDINGS2, this.yearEnding2 == null ? "" : this.yearEnding2);
			jObj.put(ContractorRegisterationStep3.FATAL_ACCIDENTS2, this.fatalAccidents2 == null ? "" : this.fatalAccidents2);
			jObj.put(ContractorRegisterationStep3.REPORTABLE_INJURIES2, this.reportableInjuries2 == null ? "" : this.reportableInjuries2);
			jObj.put(ContractorRegisterationStep3.ACCIDENT_RATE2, this.accidentRate2 == null ? "" : this.accidentRate2);
			jObj.put(ContractorRegisterationStep3.NON_REPORTABLE_INJURIES2, this.nonReportableInjuries2 == null ? "" : this.nonReportableInjuries2);
			jObj.put(ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY, this.enforcementNoticeforHealthSafety);
			jObj.put(ContractorRegisterationStep3.ENFORCEMENT_NOTICE_FOR_HEALTH_SAFETY_COMMENTS, this.enforcementNoticeforHealthSafetyComments);
			
			jObj.put(ContractorRegisterationStep3.SAFETY_ACCREDIATION, this.safetyAccreditation);
			jObj.put(ContractorRegisterationStep3.SAFETY_ACCREDIATION_COMMENTS, this.safetyAccreditationComments == null ? "" : this.safetyAccreditationComments);
			jObj.put(ContractorRegisterationStep3.EQUALITY_POLICY, this.equalityPolicy);
			jObj.put(ContractorRegisterationStep3.EQUALITY_POLICY_COMMENTS, this.equalityPolicyComments == null ? "" : this.equalityPolicyComments);
			jObj.put(ContractorRegisterationStep3.EQUALITY_POLICY_FILE_ID, this.equalityPolicyFileId);
			jObj.put("equalityPolicyFileName", this.equalityPolicyFileName);
			
			jObj.put(ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION, this.anyunlawfulDiscrimination);
			jObj.put(ContractorRegisterationStep3.ANY_UNLAWFUL_DESCRIMINATION_COMMENTS, this.anyunlawfulDiscriminationComments == null ? "" : this.anyunlawfulDiscriminationComments);
			jObj.put(ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION, this.subjectOfFormalInvestigation);
			jObj.put(ContractorRegisterationStep3.SUBJECT_FORMAL_INVESTIGATION_COMMENTS, this.subjectOfFormalInvestigationComments == null ? "" : this.subjectOfFormalInvestigationComments);
			jObj.put(ContractorRegisterationStep3.WILLING_TO_ABIDE_BY_CHARITIES, this.willingToAbideByCharities );
			jObj.put(ContractorRegisterationStep3.ADDITIONAL_INFORMATION_COST, this.additionalInformationOfCost == null ? "" : this.additionalInformationOfCost);
		
		return jObj;
	}
	
	
}
