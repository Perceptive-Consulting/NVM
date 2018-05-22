package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.Status;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Contractor extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Contractor.class.getSimpleName().toLowerCase();
	
	public static final String UNIQUE_REFERENCE = "uniqueReference";
	public static final String COMPANY_NAME = "companyName";
	public static final String BUSINESS_NATURE = "businessNature";
	public static final String CONTACT_PERSON = "contactPerson";
	public static final String TRADING_COMMENCEMENT_DATE = "tradingCommencementDate";
	public static final String COMPANY_REGISTERATION_DATE = "companyRegisterationDate";
	public static final String VAT_NO = "vatNo";
	
	public static final String USER_LOGIN_ID = "userLoginId";
	public static final String STATUS_ID = "statusId";
	
	private String uniqueReference;
	private String companyName;
	private String businessNature;
	private String contactPerson;
	private String tradingCommencementDate;
	private String companyRegisterationDate;
	private String vatNo;
	
	private String companyTypeStr;
	
	private List<Integer> functionality;
	private List<Integer> cities;
	private List<City> cityList;
	
	private Long userLoginId;
	private Long turnOverId;
	private Long contactDetailsId;
	private Short statusId;
	
	private UserLogin loginObj;
	private ContactDetails contactDetailsObj;
	private List<TurnOverDetails> turnoverDetails;
	
	private ContractorRegisterationStep2 regStep2Obj;
	private Expertise expertiseObj;
	private Address officeAddressObj;
	
	private List<Expertise> expertiseList;
	private String errorMessage;
	
	public Address getOfficeAddressObj() {
		return officeAddressObj;
	}
	public void setOfficeAddressObj(Address officeAddressObj) {
		this.officeAddressObj = officeAddressObj;
	}
	public String getCompanyTypeStr() {
		return companyTypeStr;
	}
	public void setCompanyTypeStr(String companyTypeStr) {
		this.companyTypeStr = companyTypeStr;
	}
	public List<City> getCityList() {
		return cityList;
	}
	public void setCityList(List<City> cityList) {
		this.cityList = cityList;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public List<Expertise> getExpertiseList() {
		return expertiseList;
	}
	public void setExpertiseList(List<Expertise> expertiseList) {
		this.expertiseList = expertiseList;
	}
	public Expertise getExpertiseObj() {
		return expertiseObj;
	}
	public void setExpertiseObj(Expertise expertiseObj) {
		this.expertiseObj = expertiseObj;
	}
	public ContractorRegisterationStep2 getRegStep2Obj() {
		return regStep2Obj;
	}
	public void setRegStep2Obj(ContractorRegisterationStep2 regStep2Obj) {
		this.regStep2Obj = regStep2Obj;
	}
	public List<Integer> getFunctionality() {
		return functionality;
	}
	public void setFunctionality(List<Integer> functionality) {
		this.functionality = functionality;
	}
	public List<Integer> getCities() {
		return cities;
	}
	public void setCities(List<Integer> cities) {
		this.cities = cities;
	}
	public UserLogin getLoginObj() {
		return loginObj;
	}
	public void setLoginObj(UserLogin loginObj) {
		this.loginObj = loginObj;
	}
	public ContactDetails getContactDetailsObj() {
		return contactDetailsObj;
	}
	public void setContactDetailsObj(ContactDetails contactDetailsObj) {
		this.contactDetailsObj = contactDetailsObj;
	}
	
	public List<TurnOverDetails> getTurnoverDetails() {
		return turnoverDetails;
	}
	public void setTurnoverDetails(List<TurnOverDetails> turnoverDetails) {
		this.turnoverDetails = turnoverDetails;
	}
	public Short getStatusId() {
		return statusId;
	}
	public void setStatusId(Short statusId) {
		this.statusId = statusId;
	}
	public String getUniqueReference() {
		return uniqueReference;
	}
	public void setUniqueReference(String uniqueReference) {
		this.uniqueReference = uniqueReference;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getBusinessNature() {
		return businessNature;
	}
	public void setBusinessNature(String businessNature) {
		this.businessNature = businessNature;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getTradingCommencementDate() {
		return tradingCommencementDate;
	}
	public void setTradingCommencementDate(String tradingCommencementDate) {
		this.tradingCommencementDate = tradingCommencementDate;
	}
	public String getCompanyRegisterationDate() {
		return companyRegisterationDate;
	}
	public void setCompanyRegisterationDate(String companyRegisterationDate) {
		this.companyRegisterationDate = companyRegisterationDate;
	}
	public String getVatNo() {
		return vatNo;
	}
	public void setVatNo(String vatNo) {
		this.vatNo = vatNo;
	}
	public Long getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(Long userLoginId) {
		this.userLoginId = userLoginId;
	}
	public Long getTurnOverId() {
		return turnOverId;
	}
	public void setTurnOverId(Long turnOverId) {
		this.turnOverId = turnOverId;
	}
	public Long getContactDetailsId() {
		return contactDetailsId;
	}
	public void setContactDetailsId(Long contactDetailsId) {
		this.contactDetailsId = contactDetailsId;
	}
	
	@Override
	public String toString() {
		return "ContractorGeneralInformation [uniqueReference="
				+ uniqueReference + ", companyName=" + companyName
				+ ", businessNature=" + businessNature + ", contactPerson="
				+ contactPerson + ", tradingCommencementDate="
				+ tradingCommencementDate + ", companyRegisterationDate="
				+ companyRegisterationDate + ", vatNo=" + vatNo
				+ ", functionality=" + functionality + ", cities=" + cities
				+ ", userLoginId=" + userLoginId + ", turnOverId=" + turnOverId
				+ ", contactDetailsId=" + contactDetailsId + ", statusId="
				+ statusId + ", loginObj=" + loginObj + ", detailsObj="
				+ contactDetailsObj + ", turnoverDetails=" + turnoverDetails + "]";
	}
	
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		JSONObject jObj = new JSONObject();
			if(includeParent)
				jObj = super.toJSON();
			
			jObj.put(Contractor.UNIQUE_REFERENCE, this.uniqueReference);
			jObj.put(Contractor.COMPANY_NAME, this.companyName);
			jObj.put(Contractor.BUSINESS_NATURE, this.businessNature);
			jObj.put(Contractor.CONTACT_PERSON, this.contactPerson);
			jObj.put(Contractor.TRADING_COMMENCEMENT_DATE, this.tradingCommencementDate);
			jObj.put(Contractor.COMPANY_REGISTERATION_DATE, this.companyRegisterationDate);
			jObj.put(Contractor.VAT_NO, this.vatNo == null ? "" : this.vatNo);
			jObj.put(Contractor.STATUS_ID, this.statusId);
			jObj.put("companyTypeStr", this.companyTypeStr);
			jObj.put("status", Status.get(this.statusId).value());
				
		return jObj;
		
		}
	}
