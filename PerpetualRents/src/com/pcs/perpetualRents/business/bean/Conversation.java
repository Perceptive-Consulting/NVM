package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.EmailSubject;

public class Conversation extends BusinessObject implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + Conversation.class.getSimpleName().toLowerCase();

	
	public static final String CONVERSATION_IDENTITY = "conversationIdentity";
	public static final String ACTOR_ONE_OBJECTTYPE_ID = "actorOneObjectTypeId";
	public static final String ACTOR_ONE_ID = "actorOneId";
	public static final String ACTOR_TWO_OBJECTTYPE_ID = "actorTwoObjectTypeId";
	public static final String ACTOR_TWO_ID = "actorTwoId";
	public static final String PROPERTY_ID = "propertyId";
	public static final String PROPERTY_TYPE_ID = "propertyTypeId";
	public static final String FUNCTIONALITY_ID = "functionalityId";
	public static final String MAIL1_ID = "mailId1";
	public static final String MAIL2_ID = "mailId2";
	public static final String JOB_DESCRIPTION = "jobsDescription";
	
	private String conversationIdentity;
	private Short actorOneObjectTypeId;
	private Long actorOneId;
	private Short actorTwoObjectTypeId;
	private Long actorTwoId;
	private Long propertyId;
	private Integer propertyTypeId;
	private Long functionalityId;
	private String mailId1;
	private String mailId2;
	private String jobsDescription;
	
	
	private String actorOneReference;
	private String actorTwoReference;
	private String actorOneDetailsStr;
	private String actorTwoDetailsStr;
	private String functionalityString;
	private String postCode;
	private Contractor contractorObj;
	
	public Conversation(){	}
	
	
	public Conversation(Long actorOneObjectTypeId, Long actorOneId, Long actorTwoObjectTypeId, Long actorTwoId, String actorOneReference, String actorTwoReference) {
		super();
		this.actorOneObjectTypeId = actorOneObjectTypeId.shortValue();
		this.actorOneId = actorOneId;
		this.actorTwoObjectTypeId = actorTwoObjectTypeId.shortValue();
		this.actorTwoId = actorTwoId;
		this.actorOneReference = actorOneReference;
		this.actorTwoReference = actorTwoReference;
	}
	
	
	public String getFunctionalityString() {
		ContractorFunctionality conObj = ContractorFunctionality.get(this.functionalityId);
			this.functionalityString = conObj.value();
		return functionalityString;
	}
	
	public String getJobsDescription() {
		return jobsDescription;
	}
	
	public void setJobsDescription(String jobsDescription) {
		this.jobsDescription = jobsDescription;
	}


	public String getActorOneDetailsStr() {
		return actorOneDetailsStr;
	}

	public void setActorOneDetailsStr(String actorOneDetailsStr) {
		this.actorOneDetailsStr = actorOneDetailsStr;
	}

	public String getActorTwoDetailsStr() {
		return actorTwoDetailsStr;
	}

	public void setActorTwoDetailsStr(String actorTwoDetailsStr) {
		this.actorTwoDetailsStr = actorTwoDetailsStr;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public void setFunctionalityString(String functionalityString) {
		this.functionalityString = functionalityString;
	}

	public Long getFunctionalityId() {
		return functionalityId;
	}

	public void setFunctionalityId(Long functionalityId) {
		this.functionalityId = functionalityId;
	}

	public Contractor getContractorObj() {
		return contractorObj;
	}

	public void setContractorObj(Contractor contractorObj) {
		this.contractorObj = contractorObj;
	}

	public Short getActorOneObjectTypeId() {
		return actorOneObjectTypeId;
	}

	public void setActorOneObjectTypeId(Short actorOneObjectTypeId) {
		this.actorOneObjectTypeId = actorOneObjectTypeId;
	}

	public Short getActorTwoObjectTypeId() {
		return actorTwoObjectTypeId;
	}

	public void setActorTwoObjectTypeId(Short actorTwoObjectTypeId) {
		this.actorTwoObjectTypeId = actorTwoObjectTypeId;
	}

	public String getActorOneReference() {
		return actorOneReference;
	}

	public void setActorOneReference(String actorOneReference) {
		this.actorOneReference = actorOneReference;
	}

	public String getActorTwoReference() {
		return actorTwoReference;
	}

	public void setActorTwoReference(String actorTwoReference) {
		this.actorTwoReference = actorTwoReference;
	}

	public String getConversationIdentity() {
		return conversationIdentity;
	}
	public void setConversationIdentity(String conversationIdentity) {
		this.conversationIdentity = conversationIdentity;
	}
	public Long getActorOneId() {
		return actorOneId;
	}
	public void setActorOneId(Long actorOneId) {
		this.actorOneId = actorOneId;
	}
	public Long getActorTwoId() {
		return actorTwoId;
	}
	public void setActorTwoId(Long actorTwoId) {
		this.actorTwoId = actorTwoId;
	}	
	
	
	public Long getPropertyId() {
		return propertyId;
	}


	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}


	public Integer getPropertyTypeId() {
		return propertyTypeId;
	}


	public void setPropertyTypeId(Integer propertyTypeId) {
		this.propertyTypeId = propertyTypeId;
	}


	public String getMailId1() {
		return mailId1;
	}

	public void setMailId1(String mailId1) {
		this.mailId1 = mailId1;
	}
	public String getMailId2() {
		return mailId2;
	}

	public void setMailId2(String mailId2) {
		this.mailId2 = mailId2;
	}
	

	public String generateContractorConversationIdentity(){
		String str = EmailSubject.QUOTATION_PERPETUAL.value() + getFunctionalityString() + " ";
			   str += "("+ this.actorOneReference + "-" + this.actorTwoReference + ")";
		return str;
	}
	
	public String generatePMCConversationIdentity(){
		String str = EmailSubject.PMC_LANDLORD_SUBJECT.value();
				str += this.postCode;
			   str += "("+ this.actorOneReference + "-" + this.actorTwoReference + ")";
		return str;
	}



	@Override
	public String toString() {
		return "Conversation [id=" + getId() + ", conversationIdentity="
				+ conversationIdentity + ", actorOneObjectTypeId="
				+ actorOneObjectTypeId + ", actorOneId=" + actorOneId
				+ ", actorTwoObjectTypeId=" + actorTwoObjectTypeId
				+ ", actorTwoId=" + actorTwoId + ", propertyId=" + propertyId
				+ ", mailId1=" + mailId1 + ", mailId2=" + mailId2
				+ ", actorOneReference=" + actorOneReference
				+ ", actorTwoReference=" + actorTwoReference + "]";
	}

	public JSONObject toJSON(boolean includeParent) throws JSONException{
		
		JSONObject jObj = new JSONObject();
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(Conversation.CONVERSATION_IDENTITY, this.conversationIdentity);
		jObj.put(Conversation.ACTOR_ONE_OBJECTTYPE_ID, this.actorOneObjectTypeId);
		jObj.put(Conversation.ACTOR_ONE_ID, this.actorOneId);
		jObj.put(Conversation.ACTOR_TWO_OBJECTTYPE_ID, this.actorTwoObjectTypeId);
		jObj.put(Conversation.ACTOR_TWO_ID, this.actorTwoId);
		jObj.put(Conversation.PROPERTY_ID, this.propertyId);
		jObj.put(Conversation.MAIL1_ID, this.mailId1);
		jObj.put(Conversation.MAIL2_ID, this.mailId2);
		jObj.put(Conversation.FUNCTIONALITY_ID, this.functionalityId);
		jObj.put("functionalityString", ContractorFunctionality.get(this.functionalityId).value());
		jObj.put("actorOneDetailsStr", this.actorOneDetailsStr);
		jObj.put("actorTwoDetailsStr", this.actorTwoDetailsStr);
		
		return jObj;
		
	}
	
	
	
}
