package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.PDDocuments;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.PropertyDocumentDownloadStatus;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface PropertyDeveloperManager {

	public boolean createPropertyDeveloper(PropertyDeveloper obj, final Long userID);
	
	public PropertyDeveloper loadPropDeveloperById(final Long id);

	public PropertyDeveloper loadPropertyDeveloperByUserLogin(UserLogin loginObj);

	public boolean updatePropertyDeveloper( PropertyDeveloper tPropertyDeveloperObj, Long id);
	
	public Long createPropertyDocumentDownloadStatus(PropertyDocumentDownloadStatus statusObj, final Long createdUserId);

	public PropertyDocumentDownloadStatus loadDocumentStatusById(Long id);

	public PropertyDocumentDownloadStatus loadDocumentStatusByPD(Long pdId);

	public boolean updateDocStatus(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues);

	public boolean updateProperty(PDProperty pdPropertyObj, Long id);

	public boolean saveProperty(PDProperty pdPropertyObj, Long id);
	
	public boolean saveDocuments(List<PDDocuments> documentsObj , Long createdUserId, PDProperty propertyObj, String addOrUpdateCheck);
	
	boolean saveDocumentsByAdmin(List<PDDocuments> documents,Long createdUserId, PDProperty pdPropObj, String addOrUpdateCheck, String description);
	
	public PDProperty loadPDPropertyById(Long id);
	
	public void loadPropertyDocuments(Long propertyDeveloper,  PDProperty pdPropertyObj, Long userId );
	
	public void removeDocuments(Long documentId);

	public List<PDProperty> loadPropertyByPropertyDeveloper(PropertyDeveloper propertyDeveloperObj);

	public boolean updatePropertyDetils(PDProperty tPDPropertyObj, Long id);

	public List<PDProperty> loadAll(Integer start, Integer end,UserLogin loginObj);

	public void disApproveProperty(PDProperty propObj, Long id);

	public void approveProperty(PDProperty propObj, Long id);
	
	public PropertyDeveloper loadPropertyDeveloperByPropertyId(Long pdId);

	boolean savePropertyDetilsSecond(PDProperty tPDPropertyObj, Long userId);

	public File loadPDPropertyPdfByProposedPropertyId(Long propertyId);

	public boolean checkAdminUploadDocument(Long valueOf);
	
	public List<PDDocuments> loadAdminUploadDocument(Long propertyId);
	
	public PDDocuments loadPDDocuments(Long documentId);

	public boolean changePDDocumentStatus(Long documentId);
	
	public File loadNonDisclosureAgreement();
	
	public File loadPreConstructionAgreement();

	public boolean changePropertyDocumentStatus(Long documentId);
	
}
