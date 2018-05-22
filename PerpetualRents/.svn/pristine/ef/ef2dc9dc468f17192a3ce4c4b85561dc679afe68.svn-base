package com.pcs.perpetualRents.enm;

import java.util.Arrays;
import java.util.Comparator;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.commonFunction.CommonFunctions;

public enum ContractorFunctionality {
	UNDEFINED(0, "Undefined", "undefined"),
	ELECTRICAL_INSTALLATION_TESTING(1, "Electrical installations and Testing", "electricalInstallation"),
	ELECTRICAL_TEST(2, "Electrical Test", "electricalTest"),
	GAS_APPLIANCES(3, "Gas Appliances", "gasCertificate"),
	ENERGY_PERFORMANCE(4, "Energy Performance", "energyPerformance"),
	CENTRAL_HEATING_SYSTEM(5, "Central Heating System", "centralHeatingSystem"),
	GENERAL_BUILDING_WORKS(6, "General building works", "buildingInsaurance"),
	ASBESTOS_SURVEY(8, "Asbestos Survey", "asbestosSurvey"),
	PERIODIC_INSPECTION(9, "Periodic Inspection Of Water Supply", "periodicInspectionOfWaterSupply"),
	CARPENTRY(10, "Carpentry", "carpentry"),
	AIR_CONDITIONING(11, "Air conditioning/ refrigeration", "airConditioning"),
	ASBESTOS_REMOVAL(12, "Asbestos Removal", "asbestosRemoval"),
	DRAINAGE(13, "Drainage", "drainage"),
	FENCING_SERVICES(14, "Fencing Services", "fencingServices"),
	FIRE_SERVICES_COMPANY(15, "Fire Services Company", "fireDetectionSystem"),
	FLOOR_LAYING(16, "Floor Laying", "floorLaying"),
	GLAZING_SERVICES(17, "GlazingServices", "glazing"),
	GROUND_WORKS(18, "Ground Works", "groundWorks"),
	JOINERY(19, "Joinery", "joinery"),
	LIFT_REPAIRS_AND_MAINTAINANCE(20, "Lift Repairs And Maintainance", "liftRepairsAndMaintainance"),
	MECHANICAL_INSTALLATIONS(21, "Mechanical Installations", "mechanicalInstallations"),
	PAINTING_DECORATING(22, "Painting and Decorating", "paintingAndDecorating"),
	PLUMBING(23, "Plumbing", "plumbing"),
	ROOFING_SERVICES(24, "Roofing Services", "roofingServices"),
	SCAFFOLDING(25, "Scaffolding", "scaffolding"),
	SUSPENDED_CEILINGS(26, "Suspended ceilings", "suspendedCeilings"),
	WATER_SYSTEM_TESTING(27, "Water System Testing", "waterSystemTesting"),
	

	GARDENING_SERVICES(28, "Gardening Services", "gardeningServices"),                                                  
	LEANING_SERVICES(29, "Leaning Services", "leaningServices"),
	INSULATION_SERVICES(30, "Insulation Services", "insulationServices"),
	BLIND_FITTING_SERVICES(31, "Blind Fitting Services", "blindFittingServices"),
	INVENTORY_SERVICES(32, "Inventory Services", "inventoryForProperty"),
	TREE_SURGERY_SERVICES(33, "Tree Surgery Services", "treeSurgeryServices"),
	PEST_CONTROL_SERVICES(34, "Pest Control Services", "pestControlServices"),
	ENVIRONMENTAL_SERVICES(35, "Environmental Services", "environmentalServices"),
	LEGIONELLA_ASSESSMENT_SERVICES(36, "Legionella Assessment Services", "legionellaAssessmentServices"),
	DOMESTIC_SERVICES_SUPPLIERS(37, "Domestic Services Suppliers ", "domesticServicesSuppliers "),
	SECURITY_SYSTEM_SUPPLIERS(38, "Security System Suppliers", "securitySystemSuppliers"),
	AERIAL_SUPPLIERS(39, " Aerial Suppliers", " aerialSuppliers"),
	UTILITY_SUPPLIER(40, "Utility Supplier", "utilitySupplier,"),
	HANDY_PERSON(41, "Handy Person", "handyPerson"),
	WINDOW_CLEANING_SERVICES(42, "Window Cleaning Services", "windowCleaningServices"),
	EMERGENCY_BOARDING_UP_COMPANY(43, "Emergency Boarding Up Company", "emergencyBoardingUpCompany"),
	BUILDING_SERVEYING_COMPANY(44, "Building Surveying Company", "buildingSurveyingCompany,"),
	QUANTITY_SERVEYING_SERVICES(45, "Quantity Surveying Services", "quantitySurveyingServices"),
	STRUCTURAL_ENGINEER_SERVICE(46, "Structural Engineer Service", "structuralEngineerService"),
	UPVC_WINDOW_SUPPLIER(47, "UPVC  Window Supplier", "uPVCWindowSupplier"),
	CARPET_CLEANING_COMPANY(48,"Carpet Cleaning Company", "carpetCleaningCompany");

	private final long id;
	private final String value;
	private final String fieldName;

	ContractorFunctionality(long idx, String value, String fieldName) {
		this.id = idx;
		this.value = value;
		this.fieldName = fieldName;
	}

	public static ContractorFunctionality get(Object status) {
		if (status == null || status.equals("null") || status.equals("")) {
			return ContractorFunctionality.UNDEFINED;
		} else if (CommonFunctions.isInteger(String.valueOf(status))) {
			int idx = Integer.parseInt(String.valueOf(status));
			for (ContractorFunctionality act : ContractorFunctionality.values()) {
				if (act.id == idx)
					return act;
			}
			return ContractorFunctionality.UNDEFINED;
		} else {
			for (ContractorFunctionality act : ContractorFunctionality.values()) {
				if (act.value.equalsIgnoreCase(status.toString()) || act.value.equalsIgnoreCase(status.toString()))
					return act;
			}
			return ContractorFunctionality.UNDEFINED;
		}
	}
	
	public static ContractorFunctionality getByFieldName(String fieldName) {
		if (fieldName == null || fieldName.equals("null") || fieldName.equals("")) {
			return ContractorFunctionality.UNDEFINED;
		} else {
			for (ContractorFunctionality act : ContractorFunctionality.values()) {
				if (act.fieldName.equalsIgnoreCase(fieldName))
					return act;
			}
			return ContractorFunctionality.UNDEFINED;
		}
	}
	
	public JSONObject toJSON() throws JSONException{
		JSONObject jObj = new JSONObject();
			jObj.put("id", this.id);
			jObj.put("value", this.value);
			
			return jObj;
	}
	
	public long id() {
		return id;
	}

	public String value() {
		return value;
	}

	public String fieldName() {
		return fieldName;
	}
	
	
	public static JSONArray toJArray() throws JSONException {
		JSONArray jArray = new JSONArray();
		
		ContractorFunctionality[] contractorFunctionalityArr = ContractorFunctionality.values();
		Arrays.sort(contractorFunctionalityArr,new Comparator<ContractorFunctionality>() {
			@Override
			public int compare(ContractorFunctionality obj1,ContractorFunctionality obj2) {
				    return obj1.value().compareTo(obj2.value());
			}
		});
		for(ContractorFunctionality statusObj : contractorFunctionalityArr){
			if(!statusObj.equals(ContractorFunctionality.UNDEFINED)){
				jArray.put(new JSONObject().put("key", statusObj.id()).put("value", statusObj.value()));
			}
		}
		return jArray;
	}
}
