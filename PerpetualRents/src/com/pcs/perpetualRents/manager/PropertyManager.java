package com.pcs.perpetualRents.manager;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDocument;
import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.enm.ADPL2Page;

public interface PropertyManager {
	
	public void loadAdminUploadDocument(final Property tPropertyObj);
	
	public boolean savePropertyDocument(PropertyDocument documentsObj, Long createdUserId);
	
	public boolean saveProperty(Property propertyObj, Long createdUserId);
	
	public boolean updateMarketingInfo(PropertyMarketingInformation marketingObj, Long createdUserId);
	
	public boolean updateProperty(Property propertyObj, Long modifiedUserId);
	
	public Double getStatus(Long propertyId, ADPL2Page page);
	
	public String getStatus(Long propertyId);
	
	public Map<String, PropertyResponse> getResponseMap(List<PropertyResponse> savedResponseList);
	
	public List<PropertyResponse> loadResponseByPropertyId(Long properyId , ADPL2Page page);
	
	public Property loadPropertyById(Long id);
	
	public PropertyMarketingInformation loadMarketingInfoByPropertyId(Long propertyId);
	
	public List<File> loadPropertyImage(final Long objectTypeId, final Long objectId); 
	
	public List<Property> loadPropertyByLandlord(LandLord landLordObj);
	
	public PropertyResponse loadPropertyResponseByFieldName(Long propertyId, String fieldName);
	
	public File loadADPL1File()throws IOException;
	
	public File loadADPL3File()throws IOException;
	
	public File landLordRegistrationFile();
	
	public List<File> bankStandingOrderFile();
	
	public File loadADPL2PdfByPropertyId(final Long propertyId, final String logoPath);
	
	public boolean disableProperty(Long propertyId);
	
	public boolean checkPropertyAdminUploadDocument(Long propertyId);
	
	public boolean enableProperty(Long propertyId);
	
	public File loadFileById(Long fileId);
	
	public void deleteFileById(Long fileId);
	
	public List<Property> loadAll(Integer start, Integer limit, UserLogin loginObj);
	
	public boolean deleteProperty(Long propertyId);
	
	public void approveProperty(final Property propertyObj,final Long userId);
	
	public void disApproveProperty(final Property propertyObj,final Long userId);
	
	public boolean savePropertyResponse(List<PropertyResponse> currentResponseList, Long userId,List<PropertyResponse> savedResponseList);

	public boolean deleteDocumentById(final Long parseLong);
	
	public List<PropertyDocument> loadPropertyAdminUploadDocument(final Property tPropertyObj);

	public PropertyDocument findDocumentById(final long documentId);

	public boolean changePropertyDocumentStatus(Long valueOf);
	
	
	
}
