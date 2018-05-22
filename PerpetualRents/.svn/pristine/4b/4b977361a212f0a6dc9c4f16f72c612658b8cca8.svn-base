package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.PDDocuments;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;

public interface PropertyDeveloperDAO {
	public Long createPropertyDeveloper(PropertyDeveloper propertyDeveloperObj, final Long userId);
	
	public PropertyDeveloper loadPropertyDeveloperById(Long id);

	public PropertyDeveloper loadPropertyDeveloperObjByLoginId(Long id);
	
	public boolean updatePropertyDeveloper(PropertyDeveloper propertyDeveloper);

	public PropertyDeveloper loadPropertyDeveloperByLoginId(Long id);

	public Long savePropertyDetails(PDProperty pdPropertyObj, Long id);
	
	public Long savePropertyDocuments(final PDDocuments documentsObj, final Long createdUserId);
	
	public PDProperty loadPDPropertyById(Long id);
	
	public PDDocuments loadPDDocuments(Long documentId);
	
	public List<PDDocuments> loadPDPropertyDocuments(Long propertyDeveloperId, Long propertyId, Long documentsTypeId, Long userId);
	
	public PDDocuments loadPDPropertyDocumentsById(Long documentId);
	
	public void removeDocument(final Long documentId);

	public List<PDProperty> loadPropertyByPropertyDeveloper(PropertyDeveloper propertyDeveloperObj);

	public void updatePDProperty(PDProperty tPDPropertyObj);

	public List<PDProperty> loadAllProperty(Integer start, Integer limit);

	public void disApproveProperty(PDProperty propertyObj, Long userId);

	public void approveProperty(PDProperty propertyObj, Long userId);

	public void savePDPropertySecond(PDProperty tPDPropertyObj);

	public boolean validateEmailId(String emailId);

	public PropertyDeveloper loadUserLoginCredentials(String emailId);
	
	public boolean isPropertyApproved(Long propertyId);

//	public List<File> loadAdminUploadedFile(Long propertyId);

	public int updatePDPropertyStatus(Long documentId);

    public int updateDocumentStatusInPDProperty(PDProperty pdPropertyObj, String editCheck);

	public int updateForAdminUploadedDocumentStatus(PDProperty pdPropertyObj,String editCheck);

	public String loadDescriptionFromPDDocuments(Long propertyDeveloperId, Long propertyId, Long documentsTypeId);
}