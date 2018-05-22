package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.PerpetualCounty;
import com.pcs.perpetualRents.business.bean.PropertyDocumentDownloadStatus;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface LandLordManager {
	
		public boolean createLandLord(LandLord obj, final Long userId);
		
		public Long assignToContractor(AssignModel assignObj, Long userId);
		
		public LandLord loadLandLordByUserLogin(UserLogin userLoginObj);
		
		public LandLord loadLandlordById(final Long id);
		
		public boolean updateLandLord(LandLord obj, Long modifiedUserId);
		
		public boolean deleteLandLord(Long landlordId, Long objectType);
		
		public List<LandLord> loadAllLandLord(Integer start, Integer limit, UserLogin loginObj);
		
		public List<City> loadCities();
		
		public List<City> loadCityByObjectType(Long objectType, String searchTerm);
		
		public List<Documents> loadDocumentsByJob(final AssignModel assignModelObj);
		
		public List<AssignModel> loadAssignedJobsByPropertyId(final Long landlordId, final Long propertyId);
		
		public boolean updateDocumentStatus(final Documents documents, final Long userId);
		
		public List<PerpetualCounty> loadAllPerpetualCounty();
		
		public Long createPropertyDocumentDownloadStatus(PropertyDocumentDownloadStatus statusObj, final Long createdUserId);
		
		public PropertyDocumentDownloadStatus loadDocumentStatusById(Long id);
		
		public PropertyDocumentDownloadStatus loadDocumentStatusByLandlordId(Long landlordId);
		
		public boolean updateDocStatus(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues);
		
	}

