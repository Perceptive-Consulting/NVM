package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDocument;
import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;
import com.pcs.perpetualRents.business.bean.PropertyResponse;

public interface PropertyDAO {
	
	public PropertyDocument loadPropertyDocumentsById(final Long propertyDocumentId);
	
	public boolean deletePropertyDocumentById(final Long propertyDocumentId);
	
	public void loadAdminUploadDocument(final Property tPropertyObj);
	
	public Long savePropertyDetails(Property propertyObj, final Long createdUserId);
	
	public boolean savePropertyResponse(PropertyResponse responseObj, final Long createdUserId);
	
	public Long saveMarketingInfo(final PropertyMarketingInformation infoObj);
	
	public Long updateMarketingInfo(final PropertyMarketingInformation infoObj);
	
	public boolean updatePropertyDetails(final Property propertyObj, final Long modifiedUserId);
	
	public Property loadPropertyById(Long id);
	
	public boolean isPropertyApproved(Long propertyId);
	
	public PropertyMarketingInformation loadMarketingInfoByPropertyId(Long propertyId);
	
	public boolean updatePropertyResponse(final PropertyResponse responseObj, final Long modifiedUserId);
	
	public boolean updatePropertyFile(final PropertyResponse responseObj, final Long modifiedUserId);
	
	public List<Property> loadPropertyByLandlord(LandLord landlord);
	
	public void approveProperty(final Property propertyObj,final Long userId);
	
	public void disApproveProperty(final Property propertyObj,final Long userId);
	
	public PropertyResponse loadPropertyResponseByFieldName(Long propertyId, String fieldName);
	
	public boolean disableProperty(Long propertyId);
	
	public boolean enableProperty(Long propertyId);
	
	public List<Property> loadAll(Integer start, Integer limit);
	
	public boolean deleteProperty(Long propertyObjId);
	
	public boolean savePropertyDocuments(PropertyDocument documentsObj, Long userId);
	
	public  List<PropertyDocument> loadPropertyAdminUploadDocument(final Property tPropertyObj);
	
	public int updatePDPropertyStatus(final Long documentId);
}
