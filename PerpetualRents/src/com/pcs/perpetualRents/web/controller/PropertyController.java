package com.pcs.perpetualRents.web.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDocument;
import com.pcs.perpetualRents.business.bean.PropertyDocumentDownloadStatus;
import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;
import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.commonFunction.CommonFunctions;
import com.pcs.perpetualRents.dao.PropertyDAO;
import com.pcs.perpetualRents.enm.ADPL2Page;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.DocumentType;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.PropertyType;
import com.pcs.perpetualRents.enm.WebAction;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.FileManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.PropertyManager;
import com.pcs.perpetualRents.manager.PropertyResponseManager;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class PropertyController{

	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private PropertyDAO propertyDAO;
	/*@Autowired
	private PropertyDeveloperManager propertyDeveloperManager;*/
	@Autowired
	private PropertyResponseManager propertyResponseManager;
	@Autowired
	private LandLordManager landlordManager;
	@Autowired
	private ConversationManager conversationManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	@Autowired
	private FileManager fileManager;
	
	private HttpSession sessionObj;
	private UserLogin loginObj;
	private Property propertyObj;
	private Long propertyId;
	private LandLord landLordObj;
	/*private PropertyDeveloper propertyDeveloperObj;
	private PDProperty pdPropertyObj;*/
	List<PropertyResponse> savedPropertyList = null;
	
	ObjectMapper mapper = new ObjectMapper();
	
	boolean execStatus;
	
	@RequestMapping("property")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		WebAction action = WebAction.get(request.getParameter("action"));
		String eCommand = request.getParameter("param");
		JSONObject jObj = new JSONObject();
		//JSONArray jArray = new JSONArray();
		//mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		
		String checkBox = request.getParameter("checkbox");
		
		if(action == null)
			action = WebAction.PROPERTY_DEFAULT;
			
		switch (action) {
		
		case DISABLE:
			if("PROPERTY".equalsIgnoreCase(eCommand)){
				String propId = request.getParameter("propertyId");
				if(propId != null && propId.length() != 0){
					if("disable".equalsIgnoreCase(checkBox)){
						execStatus = propertyManager.disableProperty(Long.valueOf(propId));
						if(execStatus)
							jObj.put("success", true);
						else
							jObj.put("success", false);
					}else if("enable".equalsIgnoreCase(checkBox)){
						execStatus = propertyManager.enableProperty(Long.valueOf(propId));
						if(execStatus)
							jObj.put("success", true);
						else
							jObj.put("success", false);
					}
				}
			}
			JSONDelegates.setResponse(jObj, response);
			break;
		case FETCH:
			if("FETCH-PROPERTY-DETAIL".equalsIgnoreCase(eCommand)){

					String propId  = request.getParameter("propertyId"); 
						propertyId = Long.valueOf(propId);
						sessionObj.setAttribute("propertyId", propertyId);
						sessionObj.setAttribute("flag", true);
					if(propertyId != null){
						propertyObj = propertyManager.loadPropertyById(propertyId);
						if(propertyObj != null){
							JSONObject _jObj = new JSONObject();
								_jObj.put("property", propertyObj.toJSON(true));
								
								if(propertyObj.getAddressObj() != null)
									_jObj.put("address", propertyObj.getAddressObj().toJSON(true));
								
								boolean flag = (Boolean) sessionObj.getAttribute("flag");
								if(flag)
									jObj.put("flag", flag);
								else
									jObj.put("flag", false);
								
							jObj.put("success", true);
							jObj.put("data", _jObj);
						}else{
							jObj.put("success", false);
						}
				}
			}
			
			JSONDelegates.setResponse(jObj, response);
			break;
			
		case REGISTER_PROPERTY:
			
			
		case PROPERTY_DEFAULT:
			return new ModelAndView("user/landlord/landlordManager");
			
		case PROPERTY_DETAIL:
			 return new ModelAndView("user/landlord/property/savePropertyDetails");
			
		case REVIEW_PROPERTY:
			return new ModelAndView("user/landlord/property/reviewProperty");
			
			
		case DOCUMENTS:
			String propId = request.getParameter("propertyId");
			if(propId != null){
				sessionObj.setAttribute("propertyId", Long.valueOf(propId.trim()));
			}
			return new ModelAndView("user/landlord/property/property-documents");
			
			
		case REVIEW_PDPROPERTY:                // action 600
			return new ModelAndView("user/propertyDeveloper/pdProperty/savePDPropertyDetails");
		default:
			break;
		}
		
		return null;
	}
	
	@RequestMapping("property/redirectRegisterProperty")
	public ModelAndView redirectRegisterProperty(HttpServletRequest request){
		sessionObj = request.getSession(false);
		sessionObj.removeAttribute("propertyId");
		return new ModelAndView("user/landlord/property/terms-conditions.jsp");
	}
	
	@RequestMapping("property/redirectReviewProperty")
	public ModelAndView redirectReviewProperty(){
		return new ModelAndView("user/landlord/property/reviewProperty");
	}
	
	@RequestMapping("property/submitReviewProperty")
	public ModelAndView submitReviewProperty(){
		return new ModelAndView("user/landlord/property/success");
	}
	
	@RequestMapping("property/redirectConversation")
	public ModelAndView redirectConversation(HttpServletRequest request, HttpServletResponse response){
		sessionObj = request.getSession(false);
		String propId = request.getParameter("propertyId");
		if(propId != null){
			sessionObj.setAttribute("propertyId", Long.valueOf(propId.trim()));
		}
		return new ModelAndView("user/landlord/property/email");
	}
	
	@RequestMapping("property/loadAssignedJobsDetails")
	public void loadAssignedJobsDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		if(propertyId != null){
			ContractorFunctionality[] funArr = ContractorFunctionality.values();
			JSONObject _jObj;
			for (ContractorFunctionality _conFunObj : funArr) {
				List<Conversation> conList = conversationManager.loadConversationByPropertyAndFunctionality(propertyId, PropertyType.CURRENT_DEVELOPMENT.id(), _conFunObj.id());
				if(conList != null && !conList.isEmpty()){
					 _jObj = new JSONObject();
					_jObj.put("conversation", _conFunObj.fieldName());
					jArray.put(_jObj);
				}
			}
			jObj.put("data", jArray);
			jObj.put("success", true);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("property/saveProperty")
	public void saveProperty(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		propertyObj = mapper.readValue(request.getInputStream(), Property.class);
		if(propertyObj != null){
			landLordObj = landlordManager.loadLandLordByUserLogin(loginObj);
			if(landLordObj != null){
				propertyObj.setLandlordId(landLordObj.getId());
				execStatus = propertyManager.saveProperty(propertyObj, loginObj.getId());
				Set<Long> createpropertySet = null;
				if(execStatus){
				landlordManager.updateDocStatus(PropertyDocumentDownloadStatus.TABLE_NAME, new String[]{PropertyDocumentDownloadStatus.PROPERTY_ID},
							new String[]{""+propertyObj.getId()}, new String[]{PropertyDocumentDownloadStatus.OBJECT_TYPE_ID, PropertyDocumentDownloadStatus.OBJECT_ID}, new String[]{""+ObjectType.LANDLORD.id() , ""+landLordObj.getId()});
					createpropertySet = (Set<Long>) sessionObj.getAttribute("createpropertySet");
					if(createpropertySet == null){
						createpropertySet = new HashSet<Long>();
						createpropertySet.add(propertyObj.getId());
						sessionObj.setAttribute("createpropertySet", createpropertySet);
					}else{
						createpropertySet.add(propertyObj.getId());
						sessionObj.setAttribute("createpropertySet", createpropertySet);
					}
					sessionObj.setAttribute("propertyId", propertyObj.getId());
					jObj.put("success", true);
					jObj.put("message", "Property Details has been successfully saved.");
				}else{
					jObj.put("success", false);
					jObj.put("message", "Error occurred.");
				}
			
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	/*----------------------------------------------------------------------------------------------------------------------*/
	
	@SuppressWarnings("unchecked")
	@RequestMapping("property/updateProperty")
	public void updateProperty(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		propertyObj = mapper.readValue(request.getInputStream(), Property.class);
		sessionObj = request.getSession(false);
		JSONObject jObj = new JSONObject();
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(propertyObj != null){
			propertyId = (Long) sessionObj.getAttribute("propertyId");
			propertyObj.setId(propertyId);
			execStatus = propertyManager.updateProperty(propertyObj, loginObj.getId());
			Set<Long> editpropertySet = null;
			if(execStatus){
				editpropertySet = (Set<Long>) sessionObj.getAttribute("editpropertySet");
				if(editpropertySet == null){
					editpropertySet = new HashSet<Long>();
					editpropertySet.add(propertyObj.getId());
					sessionObj.setAttribute("editpropertySet", editpropertySet);
				}else{
					editpropertySet.add(propertyObj.getId());
					sessionObj.setAttribute("editpropertySet", editpropertySet);
				}
				request.getSession(false).setAttribute("propertyId", propertyId);
				jObj.put("success", true);
				jObj.put("message", "Property Details has been successfully updated.");
			}else{
				jObj.put("success", false);
				jObj.put("message", "Error occurred.");
			}
		}
	JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveHMOLicense")
	public ModelAndView saveHMOLicense(HttpServletRequest request , HttpServletResponse response) throws IOException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		//JSONObject jObj = new JSONObject();
		if(loginObj != null){
			
			String hmoLicence = request.getParameter("hmoLicence");
			String licenceNumber = request.getParameter("licenceNumber");
			
			String electricalInstallation = request.getParameter("electricalInstallation");
			String electricalTest = request.getParameter("electricalTest"); 
			String gasCertificate = request.getParameter("gasCertificate");
			String energyPerformance = request.getParameter("energyPerformance");
			String centralHeatingSystem = request.getParameter("centralHeatingSystem");
			String centralHeatingSystemComments = request.getParameter("centralHeatingSystemComments");
			
			String buildingInsaurance = request.getParameter("buildingInsaurance");
			String sketchPlan = request.getParameter("sketchPlan");
			String asbestosSurvey = request.getParameter("asbestosSurvey");
			String periodicInspectionOfWaterSupply = request.getParameter("periodicInspectionOfWaterSupply");
			String keySet = request.getParameter("keySet");
			
			String landTitleRegisteryDocument = request.getParameter("landTitleRegisteryDocument");
			String inventoryForProperty = request.getParameter("inventoryForProperty");
			String landlordInsauranceForContent = request.getParameter("landlordInsauranceForContent");
			String windowAndDoorWarrantee = request.getParameter("windowAndDoorWarrantee");
			String dampPoofcourse = request.getParameter("dampPoofcourse");
			String fittedHobAndOven = request.getParameter("fittedHobAndOven");
			String electricShower = request.getParameter("electricShower");
			String electricFires = request.getParameter("electricFires");
			
			String manualForCentralHeating = request.getParameter("manualForCentralHeating");
			String timerForCentralHeating = request.getParameter("timerForCentralHeating");
			String manualForBoiler = request.getParameter("manualForBoiler");
			String manualForFittedOven = request.getParameter("manualForFittedOven");
			
			MultipartHttpServletRequest multiPartRequest = null;
			try{
				
				if(request instanceof MultipartHttpServletRequest)
					multiPartRequest = (MultipartHttpServletRequest) request;
			}catch (Exception e) {
				e.printStackTrace();
				return new ModelAndView("user/landlord/property/hmoLicence1");
			}
			
			PropertyResponse responseObj = null;
			File fileObj = null;
			MultipartFile partObj = null;
			Long objectType = ObjectType.PROPERTY.id();
			propertyId = (Long) sessionObj.getAttribute("propertyId");
			propertyObj = propertyManager.loadPropertyById(propertyId);
			savedPropertyList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.HMO_LICENCE);
			List<PropertyResponse> currentResponseList = new ArrayList<PropertyResponse>();
			if(propertyId != null && propertyObj != null){
			 	responseObj = new PropertyResponse();
			 		responseObj.setFieldName("hmoLicence");
			 		responseObj.setResponse(hmoLicence);
			 		responseObj.setPropertyId(propertyId);
			 	currentResponseList.add(responseObj);
			 	
			 	responseObj = new PropertyResponse();
		 			responseObj.setFieldName("licenceNumber");
		 			responseObj.setComments(licenceNumber);
			 		responseObj.setPropertyId(propertyId);
		    	currentResponseList.add(responseObj);
		    	
					if(electricalInstallation != null){
						responseObj = new PropertyResponse();
						if(multiPartRequest != null)
							partObj = multiPartRequest.getFile("electricalInstallationFile");
						
						responseObj.setFieldName("electricalInstallation");
				 		responseObj.setPropertyId(propertyId);
						responseObj.setResponse(electricalInstallation);
						
						if(partObj != null && partObj.getSize() != 0){
							fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
							if(fileObj != null){
								fileObj.setPropertyReference(propertyObj.getUniqueReference());
								responseObj.setFileObj(fileObj);
							}
						}
						currentResponseList.add(responseObj);
					}
				
				if(electricalTest != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("electricalTestFile");
					responseObj.setFieldName("electricalTest");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(electricalTest);
				
					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(gasCertificate != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("gasCertificateFile");
					responseObj.setFieldName("gasCertificate");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(gasCertificate);
					
					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(energyPerformance != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("energyPerformanceFile");
					responseObj.setFieldName("energyPerformance");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(energyPerformance);
			
					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("centralHeatingSystemFile");
					responseObj.setFieldName("centralHeatingSystem");
					responseObj.setComments(centralHeatingSystemComments);
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(centralHeatingSystem);
		
					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					
				currentResponseList.add(responseObj);
				
				if(buildingInsaurance != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("buildingInsauranceFile");
					responseObj.setFieldName("buildingInsaurance");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(buildingInsaurance);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(sketchPlan != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("sketchPlanFile");
					responseObj.setFieldName("sketchPlan");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(sketchPlan);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				if(asbestosSurvey != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("asbestosSurveyFile");
					responseObj.setFieldName("asbestosSurvey");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(asbestosSurvey);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(periodicInspectionOfWaterSupply != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("periodicInspectionOfWaterSupplyFile");
					responseObj.setFieldName("periodicInspectionOfWaterSupply");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(periodicInspectionOfWaterSupply);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(keySet != null){
					responseObj = new PropertyResponse();
					
					responseObj.setFieldName("keySet");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(keySet);
					currentResponseList.add(responseObj);
				}
				
				if(landTitleRegisteryDocument != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("landTitleRegisteryDocumentFile");
					responseObj.setFieldName("landTitleRegisteryDocument");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(landTitleRegisteryDocument);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(inventoryForProperty != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("inventoryForPropertyFile");
					responseObj.setFieldName("inventoryForProperty");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(inventoryForProperty);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(landlordInsauranceForContent != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("landlordInsauranceForContentFile");
					responseObj.setFieldName("landlordInsauranceForContent");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(landlordInsauranceForContent);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(windowAndDoorWarrantee != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("windowAndDoorWarranteeFile");
					responseObj.setFieldName("windowAndDoorWarrantee");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(windowAndDoorWarrantee);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(dampPoofcourse != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("dampPoofcourseFile");
					responseObj.setFieldName("dampPoofcourse");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(dampPoofcourse);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(fittedHobAndOven != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("fittedHobAndOvenFile");
					responseObj.setFieldName("fittedHobAndOven");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(fittedHobAndOven);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(electricShower != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("electricShowerFile");
					responseObj.setFieldName("electricShower");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(electricShower);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(electricFires != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("electricFiresFile");
					responseObj.setFieldName("electricFires");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(electricFires);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(manualForCentralHeating != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("manualForCentralHeatingFile");
					responseObj.setFieldName("manualForCentralHeating");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(manualForCentralHeating);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(timerForCentralHeating != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("timerForCentralHeatingFile");
					responseObj.setFieldName("timerForCentralHeating");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(timerForCentralHeating);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(manualForBoiler != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("manualForBoilerFile");
					responseObj.setFieldName("manualForBoiler");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(manualForBoiler);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
				
				if(manualForFittedOven != null){
					responseObj = new PropertyResponse();
					if(multiPartRequest != null)
						partObj = multiPartRequest.getFile("manualForFittedOvenFile");
					responseObj.setFieldName("manualForFittedOven");
			 		responseObj.setPropertyId(propertyId);
					responseObj.setResponse(manualForFittedOven);

					if(partObj != null && partObj.getSize() != 0){
						fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), objectType, propertyId, partObj.getBytes(),  partObj.getContentType(), DocumentType.CERTIFICATE.id());
						if(fileObj != null){
							fileObj.setPropertyReference(propertyObj.getUniqueReference());
							responseObj.setFileObj(fileObj);
						}
						
					}
					currentResponseList.add(responseObj);
				}
			}
			execStatus = propertyManager.savePropertyResponse(currentResponseList, loginObj.getId(), savedPropertyList);
			
			return new ModelAndView("user/landlord/property/dhs-criteria-A");
		}else{
			return new ModelAndView("user/landlord/property/hmoLicence1");
		}
	}
	
	@RequestMapping("property/loadHMOLicense")
	public void loadHMOLicense(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.HMO_LICENCE);

		JSONObject _jObj = new JSONObject();
		if(responseList != null && responseList.size() != 0){
			for (PropertyResponse _resObj : responseList) 
				if(_resObj != null)
					_jObj.put(_resObj.getFieldName(), _resObj.toJSON(false));
				
			
			jObj.put("data", _jObj);
		}else{
			jObj.put("success", false);
		}
		List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.HMO_LICENCE);
		JSONObject tJObj = new JSONObject();
		JSONArray tjArray = new JSONArray();
		if(questionList != null && !questionList.isEmpty()){
			for (PropertyQuestions _propQuesObj : questionList) {
					tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
					tjArray.put(_propQuesObj.getFieldName());
			}
		}
		    jObj.put("fieldArr", tjArray);
			jObj.put("ansObj", tJObj);
			
		ContractorFunctionality[] funArr = ContractorFunctionality.values();
		JSONArray _jArr = new JSONArray();
		for (ContractorFunctionality _conFunObj : funArr) {
			List<Conversation> conList = conversationManager.loadConversationByPropertyAndFunctionality(propertyId, PropertyType.CURRENT_DEVELOPMENT.id(), _conFunObj.id());
			if(conList != null && !conList.isEmpty()){
				_jArr.put(_conFunObj.fieldName());
			}
		}
		jObj.put("conversation", _jArr);
		jObj.put("success", true);
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveDHSCriteriaA")
	public ModelAndView saveDHSCriteriaA(HttpServletRequest request, HttpServletResponse response) throws IOException{

		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		savedPropertyList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_A);   // fetching already saved response of property 
		
		
		String readAndUnderstandTerms = request.getParameter("readAndUnderstandTerms");
		if("on".equalsIgnoreCase(readAndUnderstandTerms) || "true".equalsIgnoreCase("true")){
			readAndUnderstandTerms = "true";
		}else{
			readAndUnderstandTerms = "false";
		}
		System.out.println("readAndUnderstandTerms : " + readAndUnderstandTerms);
		String structurallyStable = request.getParameter("structurallyStable");
		String structurallyStableComments = request.getParameter("structurallyStableComments");
		String freeFromSeriousDisRepair = request.getParameter("freeFromSeriousDisRepair");
		String freeFromSeriousDisRepairComments = request.getParameter("freeFromSeriousDisRepairComments");
		String freeFromDampness = request.getParameter("freeFromDampness");
		String freeFromDampnessComments = request.getParameter("freeFromDampnessComments");
		
		String insulation270mm = request.getParameter("insulation270mm");
		String insulation270mmComments = request.getParameter("insulation270mmComments");
		String installationDate = request.getParameter("installationDate");
		
		String adequateHeating = request.getParameter("adequateHeating");
		String adequateHeatingComments = request.getParameter("adequateHeatingComments"); 
		String boilerAge = request.getParameter("boilerAge");
		
		String pollutants = request.getParameter("pollutants");
		String pollutantsComments = request.getParameter("pollutantsComments");
		
		String needRadonRiskReport = request.getParameter("needRadonRiskReport");
		String needRadonRiskReportComments = request.getParameter("needRadonRiskReportComments");
		
		String propertyMeetStandards = request.getParameter("propertyMeetStandards");
		String whereITFails = request.getParameter("whereITFails");
		String upgradeProperty = request.getParameter("upgradeProperty");
		String workCompletedBy = request.getParameter("workCompletedBy");
		
		PropertyResponse responseObj = null;
		propertyObj = propertyManager.loadPropertyById(propertyId);
		MultipartHttpServletRequest multiPartRequest = null;
		try{
			
			if(request instanceof MultipartHttpServletRequest)
				multiPartRequest = (MultipartHttpServletRequest) request;                 // check attachments file
		}catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("user/landlord/property/dhs-criteria-A.jsp");
		}
		
		List<PropertyResponse> currentResponseList = new ArrayList<PropertyResponse>();
		
		responseObj = new PropertyResponse();
			responseObj.setFieldName("readAndUnderstandTerms");
			responseObj.setResponse(readAndUnderstandTerms);
			responseObj.setPropertyId(propertyId);
		currentResponseList.add(responseObj);
		
		responseObj = new PropertyResponse();
 			responseObj.setFieldName("structurallyStable");
 			responseObj.setResponse(structurallyStable);;
 			responseObj.setComments(structurallyStableComments);
 			responseObj.setPropertyId(propertyId);
 		currentResponseList.add(responseObj);
 		
 		responseObj = new PropertyResponse();
				responseObj.setFieldName("freeFromSeriousDisRepair");
				responseObj.setResponse(freeFromSeriousDisRepair);
				responseObj.setComments(freeFromSeriousDisRepairComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("freeFromDampness");
				responseObj.setResponse(freeFromDampness);
				responseObj.setComments(freeFromDampnessComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
		
			responseObj = new PropertyResponse();
				responseObj.setFieldName("insulation270mm");
				responseObj.setResponse(insulation270mm);
				responseObj.setComments(insulation270mmComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			if("true".equalsIgnoreCase(insulation270mm)){
				responseObj = new PropertyResponse();
					responseObj.setFieldName("installationDate");
					responseObj.setComments(installationDate);
					responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
			}

			responseObj = new PropertyResponse();
	 			responseObj.setFieldName("adequateHeating");
	 			responseObj.setResponse(adequateHeating);
	 			responseObj.setComments(adequateHeatingComments);
	 			responseObj.setPropertyId(propertyId);
	 		currentResponseList.add(responseObj);
 		
	 		if("true".equalsIgnoreCase(adequateHeating)){
		 		responseObj = new PropertyResponse();
					responseObj.setFieldName("boilerAge");
					responseObj.setComments(boilerAge);
					responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
	 		}
	 		
	 		responseObj = new PropertyResponse();
				responseObj.setFieldName("pollutants");
				responseObj.setResponse(pollutants);
				responseObj.setComments(pollutantsComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
					
			responseObj = new PropertyResponse();                          // pojo to save property response
				responseObj.setFieldName("needRadonRiskReport");
				responseObj.setResponse(needRadonRiskReport);
				responseObj.setComments(needRadonRiskReportComments);
				responseObj.setPropertyId(propertyId);                    // getting from session
				
				MultipartFile partObj = null;
				if(multiPartRequest != null){
					partObj = multiPartRequest.getFile("needRadonRiskReportFile");
						if(partObj != null && partObj.getSize() != 0){
							File fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), ObjectType.PROPERTY.id(), propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
							if(fileObj != null){
								fileObj.setPropertyReference(propertyObj.getUniqueReference());
								responseObj.setFileObj(fileObj);
							}
					}
				}
			currentResponseList.add(responseObj);
				
				responseObj = new PropertyResponse();
 				responseObj.setFieldName("propertyMeetStandards");
 				responseObj.setResponse(propertyMeetStandards);
		 		responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 				responseObj = new PropertyResponse();
					responseObj.setFieldName("whereITFails");
					responseObj.setComments(whereITFails);
		 		responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
				
				responseObj = new PropertyResponse();
					responseObj.setFieldName("upgradeProperty");
					responseObj.setResponse(upgradeProperty);
		 		responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
				
				responseObj = new PropertyResponse();
					responseObj.setFieldName("workCompletedBy");
					responseObj.setComments(workCompletedBy);
		 		responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
					
			currentResponseList.add(responseObj);
 		
	execStatus = propertyManager.savePropertyResponse(currentResponseList, loginObj.getId(), savedPropertyList);
		return new ModelAndView("user/landlord/property/dhs-criteria-B");
	
	}
	
	@RequestMapping("property/loadDHSCriteriaA")
	public void loadDHSCriteriaA(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		if(propertyId != null){
			List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_A);
			if(responseList != null && responseList.size() != 0){
				JSONObject _jObj = new JSONObject();
				for (PropertyResponse _resObj : responseList) {
					if(_resObj != null){
						_jObj.put(_resObj.getFieldName(), _resObj.toJSON(false));
					}
				}
				
				jObj.put("data", _jObj);
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
			List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.DHS_CRITERIA_A);
			JSONObject tJObj = new JSONObject();
			JSONArray tjArray = new JSONArray();
			if(questionList != null && !questionList.isEmpty()){
				for (PropertyQuestions _propQuesObj : questionList) {
						tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
						tjArray.put(_propQuesObj.getFieldName());
				}
			}
		    jObj.put("fieldArr", tjArray);
			jObj.put("ansObj", tJObj);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveDHSCriteriaB")
	public ModelAndView saveDHSCriteriaB(HttpServletRequest request, HttpServletResponse response) throws IOException{                        // also include upload code
			sessionObj = request.getSession(false);
			loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			propertyId = (Long) sessionObj.getAttribute("propertyId");
			//JSONObject jObj = new JSONObject();
			
			MultipartHttpServletRequest multiPartRequest = null;
			try{
				
				if(request instanceof MultipartHttpServletRequest)
					multiPartRequest = (MultipartHttpServletRequest) request;
			}catch (Exception e) {
				e.printStackTrace();
				return new ModelAndView("user/landlord/property/dhs-criteria-C.jsp");
			}
			propertyObj = propertyManager.loadPropertyById(propertyId);
		if(propertyId != null && loginObj != null){
			if(propertyObj != null){
				savedPropertyList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_B);
				
				String adequateSizeandLayout = request.getParameter("adequateSizeandLayout");
				String adequateSizeandLayoutComments = request.getParameter("adequateSizeandLayoutComments");
				String safeAgainstUnauthorizedEntry = request.getParameter("safeAgainstUnauthorizedEntry");
				String safeAgainstUnauthorizedEntryComments = request.getParameter("safeAgainstUnauthorizedEntryComments");
				String careTaker = request.getParameter("careTaker");
				String careTakerComments = request.getParameter("careTakerComments");
				
				String burglarAlarmSystem = request.getParameter("burglarAlarmSystem");
				String burglarAlarmSystemComments = request.getParameter("burglarAlarmSystemComments");
				
				String allWindowsHaveKeys = request.getParameter("allWindowsHaveKeys");
				String allWindowsHaveKeysComments = request.getParameter("allWindowsHaveKeysComments");
				String adequateLightening = request.getParameter("adequateLightening");
				String adequateLighteningComments = request.getParameter("adequateLighteningComments");
				
				String adequateSecurityLightening = request.getParameter("adequateSecurityLightening");
				String adequateSecurityLighteningComments = request.getParameter("adequateSecurityLighteningComments");
				String externalLighteningAtNight = request.getParameter("externalLighteningAtNight");
				String externalLighteningAtNightComments = request.getParameter("externalLighteningAtNightComments");
				String complaintsAgainstNoise = request.getParameter("complaintsAgainstNoise");
				String complaintsAgainstNoiseComments = request.getParameter("complaintsAgainstNoiseComments");
				String safeBarriersAgainstFire = request.getParameter("safeBarriersAgainstFire");
				String safeBarriersAgainstFireComments = request.getParameter("safeBarriersAgainstFireComments"); 
				String adequateNoiceInsulation = request.getParameter("adequateNoiceInsulation");
				String adequateNoiceInsulationComments = request.getParameter("adequateNoiceInsulationComments");
				
				PropertyResponse responseObj = null;
				
				List<PropertyResponse> currentResponseList = new ArrayList<PropertyResponse>();
				
				responseObj = new PropertyResponse();
				responseObj.setFieldName("adequateSizeandLayout");
				responseObj.setResponse(adequateSizeandLayout);
				responseObj.setComments(adequateSizeandLayoutComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("safeAgainstUnauthorizedEntry");
				responseObj.setResponse(safeAgainstUnauthorizedEntry);
				responseObj.setComments(safeAgainstUnauthorizedEntryComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("careTaker");
				responseObj.setResponse(careTaker);
				responseObj.setComments(careTakerComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
					responseObj.setFieldName("burglarAlarmSystem");
					responseObj.setResponse(burglarAlarmSystem);
					responseObj.setComments(burglarAlarmSystemComments);
					responseObj.setPropertyId(propertyId);
					MultipartFile partObj = null;
					if(multiPartRequest != null){
						partObj = multiPartRequest.getFile("burglarAlarmSystemFile");
							if(partObj != null && partObj.getSize() != 0){
								File fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), ObjectType.PROPERTY.id(), propertyId, partObj.getBytes(), partObj.getContentType(), DocumentType.CERTIFICATE.id());
								if(fileObj != null){
									fileObj.setPropertyReference(propertyObj.getUniqueReference());
									responseObj.setFileObj(fileObj);
								}
						}
					}
						
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("allWindowsHaveKeys");
				responseObj.setResponse(allWindowsHaveKeys);
				responseObj.setComments(allWindowsHaveKeysComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("adequateLightening");
				responseObj.setResponse(adequateLightening);
				responseObj.setComments(adequateLighteningComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("adequateSecurityLightening");
				responseObj.setResponse(adequateSecurityLightening);
				responseObj.setComments(adequateSecurityLighteningComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("externalLighteningAtNight");
				responseObj.setResponse(externalLighteningAtNight);
				responseObj.setComments(externalLighteningAtNightComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("complaintsAgainstNoise");
				responseObj.setResponse(complaintsAgainstNoise);
				responseObj.setComments(complaintsAgainstNoiseComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("safeBarriersAgainstFire");
				responseObj.setResponse(safeBarriersAgainstFire);
				responseObj.setComments(safeBarriersAgainstFireComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				responseObj = new PropertyResponse();
				responseObj.setFieldName("adequateNoiceInsulation");
				responseObj.setResponse(adequateNoiceInsulation);
				responseObj.setComments(adequateNoiceInsulationComments);
				responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);

				currentResponseList.add(responseObj);
				
			execStatus = propertyManager.savePropertyResponse(currentResponseList, loginObj.getId(), savedPropertyList);
				return new ModelAndView("user/landlord/property/dhs-criteria-C");
			}
		}else{
			return new ModelAndView("user/landlord/property/dhs-criteria-B");
		}
		return null;
	}
	
	@RequestMapping("property/loadDHSCriteriaB")
	public void loadDHSCriteriaB(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		JSONObject jObj = new JSONObject();
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_B);
		if(responseList != null && responseList.size() != 0){
			JSONObject _jObj = new JSONObject();
			for (PropertyResponse _resObj : responseList) {
				if(_resObj != null){
					_jObj.put(_resObj.getFieldName(), _resObj.toJSON(false));
				}
			}
			jObj.put("data", _jObj);
			jObj.put("success", true);
		}else{
			jObj.put("success", false);
		}
		List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.DHS_CRITERIA_B);
		JSONObject tJObj = new JSONObject();
		JSONArray tjArray = new JSONArray();
		if(questionList != null && !questionList.isEmpty()){
			for (PropertyQuestions _propQuesObj : questionList) {
					tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
					tjArray.put(_propQuesObj.getFieldName());
			}
		}
		    jObj.put("fieldArr", tjArray);
			jObj.put("ansObj", tJObj);
			
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveDHSCriteriaC")
	public ModelAndView saveDHSCriteriaC(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		//JSONObject jObj = new JSONObject();
		if(propertyId != null && loginObj != null){
			savedPropertyList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_C);
			
			String kitchen = request.getParameter("kitchen");
			String kitchenComments = request.getParameter("kitchenComments");
			String adequateKitchenSpace = request.getParameter("adequateKitchenSpace");
			String adequateKitchenSpaceComments = request.getParameter("adequateKitchenSpaceComments");
			String appropriatePowerSockets = request.getParameter("appropriatePowerSockets");
			String appropriatePowerSocketsComments = request.getParameter("appropriatePowerSocketsComments");
			String facilitiesForPreparationOfFood = request.getParameter("facilitiesForPreparationOfFood");
			String facilitiesForPreparationOfFoodComments = request.getParameter("facilitiesForPreparationOfFoodComments");
			String storageOfFood = request.getParameter("storageOfFood");
			String storageOfFoodComments = request.getParameter("storageOfFoodComments");
			String suitableVentilationOfKitchen = request.getParameter("suitableVentilationOfKitchen");
			String suitableVentilationOfKitchenComments = request.getParameter("suitableVentilationOfKitchenComments");
			String suitableLocatedWashBasin = request.getParameter("suitableLocatedWashBasin");
			String suitableLocatedWashBasinComments = request.getParameter("suitableLocatedWashBasinComments");
			String drainageOfFoulWater = request.getParameter("drainageOfFoulWater");
			String drainageOfFoulWaterComments = request.getParameter("drainageOfFoulWaterComments");
			String appropriatelyLocatedBathroom = request.getParameter("appropriatelyLocatedBathroom");
			String appropriatelyLocatedBathroomComments = request.getParameter("appropriatelyLocatedBathroomComments");
			String drinkingWater = request.getParameter("drinkingWater");
			String drinkingWaterComments = request.getParameter("drinkingWaterComments");
			String refuseStorage = request.getParameter("refuseStorage");
			String refuseStorageComments = request.getParameter("refuseStorageComments");
			
			
			PropertyResponse responseObj = null;
			
			List<PropertyResponse> currentResponseList = new ArrayList<PropertyResponse>();
			
			responseObj = new PropertyResponse();
	 			responseObj.setFieldName("kitchen");
	 			responseObj.setResponse(kitchen);
	 			responseObj.setComments(kitchenComments);
	 			responseObj.setPropertyId(propertyId);
	 		currentResponseList.add(responseObj);
	 		
	 		responseObj = new PropertyResponse();
 				responseObj.setFieldName("adequateKitchenSpace");
 				responseObj.setResponse(adequateKitchenSpace);
 				responseObj.setComments(adequateKitchenSpaceComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
 				responseObj.setFieldName("appropriatePowerSockets");
 				responseObj.setResponse(appropriatePowerSockets);
 				responseObj.setComments(appropriatePowerSocketsComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
				responseObj.setFieldName("facilitiesForPreparationOfFood");
				responseObj.setResponse(facilitiesForPreparationOfFood);
				responseObj.setComments(facilitiesForPreparationOfFoodComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("storageOfFood");
				responseObj.setResponse(storageOfFood);
				responseObj.setComments(storageOfFoodComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("suitableVentilationOfKitchen");
				responseObj.setResponse(suitableVentilationOfKitchen);
				responseObj.setComments(suitableVentilationOfKitchenComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("drainageOfFoulWater");
				responseObj.setResponse(drainageOfFoulWater);
				responseObj.setComments(drainageOfFoulWaterComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("suitableLocatedWashBasin");
				responseObj.setResponse(suitableLocatedWashBasin);
				responseObj.setComments(suitableLocatedWashBasinComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("appropriatelyLocatedBathroom");
				responseObj.setResponse(appropriatelyLocatedBathroom);
				responseObj.setComments(appropriatelyLocatedBathroomComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("drinkingWater");
				responseObj.setResponse(drinkingWater);
				responseObj.setComments(drinkingWaterComments);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
			
			responseObj = new PropertyResponse();
				responseObj.setFieldName("refuseStorage");
				responseObj.setResponse(refuseStorage);
				responseObj.setComments(refuseStorageComments);
				responseObj.setPropertyId(propertyId);
		   currentResponseList.add(responseObj);
			
 		
		execStatus = propertyManager.savePropertyResponse(currentResponseList, loginObj.getId(), savedPropertyList);
		
			return new ModelAndView("user/landlord/property/dhs-criteria-D");
		}else{
			return new ModelAndView("user/landlord/property/dhs-criteria-C");
			}
		}
	
	@RequestMapping("property/loadDHSCriteriaC")
	public void loadDHSCriteriaC(HttpServletRequest request, HttpServletResponse response) throws JSONException{
			sessionObj = request.getSession(false);
			propertyId = (Long) sessionObj.getAttribute("propertyId");
			JSONObject jObj = new JSONObject();
		if(propertyId != null){
			List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_C);
			if(responseList != null && responseList.size() != 0){
				JSONObject _jObj = new JSONObject();
				for (PropertyResponse _resObj : responseList) {
					if(_resObj != null){
						_jObj.put(_resObj.getFieldName(), _resObj.toJSON(false));
					}
				}
				
				jObj.put("data", _jObj);
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
			List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.DHS_CRITERIA_C);
			JSONObject tJObj = new JSONObject();
			JSONArray tjArray = new JSONArray();

			 if(questionList != null && !questionList.isEmpty()){
				for (PropertyQuestions _propQuesObj : questionList) {
						tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
						tjArray.put(_propQuesObj.getFieldName());
				}
			}
			 jObj.put("fieldArr", tjArray);
			 jObj.put("ansObj", tJObj);
			
			
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveDHSCriteriaD")
	public ModelAndView saveDHSCriteriaD(HttpServletRequest request , HttpServletResponse response){
			sessionObj = request.getSession(false);
			loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			propertyId = (Long) sessionObj.getAttribute("propertyId");
			//JSONObject jObj = new JSONObject();
		if(propertyId != null && loginObj != null){
			savedPropertyList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_D);
			
			String riskOfFall = request.getParameter("riskOfFall");
			String riskOfFallComments = request.getParameter("riskOfFallComments");
			String adequateNaturalLightening = request.getParameter("adequateNaturalLightening");
			String adequateNaturalLighteningComments = request.getParameter("adequateNaturalLighteningComments");
			String securedStepsAndRamps = request.getParameter("securedStepsAndRamps");
			String securedStepsAndRampsComments = request.getParameter("securedStepsAndRampsComments");
			
			String doorsDirection = request.getParameter("doorsDirection");
			String doorsDirectionComments = request.getParameter("doorsDirectionComments"); 
			String moreThanOneFlightOfStairs = request.getParameter("moreThanOneFlightOfStairs");
			String moreThanOneFlightOfStairsComments = request.getParameter("moreThanOneFlightOfStairsComments");
			
			String buildingRegulation = request.getParameter("buildingRegulation");
			String buildingRegulationComments = request.getParameter("buildingRegulationComments");
			String buildingRegulationDate = request.getParameter("buildingRegulationDate"); 
			
			String spaceAccessedViaFlightOfStairsComments = request.getParameter("spaceAccessedViaFlightOfStairsComments");
			String electricalWiringStandards = request.getParameter("electricalWiringStandards");
			String electricalWiringStandardsComments = request.getParameter("electricalWiringStandardsComments");
			String trappingBodyParts = request.getParameter("trappingBodyParts");
			String trappingBodyPartsComments = request.getParameter("trappingBodyPartsComments");
			
			PropertyResponse responseObj = null;
			
			List<PropertyResponse> currentResponseList = new ArrayList<PropertyResponse>();
			
			responseObj = new PropertyResponse();
	 			responseObj.setFieldName("riskOfFall");
	 			responseObj.setResponse(riskOfFall);
	 			responseObj.setComments(riskOfFallComments);
	 			responseObj.setPropertyId(propertyId);
	 		currentResponseList.add(responseObj);
	 		
	 		responseObj = new PropertyResponse();
 				responseObj.setFieldName("adequateNaturalLightening");
 				responseObj.setResponse(adequateNaturalLightening);
 				responseObj.setComments(adequateNaturalLighteningComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
 				responseObj.setFieldName("securedStepsAndRamps");
 				responseObj.setResponse(securedStepsAndRamps);
 				responseObj.setComments(securedStepsAndRampsComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 		
 			responseObj = new PropertyResponse();
 				responseObj.setFieldName("doorsDirection");
 				responseObj.setResponse(doorsDirection);
 				responseObj.setComments(doorsDirectionComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);

			responseObj = new PropertyResponse();
	 			responseObj.setFieldName("moreThanOneFlightOfStairs");
	 			responseObj.setResponse(moreThanOneFlightOfStairs);
	 			responseObj.setComments(moreThanOneFlightOfStairsComments);
	 			responseObj.setPropertyId(propertyId);
	 		currentResponseList.add(responseObj);
	 		
	 		responseObj = new PropertyResponse();
 				responseObj.setFieldName("buildingRegulation");
 				responseObj.setResponse(buildingRegulation);
 				responseObj.setComments(buildingRegulationComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
				responseObj.setFieldName("buildingRegulationDate");
				responseObj.setComments(buildingRegulationDate);
				responseObj.setPropertyId(propertyId);
			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
	 			responseObj.setFieldName("spaceAccessedViaFlightOfStairs");
	 			responseObj.setResponse(null);
	 			responseObj.setComments(spaceAccessedViaFlightOfStairsComments);
	 			responseObj.setPropertyId(propertyId);
	 		currentResponseList.add(responseObj);
 		
	 		responseObj = new PropertyResponse();
 				responseObj.setFieldName("electricalWiringStandards");
 				responseObj.setResponse(electricalWiringStandards);
 				responseObj.setComments(electricalWiringStandardsComments);
 				responseObj.setPropertyId(propertyId);
 			currentResponseList.add(responseObj);
 			
 			responseObj = new PropertyResponse();
					responseObj.setFieldName("trappingBodyParts");
					responseObj.setResponse(trappingBodyParts);
					responseObj.setComments(trappingBodyPartsComments);
					responseObj.setPropertyId(propertyId);
				currentResponseList.add(responseObj);
 		
			execStatus = propertyManager.savePropertyResponse(currentResponseList, loginObj.getId(), savedPropertyList);
			
			return new ModelAndView("user/landlord/property/property-marketing-information");
		}else{
			return new ModelAndView("user/landlord/property/dhs-criteria-D");
		}
	}
	
	@RequestMapping("property/loadDHSCriteriaD")
	public void loadDHSCriteriaD(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		if(propertyId != null){
			List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, ADPL2Page.DHS_CRITERIA_D);
			if(responseList != null && responseList.size() != 0){
				JSONObject _jObj = new JSONObject();
				for (PropertyResponse _resObj : responseList) {
					if(_resObj != null){
						_jObj.put(_resObj.getFieldName(), _resObj.toJSON(false));
					}
				}
				
				jObj.put("data", _jObj);
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
			List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.DHS_CRITERIA_D);
			JSONObject tJObj = new JSONObject();
			JSONArray tjArray = new JSONArray();
			if(questionList != null && !questionList.isEmpty()){
				for (PropertyQuestions _propQuesObj : questionList) {
						tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
						tjArray.put(_propQuesObj.getFieldName());
				}
			}
			    jObj.put("fieldArr", tjArray);
				jObj.put("ansObj", tJObj);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/saveMarketingInformation")
	public ModelAndView saveMarketingInformation(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj"); 
		//JSONObject jObj = new JSONObject();
		if(propertyId != null && loginObj != null){
			String availability = request.getParameter("availability");
			String rentAmount = request.getParameter("rentAmount");
			String propertyType = request.getParameter("propertyType");
			String propertyOtherType = request.getParameter("propertyOtherType");
			String rentPeriod = request.getParameter("rentPeriod");
			String rentReasonComment = request.getParameter("rentReasonComment");
			String bedroomCount = request.getParameter("bedroomCount");
			String bathroomCount = request.getParameter("bathroomCount"); 
			String seprateWC = request.getParameter("seprateWC");
			String furnished = request.getParameter("furnished");
			String flooring = request.getParameter("flooring");
			String flooringComments = request.getParameter("flooringComments");
			String curtains = request.getParameter("curtains");
			String curtainsComments = request.getParameter("curtainsComments");
			String frontGarden = request.getParameter("frontGarden");
			String rearGardenComments = request.getParameter("rearGardenComments");
			String rearGarden = request.getParameter("rearGarden");
			String frontGardenComments = request.getParameter("frontGardenComments");
			String wheelChairAccess = request.getParameter("wheelChairAccess");
			String wheelChairAccessComments = request.getParameter("wheelChairAccessComments");
			String extraStairs = request.getParameter("extraStairs");
			String extraStairsComments = request.getParameter("extraStairsComments");
			String otherPropertyInformation = request.getParameter("otherPropertyInformation");
			
			MultipartHttpServletRequest multiPartRequest = null;
			try{
				
				if(request instanceof MultipartHttpServletRequest)
					multiPartRequest = (MultipartHttpServletRequest) request;
			}catch (Exception e) {
				e.printStackTrace();
				return new ModelAndView("user/landlord/property/reviewProperty");
			}
			PropertyMarketingInformation infoObj = null;
			File fileObj = null;
			propertyObj = propertyManager.loadPropertyById(propertyId);
			if(propertyObj != null){
				infoObj = new PropertyMarketingInformation();
				if(multiPartRequest != null){
					List<MultipartFile> files = multiPartRequest.getFiles("furnishedPropertyFile");
					if(files != null && !files.isEmpty()){
						for (MultipartFile multipartFile : files) {
							System.out.println("File Name : " + multipartFile.getOriginalFilename());
							if(multipartFile != null){
								if(multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename().length() != 0){
									fileObj = new File(multipartFile.getOriginalFilename(), multipartFile.getSize(), ObjectType.PROPERTY_MARKETING.id(), propertyId,multipartFile.getBytes(), multipartFile.getContentType(), DocumentType.IMAGES.id());
									if(fileObj != null){
										fileObj.setPropertyReference(propertyObj.getUniqueReference());
											infoObj.getFiles().add(fileObj);
									}
								}
							}
						}
					}
				}
			}
			infoObj.setAvailability(availability);
			infoObj.setRentAmount(rentAmount);
			infoObj.setPropertyType(propertyType);
			infoObj.setPropertyOtherType(propertyOtherType);
			if(propertyOtherType != null)
				infoObj.setPropertyOtherType(propertyOtherType);
			
			infoObj.setRentPeriod(rentPeriod);
			
			if(rentReasonComment != null && rentReasonComment.length() != 0)
				infoObj.setRentReasonComment(rentReasonComment);
			
			if(bedroomCount != null && bedroomCount.length() != 0)
				infoObj.setBedroomCount(Short.valueOf(bedroomCount));
			else
				infoObj.setBedroomCount(Short.valueOf("" + 0));
			if(bathroomCount != null && bathroomCount.length() != 0)
				infoObj.setBathroomCount(Short.valueOf(bathroomCount));
			else
				infoObj.setBathroomCount(Short.valueOf(""+0));
			if(seprateWC != null && seprateWC.length() != 0)
				infoObj.setSeprateWC(Short.valueOf(seprateWC));
			else
				infoObj.setSeprateWC(Short.valueOf("" + 0));
			if(furnished != null && furnished.length() != 0)
				infoObj.setFurnished(Boolean.parseBoolean(furnished));
			else
				infoObj.setFurnished(Boolean.parseBoolean(""+0));
			
			infoObj.setFlooring(Boolean.parseBoolean(flooring));
			infoObj.setFlooringComments(flooringComments);
			infoObj.setCurtains(Boolean.parseBoolean(curtains));
			infoObj.setCurtainsComments(curtainsComments);
			infoObj.setFrontGarden(Boolean.parseBoolean(frontGarden));
			infoObj.setFrontGardenComments(frontGardenComments);
			infoObj.setRearGarden(Boolean.parseBoolean(rearGarden));
			infoObj.setRearGardenComments(rearGardenComments);
			infoObj.setWheelChairAccess(Boolean.parseBoolean(wheelChairAccess));
			infoObj.setWheelChairAccessComments(wheelChairAccessComments);
			infoObj.setExtraStairs(Boolean.parseBoolean(extraStairs));
			infoObj.setExtraStairsComments(extraStairsComments);
			infoObj.setOtherPropertyInformation(otherPropertyInformation);
			
			infoObj.setPropertyId(propertyId);
			
			execStatus = propertyManager.updateMarketingInfo(infoObj, loginObj.getId());
			
				return new ModelAndView("user/landlord/property/reviewProperty");
			}else{
				return new ModelAndView("user/landlord/property/property-marketing-information");
			}
	}
	
	@RequestMapping("property/loadMarketingInformation")
	public void loadMarketingInformation(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		if(propertyId != null){
				PropertyMarketingInformation infoObj = propertyManager.loadMarketingInfoByPropertyId(propertyId);
				if(infoObj != null){
					JSONObject _jObj = new JSONObject();
						_jObj.put("info", infoObj.toJSON());
						
						List<File> files = infoObj.getFiles();
						if(files != null && !files.isEmpty()){
							for (File fileObj : files) {
								jArray.put(new JSONObject().put("fileObj",fileObj.toJSON(true)));
							}
							_jObj.put("files", jArray);
						}
						jObj.put("success", true);
						jObj.put("data", _jObj);
				}else{
					jObj.put("success", false);
				}
			}else{
				jObj.put("success", false);
			}
		JSONDelegates.setResponse(jObj, response);
		}
	
	@RequestMapping("property/viewPropertyAdminUploadedDocs")
	public ModelAndView viewAdminUploadedDocs(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/landlord/viewAdminUploadedDocs");
		Property tPropertyObj = null;
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPropertyObj = propertyManager.loadPropertyById(Long.parseLong(request.getParameter("propertyId")));
		
		if(tPropertyObj != null)
			mv.addObject("PropertydocList", propertyManager.loadPropertyAdminUploadDocument(tPropertyObj));
		
		return mv;
	}
	
	@RequestMapping("property/downloadAdminDocuments")
	public void downloadAdminUploadedDocumentById(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PropertyDocument tPropertyDocumentObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("documentId")))
			tPropertyDocumentObj = propertyDAO.loadPropertyDocumentsById(Long.parseLong(request.getParameter("documentId")));
		
		if(tPropertyDocumentObj != null){
			propertyManager.changePropertyDocumentStatus(Long.parseLong(request.getParameter("documentId")));
			File tFileObj = fileManager.loadFileById(tPropertyDocumentObj.getFileId());
			
			if(tFileObj != null && tFileObj.getFilePath() != null && tFileObj.getFilePath().trim().length() != 0){
				FileInputStream iStreamObj = new FileInputStream(tFileObj.getFilePath()); 
				if(iStreamObj != null && iStreamObj.available() != -1){
					response.setContentType(tFileObj.getContentType());  
					response.setHeader("Content-Disposition","attachment; filename=\"" + tPropertyDocumentObj.getFileName() + "\""); 
					OutputStream fOStream = response.getOutputStream();
					byte[] buffer = new byte[iStreamObj.available()];
					iStreamObj.read(buffer);
					fOStream.write(buffer);
					iStreamObj.close();
					fOStream.flush();
					fOStream.close();
				}
			}
		}
	}
	
	
	@RequestMapping("property/loadAllProperty")
	public void loadAllProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		landLordObj = landlordManager.loadLandLordByUserLogin(loginObj);
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		if(landLordObj != null){
			List<Property> propList = propertyManager.loadPropertyByLandlord(landLordObj);
			if(propList != null && !propList.isEmpty()){
				JSONObject _jObj = null;
				for (Property _propObj : propList) {
					_jObj = new JSONObject();
						_jObj.put("property", _propObj.toJSON(true));
						Address tAddressObj = _propObj.getAddressObj();
						if(tAddressObj != null)
							_jObj.put("address", tAddressObj.toJSON(false));
							_jObj.put("viewPropertyAdminDocs",propertyManager.checkPropertyAdminUploadDocument(_propObj.getId()));

					List<File> fileList = propertyManager.loadPropertyImage(ObjectType.PROPERTY_MARKETING.id(), _propObj.getId());
					if(fileList != null){
						JSONArray _jArr = new JSONArray();
						for (File tFileObj : fileList) {
							_jArr.put(tFileObj.getFilePath());
						}
						_jObj.put("files", _jArr);
					}
					jArray.put(_jObj);
				}
				jObj.put("data", jArray);
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	
	
	
	
	@RequestMapping("property/propertyStatus")
	public void propertyStatus(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		 sessionObj = request.getSession(false);
		String propId = request.getParameter("propertyId");
		JSONObject jObj = new JSONObject();
		if(propId != null){
			propertyId = Long.valueOf(propId);
		}else{
			 propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		 List<ADPL2Page> adplList = ADPL2Page.list();
		 Double status = 0.0;
		 for (ADPL2Page adplObj : adplList) {
			 status += propertyManager.getStatus(propertyId, adplObj);
		}
		 status = Math.floor(status);
		 if(status > 100)
			 status = 100.0;
		 DecimalFormat dc = new DecimalFormat("#");
		 String st = dc.format(status);
		if(st != null){
			jObj.put("status", st);
			jObj.put("success", true);
		}
	
		JSONDelegates.setResponse(jObj, response);	
	}
	
	@RequestMapping("property/removeMarketingInfoImage")
	public void removeMarketingInfoImage(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		String fileId = request.getParameter("fileId");
		JSONObject jObj = new JSONObject();
		if(fileId != null){
			propertyManager.deleteFileById(Long.valueOf(fileId));
			jObj.put("success", true);
			JSONDelegates.setResponse(jObj, response);
		}
	}
	
	@RequestMapping("property/questionData")
	public void questionData(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		String page = request.getParameter("page");
		propertyId = (Long) sessionObj.getAttribute("propertyId");
		JSONObject jObj = new JSONObject();
		if(page != null && propertyId != null){
			Integer totalQuestion = 0;
			Integer unattempted = 0;
			Integer wrongAnswers = 0;
			ADPL2Page pageObj = ADPL2Page.get(page);
			if(pageObj != null && pageObj.id() != ADPL2Page.UNDEFINED.id() && pageObj.id() != ADPL2Page.SAVED_PROPERTY_DETAILS.id()){
				JSONObject _jObj = new JSONObject();
				List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(pageObj);
				if(questionList != null){
					for (PropertyQuestions _totalQues : questionList) {
						if(_totalQues.isConsiderable())
							totalQuestion++;
					}
					_jObj.put("totalQuestion", totalQuestion);
					Map<String, PropertyQuestions> questionMap = propertyResponseManager.getQuestionMap(questionList);
				List<PropertyResponse> responseList = propertyManager.loadResponseByPropertyId(propertyId, pageObj);
				Map<String, PropertyResponse> responseMap = propertyManager.getResponseMap(responseList);
				if(questionList != null && !questionList.isEmpty() && questionMap != null && !questionMap.isEmpty()){
					
					for (PropertyQuestions quesObj : questionList) {
						PropertyResponse tResponseObj = responseMap.get(quesObj.getFieldName());
						
						if(tResponseObj != null){
							String affirmativeAns = Boolean.toString(quesObj.isAffirmativeAns());
							String savedAnswer = tResponseObj.getResponse();
							Boolean considerable = quesObj.isConsiderable();
							if(savedAnswer != null && affirmativeAns != null){
								if(!savedAnswer.equalsIgnoreCase(affirmativeAns) && considerable)
									wrongAnswers ++;
								}
							
							if(considerable != null){
								if(savedAnswer == null && considerable)
									unattempted ++;
							}
						}else{
							Boolean considerable = quesObj.isConsiderable();
							if(considerable != null){
								if(considerable)
									unattempted ++;
							}
						}
					}
					_jObj.put("unattempted", unattempted);
					_jObj.put("wrongAnswers",wrongAnswers);
					
					}
				}
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("property/proceed")
	public ModelAndView proceed(){
		return new ModelAndView("user/landlord/property/savePropertyDetails");
	}
	
	@RequestMapping("property/redirectHMOLicence")
	public ModelAndView redirectHMOLicence(){
		return new ModelAndView("user/landlord/property/hmoLicence1");
	}
	
	@RequestMapping("property/redirectDHSCriteriaA")
	public ModelAndView redirectDHSCriteriaA(){
		return new ModelAndView("user/landlord/property/dhs-criteria-A");
	}
	
	@RequestMapping("property/redirectDHSCriteriaB")
	public ModelAndView redirectDHSCriteriaB(){
		return new ModelAndView("user/landlord/property/dhs-criteria-B");
	}
	
	@RequestMapping("property/redirectDHSCriteriaC")
	public ModelAndView redirectDHSCriteriaC(){
		return new ModelAndView("user/landlord/property/dhs-criteria-C");
	}
	
	@RequestMapping("property/redirectDHSCriteriaD")
	public ModelAndView redirectDHSCriteriaD(){
		return new ModelAndView("user/landlord/property/dhs-criteria-D");
	}
	
	@RequestMapping("property/redirectMarketingInformation")
	public ModelAndView redirectMarketingInformation(){
		return new ModelAndView("user/landlord/property/property-marketing-information");
	}
	
	}
