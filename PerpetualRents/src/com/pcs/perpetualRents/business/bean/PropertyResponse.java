package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import org.json.JSONException;
import org.json.JSONObject;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.common.bean.BusinessObject;

@JsonIgnoreProperties(ignoreUnknown=true)
public class PropertyResponse extends BusinessObject implements Serializable{
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PropertyResponse.class.getSimpleName().toLowerCase();
	
	public static final String PROPERTY_ID = "propertyId";
	public static final String QUESTION_ID = "questionId";
	public static final String RESPONSE = "response";
	public static final String COMMENTS = "comments";
	public static final String DOCUMENT_ID = "documentId";
	public static final String FIELD_NAME = "fieldName";
	public static final String GROUP_ID = "groupId";
	public static final String AFFIRMATIVE_ANS = "affirmativeAns";
	
	private Long propertyId;
	private Long questionId;
	
	private String fieldName;
	private String response;
	private String comments;
	private Long documentId;
	private Long groupId;
	private Boolean affirmativeAns;
	
	private File fileObj;
	
	public Boolean getAffirmativeAns() {
		return affirmativeAns;
	}
	public void setAffirmativeAns(Boolean affirmativeAns) {
		this.affirmativeAns = affirmativeAns;
	}
	public Long getGroupId() {
		return groupId;
	}
	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}
	public File getFileObj() {
		return fileObj;
	}
	public void setFileObj(File fileObj) {
		this.fileObj = fileObj;
	}
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public Long getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Long getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}
	
	@Override
	public String toString() {
		return "PropertyResponse [propertyId=" + propertyId + ", questionId="
				+ questionId + ", fieldName=" + fieldName + ", response="
				+ response + ", comments=" + comments + ", documentId="
				+ documentId + ", groupId=" + groupId + ", fileObj=" + fileObj
				+ "]";
	}
	public boolean compareOldNewPropertyResponse(PropertyResponse responseObj){
		if(this.response == null || responseObj.getResponse() == null){
			return false;
		}
		if(!this.response.equalsIgnoreCase(responseObj.getResponse()))
				return false;
		
		if(this.comments != responseObj.getComments())
			return false;
		
		return true;
	}
	
	public JSONObject toJSON(boolean includeParent) throws JSONException{
		
		JSONObject jObj = new JSONObject();
		
		if(includeParent)
			jObj = super.toJSON();
		
		jObj.put(PropertyResponse.FIELD_NAME, this.fieldName);
		jObj.put(PropertyResponse.COMMENTS, this.comments == null ? "" : this.comments);
		jObj.put(PropertyResponse.RESPONSE, this.response == null ? "null" : this.response);
		jObj.put(PropertyResponse.DOCUMENT_ID, this.documentId == null ? "null" : this.documentId);
		jObj.put(PropertyQuestions.AFFIRMATIVE_ANS, this.affirmativeAns);
	
		File fileObj = this.getFileObj();
			if(fileObj != null){
				jObj.put(File.FILE_NAME, fileObj.getFileName());
				jObj.put(File.SIZE, fileObj.getSize());
				jObj.put(File.FILE_NAME, fileObj.getFileName());
				jObj.put(File.CONTENT_TYPE, fileObj.getContentType());
				jObj.put(File.FILE_PATH, fileObj.getFilePath());
				jObj.put(File.IS_IMAGE, fileObj.getContentType().contains("image") ? true : false);
			}
	
		return jObj;
	}
	
	
}
