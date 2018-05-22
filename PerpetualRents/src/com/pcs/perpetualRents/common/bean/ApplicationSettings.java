package com.pcs.perpetualRents.common.bean;

import java.util.logging.Logger;

import org.springframework.stereotype.Component;

@Component
public class ApplicationSettings {
	
	public static final String APP_NAME = "perpetualrents";
	
	private String userName;
	private String adminEmailId;
	private String controlEmailId;
	private String controlEmailPassword;
	private String commonEmailSenderName;
	private String documentRepository;
	private String folderPath;
	private String folderName;
	private String contextPath;
	private String adpl1FolderPath;
	private String adpl3FolderPath;
	private String bankStandingOrderFolderPath;
	private String landLordRegisterationFolderPath;
	private String contractorDocumentFolderPath;
	private String wordPressUrl;
	private Long sessionMaxAge;
	
	@Override
	public String toString() {
		return "ApplicationSettings [userName=" + userName + ", adminEmailId="
				+ adminEmailId + ", controlEmailId=" + controlEmailId
				+ ", controlEmailPassword=" + controlEmailPassword
				+ ", commonEmailSenderName=" + commonEmailSenderName
				+ ", documentRepository=" + documentRepository
				+ ", folderPath=" + folderPath + ", folderName=" + folderName
				+ ", contextPath=" + contextPath + ", adpl1FolderPath="
				+ adpl1FolderPath + ", adpl3FolderPath=" + adpl3FolderPath
				+ ", bankStandingOrderFolderPath="
				+ bankStandingOrderFolderPath
				+ ", landLordRegisterationFolderPath="
				+ landLordRegisterationFolderPath
				+ ", contractorDocumentFolderPath="
				+ contractorDocumentFolderPath + ", wordPressUrl="
				+ wordPressUrl + ", sessionMaxAge=" + sessionMaxAge + "]";
	}
	
	public String getDocumentRepository() {
		return documentRepository;
	}
	
	public void setDocumentRepository(String documentRepository) {
		this.documentRepository = documentRepository;
	}
	
	public String getContractorDocumentFolderPath() {
		return contractorDocumentFolderPath;
	}
	
	public void setContractorDocumentFolderPath(String contractorDocumentFolderPath) {
		this.contractorDocumentFolderPath = contractorDocumentFolderPath;
	}
	
	public String getWordPressUrl() {
		return wordPressUrl;
	}
	
	public void setWordPressUrl(String wordPressUrl) {
		this.wordPressUrl = wordPressUrl;
	}

	public String getAdpl1FolderPath() {
		return adpl1FolderPath;
	}
	
	public void setAdpl1FolderPath(String adpl1FolderPath) {
		this.adpl1FolderPath = adpl1FolderPath;
	}
	
	public String getAdpl3FolderPath() {
		return adpl3FolderPath;
	}
	
	public void setAdpl3FolderPath(String adpl3FolderPath) {
		this.adpl3FolderPath = adpl3FolderPath;
	}
	
	public String getLandLordRegisterationFolderPath() {
		return landLordRegisterationFolderPath;
	}
	
	public void setLandLordRegisterationFolderPath(String landLordRegisterationFolderPath) {
		this.landLordRegisterationFolderPath = landLordRegisterationFolderPath;
	}
	
	public String getBankStandingOrderFolderPath() {
		return bankStandingOrderFolderPath;
	}
	
	public void setBankStandingOrderFolderPath(String bankStandingOrderFolderPath) {
		this.bankStandingOrderFolderPath = bankStandingOrderFolderPath;
	}
	
	public String getContextPath() {
		return contextPath;
	}
	
	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}
	
	public String getFolderName() {
		return folderName;
	}
	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}
	
	public String getFolderPath() {
		return folderPath;
	}
	
	public void setFolderPath(String folderPath) {
		this.folderPath = folderPath;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getCommonEmailSenderName() {
		return commonEmailSenderName;
	}
	
	public void setCommonEmailSenderName(String commonEmailSenderName) {
		this.commonEmailSenderName = commonEmailSenderName;
	}
	
	public String getControlEmailPassword() {
		return controlEmailPassword;
	}
	
	public void setControlEmailPassword(String controlEmailPassword) {
		this.controlEmailPassword = controlEmailPassword;
	}
	
	public String getControlEmailId() {
		return controlEmailId;
	}
	
	public void setControlEmailId(String controlEmailId) {
		this.controlEmailId = controlEmailId;
	}
	
	public String getAdminEmailId() {
		return adminEmailId;
	}
	
	public void setAdminEmailId(String adminEmailId) {
		this.adminEmailId = adminEmailId;
	}
	
	public Long getSessionMaxAge() {
		return sessionMaxAge;
	}
	
	public void setSessionMaxAge(Long sessionMaxAge) {
		this.sessionMaxAge = sessionMaxAge;
	}
	
	public static Logger getLogger(String entityClass) {
		Logger logger = Logger.getLogger(entityClass);
			return logger;
	}
	
}	
