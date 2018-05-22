package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;

@JsonIgnoreProperties(ignoreUnknown=true)
public class QuestionGroup implements Serializable, Comparable<QuestionGroup> {
	
	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + QuestionGroup.class.getSimpleName().toLowerCase();
	
	public static final String ID = "id";
	public static final String GROUP_NAME = "groupName";
	public static final String QUESTION_COUNT = "questionCount";
	public static final String FAIL_THRESHOLD = "failThreshold";
	public static final String CRITERIA_STR = "criteriaStr";
	public static final String GROUP_DETAILS = "groupDetail";
	
	private Long id;
	private String groupName;
	private Integer questionCount;
	private Integer failThreshold;
	private String criteriaStr;
	private String groupDetail;
	
	public String getCriteriaStr() {
		return criteriaStr;
	}
	public void setCriteriaStr(String criteriaStr) {
		this.criteriaStr = criteriaStr;
	}
	public String getGroupDetail() {
		return groupDetail;
	}
	public void setGroupDetail(String groupDetail) {
		this.groupDetail = groupDetail;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Integer getQuestionCount() {
		return questionCount;
	}
	public void setQuestionCount(Integer questionCount) {
		this.questionCount = questionCount;
	}
	public Integer getFailThreshold() {
		return failThreshold;
	}
	public void setFailThreshold(Integer failThreshold) {
		this.failThreshold = failThreshold;
	}
	
	@Override
	public String toString() {
		return "QuestionGroup [id=" + id + ", groupName=" + groupName
				+ ", questionCount=" + questionCount + ", failThreshold="
				+ failThreshold + ", criteriaStr=" + criteriaStr
				+ ", groupDetail=" + groupDetail + "]";
	}
	
	@Override
	public int compareTo(QuestionGroup groupObj) {
		return this.getId().compareTo(groupObj.getId());
	}
	
}
