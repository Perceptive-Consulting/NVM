package com.pcs.perpetualRents.manager.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.dao.AddressDAO;
import com.pcs.perpetualRents.dao.AssignDAO;
import com.pcs.perpetualRents.dao.CityDAO;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.AssignManager;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.PropertyManager;
import com.pcs.perpetualRents.manager.UserAdminManager;

@Service
@Transactional
public class AssignManagerImpl implements AssignManager {

	@Autowired
	private AssignDAO assignDAO;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private CommonManager commonManager;
	@Autowired
	private UserAdminManager adminManager;
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private PropertyManager propertyManager;
	
	@Override
	public Long assign(AssignModel assignObj, Long userId) {
		try{
			if(assignObj != null){
				List<Address> addresses = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), assignObj.getPropertyId());
				if(addresses != null && !addresses.isEmpty()){
					City cityObj = cityDAO.loadCityByName(addresses.get(0).getCity());
					if(cityObj != null){
						assignObj.setCityId(cityObj.getId());
						Long assignId = assignDAO.assign(assignObj, userId);
						if(assignId != null)
							return assignId;
					}
				}
				
			}
			return null;
		}catch (DuplicateKeyException e) {
			assignObj.setErrorMessage("Already assigned.");
			return null;
		}
		
	}
	
	@Override
	public AssignModel loadAssignModelById(final Long id){
		AssignModel assignModelObj = assignDAO.loadAssignModelById(id);
		if(assignModelObj != null){
			if(assignModelObj.getAssignByTypeId() == ObjectType.LANDLORD.id()){
				LandLord landlordObj = landLordManager.loadLandlordById(assignModelObj.getAssignById());
				if(landlordObj != null){
					assignModelObj.setLandlordObj(landlordObj);
				}
				Contractor contractorObj = contractorManager.loadContractorById(assignModelObj.getAssignToId());
				if(contractorObj != null){
					assignModelObj.setContractorObj(contractorObj);
				}
				Property propertyObj = propertyManager.loadPropertyById(assignModelObj.getPropertyId());
				if(propertyObj != null){
					assignModelObj.setPropertyObj(propertyObj);
				}
		return assignModelObj;
			}
		}
		return null;
	}
	
	@Override
	public List<AssignModel> loadAllByAssignedToValues(Long assignToTypeId,
			Long assignToId) {
		List<AssignModel> assignModelList = assignDAO.loadAssignedToValues(assignToTypeId, assignToId);
		return assignModelList;
	}

	@Override
	public List<AssignModel> loadAllByAssignedByValues(Long assignByTypeId,	Long assignById) {
		return assignDAO.loadAssignedByValues(assignByTypeId, assignById);
		
	}

	@Override
	public List<Long> loadPropertyIdByCity(Long cityId) {
		return assignDAO.loadPropertyIdByCity(cityId);
	}
	
	@Override
	public AssignModel loadAssignedByPropertyAndFunctionality(Long propertyId, Long functionalityId){
		return assignDAO.loadAssignedByPropertyAndFunctionality(propertyId, functionalityId);
	}
	
	@Override
	public List<AssignModel> loadAssignedByPropertyId(Long propertyId){
		return assignDAO.loadAssignedByPropertyId(propertyId);
	}
	
	@Override
	public  List<AssignModel> loadAssignedByPropertyAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId){
		return assignDAO.loadAssignedByPropertyAndAssignedTo(assignToTypeId, assignToId, propertyId);
	}
	
	@Override
	public  List<AssignModel> loadAssignedByPropertyAndAssignedBy(Long assignByTypeId, Long assignById, Long propertyId){
		return assignDAO.loadAssignedByPropertyAndAssignedBy(assignByTypeId, assignById, propertyId);
	}
	
	@Override
	public  AssignModel loadAssignedByPropertyFunctionalityAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId, Long functionalityId){
		return assignDAO.loadAssignedByPropertyFunctionalityAndAssignedTo(assignToTypeId, assignToId, propertyId, functionalityId);
	}

	@Override
	public List<AssignModel> loadAllAssignModel(Integer start, Integer end, UserLogin loginObj) {
		if(loginObj != null){
			List<AssignModel> assignModelList = null;
			if(loginObj.getUserTypeId() == UserType.SUPER_ADMIN.id()){
				assignModelList =assignDAO.loadAllAssignModel(start, end);
			}else{
				Admin adminObj = adminManager.loadUserByLoginObj(loginObj);
				if(adminObj != null){
					 assignModelList = commonManager.loadJobsByAdmin(adminObj);
				}
			}
			if(assignModelList != null && assignModelList.size() > 0){
				for (AssignModel assignModelObj : assignModelList) {
						LandLord landlordObj = landLordManager.loadLandlordById(assignModelObj.getAssignById());
						if(landlordObj != null){
							assignModelObj.setLandlordObj(landlordObj);
						}
						Contractor contractorObj = contractorManager.loadContractorById(assignModelObj.getAssignToId());
						if(contractorObj != null){
							assignModelObj.setContractorObj(contractorObj);
						}
						Property propertyObj = propertyManager.loadPropertyById(assignModelObj.getPropertyId());
						if(propertyObj != null){
							assignModelObj.setPropertyObj(propertyObj);
						}
				}
			}
			return assignModelList;
		}
		return null;
	}
	
}
