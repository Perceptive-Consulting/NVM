package com.pcs.perpetualRents.manager;

import java.util.List;

import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.UserLogin;

public interface AssignManager {
	
	public Long assign(AssignModel assignObj, Long userId);
	
	public AssignModel loadAssignModelById(final Long id);
	
	public List<AssignModel> loadAllByAssignedToValues(Long assignToTypeId, Long assignToId);
	
	public List<AssignModel> loadAllByAssignedByValues(Long assignByTypeId, Long assignById);
	
	public List<Long> loadPropertyIdByCity(Long cityId);
	
	public AssignModel loadAssignedByPropertyAndFunctionality(Long propertyId, Long functionalityId);
	
	public List<AssignModel> loadAssignedByPropertyId(Long propertyId);
	
	public  List<AssignModel> loadAssignedByPropertyAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId);
	
	public  List<AssignModel> loadAssignedByPropertyAndAssignedBy(Long assignByTypeId, Long assignById, Long propertyId);
	
	public  AssignModel loadAssignedByPropertyFunctionalityAndAssignedTo(Long assignToTypeId, Long assignToId, Long propertyId, Long functionalityId);
	
	public List<AssignModel> loadAllAssignModel(Integer start, Integer end, UserLogin loginObj);
	
}
