package com.pcs.perpetualRents.web.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.SwingUtilities;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AdminUploadDocuments;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.Country;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.EditPassword;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.FunctionalityCostMatrix;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.Lead;
import com.pcs.perpetualRents.business.bean.PDDocuments;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.PropertyDocument;
import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;
import com.pcs.perpetualRents.business.bean.PropertyQuestions;
import com.pcs.perpetualRents.business.bean.PropertyResponse;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.commonFunction.CommonFunctions;
import com.pcs.perpetualRents.dao.CityDAO;
import com.pcs.perpetualRents.dao.FileDAO;
import com.pcs.perpetualRents.enm.ADPL2Page;
import com.pcs.perpetualRents.enm.AdminDocuments;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.DocumentType;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.PropertyType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.enm.WebAction;
import com.pcs.perpetualRents.manager.AssignManager;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.LeadManager;
import com.pcs.perpetualRents.manager.MailEventManager;
import com.pcs.perpetualRents.manager.PMCManager;
import com.pcs.perpetualRents.manager.PropertyDeveloperManager;
import com.pcs.perpetualRents.manager.PropertyManager;
import com.pcs.perpetualRents.manager.PropertyResponseManager;
import com.pcs.perpetualRents.manager.UserAdminManager;
import com.pcs.perpetualRents.manager.UserLoginManager;
import com.pcs.perpetualRents.util.mail.PropertyDeveloperMailUtility;
import com.pcs.perpetualRents.util.mail.SuperAdminMailUtility;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class AdminController {

	@Autowired
	private PropertyDeveloperManager propertyDeveloperManager;
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private UserLoginManager loginManager;
	@Autowired
	private PMCManager pmcManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	@Autowired
	private UserAdminManager adminManager;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private FileDAO fileDAO;
	@Autowired
	private AssignManager assignManager;
	@Autowired
	private ConversationManager conversationManager;
	@Autowired
	private LeadManager leadManager;
	@Autowired
	private PropertyResponseManager propertyResponseManager;
	@Autowired
	private CommonManager commonManager;
	/*@Autowired
	private AdminDocumentDAO adminDocumentDAO;*/
	@Autowired
	private MailEventManager mailEventManager;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private SpringTemplateEngine templateEngine;
	@Autowired
	private JavaMailSender mailSenderObj;
	private HttpSession sessionObj;
	UserLogin loginObj;
	boolean execStatus;
	private ObjectMapper mapper = new ObjectMapper();
	
	//private static Logger logger = ApplicationSettings.getLogger(PropertyDeveloperMailUtility.class.getName()); 
	
	
	@RequestMapping("/admin")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		WebAction action = WebAction.get(request.getParameter("action"));
		String param = request.getParameter("param");
		String task = request.getParameter("task");
		boolean execStatus = false;
		JSONObject jObj = new JSONObject();	
		JSONArray jArray = new JSONArray();
		ObjectMapper mapper = new ObjectMapper();
		
		loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		
		switch (action) {
		
		case DELETE:
			if ("LANDLORD".equalsIgnoreCase(param)) {
				Long landlordId = Long.parseLong(request.getParameter("landlordId"));
				execStatus = landLordManager.deleteLandLord(landlordId, ObjectType.LANDLORD.id());
			} else if("CONTRACTOR".equalsIgnoreCase(param)){
				String contractorIdStr = request.getParameter("contractorId");
				if(contractorIdStr != null){
					Contractor tConObj = contractorManager.loadContractorById(Long.valueOf(contractorIdStr));
					if(tConObj != null){
						execStatus = contractorManager.deleteContractor(tConObj, ObjectType.CONTRACTOR.id());
					}
				}
			}
			else if("PROPERTY".equalsIgnoreCase(param)){
				Long propertyId = Long.parseLong(request.getParameter("propertyId"));
					execStatus = propertyManager.deleteProperty(propertyId);
			}else if("DISABLE-ADMIN".equalsIgnoreCase(param)){
				Long adminObjId = Long.parseLong(request.getParameter("adminId"));
				if(adminObjId != null)
					execStatus = adminManager.disableUser(adminObjId, loginObj.getId());
			}
			else if("ENABLE-ADMIN".equalsIgnoreCase(param)){
				Long adminObjId = Long.parseLong(request.getParameter("adminId"));
				if(adminObjId != null)
					execStatus = adminManager.enableUser(adminObjId, loginObj.getId());
			}
			
			jObj.put("success", execStatus);
			JSONDelegates.setResponse(jObj, response);
			break;

		case UPDATE:
			if ("LANDLORD".equalsIgnoreCase(param)) {
				LandLord landLordObj = mapper.readValue(request.getInputStream(), LandLord.class);
				execStatus = landLordManager.updateLandLord(landLordObj, loginObj.getId());
				jObj.put("success", execStatus);
			}else if ("CONTRACTOR".equalsIgnoreCase(param)){
				if(task != null){
					if("STATUS".equalsIgnoreCase(task)){
						String value = request.getParameter("value");
						String contId = request.getParameter("contractorId");
						if(value != null && contId != null){
							Contractor contObj = contractorManager.loadContractorById(Long.valueOf(contId));
							if(contObj != null){
								if("DISAPROVE".equalsIgnoreCase(value)){
									contractorManager.disapproveContractor(contObj, loginObj.getId());
									jObj.put("success", true);
								}else if("APPROVE".equalsIgnoreCase(value)){
									contractorManager.approveContractor(contObj, loginObj.getId());
									jObj.put("success", true);
								}
							}
							
						}
					}
				}else{
					Contractor contractorObj = mapper.readValue(request.getInputStream(), Contractor.class);
					execStatus = contractorManager.updateContractorDetails(contractorObj, loginObj.getId());
					jObj.put("success", execStatus);
				}
			}
			else if ("PROPERTY".equalsIgnoreCase(param)) {
				if(task != null){
					String value = request.getParameter("value");
					if(value != null){
						String propertyIdStr = request.getParameter("propertyId");
						if(propertyIdStr != null){
							Property propObj = propertyManager.loadPropertyById(Long.valueOf(propertyIdStr));
							if(propObj != null){
								if("APPROVE".equalsIgnoreCase(value)){
									propertyManager.approveProperty(propObj, loginObj.getId());
									jObj.put("success", true);
								}else if("DISAPROVE".equalsIgnoreCase(value)){
									propertyManager.disApproveProperty(propObj, loginObj.getId());
									jObj.put("success", true);
								}
							}
						}
					}
				}else{
					Property propertyObj = mapper.readValue(request.getInputStream(), Property.class);
					execStatus = propertyManager.updateProperty(propertyObj, loginObj.getId());
					jObj.put("success", execStatus);
				}
				
			}else if ("PMC".equalsIgnoreCase(param)){
				
					Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
					pmcManager.updatePMC(charityObj, loginObj.getId());
				
				
				jObj.put("success", true);
				
			}else if("PMC-STATUS".equalsIgnoreCase(param)){
				String value = request.getParameter("value");
				if(value != null){
					String pmcId = request.getParameter("pmcId");
					if(pmcId != null){
						Charity charObj = pmcManager.loadPMCById(Long.valueOf(pmcId));
						if(charObj != null){
							if("DISABLE".equalsIgnoreCase(value)){
								pmcManager.disablePMC(charObj, loginObj.getId());
								jObj.put("success", true);
							}else if("ENABLE".equalsIgnoreCase(value)){
								pmcManager.enablePMC(charObj, loginObj.getId());
								jObj.put("success", true);
							}
						}
					}else{
						jObj.put("success", false);
					}
				}
			}else if("ADMIN".equalsIgnoreCase(param)){
					Admin userObj = mapper.readValue(request.getInputStream(), Admin.class);
					if(userObj != null){
						execStatus = adminManager.updateAdmin(userObj, loginObj);
					}
						jObj.put("success", execStatus);
			}
			else if("CHANGE_PASSWORD".equalsIgnoreCase(param)){
				if("CONTRACTOR".equalsIgnoreCase(task)){
				Long id = Long.parseLong(request.getParameter("id"));
				if(id != null){
					String password = contractorManager.resetPassword(id);
					if(password != null)
					execStatus = true;
					jObj.put("password", password);
				}
				jObj.put("success", execStatus);
			}
				else if("ADMIN".equalsIgnoreCase(task)){
					Long id = Long.parseLong(request.getParameter("id"));
					if(id != null){
						String password = adminManager.resetPassword(id);
						if(password != null)
						execStatus = true;
						jObj.put("password", password);
					}
					jObj.put("success", execStatus);
				}
				else if("PMC".equalsIgnoreCase(task)){
					Long id = Long.parseLong(request.getParameter("id"));
					if(id != null){
						String password = pmcManager.resetPassword(id);
						if(password != null)
						execStatus = true;
						jObj.put("password", password);
					}
					jObj.put("success", execStatus);
				}
			}
				
				JSONDelegates.setResponse(jObj, response);
			break;

		case FETCH:
			JSONArray jArr = new JSONArray();
			if ("CONTRACTOR".equalsIgnoreCase(param)) {
				if(task != null){
					if("VIEW".equalsIgnoreCase(task)){
						String contractorIdStr = request.getParameter("contractorId");
						if(contractorIdStr != null){
							Contractor conObj = contractorManager.loadContractorById(Long.valueOf(contractorIdStr));
							if(conObj != null){
								JSONObject _jObj = new JSONObject();
									_jObj.put("conObj", conObj.toJSON(true));
								
									if (conObj.getContactDetailsObj() != null) {
										_jObj.put("detailsObj", conObj.getContactDetailsObj().toJSON(true));
									}
									List<Expertise> expList = conObj.getExpertiseList();
									if(expList != null && !expList.isEmpty()){
										String functionalityString = "";
										String cityServicedString = "";
										String fDelim = "";
										
										for(Expertise expObj : expList) {
											cityServicedString = "";
											functionalityString += fDelim + ContractorFunctionality.get(expObj.getFunctionalityId()).value();
											fDelim  = ", ";
											List<City> cityList = new ArrayList<City>();// expObj.getCities();
											if(cityList != null && !cityList.isEmpty()){
												String cDelim = "";
												for (City city : cityList) {
													cityServicedString += cDelim + city.getCity();
													cDelim = ", ";
												}
											}
										}
										for(Expertise expObj : expList) {
											expObj.setFunctionality(functionalityString);
											expObj.setCityServiced(cityServicedString);
											_jObj.put("expertise", expObj.toJSON(false));
										}
									}
									jObj.put("success", true);
									jObj.put("data", _jObj);
							}
						}
					}
				}
				
			}else if("FETCH-PROPERTY-DETAIL".equalsIgnoreCase(param)){
				String propId  = request.getParameter("propertyId"); 
					Long propertyId = Long.valueOf(propId);
					request.getSession().setAttribute("propertyId", propertyId);
				if(propertyId != null){
					Property propertyObj = propertyManager.loadPropertyById(propertyId);
					if(propertyObj != null){
						JSONObject _jObj = new JSONObject();
							_jObj.put("property", propertyObj.toJSON(true));
							
							Address addressObj = propertyObj.getAddressObj();
							if(addressObj != null){
								_jObj.put("address", addressObj.toJSON(true));
							}
						jObj.put("success", true);
						jObj.put("data", _jObj);
					}else{
						jObj.put("success", false);
					}
			}
			}else if ("ADPL2".equalsIgnoreCase(param)) {
				Long id = Long.parseLong(request.getParameter("id"));
				request.getSession().setAttribute("propertyId", id);
				String adpl2Id = request.getParameter("adpl2Id");
				
				List<PropertyResponse> propertyResponseList = propertyManager.loadResponseByPropertyId(id, ADPL2Page.get(adpl2Id));
				execStatus = (propertyResponseList != null);
				if(propertyResponseList != null && !propertyResponseList.isEmpty()){
					JSONObject jObject = new JSONObject();
					for (PropertyResponse propertyResponse : propertyResponseList) {
						JSONObject _jObj = propertyResponse.toJSON(true);
						jObject.put(propertyResponse.getFieldName(), _jObj);
					}
					jObj.put("data", jObject);
				}
			}else if("ADPL2_INFO".equalsIgnoreCase(param)){
				Long id = Long.parseLong(request.getParameter("id"));
					PropertyMarketingInformation infoObj = propertyManager.loadMarketingInfoByPropertyId(id);
					if(infoObj != null){
						JSONObject _jObj = new JSONObject();
							_jObj.put("info", infoObj.toJSON());
							
							List<File> files = infoObj.getFiles();
							if(files != null && !files.isEmpty()){
								for (File fileObj : files) {
									//String fileData = Base64.encode(fileObj.getFileData());
									//fileObj.setBase64Data(fileData);
									//fileObj.removeFile();
									jArray.put(new JSONObject().put("fileObj",fileObj.toJSON(true)));
								}
								_jObj.put("files", jArray);
							}
							jObj.put("success", true);
							jObj.put("data", infoObj.toJSON().put("files", jArray));
					}else{
						jObj.put("success", false);
					}
			}else if("DELETE-PERPETUAL-CITY".equalsIgnoreCase(param)){
				String city = request.getParameter("city");
				jObj.put("success", false);
				if(city != null){
					try{
						jObj.put("success", cityDAO.removePerpetualCity(city));
					} catch(Exception e){
						e.printStackTrace();
					}
				}
			}else if("CREATE-PERPETUAL-CITY".equalsIgnoreCase(param)){
				String city = request.getParameter("city");
				jObj.put("success", false);
				if(city != null){
					try{
						if(cityDAO.addPerpetualCity(city)){
							jObj.put("success", true);
							jObj.put("message", "City created successfully.");
						}
					} catch(DuplicateKeyException e){
						e.printStackTrace();
						jObj.put("message", "City Already Exists.");
						jObj.put("success", false);
					}
				}
			}else if("PERPETUAL-CITY".equalsIgnoreCase(param)){
				jObj.put("success", false);
				try{
					List<PerpetualCity> listCity = cityDAO.loadAllPerpetualCity();
					if(listCity != null && !listCity.isEmpty()){
						for(PerpetualCity city : listCity)
							jArr.put(city.toJSON(true));
						jObj.put("data", jArr);
						jObj.put("success", true);
					}
				} catch(DuplicateKeyException e){
					e.printStackTrace();
				}
			}else if("ADMIN".equalsIgnoreCase(param)){
				if("VIEW".equalsIgnoreCase(task)){
					String userId = request.getParameter("userId");
					if(userId != null){
						Admin adminObj = adminManager.loadAdminById(Long.valueOf(userId));
						if(adminObj != null){
							JSONObject _jObj = new JSONObject();
								_jObj.put("adminObj", adminObj.toJSON(true));
							
						Address addressObj = adminObj.getAddressObj();
						if(addressObj != null)
							_jObj.put("addressObj", addressObj.toJSON(false));
						
						UserLogin loginObj1 = adminObj.getLoginObj();
						if(loginObj1 != null)
							_jObj.put("loginObj", loginObj1.toJSON(false));
						
						ContactDetails detailsObj = adminObj.getContactDetailsObj();
							if(detailsObj != null)
								_jObj.put("detailsObj", detailsObj.toJSON(false));
										
						jObj.put("success", true);
						jObj.put("data", _jObj);
						}
					}
					
				}else if("DISABLE".equalsIgnoreCase(task)){
					
				}else if("VIEW-CURRENT".equalsIgnoreCase(task)){
					JSONObject _jObj = new JSONObject();
					UserLogin _loginObj = (UserLogin) request.getSession().getAttribute("loginObj");
					if(_loginObj != null){
					_jObj.put("loginObj", _loginObj.toJSON(true));
					jObj.put("success", true);
					jObj.put("data", _jObj);
					}
					else{
						jObj.put("success", false);
					}
				}
				else if("ADMIN-TYPE".equalsIgnoreCase(task)){
					if(loginObj.getUserTypeId()==1)
						jObj.put("show", true);
					else if(loginObj.getUserTypeId()==2){
						jObj.put("show", false);
					}
					jObj.put("success", true);
				}
				
			}else if("SETTINGS".equalsIgnoreCase(param)){
				Admin adminObj = adminManager.loadUserByLoginObj(loginObj);
				JSONObject _jObj = new JSONObject();
				jObj.put("success", false);
				if(adminObj != null){
					_jObj.put("adminObj", adminObj);
					if(adminObj != null)
						_jObj.put("adminObj", adminObj.toJSON(true));
					if(loginObj != null)
						_jObj.put("loginObj", loginObj.toJSON(true));
					if(adminObj.getAddressObj() != null)
						_jObj.put("addressObj", adminObj.getAddressObj().toJSON(true));
					if(adminObj.getContactDetailsObj() != null)
						_jObj.put("detailsObj", adminObj.getContactDetailsObj().toJSON(true));
					
					jObj.put("data", _jObj);
					jObj.put("success", true);
				}
			}
			
			JSONDelegates.setResponse(jObj, response);
			
			break;
		case LIST:
			if("ADMIN".equalsIgnoreCase(param)){
				if(task != null){
					if("VIEW-LIST".equalsIgnoreCase(task)){
						boolean status = false;
						List<Admin> adminList = adminManager.loadUsersByAdminId(loginObj.getId());
						if(adminList != null && !adminList.isEmpty()){
							status = true;
							for(Admin admin : adminList){
									JSONObject _jObj = new JSONObject();
									if(admin.getLoginObj() != null)
									_jObj = admin.toJSON(true);
									if(admin.getLoginObj() != null)
									_jObj.put("loginObj", admin.getLoginObj().toJSON(true));
									if(admin.getAddressObj() != null)
									_jObj.put("addressObj", admin.getAddressObj().toJSON(true));
									if(admin.getContactDetailsObj() != null)
									_jObj.put("detailsObj", admin.getContactDetailsObj().toJSON(true));
									
									jArray.put(_jObj);
								}
							jObj.put("success", status);
							jObj.put("data", jArray);
							}else{
								jObj.put("success", status);
								jObj.put("data", jArray);
							}
					}
				}
				
			
			
			}else if("PROPERTY".equalsIgnoreCase(param)){
				List<Property> propertyList = propertyManager.loadAll(null, null, loginObj);
				if(propertyList != null && !propertyList.isEmpty()){
					for (Property property : propertyList){
						JSONObject _jObj;
							List<ADPL2Page> adplList = ADPL2Page.list();
							 Double status = 0.0;
							 for (ADPL2Page adplObj : adplList) {
								 status += propertyManager.getStatus(property.getId(), adplObj);
							}
							 status = Math.floor(status);
							 if(status > 100)
								 status = 100.0;
							 
							 DecimalFormat dc = new DecimalFormat("#");
							 String st = dc.format(status);
							 property.setStatusPercentage(Integer.parseInt(st));
							 _jObj = property.toJSON(true);
							 
						if (property.getAddressObj() != null) {
							_jObj.put("addressObj", property.getAddressObj().toJSON(true));
						}
						jArray.put(_jObj);
					}
					jObj.put("success", true);
					jObj.put("data", jArray);
				}else{
					jObj.put("success", false);
					jObj.put("data", jArray);
				}
			}else if("CONTRACTOR".equalsIgnoreCase(param)){
				List<Contractor> contractorList = contractorManager.loadAll(null, null, loginObj);
				if(contractorList != null && !contractorList.isEmpty()){
					for (Contractor contractor : contractorList) {
						JSONObject _jObj = contractor.toJSON(true);
						
						if (contractor.getLoginObj() != null) {
							_jObj.put("loginObj", contractor.getLoginObj().toJSON(true));
						}
						if (contractor.getExpertiseObj() != null) {
							_jObj.put("expertiseObj", contractor.getExpertiseObj().toJSON(false));
						}
						jArray.put(_jObj);
					}
					jObj.put("data", jArray);
					jObj.put("success", true);
				}else{
					jObj.put("data", jArray);
					jObj.put("success", false);
				}
				
			}else if("PMC".equalsIgnoreCase(param)){
				if(task != null){
					if("CITY".equalsIgnoreCase(task)){
						List<PerpetualCity> cityList = pmcManager.loadAllCities();
						if(cityList != null && !cityList.isEmpty()){
							for (PerpetualCity _cityObj : cityList) {
								jArray.put(_cityObj.toJSON(true));
							}
						}
						jObj.put("success", true);
						jObj.put("data", jArray);
					}
				}else{
					List<Charity> pmcList = pmcManager.loadAllPMC(null, null , loginObj);
					if(pmcList != null && !pmcList.isEmpty()){
						JSONObject _jObj  = null;
						for (Charity charityObj : pmcList) {
							_jObj = new JSONObject();
								_jObj.put("pmc", charityObj.toJSON(true));
							Address addressObj = charityObj.getAddressObj();
								if(addressObj != null)
									_jObj.put("addressObj", addressObj.toJSON(false));
							
							ContactDetails detailsObj = charityObj.getContactDetailsObj();
							if(detailsObj != null)
								_jObj.put("detailsObj", detailsObj.toJSON(false));
							
							UserLogin _loginObj = charityObj.getLoginObj();
							if(_loginObj != null)
								_jObj.put("loginObj", _loginObj.toJSON(false));
							jArray.put(_jObj);
						}
						jObj.put("success", execStatus);
						jObj.put("data", jArray);
					}else{
						jObj.put("data", jArray);
						jObj.put("success", false);
					}
				}
			}else if("LANDLORD".equalsIgnoreCase(param)){
				
				List<LandLord> landLordList = landLordManager.loadAllLandLord(null, null, loginObj);
				if(landLordList != null && !landLordList.isEmpty()){
					for (LandLord landLord : landLordList) {
						JSONObject _jObj = landLord.toJSON(true);
						if (landLord.getAddressObj() != null)
							_jObj.put("addressObj", landLord.getAddressObj().toJSON(true));
						if (landLord.getLoginObj() != null)
							_jObj.put("loginObj", landLord.getLoginObj().toJSON(true));
						jArray.put(_jObj);
					}
					jObj.put("data", jArray);
					jObj.put("success", true);
				}else{
					jObj.put("data", jArray);
					jObj.put("success", false);
				}
			}
			JSONDelegates.setResponse(jObj, response);
			break;
		case ADD:
			if ("LANDLORD".equalsIgnoreCase(param)) {
				LandLord landLordObj = mapper.readValue(request.getInputStream(), LandLord.class);
				Country country = new Country();
				country.setCountryName("India");
				country.setCreatedUserId(1L);
				landLordObj.setCountryObj(country);
					execStatus = landLordManager.createLandLord(landLordObj, loginObj.getId());
			}else if ("CONTRACTOR".equalsIgnoreCase(param)) {
				Contractor contractorObj = mapper.readValue(request.getInputStream(), Contractor.class);
					execStatus = contractorManager.createContractor(contractorObj, loginObj.getId());
			}else if("PMC".equalsIgnoreCase(param)){
				Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
				System.out.println("Login Id " + loginObj.getId());
				UserLogin _loginObj = charityObj.getLoginObj();
				if(_loginObj != null){
					_loginObj.setUserTypeId(5);
				}
					execStatus = pmcManager.createPMC(charityObj, loginObj.getId());
					if(execStatus){
						jObj.put("message", "Successfully created");
						jObj.put("success", true);
					}else{
						jObj.put("message", "User already exists. Please try with different username");
						jObj.put("success", false);
					}
			}
			else if("PMC_USERS".equalsIgnoreCase(param)){
				Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
				UserLogin _loginObj = charityObj.getLoginObj();
				if(_loginObj != null){
					_loginObj.setUserTypeId(6);
				}
					execStatus = pmcManager.createPMC(charityObj, loginObj.getId());
					if(execStatus){
						jObj.put("message", "Successfully created");
						jObj.put("success", true);
					}else{
						jObj.put("message", "User already exists. Please try with different username");
						jObj.put("success", false);
					}
			}else if("FILE_UPLOAD".equalsIgnoreCase(param)){
				try{
				MultipartHttpServletRequest multiPartRequest  = (MultipartHttpServletRequest) request;
				Iterator<String> fileIterator = multiPartRequest.getFileNames();
				long file = Long.parseLong(request.getParameter("file"));
				while(fileIterator.hasNext()){
					MultipartFile partObj = multiPartRequest.getFile(fileIterator.next());
					File fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), ObjectType.ADPL.id(), file, partObj.getBytes(), partObj.getContentType(), DocumentType.DOCUMENT.id());
					//System.out.println(fileObj.getFileName());
					//System.out.println("file DAO : " + fileDAO);
					Long fileId = fileDAO.saveFile(fileObj, loginObj.getId());
					//System.out.println("file id is : " + fileId);
					File tFileObj = fileDAO.loadFileById(fileId);
					//System.out.println("File object : " + tFileObj);
					execStatus = false;
					if(tFileObj != null) {
						jObj.put("data", tFileObj.toJSON(true));
						execStatus = true;
					}
					//System.out.println(fileId);
					
				}
				}catch (Exception e) {
					e.printStackTrace();
					execStatus = false;
				}
			}
				jObj.put("success", execStatus);
				JSONDelegates.setResponse(jObj, response);
			break;

		case LANDLORD:
			return new ModelAndView("admin/landlord/landlord");
		case CONTRACTOR:
			return new ModelAndView("admin/contractor/contractor");
		case PROPERTY:
			return new ModelAndView("admin/property/property");
		case PMC:
			return new ModelAndView("admin/pmc/pmc");
		case SETTINGS:
			if("settings".equalsIgnoreCase(param)){
				return new ModelAndView("admin/settings/settings");
			}else if("profile".equalsIgnoreCase(param)){
				return new ModelAndView("admin/profile/settings");	
			}
		case USERS:
			return new ModelAndView("admin/sub-admin/users");
			
		case VIEW:
			
			if ("LANDLORD".equalsIgnoreCase(param)) {
				return new ModelAndView("admin/landlord/landLordDetails");
			}else if("CONTRACTOR".equalsIgnoreCase(param)){
				return new ModelAndView("admin/contractor/contractorDetails");
			}else if("PROPERTY-DETAILS".equalsIgnoreCase(param)){
				return new ModelAndView("admin/property/propertyDetails");
			}else if("ADPL2".equalsIgnoreCase(param)){
				return new ModelAndView("admin/property/adpl2Form");
			}else if("PMC".equalsIgnoreCase(param)){
				
			}else if("ADMIN".equalsIgnoreCase(param)){
				return new ModelAndView("admin/sub-admin/usersDetails");
			}
		default:
			return new ModelAndView("admin/property/property");
			
		}
		return null;
	}
	
	@RequestMapping("/admin/adminType")
	public void adminType(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();	
			if(loginObj.getUserTypeId()==1)
				jObj.put("show", true);
			else if(loginObj.getUserTypeId()==2){
				jObj.put("show", false);
			}
			jObj.put("success", true);
			JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/enableAdmin")
	public void enableAdmin(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		boolean execStatus = false;
		JSONObject jObj = new JSONObject();	
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Long adminObjId = Long.parseLong(request.getParameter("adminId"));
		if(adminObjId != null)
			execStatus = adminManager.enableUser(adminObjId, loginObj.getId());
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/disableAdmin")
	public void disableAdmin(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		boolean execStatus = false;
		JSONObject jObj = new JSONObject();	
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		if(CommonFunctions.isLong(request.getParameter("adminId")))
			execStatus = adminManager.disableUser(Long.parseLong(request.getParameter("adminId")), loginObj.getId());
		
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/adminUsers")
	public ModelAndView adminUsers(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		return new ModelAndView("admin/sub-admin/users");
	}
	
	@RequestMapping("/admin/allLeads")
	public ModelAndView allLeads(HttpServletRequest request, HttpServletResponse response) throws JSONException{
	return new ModelAndView("admin/anonymous/anonymous");
	}
	
	@RequestMapping("/admin/viewLeads")
	public ModelAndView viewLeads(HttpServletRequest request, HttpServletResponse response) throws JSONException{
	return new ModelAndView("admin/anonymous/anonymousDetails");
	}
	
	@RequestMapping("/admin/uploadNewFile")
	public ModelAndView uploadAttachmentFiles(HttpServletRequest request, HttpServletResponse response)throws JSONException{
		return new ModelAndView("/admin/settings/newAttachmentFile");
	}
	
	@RequestMapping("/admin/updateProperty")
	public void updateProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		JSONObject jObj = new JSONObject();	
		ObjectMapper mapper = new ObjectMapper();
		boolean execStatus = false;
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Property propertyObj = mapper.readValue(request.getInputStream(), Property.class);
		execStatus = propertyManager.updateProperty(propertyObj, loginObj.getId());
		/*if(execStatus){
			System.out.println("FIRE MAIL============================================================================");
			
			new SuperAdminMailUtility(propertyObj.getP, propertyObj, applicationSettings, mailSenderObj, MailEventType.PROFILE_EDIT, eventManager, templateEngine, commonManager, loginObj);
		}*/
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewLeadDetails")
	public void viewLeadDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		Lead tLeadObj = null;
		if(CommonFunctions.isLong(request.getParameter("leadId")))
			tLeadObj = leadManager.loadLeadById(Long.parseLong(request.getParameter("leadId")));
		
		jObj.put("success", false);
		if(tLeadObj != null){
			jObj.put("success", true);
			jObj.put("data", tLeadObj.toJSON(true));
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listLeads")
	public void listLeads(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONArray jArr = new JSONArray();
		JSONObject jObj = new JSONObject();	
		List<Lead> listLead = leadManager.loadAllLead(0, 0);
		
		jObj.put("success", false);
		jObj.put("data", jArr);
		
		if(listLead != null){
			for(Lead leadObj : listLead)
				jArr.put(leadObj.toJSON(true));
			jObj.put("success", true);
			jObj.put("data", jArr);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/displayAdpl2")
	public void displayAdpl2(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		Long id = Long.parseLong(request.getParameter("id"));
		JSONObject jObj = new JSONObject();
		request.getSession().setAttribute("propertyId", id);
		String adpl2Id = request.getParameter("adpl2Id");
		boolean execStatus = false;
		List<PropertyResponse> propertyResponseList = propertyManager.loadResponseByPropertyId(id, ADPL2Page.get(adpl2Id));
		execStatus = (propertyResponseList != null);
		if(propertyResponseList != null && !propertyResponseList.isEmpty()){
			JSONObject jObject = new JSONObject();
			for (PropertyResponse propertyResponse : propertyResponseList) {
				JSONObject _jObj = propertyResponse.toJSON(true);
				jObject.put(propertyResponse.getFieldName(), _jObj);
			}
			
			jObj.put("data", jObject);
			jObj.put("success", execStatus);
		}else{
			jObj.put("success", false);
		}
		List<PropertyQuestions> questionList = propertyResponseManager.loadQuestionByADPL(ADPL2Page.get(adpl2Id));
		JSONObject tJObj = new JSONObject();
		JSONArray tjArray = new JSONArray();
		if(questionList != null && !questionList.isEmpty()){
			for (PropertyQuestions _propQuesObj : questionList) {
					tJObj.put(_propQuesObj.getFieldName(), _propQuesObj.toJSON());
					tjArray.put(_propQuesObj.getFieldName());
			}
		}
	    jObj.put("fieldArr", tjArray);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updatePMC")
	public void updatePMC(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();	
		ObjectMapper mapper = new ObjectMapper();
		Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
		pmcManager.updatePMC(charityObj, loginObj.getId());
		jObj.put("success", true);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewPMC")
	public ModelAndView viewPMC(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pmc/pmcDetails");
	}
	
	@RequestMapping("/admin/viewcontractor")
	public ModelAndView viewcontractor(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/contractor/contractorDetails");
	}
	
	@RequestMapping("/admin/viewLandlord")
	public ModelAndView viewLandlord(HttpServletRequest request, HttpServletResponse response){
	return new ModelAndView("admin/landlord/landLordDetails");
	}
	
	@RequestMapping("/admin/landlordTable")
	public ModelAndView landlordTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/landlord/landlord");
	}
	
	@RequestMapping("/admin/listAdmin")
	public void listAdmin(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONArray jArray = new JSONArray();
		JSONObject jObj = new JSONObject();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		List<Admin> adminList = adminManager.loadUsersByAdminId(loginObj.getId());
		
		jObj.put("success", false);
		jObj.put("data", jArray);
		
		if(adminList != null && !adminList.isEmpty()){
			for(Admin admin : adminList){
				JSONObject _jObj = new JSONObject();
				if(admin.getLoginObj() != null)
					_jObj = admin.toJSON(true);
				if(admin.getLoginObj() != null)
					_jObj.put("loginObj", admin.getLoginObj().toJSON(true));
				if(admin.getAddressObj() != null)
					_jObj.put("addressObj", admin.getAddressObj().toJSON(true));
				if(admin.getContactDetailsObj() != null)
					_jObj.put("detailsObj", admin.getContactDetailsObj().toJSON(true));
				jArray.put(_jObj);
			}
			jObj.put("success", true);
			jObj.put("data", jArray);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewPMCDetails")
	public void viewPMCDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		Charity tCharityObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		
		jObj.put("success", false);
		jObj.put("data", new JSONObject());
		
		if(tCharityObj != null){
			JSONObject _jObj = new JSONObject();
			if(loginObj.getUserTypeId() == UserType.SUPER_ADMIN.id())
				_jObj.put("flag", true);
			else
				_jObj.put("flag", false);
			
			_jObj.put("pmc", tCharityObj.toJSON(true));
			
			if(tCharityObj.getLoginObj() != null)
				_jObj.put("loginObj", tCharityObj.getLoginObj().toJSON(false));
			if(tCharityObj.getAddressObj() != null)
				_jObj.put("addressObj", tCharityObj.getAddressObj().toJSON(false));
			if(tCharityObj.getContactDetailsObj() != null)
				_jObj.put("detailsObj", tCharityObj.getContactDetailsObj().toJSON(false));
					
			jObj.put("success", true);
			jObj.put("data", _jObj);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/approveProperty")
	public void approveProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		Property tPropertyObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPropertyObj = propertyManager.loadPropertyById(Long.parseLong(request.getParameter("propertyId")));
		jObj.put("success", false);
		
		if(tPropertyObj != null){
			propertyManager.approveProperty(tPropertyObj, loginObj.getId());
			jObj.put("success", true);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/adminCityList")
	public void adminCityList(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		List<PerpetualCity> cityList = adminManager.loadAllCities();
		JSONArray jArray = new JSONArray();
		JSONObject jObj = new JSONObject();
		if(cityList != null && !cityList.isEmpty())
			for (PerpetualCity _cityObj : cityList) 
				jArray.put(_cityObj.toJSON(true));
			
		
		jObj.put("success", true);
		jObj.put("data", jArray);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/disapproveProperty")
	public void disapproveProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		Property tPropertyObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPropertyObj = propertyManager.loadPropertyById(Long.parseLong(request.getParameter("propertyId")));
		jObj.put("success", false);
		
		if(tPropertyObj != null){
			propertyManager.disApproveProperty(tPropertyObj, loginObj.getId());
			jObj.put("success", true);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewContractorDetails")
	public void viewContractorDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		String contractorIdStr = request.getParameter("contractorId");
		JSONObject jObj = new JSONObject();
		if(contractorIdStr != null){
			Contractor conObj = contractorManager.loadContractorById(Long.valueOf(contractorIdStr));
			if(conObj != null){
				JSONObject _jObj = new JSONObject();
				_jObj.put("conObj", conObj.toJSON(true));
			
				if (conObj.getLoginObj() != null)
					_jObj.put("loginObj", conObj.getLoginObj().toJSON(true));
				
				if (conObj.getContactDetailsObj() != null)
					_jObj.put("detailsObj", conObj.getContactDetailsObj().toJSON(true));
				
				List<City> cityList = conObj.getCityList();
				String cityServicedString = "";
				String cityServicedIdString = "";
				String cDelim = "";
				if(cityList != null){
					for (City city : cityList) {
						cityServicedString += cDelim + city.getCity();
						cityServicedIdString += cDelim + city.getCityId();
						cDelim = ", ";
					}
				}
				
				List<Expertise> expList = conObj.getExpertiseList();
				if(expList != null && !expList.isEmpty()){
					String functionalityString = "";
					String functionalityIdStr = "";
					String fDelim = "";
					
					for(Expertise expObj : expList) {
						functionalityString += fDelim + ContractorFunctionality.get(expObj.getFunctionalityId()).value();
						functionalityIdStr += fDelim + expObj.getFunctionalityId();
						fDelim  = ", ";
					}
					for(Expertise expObj : expList) {
						expObj.setFunctionality(functionalityString);
						expObj.setFunctionalityIdStr(functionalityIdStr);
						//expObj.setCityServiced(cityServicedString);
						_jObj.put("expertise", expObj.toJSON(false));
					}
				}
				_jObj.put("cityServicedStr", cityServicedString);
				_jObj.put("cityServicedIdStr", cityServicedIdString);
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}
			JSONDelegates.setResponse(jObj, response);
		}
	}
	
	@RequestMapping("/admin/addContractor")
	public void addContractor(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		ObjectMapper mapper = new ObjectMapper();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Contractor tContractorObj = mapper.readValue(request.getInputStream(), Contractor.class);
		JSONObject jObj = new JSONObject();
		jObj.put("success", contractorManager.createContractor(tContractorObj, loginObj.getId()));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updateContractor")
	public void updateContractor(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		ObjectMapper mapper = new ObjectMapper();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Contractor tContractorObj = mapper.readValue(request.getInputStream(), Contractor.class);
		JSONObject jObj = new JSONObject();
		jObj.put("success", contractorManager.updateContractorDetails(tContractorObj, loginObj.getId()));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updateContractorFunctionality")
	public void updateContractorFunctionality(HttpServletRequest request, HttpServletResponse response) throws JSONException{ // change  ---> contractorManager ---->managerImpl ----> ExpertiesDaoImpl
		JSONObject jObj = new JSONObject();
		Map<String, String[]> dataMap = request.getParameterMap();
		String functionalityStr[] = dataMap.get("functionalityStr[]");
		Long contractorId = Long.parseLong(request.getParameter("contractorId"));
		List<Expertise> expertiesList = new ArrayList<Expertise>();
		
		if(functionalityStr != null && contractorId != null){
			for (String functionality : functionalityStr) {
				Expertise tExpertiseObj = new Expertise();
					tExpertiseObj.setContractorId(contractorId);
					tExpertiseObj.setFunctionalityId(Short.valueOf(functionality));
				expertiesList.add(tExpertiseObj);
			}
		}
		
		jObj.put("success", contractorManager.updateContractorFunctionality(expertiesList , contractorId ));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updateCities")
	public void updateCities(HttpServletRequest request, HttpServletResponse response) throws JSONException{ // change  ---> contractorManager ---->managerImpl ----> ExpertiesDaoImpl
		JSONObject jObj = new JSONObject();
		Map<String, String[]> dataMap = request.getParameterMap();
		String cityIdArr[] = dataMap.get("citiesStr[]");
		String extraParam = request.getParameter("extraParam");
		Long id = Long.parseLong(request.getParameter("id"));
		loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		
		if(cityIdArr != null && extraParam != null && id != null){
			if("Contractor".equalsIgnoreCase(extraParam))
				execStatus = contractorManager.updateContractorCities(cityIdArr , id );
			else if("Admin".equalsIgnoreCase(extraParam))
				execStatus = adminManager.updateAdminCities(cityIdArr, id);
			else if("PMC".equalsIgnoreCase(extraParam))
				execStatus = pmcManager.updatePMCCities(cityIdArr, id , loginObj);
			
			jObj.put("success", execStatus);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listContractor")
	public void listContractor(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		List<Contractor> contractorList = contractorManager.loadAll(null, null, loginObj);
		
		jObj.put("data", jArray);
		jObj.put("success", false);
		
		if(contractorList != null && !contractorList.isEmpty()){
			for (Contractor contractor : contractorList) {
				JSONObject _jObj = contractor.toJSON(true);
				if (contractor.getLoginObj() != null)
					_jObj.put("loginObj", contractor.getLoginObj().toJSON(true));
				
				if (contractor.getExpertiseObj() != null) 
					_jObj.put("expertiseObj", contractor.getExpertiseObj().toJSON(false));
				
				jArray.put(_jObj);
			}
			jObj.put("data", jArray);
			jObj.put("success", true);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewPropertyDetails")
	public void viewPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		
		JSONObject jObj = new JSONObject();
		JSONObject _jObj = new JSONObject();
		
		Property tPropertyObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPropertyObj = propertyManager.loadPropertyById(Long.parseLong(request.getParameter("propertyId")));
		
		if(tPropertyObj == null){
			_jObj.put("propObj", new JSONObject());
			_jObj.put("landlord", new JSONObject());
			_jObj.put("addressObj", new JSONObject());
			_jObj.put("convObj", new JSONObject());
			_jObj.put("data", _jObj);
			jObj.put("success", false);
			
			JSONDelegates.setResponse(jObj, response);
			return;
		}
		
		
		
		UserLogin tUserLoginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		List<ADPL2Page> adplList = ADPL2Page.list();
		Double status = 0.0;
		for (ADPL2Page adplObj : adplList) 
			 status += propertyManager.getStatus(tPropertyObj.getId(), adplObj);
		
		status = Math.floor(status);
		if(status > 100)
			status = 100.0;
		
		DecimalFormat dc = new DecimalFormat("#");
		String st = dc.format(status);
			tPropertyObj.setStatusPercentage(Integer.parseInt(st));
		
			_jObj.put("propObj", tPropertyObj.toJSON(true));		
			
			
		if(tPropertyObj.getAddressObj() != null)
			_jObj.put("addressObj", tPropertyObj.getAddressObj().toJSON(true));
		
		UserLogin tCreatorUserLoginObj = null;
		if(tPropertyObj.getCreatedBy() != null)
			tCreatorUserLoginObj = loginManager.findLoginUserByName(tPropertyObj.getCreatedBy());
		
		if(tCreatorUserLoginObj != null){
			LandLord tLandLordObj = landLordManager.loadLandLordByUserLogin(tCreatorUserLoginObj);
			if(tLandLordObj != null){
				if(tLandLordObj.getAddressObj() != null)
					_jObj.put("address", tLandLordObj.getAddressObj().toJSON(true));
				_jObj.put("landlord", tLandLordObj.toJSON(true));
			}
		}
		
		Charity tCharityObj = null;
		if(tUserLoginObj.getCreatedBy() != null)
			tCharityObj = pmcManager.loadCharityByUserLogin(tUserLoginObj);
		if(tCharityObj != null){
			List<Conversation> conversationList = conversationManager.loadConversationByActorOne(tCharityObj.getId(), ObjectType.PMC.id(), tPropertyObj.getId(), PropertyType.CURRENT_DEVELOPMENT.id());
			if(tUserLoginObj.getUserTypeId() == UserType.SUPER_PMC.id())
				conversationList = conversationManager.loadConversationByActorOne(tCharityObj.getId(), ObjectType.SUPER_PMC.id(), tPropertyObj.getId(), PropertyType.CURRENT_DEVELOPMENT.id());
			
			if(conversationList != null && conversationList.size() != 0)
				_jObj.put("convObj", conversationList.get(0).toJSON(true));
		}
	
	
		jObj.put("data", _jObj);
		jObj.put("success", true);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updateUsers")
	public void updateUsers(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		boolean execStatus = false;
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Admin tAdminObj = mapper.readValue(request.getInputStream(), Admin.class);
		JSONObject jObj = new JSONObject();
		
		if(tAdminObj != null)
			execStatus = adminManager.updateAdminUser(tAdminObj, loginObj);
		
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/addUsers")
	public void addUsers(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		Admin userObj = mapper.readValue(request.getInputStream(), Admin.class);
		boolean execStatus = false;
		ContactDetails detailsObj = userObj.getContactDetailsObj();
		
		jObj.put("message", "Please enter your contact details.");
		jObj.put("success", false);
		if(detailsObj != null){
			String emailId = detailsObj.getEmailId();
			if(emailId != null && emailId.length() > 0){
				jObj.put("message", "This Email Id is already registered with us. Please try with different one.");
				jObj.put("success", false);
				execStatus = commonManager.validateEmailId(emailId);
				if(execStatus){
					jObj.put("message", "User already exists. Please try with different username");
					jObj.put("success", false);
					execStatus = adminManager.createUserAdmin(userObj, loginObj.getId());
					if(execStatus){
						jObj.put("message", "Successfully created");
						jObj.put("success", true);
					}
				}
			}
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listLandlord")
	public void listLandlord(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();	
		JSONArray jArray = new JSONArray();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		List<LandLord> landLordList = landLordManager.loadAllLandLord(null, null, loginObj);
		if(landLordList != null && !landLordList.isEmpty()){
			for (LandLord landLord : landLordList) {
				JSONObject _jObj = landLord.toJSON(true);
				if (landLord.getAddressObj() != null)
					_jObj.put("addressObj", landLord.getAddressObj().toJSON(true));
				if (landLord.getLoginObj() != null)
					_jObj.put("loginObj", landLord.getLoginObj().toJSON(true));
				
				List<Property> propList = propertyManager.loadPropertyByLandlord(landLord);
				if(propList != null){
					
				}
				
				jArray.put(_jObj);
			}
			jObj.put("data", jArray);
			jObj.put("success", true);
		}else{
			jObj.put("data", jArray);
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/changeAdminPassword")
	public void changeAdminPassword(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		Long id = Long.parseLong(request.getParameter("id"));
		boolean execStatus = false;
		JSONObject jObj = new JSONObject();
		if(id != null){
			String password = adminManager.resetPassword(id);
			if(password != null)
				execStatus = true;
			jObj.put("password", password);
		}
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/deleteContractor")
	public void deleteContractor(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		boolean execStatus = false;
		if(CommonFunctions.isLong(request.getParameter("contractorId"))){
			Contractor tContractorObj = contractorManager.loadContractorById(Long.parseLong(request.getParameter("contractorId")));
			if(tContractorObj != null)
				execStatus = contractorManager.deleteContractor(tContractorObj, ObjectType.CONTRACTOR.id());
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}

	@RequestMapping("/admin/deleteLandlord")
	public void deleteLandlord(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		jObj.put("success", false);
		
		if(CommonFunctions.isLong(request.getParameter("landlordId")))
			jObj.put("success", landLordManager.deleteLandLord(Long.parseLong(request.getParameter("landlordId")), ObjectType.LANDLORD.id()));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/disapproveContractor")
	public void disapproveContractor(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		String contId = request.getParameter("contractorId");
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		
		jObj.put("success", false);
		Contractor tContractorObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("contractorId")))
			tContractorObj = contractorManager.loadContractorById(Long.valueOf(contId));
		
		if(tContractorObj != null){
			contractorManager.disapproveContractor(tContractorObj, loginObj.getId());
			jObj.put("success", true);
		}
			
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/approveContractor")
	public void approveContractor(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		String contId = request.getParameter("contractorId");
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		
		jObj.put("success", false);
		Contractor tContractorObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("contractorId")))
			tContractorObj = contractorManager.loadContractorById(Long.valueOf(contId));
		
		if(tContractorObj != null){
			contractorManager.approveContractor(tContractorObj, loginObj.getId());
			jObj.put("success", true);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/updateLandlord")
	public void updateLandlord(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		LandLord landLordObj = mapper.readValue(request.getInputStream(), LandLord.class);
		jObj.put("success", landLordManager.updateLandLord(landLordObj, loginObj.getId()));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/deletePerpetualCity")
	public void deletePerpetualCity(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		JSONObject jObj = new JSONObject();
		
		jObj.put("success", false);
		
		if(request.getParameter("city") != null){
			try{
				jObj.put("success", cityDAO.removePerpetualCity(request.getParameter("city")));
			} catch(Exception e){ e.printStackTrace(); }
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/createPerpetualCity")
	public void createPerpetualCity(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		JSONObject jObj = new JSONObject();
		
		jObj.put("success", false);
		if(request.getParameter("city") != null){
			try{
				jObj.put("success", cityDAO.addPerpetualCity(request.getParameter("city")));
			} catch(DuplicateKeyException e){
				e.printStackTrace();
				jObj.put("message", "City Already Exists.");
				jObj.put("success", false);
			}
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/addLandlord")
	public void addLandlord(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		LandLord landLordObj = mapper.readValue(request.getInputStream(), LandLord.class);
		Country tCountryObj = new Country();
			tCountryObj.setCountryName("United Kingdom");
			tCountryObj.setCreatedUserId(1L);
		landLordObj.setCountryObj(tCountryObj);
		jObj.put("success", landLordManager.createLandLord(landLordObj, loginObj.getId()));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/changeContractorPassword")
	public void changeContractorPassword(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		Long id = Long.parseLong(request.getParameter("id"));
		JSONObject jObj = new JSONObject();
		jObj.put("success", false);
		if(id != null){
			String password =  contractorManager.resetPassword(id);
			if(password != null && !password.isEmpty()){
				jObj.put("success", true);
				jObj.put("password", password);
			}
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listPMC")
	public void listPMC(HttpServletRequest request, HttpServletResponse response)throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();	
		JSONArray jArray = new JSONArray();
		List<Charity> pmcList = pmcManager.loadAllPMC(null, null , loginObj);
		if(pmcList != null && !pmcList.isEmpty()){
			JSONObject _jObj  = null;
			for (Charity charityObj : pmcList) {
				_jObj = new JSONObject();
				_jObj.put("pmc", charityObj.toJSON(true));
				Address addressObj = charityObj.getAddressObj();
				if(addressObj != null)
					_jObj.put("addressObj", addressObj.toJSON(false));
			
				ContactDetails detailsObj = charityObj.getContactDetailsObj();
				if(detailsObj != null)
					_jObj.put("detailsObj", detailsObj.toJSON(false));
			
				UserLogin _loginObj = charityObj.getLoginObj();
				if(_loginObj != null)
					_jObj.put("loginObj", _loginObj.toJSON(false));
				jArray.put(_jObj);
			}
			jObj.put("success", true);
			jObj.put("data", jArray);
		}else{
			jObj.put("data", jArray);
			jObj.put("success", false);
	}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/viewPMCUsers")
	public void viewPMCUsers(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		Charity tCharityObj = null;
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		
		if(tCharityObj == null){
			jObj.put("success", false);
			jObj.put("data", jArray);
			jObj.put("message", "It has no users till now.");
			
			JSONDelegates.setResponse(jObj, response);
		}

		List<Charity> charityList = pmcManager.loadAllPMC(null, null, tCharityObj.getLoginObj());
		if(charityList != null && charityList.size() != 0){
			for(Charity tObj : charityList){
				if(tObj == null)
					continue;
				JSONObject _jObj  = new JSONObject();
					_jObj.put("pmc", tObj.toJSON(true));
				if(tObj.getContactDetailsObj() != null)
					_jObj.put("detailsObj", tObj.getContactDetailsObj().toJSON(false));
				if(tObj.getLoginObj() != null)
					_jObj.put("loginObj", tObj.getLoginObj().toJSON(false));
				jArray.put(_jObj);
			}
		}
		
		jObj.put("success", true);
		jObj.put("data", jArray);
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listPMCCities")
	public void listPMCCities(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		List<PerpetualCity> cityList = pmcManager.loadAllCities();
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		if(cityList != null && !cityList.isEmpty())
			for (PerpetualCity _cityObj : cityList)
				jArray.put(_cityObj.toJSON(true));
			
		jObj.put("success", true);
		jObj.put("data", jArray);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listPMCCoveredCities")
	public void listPMCCoveredCities(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		Charity tCharityObj = null;
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		
		if(tCharityObj != null)
			if(tCharityObj.getCityList() != null)
				for (City _cityObj : tCharityObj.getCityList()) 
					jArray.put(_cityObj.toJSON(true));
				
			
		jObj.put("success", true);
		jObj.put("data", jArray);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/userNameAllowed")
	public void userNameAllowed(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		String name = request.getParameter("name"); 
		JSONObject jObj = new JSONObject();
		boolean status = loginManager.validateUser(name);
		jObj.put("success", status);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/disablePMC")
	public void disablePMC(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		
		jObj.put("success", false);
		Charity tCharityObj = null;
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		if(tCharityObj != null){
			pmcManager.disablePMC(tCharityObj, loginObj.getId());
			jObj.put("success", true);
		}
			
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/enablePMC")
	public void enablePMC(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		jObj.put("success", false);
		Charity tCharityObj = null;
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		if(tCharityObj != null){
			pmcManager.enablePMC(tCharityObj, loginObj.getId());
			jObj.put("success", true);
		}
	
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/displayAdpl2Info")
	public void displayAdpl2Info(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
	Long id = Long.parseLong(request.getParameter("id"));
	JSONArray jArray = new JSONArray();
	JSONObject jObj = new JSONObject();
	PropertyMarketingInformation infoObj = propertyManager.loadMarketingInfoByPropertyId(id);
	if(infoObj != null){
		JSONObject _jObj = new JSONObject();
			_jObj.put("info", infoObj.toJSON());
			
			List<File> files = infoObj.getFiles();
			if(files != null && !files.isEmpty()){
				for (File fileObj : files) {
					//String fileData = Base64.encode(fileObj.getFileData());
					//fileObj.setBase64Data(fileData);
					//fileObj.removeFile();
					jArray.put(new JSONObject().put("fileObj",fileObj.toJSON(true)));
				}
				_jObj.put("files", jArray);
			}
			jObj.put("success", true);
			jObj.put("data", infoObj.toJSON().put("files", jArray));
	}else{
		jObj.put("success", false);
	}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/changePMCPassword")
	public void changePMCPassword(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		Long id = Long.parseLong(request.getParameter("id"));
		boolean execStatus = false;
		JSONObject jObj = new JSONObject();
		if(id != null){
			String password = pmcManager.resetPassword(id);
			if(password != null)
			execStatus = true;
			jObj.put("password", password);
		}
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/adminSettings")
	public void adminSettings(HttpServletRequest request, HttpServletResponse response)throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		loginObj = loginManager.findLoginUserByName(loginObj.getUsername());
		Admin adminObj = adminManager.loadUserByLoginObj(loginObj);
		JSONObject jObj = new JSONObject();
		JSONObject _jObj = new JSONObject();
		if(adminObj != null){
			_jObj.put("adminObj", adminObj);
			if(adminObj != null){
				_jObj.put("adminObj", adminObj.toJSON(true));
			}
			if(loginObj != null){
				_jObj.put("loginObj", loginObj.toJSON(true));
			}
			Address addressObj = adminObj.getAddressObj();
			if(addressObj != null){
				_jObj.put("addressObj", addressObj.toJSON(true));
			}else{
				System.out.println("Address Object is null");
			}
			ContactDetails detailsObj = adminObj.getContactDetailsObj();
			if(detailsObj != null){
				_jObj.put("detailsObj", detailsObj.toJSON(true));
			}else{
				System.out.println("Details Object is null");
			}
			jObj.put("data", _jObj);
			jObj.put("success", true);
		}else{
			jObj.put("success", false);
		}JSONDelegates.setResponse(jObj, response);
		}
	
	@RequestMapping("/admin/updateAdmin")
	public void updateAdmin(HttpServletRequest request, HttpServletResponse response)throws JSONException, JsonParseException, JsonMappingException, IOException{
		JSONObject jObj = new JSONObject();
		ObjectMapper mapper = new ObjectMapper();
		boolean execStatus = false;
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Admin userObj = mapper.readValue(request.getInputStream(), Admin.class);
		
		Admin admin = adminManager.loadAdminById(userObj.getId());
		if(admin != null){
			UserLogin login = admin.getLoginObj();
			if(login != null){
				userObj.setLoginObj(login);
			}
		}
		if(userObj != null){
			execStatus = adminManager.updateAdmin(userObj, loginObj);
		}
			jObj.put("success", execStatus);
			JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listProperty")
	public void listProperty(HttpServletRequest request, HttpServletResponse response)throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
	List<Property> propertyList = propertyManager.loadAll(null, null, loginObj);
	JSONObject jObj = new JSONObject();
	JSONArray jArray = new JSONArray();
	if(propertyList != null && !propertyList.isEmpty()){
		for (Property property : propertyList){
			JSONObject _jObj;
				List<ADPL2Page> adplList = ADPL2Page.list();
				 Double status = 0.0;
				 for (ADPL2Page adplObj : adplList) {
					 status += propertyManager.getStatus(property.getId(), adplObj);
				}
				 status = Math.floor(status);
				 if(status > 100)
					 status = 100.0;
				 
				 DecimalFormat dc = new DecimalFormat("#");
				 String st = dc.format(status);
				 property.setStatusPercentage(Integer.parseInt(st));
				 _jObj = property.toJSON(true);
				 
			if (property.getAddressObj() != null) {
				_jObj.put("addressObj", property.getAddressObj().toJSON(true));
			}
			jArray.put(_jObj);
		}
		jObj.put("success", true);
		jObj.put("data", jArray);
	}else{
		jObj.put("success", false);
		jObj.put("data", jArray);
	}
	JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/allProperty")
	public ModelAndView allProperty(HttpServletRequest request, HttpServletResponse response) 
			throws JSONException, JsonParseException, JsonMappingException, IOException{
		return new ModelAndView("admin/property/property");
	}
	
	@RequestMapping("/admin/viewProperty")
	public ModelAndView viewProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		return new ModelAndView("admin/property/propertyDetails", "propertyId", request.getParameter("propertyId"));
	}
	
	@RequestMapping("/admin/viewAdmin")
	public ModelAndView viewAdmin(HttpServletRequest request, HttpServletResponse response) 
			throws JSONException, JsonParseException, JsonMappingException, IOException{
		return new ModelAndView("admin/sub-admin/usersDetails");
	}
	
	@RequestMapping("/admin/viewAdminDetails")
	public void viewAdminDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		String userId = request.getParameter("userId");
		System.out.println("User Id is "+userId);
		JSONObject jObj = new JSONObject();
		if(userId != null){
			Admin adminObj = adminManager.loadAdminById(Long.valueOf(userId));
			if(adminObj != null){
				JSONObject _jObj = new JSONObject();
					_jObj.put("adminObj", adminObj.toJSON(true));
				
			Address addressObj = adminObj.getAddressObj();
			if(addressObj != null)
				_jObj.put("addressObj", addressObj.toJSON(false));
			
			UserLogin loginObj1 = adminObj.getLoginObj();
			if(loginObj1 != null)
				_jObj.put("loginObj", loginObj1.toJSON(false));
			
			ContactDetails detailsObj = adminObj.getContactDetailsObj();
				if(detailsObj != null)
					_jObj.put("detailsObj", detailsObj.toJSON(false));
							
			jObj.put("success", true);
			jObj.put("data", _jObj);
			}
			}
			JSONDelegates.setResponse(jObj, response);
		}
	
	@RequestMapping("/admin/fetchPropertyDetail")
	public void fetchPropertyDetail(HttpServletRequest request, HttpServletResponse response) 
			throws JSONException, JsonParseException, JsonMappingException, IOException{
			JSONObject jObj = new JSONObject();
			String propId  = request.getParameter("propertyId"); 
			Long propertyId = Long.valueOf(propId);
			request.getSession().setAttribute("propertyId", propertyId);
			if(propertyId != null){
			Property propertyObj = propertyManager.loadPropertyById(propertyId);
			if(propertyObj != null){
				JSONObject _jObj = new JSONObject();
					_jObj.put("property", propertyObj.toJSON(true));
					
					Address addressObj = propertyObj.getAddressObj();
					if(addressObj != null){
						_jObj.put("address", addressObj.toJSON(true));
					}
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);	
	}
	
	@RequestMapping("/admin/deleteProperty")
	public void deleteProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		Long propertyId = Long.parseLong(request.getParameter("propertyId"));
		boolean execStatus = propertyManager.deleteProperty(propertyId);
		jObj.put("success", execStatus);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewADPL2")
	public ModelAndView viewADPL2(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		return new ModelAndView("admin/property/adpl2Form");
	}
	
	@RequestMapping("/admin/addAdmin")
	public void addAdmin(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		boolean execStatus = false;
		ObjectMapper mapper = new ObjectMapper();
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		Admin userObj = mapper.readValue(request.getInputStream(), Admin.class);
		execStatus = adminManager.createUserAdmin(userObj, loginObj.getId());
		if(execStatus){
			jObj.put("message", "Successfully created");
			jObj.put("success", true);
		}else{
			jObj.put("message", "User already exists. Please try with different username");
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/fileUpload")
	public void fileUpload(HttpServletRequest request, HttpServletResponse response) throws JSONException{
	boolean execStatus =  false;
	JSONObject jObj = new JSONObject();
	try{
		MultipartHttpServletRequest multiPartRequest  = (MultipartHttpServletRequest) request;
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Iterator<String> fileIterator = multiPartRequest.getFileNames();
		long file = Long.parseLong(request.getParameter("file"));
		while(fileIterator.hasNext()){
			MultipartFile partObj = multiPartRequest.getFile(fileIterator.next());
			File fileObj = new File(partObj.getOriginalFilename(), partObj.getSize(), ObjectType.ADPL.id(), file, partObj.getBytes(), partObj.getContentType(), DocumentType.DOCUMENT.id());
			//System.out.println(fileObj.getFileName());
			//System.out.println("file DAO : " + fileDAO);
			Long fileId = fileDAO.saveFile(fileObj, loginObj.getId());
			//System.out.println("file id is : " + fileId);
			File tFileObj = fileDAO.loadFileById(fileId);
			//System.out.println("File object : " + tFileObj);
			execStatus = false;
			if(tFileObj != null) {
				jObj.put("data", tFileObj.toJSON(true));
				execStatus = true;
			}
			//System.out.println(fileId);
			
		}
		}catch (Exception e) {
			e.printStackTrace();
			execStatus = false;
		}
	jObj.put("success", execStatus);
	JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/listPerpetualCity")
	public void listPerpetualCity(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		boolean status = false;
		JSONArray jArr = new JSONArray();
		JSONObject jObj = new JSONObject();
		try{
			List<PerpetualCity> listCity = cityDAO.loadAllPerpetualCity();
			if(listCity != null && !listCity.isEmpty()){
				status = true;
				for(PerpetualCity city : listCity){
					jArr.put(city.toJSON(true));
					}
				jObj.put("data", jArr);
				}
		}
		catch(DuplicateKeyException e){
			e.printStackTrace();
		}
		jObj.put("success", status);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/addPMC")
	public void addPMC(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		JSONObject jObj = new JSONObject();
		Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		ContactDetails detailsObj = charityObj.getContactDetailsObj();
		if(detailsObj != null){
			String emailId = detailsObj.getEmailId();
			if(emailId != null && emailId.length() > 0){
				execStatus = commonManager.validateEmailId(emailId);
				if(execStatus){
					UserLogin _loginObj = charityObj.getLoginObj();
						if(_loginObj != null){
							_loginObj.setUserTypeId(UserType.SUPER_PMC.id());
						}
						execStatus = pmcManager.createPMC(charityObj, loginObj.getId());
						if(execStatus){
							jObj.put("message", "Successfully created");
							jObj.put("success", true);
						}else{
							jObj.put("message", "User already exists. Please try with different username");
							jObj.put("success", false);
						}
				}else{
					jObj.put("message", "This Email Id is already registered with us. Please try with different one.");
					jObj.put("success", false);
				}
			}
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadContractorConversationByProperty")
	public void loadContractorConversationByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		String propId = request.getParameter("propertyId");
		sessionObj = request.getSession(false);
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		if(propertyId != null){
			List<Conversation> lFunctionalities = conversationManager.loadConversationByPropertyAndActorOneTypeId(propertyId, PropertyType.CURRENT_DEVELOPMENT.id(), ObjectType.LANDLORD.id());
			if(lFunctionalities != null && !lFunctionalities.isEmpty()){
				Set<Long> functionalityIdSet = new HashSet<Long>();
				for (Conversation _funObj : lFunctionalities) {
					functionalityIdSet.add(_funObj.getFunctionalityId());
				}
				for (Long functionalityId : functionalityIdSet) {
					List<Conversation> lContractors = conversationManager.loadConversationByPropertyAndFunctionality(propertyId,PropertyType.CURRENT_DEVELOPMENT.id(), functionalityId);
					
					JSONObject _jObj = new JSONObject();
					JSONArray _jArray = new JSONArray();
						_jObj.put("functionality", ContractorFunctionality.get(functionalityId).value());
						_jObj.put("functionalityId",functionalityId);
						
						AssignModel tAssignObj = assignManager.loadAssignedByPropertyAndFunctionality(propertyId, functionalityId);
						if(tAssignObj != null)
							_jObj.put("assigned", true);
						else{
							_jObj.put("assigned", false);
						}
						
					if(lContractors != null && !lContractors.isEmpty()){
						for (Conversation _conObj : lContractors) {
							JSONObject tJobj = new JSONObject();
							Contractor contObj = contractorManager.loadContractorById(_conObj.getActorTwoId());
							if(contObj != null){
								tJobj.put("conversationObj", _conObj.toJSON(true));
								tJobj.put("contractorObj", contObj.toJSON(false));
							}
							_jArray.put(tJobj);
						}
						
						_jObj.put("contractors", _jArray);
					}
					jArray.put(_jObj);
				System.out.println(jArray);
				}
				jObj.put("success", true);
				jObj.put("data", jArray);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadPmcConversationByProperty")
	public void loadPmcConversationByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		String propId = request.getParameter("propertyId");
		sessionObj = request.getSession(false);
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		if(propertyId != null){
			List<Conversation> lPmc = conversationManager.loadConversationByPropertyAndActorOneTypeId(propertyId, PropertyType.CURRENT_DEVELOPMENT.id(), ObjectType.SUPER_PMC.id(), ObjectType.PMC.id());
			if(lPmc != null && !lPmc.isEmpty()){
				JSONObject _jObj = null;
				for (Conversation conObj : lPmc) {
					_jObj = new JSONObject();
					Charity pmcObj = pmcManager.loadPMCById(conObj.getActorOneId());
					if(pmcObj != null)
						_jObj.put("charity", pmcObj.toJSON(false));
						_jObj.put("conversation", conObj.toJSON(true));
					
					jArray.put(_jObj);
				}
				jObj.put("success", true);
				jObj.put("data", jArray);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadPmcConversationByPDProperty")
	public void loadPmcConversationByPDProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		String propId = request.getParameter("pdId");
		sessionObj = request.getSession(false);
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("pdPropertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("pdPropertyId");
		}
		if(propertyId != null){
			List<Conversation> lPmc = conversationManager.loadConversationByPropertyAndActorOneTypeId(propertyId, PropertyType.PROPOSED_DEVELOPMENT.id(), ObjectType.SUPER_PMC.id(), ObjectType.PMC.id());
			if(lPmc != null && !lPmc.isEmpty()){
				JSONObject _jObj = null;
				for (Conversation conObj : lPmc) {
					_jObj = new JSONObject();
					Charity pmcObj = pmcManager.loadPMCById(conObj.getActorOneId());
					if(pmcObj != null)
						_jObj.put("charity", pmcObj.toJSON(false));
						_jObj.put("conversation", conObj.toJSON(true));
					
					jArray.put(_jObj);
				}
				jObj.put("success", true);
				jObj.put("data", jArray);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadContractorStep2Info")
	public void loadContractorStep1Info(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		String contId = request.getParameter("contractorId");
		Long contractorId = Long.valueOf(contId);
		JSONObject jObj = new JSONObject();
		if(contractorId != null){
			ContractorRegisterationStep2 conObj = contractorManager.loadContractorStep2Info(contractorId);
			if(conObj != null){
				JSONObject _jObj = null;
				if(conObj != null){
					_jObj = new JSONObject();
					Address officeAddObj = conObj.getOfficeAddObj();
						if(officeAddObj != null){
							_jObj.put("officeAddress", officeAddObj.toJSON(true));
						}
					Address cAddObj = conObj.getCorrespondenceAddObj();
						if(cAddObj != null){
							_jObj.put("correspondenceAddress", cAddObj.toJSON(true));
						}
						_jObj.put("contractor", conObj.toJSON(true));
					jObj.put("success", true);
					jObj.put("data", _jObj);
				}
			
			}
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadContractorStep3Info")
	public void loadContractorStep3Info(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		JSONObject jObj = new JSONObject();
		String contId = request.getParameter("contractorId");
		Long contractorId = Long.valueOf(contId);
		if(contractorId != null){
			ContractorRegisterationStep3 conObj = contractorManager.loadContractorStep3Info(contractorId);
			JSONObject _jObj = null;
			if(conObj != null){
				_jObj = new JSONObject();
				List<FunctionalityCostMatrix> costSheet = conObj.getCostSheet();
				if(costSheet != null){
					JSONArray _jArray = new JSONArray();
					for (FunctionalityCostMatrix functionalityCostMatrix : costSheet) {
						_jArray.put(functionalityCostMatrix.toJSON());
					}
					_jObj.put("costsheet", _jArray);
				}
				
					_jObj.put("contractor", conObj.toJSON(true));
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadContractorStep4Info")
	public void loadContractorStep4Info(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		String contId = request.getParameter("contractorId");
		Long contractorId = Long.valueOf(contId);
		JSONObject jObj = new JSONObject();
		if(contractorId != null){
			ContractorRegisterationStep4 conObj = contractorManager.loadContractorStep4Info(contractorId);
			JSONObject _jObj = null;
			if(conObj != null){
				_jObj = new JSONObject();
					_jObj.put("contractor", conObj.toJSON(true));
					
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}
		}else{
			jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadAllJobDetails")
	public void loadAllJobDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONArray jArray = new JSONArray();
		JSONObject jObj = new JSONObject();
		if(loginObj != null){
			List<AssignModel> assignModelList = assignManager.loadAllAssignModel(null, null, loginObj);
			if(assignModelList != null && assignModelList.size() != 0 ){
				for (AssignModel assignModelObj : assignModelList) {
					JSONObject _jObj = new JSONObject();
						_jObj.put("assignModel", assignModelObj.toJSON(true));
						
						LandLord landlordObj= assignModelObj.getLandlordObj();
						if(landlordObj != null)
							_jObj.put("landlord", landlordObj.toJSON(true));
						
						Contractor contractorObj = assignModelObj.getContractorObj();
						if(contractorObj != null)
							_jObj.put("contractor", contractorObj.toJSON(true));
						
						Property propertyObj = assignModelObj.getPropertyObj();
							if(propertyObj != null)
								_jObj.put("property", propertyObj.toJSON(true));
							
							jArray.put(_jObj);
				}
				jObj.put("data", jArray);
				jObj.put("success", true);
			}else{
				jObj.put("data", jArray);
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/loadJobDetail")
	public void loadJobDetail(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		String assignModelIdStr = request.getParameter("assignModelId");
		if(assignModelIdStr != null){
			AssignModel assignModelObj = assignManager.loadAssignModelById(Long.valueOf(assignModelIdStr));
			if(assignModelObj != null){
				JSONObject _jObj = new JSONObject();
				
				_jObj.put("assignModel", assignModelObj.toJSON(true));
				
				LandLord landLordObj = assignModelObj.getLandlordObj();
				if(landLordObj != null)
					_jObj.put("landlord", landLordObj.toJSON(true));
				
					
				Property propertyObj = assignModelObj.getPropertyObj();
					if(propertyObj != null){
						List<ADPL2Page> adplList = ADPL2Page.list();
						 Double status = 0.0;
						 for (ADPL2Page adplObj : adplList) {
							 status += propertyManager.getStatus(propertyObj.getId(), adplObj);
						}
						 status = Math.floor(status);
						 if(status > 100)
							 status = 100.0;
						 
						 DecimalFormat dc = new DecimalFormat("#");
						 String st = dc.format(status);
						 propertyObj.setStatusPercentage(Integer.parseInt(st));
						JSONObject pObj = propertyObj.toJSON(true);
						Address propertyAddressObj = propertyObj.getAddressObj();
						if(propertyAddressObj != null)
							pObj.put("address", propertyAddressObj.toJSON(true));
						
						_jObj.put("property", pObj);
					}
				
				Contractor contractorObj = assignModelObj.getContractorObj();
				if(contractorObj != null){
					JSONObject cObj = contractorObj.toJSON(true);
					ContactDetails detailsObj = contractorObj.getContactDetailsObj();
					if(detailsObj != null){
						cObj.put("contactDetails", detailsObj.toJSON(true));
						
						_jObj.put("contractor", cObj);
					}
				}
				
				List<Documents> lDocuments = adminManager.loadDocumentsByAssignModel(Long.valueOf(assignModelIdStr));
				if(lDocuments != null && lDocuments.size() > 0){
					JSONArray docArr = new JSONArray();
						for (Documents documentObj : lDocuments) {
								JSONObject docObj = documentObj.toJSON(true);
									File fileObj = documentObj.getFileObj();
									if(fileObj != null){
											docObj.put("file", fileObj.toJSON(true));
									}
								docArr.put(docObj);
							}
						_jObj.put("uploadedDocuments", docArr);
					}
				
				jObj.put("data", _jObj);
				jObj.put("success", true);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	/*@RequestMapping("admin/loadAllDocuments")
	public void loadAllDocuments(HttpServletRequest request, HttpServletResponse response){
		String assignModelStr = request.getParameter("assignModel");
		if(assignModelStr != null){
			List<Documents> lDocuments = adminManager.loadDocumentsByAssignModel(Long.valueOf(assignModelStr));
			if(lDocuments != null && lDocuments.size() > 0){
				
			}
		}
			
	}*/
	
	@RequestMapping("admin/updatePassword")
	public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		loginObj = loginManager.findLoginUserByName(loginObj.getUsername());
		
		EditPassword pwdObj = mapper.readValue(request.getInputStream(), EditPassword.class);
		JSONObject jObj = new JSONObject();
		if(pwdObj != null && loginObj != null){
			pwdObj.setId(loginObj.getId());
			if(pwdObj.getUsername() == null || pwdObj.getUsername() == ""){
				jObj.put("success", false);
				jObj.put("message", "User Name Cannot be blank.");
			}else if(pwdObj.getCurrentPassword() == null || pwdObj.getCurrentPassword() == ""){
				jObj.put("success", false);
				jObj.put("message", "Current Password Cannot be blank.");
			}else if(pwdObj.getCurrentPassword() == null || !loginObj.getPassword().equalsIgnoreCase(pwdObj.getCurrentPassword())){
				jObj.put("success", false);
				jObj.put("message", "Invalid Current Password");
			}else if(pwdObj.getNewPassword() == null || pwdObj.getNewPassword() == ""){
				jObj.put("success", false);
				jObj.put("message", "New Password cannot be blank.");
			}else if(pwdObj.getConfirmPassword() == null || pwdObj.getConfirmPassword() == ""){
				jObj.put("success", false);
				jObj.put("message", "Confirm Password Cannot be blank.");
			}else if(!pwdObj.getNewPassword().equalsIgnoreCase(pwdObj.getConfirmPassword())){
				jObj.put("success", false);
				jObj.put("message", "Confirm Password doesnot match.");
			}
			else{
				execStatus = loginManager.updatePassword(pwdObj);
				if(execStatus){
					loginObj = loginManager.findLoginUserByName(pwdObj.getUsername());
					sessionObj.setAttribute("loginObj", loginObj);
					jObj.put("message", "Password has been successfully updated");
					jObj.put("success", true);
				}else{
					jObj.put("message", "Failed to update password");
					jObj.put("success", false);
				}
			}
		}else{
			jObj.put("success", false);
			jObj.put("message", "Current Password cannot be blank.");
		}
		JSONDelegates.setResponse(jObj, response);
	}
/*----------------------------------------------------------------------------------------*/	
/*	@RequestMapping("/admin/uploadFiles")
	public ModelAndView uploadFiles(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException{

		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		jObj.put("success", false);
		if(loginObj != null){
			String adminDocumentId = request.getParameter("adminDocumentId");
				if(adminDocumentId != null){
					MultipartHttpServletRequest multiPartRequest = null;
					try{
						if(request instanceof MultipartHttpServletRequest)
							multiPartRequest = (MultipartHttpServletRequest) request;
					}catch (Exception e) {
						e.printStackTrace();
						return new ModelAndView("admin/settings/newAttachmentFile");
					}
					File fileObj = null;
							if(multiPartRequest != null){
								MultipartFile multipartFile = multiPartRequest.getFile("uploadedFile");
								if(multipartFile != null){
									fileObj = new File(multipartFile.getOriginalFilename(), multipartFile.getSize(),0, 0, multipartFile.getBytes(), multipartFile.getContentType(), DocumentType.DOCUMENT.id());
									execStatus = adminManager.uploadFiles(fileObj, loginObj.getId(), Integer.parseInt(adminDocumentId));
								if(execStatus)
									jObj.put("success", true);
								else
									jObj.put("success", false);
								}
					}else{
						jObj.put("success", false);
				}
			}
		}
		JSONDelegates.setResponse(jObj, response);
		return null;
	}*/
	
	@RequestMapping("/admin/uploadFiles")
	public ModelAndView uploadFiles(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		jObj.put("success", false);
		if(loginObj != null){
			String adminDocumentId = request.getParameter("adminDocumentId");
				if(adminDocumentId != null){
					MultipartHttpServletRequest multiPartRequest = null;
					try{
						if(request instanceof MultipartHttpServletRequest)
							multiPartRequest = (MultipartHttpServletRequest) request;
					}catch (Exception e) {
						e.printStackTrace();
						return new ModelAndView("admin/settings/newAttachmentFile");
					}
					File fileObj = null;
							if(multiPartRequest != null){
								MultipartFile multipartFile = multiPartRequest.getFile("uploadedFile");
								if(multipartFile != null){
									if(multipartFile.getSize() > 10000000){      // max size is 10 MB
										jObj.put("sizeError", false);
									}
								else{
									fileObj = new File(multipartFile.getOriginalFilename(), multipartFile.getSize(),0, 0, multipartFile.getBytes(), multipartFile.getContentType(), DocumentType.DOCUMENT.id());
									execStatus = adminManager.uploadFiles(fileObj, loginObj.getId(), Integer.parseInt(adminDocumentId));
								if(execStatus)
									jObj.put("success", true);
								else
									jObj.put("success", false);
								}
							}
					}else{
						jObj.put("success", false);
				}
			}
		}
		JSONDelegates.setResponse(jObj, response);
		return null;
	}
	
	/*------------------------Load uplaoded data----------------------------------*/
	
	@RequestMapping("admin/loadFileData")
	public void loadAllUploadedFileData(HttpServletRequest request, HttpServletResponse response) throws JSONException {
		JSONObject jObj = new JSONObject();
		
		JSONObject _jObj = new JSONObject();
		
		AdminUploadDocuments adpl1Obj  = adminManager.loadByDocumentId(AdminDocuments.ADPL1.id());
		if(adpl1Obj != null){
			_jObj.put("adpl1Name", adpl1Obj.getFileName());
			_jObj.put("adpl1Id", adpl1Obj.getFileId());
		}else
			_jObj.put("adpl1Name"," Not Yet Uploaded");
			
		AdminUploadDocuments adpl3Obj  = adminManager.loadByDocumentId(AdminDocuments.ADPL3.id());
		if(adpl3Obj != null){
			_jObj.put("adpl3Name", adpl3Obj.getFileName());
			_jObj.put("adpl3Id", adpl3Obj.getFileId());
		}else
			_jObj.put("adpl3Name"," Not Yet Uploaded");
		
		AdminUploadDocuments adpl4Obj  = adminManager.loadByDocumentId(AdminDocuments.BANKING_DOCUMENTS.id());
		if(adpl4Obj != null){
			_jObj.put("bankDocumentName", adpl4Obj.getFileName());
			_jObj.put("bankDocumentId", adpl4Obj.getFileId());
		}else
			_jObj.put("bankDocumentName"," Not Yet Uploaded");
		
		AdminUploadDocuments adpl5Obj  = adminManager.loadByDocumentId(AdminDocuments.TEERMS_AND_CONDITIONS.id());
		if(adpl5Obj != null){
			_jObj.put("termsAndConditionName", adpl5Obj.getFileName());
			_jObj.put("termsAndConditionId", adpl5Obj.getFileId());
		}else
			_jObj.put("termsAndConditionName"," Not Yet Uploaded");
			
		jObj.put("data", _jObj);
		jObj.put("success", true);
		
		AdminUploadDocuments pdDeveloperDoc1Obj  = adminManager.loadByDocumentId(AdminDocuments.PROPERTY_DEVELOPER_DOCUMENT_1.id());
		if(pdDeveloperDoc1Obj != null){
			_jObj.put("pdDeveloperDoc1Name", pdDeveloperDoc1Obj.getFileName());
			_jObj.put("pdDeveloperDoc1Id", pdDeveloperDoc1Obj.getFileId());
		}else
			_jObj.put("pdDeveloperDoc1Name"," Not Yet Uploaded");
			
		jObj.put("data", _jObj);
		jObj.put("success", true);
		
		AdminUploadDocuments pdDeveloperDoc2Obj  = adminManager.loadByDocumentId(AdminDocuments.PROPERTY_DEVELOPER_DOCUMENT_2.id());
		if(pdDeveloperDoc2Obj != null){
			_jObj.put("pdDeveloperDoc2Name", pdDeveloperDoc2Obj.getFileName());
			_jObj.put("pdDeveloperDoc2Id", pdDeveloperDoc2Obj.getFileId());
		}else
			_jObj.put("pdDeveloperDoc2Name"," Not Yet Uploaded");
			
		jObj.put("data", _jObj);
		jObj.put("success", true);

		JSONDelegates.setResponse(jObj, response);
		
	}
	
	@RequestMapping("admin/redirectPDPropertyConversation")
	public ModelAndView redirectPDPropertyConversation(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pdProperty/allPDPropertyConversations");
	}
	
	@RequestMapping("admin/redirectPropertyConversation")
	public ModelAndView redirectPropertyConversation(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/property/allConversations");
	}
	
	@RequestMapping("/admin/redirectProperty")
	public ModelAndView redirectProperty(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/property/property");
	}
	
	@RequestMapping("/admin/contractorTable")
	public ModelAndView contractorTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/contractor/contractor");
	}
	
	@RequestMapping("/admin/propertyTable")
	public ModelAndView propertyTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/property/property");
	}
	
	@RequestMapping("/admin/pmcTable")
	public ModelAndView pmcTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pmc/pmc");
	}
	
	@RequestMapping("/admin/subPMCTable")
	public ModelAndView subPMCTable(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("admin/pmc/subPMC/subpmc");
	}
	
	@RequestMapping("/admin/viewSubPMC")
	public ModelAndView viewSubPMC(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pmc/subPMC/subpmcDetails");
	}
	
	@RequestMapping("/admin/allJobsTable")
	public ModelAndView allJobsTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/jobs/jobs");
	}
	
	@RequestMapping("/admin/viewJobDetails")
	public ModelAndView viewJobDetails(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/jobs/jobDetails");
	}
	
	@RequestMapping("/admin/settings")
	public ModelAndView settings(HttpServletRequest request, HttpServletResponse response){
	return new ModelAndView("admin/settings/settings");
	}
	
	@RequestMapping("/admin/profile")
	public ModelAndView profile(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/profile/settings");
	}
	
	@RequestMapping("/admin/usersTable")
	public ModelAndView usersTable(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/sub-admin/users");
	}
	
	@RequestMapping("admin/proposedDevelopment")
	public ModelAndView proposedDevelopment(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pdProperty/pdProperty");
	}

	@RequestMapping("admin/listPDProperty")
	public void listPDProperty(HttpServletRequest request, HttpServletResponse response)throws JSONException, JsonParseException, JsonMappingException, IOException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		List<PDProperty> propertyList = propertyDeveloperManager.loadAll(null, null, loginObj);
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		
		jObj.put("success", false);
		jObj.put("data", jArray);
		
		if(propertyList != null && !propertyList.isEmpty()){
			for (PDProperty property : propertyList){
				 JSONObject _jObj = property.toJSON(true);
				if (property.getAddressObj() != null)
					_jObj.put("addressObj", property.getAddressObj().toJSON(true));
				
				jArray.put(_jObj);
			 }
			jObj.put("success", true);
			jObj.put("data", jArray);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/admin/viewPDPropertyDetails")
	public void viewPDPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		
		HttpSession sessionObj = request.getSession(false);
		if(sessionObj != null)
			sessionObj.setAttribute("pdPropertyId", request.getParameter("PDId"));
		
		PDProperty tPDPropertyObj = null;
		if(CommonFunctions.isLong(request.getParameter("PDId")))
			tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong(request.getParameter("PDId")));
		
		if(tPDPropertyObj != null){
			JSONObject _jObj = new JSONObject();
			_jObj.put("propObj", tPDPropertyObj.toJSON(true));
			if (tPDPropertyObj.getAddressObj() != null)
				_jObj.put("addressObj", tPDPropertyObj.getAddressObj().toJSON(true));
			if(tPDPropertyObj.getCreatedBy() != null && tPDPropertyObj.getCreatedBy().length() > 0){
				UserLogin tUserLoginObj = loginManager.findLoginUserByName(tPDPropertyObj.getCreatedBy());
				
				PropertyDeveloper tPropertyDeveloperObj = null;
				if(tUserLoginObj != null)
					tPropertyDeveloperObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tUserLoginObj);
				
				if(tPropertyDeveloperObj != null){
					JSONObject lJsonObj = tPropertyDeveloperObj.toJSON(true);
						if(tPropertyDeveloperObj.getAddressObj() != null)
							lJsonObj.put("address", tPropertyDeveloperObj.getAddressObj().toJSON(false));
						if(tPropertyDeveloperObj.getLoginObj() != null)
							lJsonObj.put("loginObj",tPropertyDeveloperObj.getLoginObj().toJSON(false));
					_jObj.put("propertyDeveloper", lJsonObj);
				}
			}
			jObj.put("data", _jObj);
		}
		
		jObj.put("success", true);
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/viewPropertyDeveloper")
	public ModelAndView viewPropertyDeveloper (HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("admin/pdProperty/pdPropertyDetail", "pdId", request.getParameter("pdId"));
	}
	
	@RequestMapping("admin/allPDProperty")
	public ModelAndView allPDProperty(HttpServletRequest request, HttpServletResponse response) 
			throws JSONException, JsonParseException, JsonMappingException, IOException{
		return new ModelAndView("admin/pdProperty/pdProperty");
	}
	
	@RequestMapping("admin/disapprovePDProperty")
	public void disapprovePDProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		String propertyIdStr = request.getParameter("propertyId");
		JSONObject jObj = new JSONObject();
		if(propertyIdStr != null){
			PDProperty propObj = propertyDeveloperManager.loadPDPropertyById(Long.valueOf(propertyIdStr));
			if(propObj != null){
				propertyDeveloperManager.disApproveProperty(propObj, loginObj.getId());
					jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/approvePDProperty")
	public void approvePDProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		PDProperty tPDPropertyObj = null;
		
		jObj.put("success", false);
		
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong(request.getParameter("propertyId")));
		
		if(tPDPropertyObj != null && tPDPropertyObj.getCreatedBy() != null &&tPDPropertyObj.getCreatedBy().length() > 0){
			UserLogin tempObj = loginManager.findLoginUserByName(tPDPropertyObj.getCreatedBy());
			if(tempObj != null){
				PropertyDeveloper propertyDeveloerObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tempObj);
				propertyDeveloperManager.approveProperty(tPDPropertyObj, loginObj.getId());
				if(tPDPropertyObj!=null)
					SwingUtilities.invokeLater(new  PropertyDeveloperMailUtility(propertyDeveloerObj, tPDPropertyObj,applicationSettings,mailSenderObj, MailEventType.APPROVE, mailEventManager, templateEngine, commonManager, loginObj));
				jObj.put("success", true);
			}
		}
		JSONDelegates.setResponse(jObj, response);	
	}
	
	@RequestMapping("admin/viewPDDocuments")
	public ModelAndView viewPDDocuments(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		PDProperty tPDPropertyObj = null;
		
		if(request.getParameter("pdId") == null){
			if(CommonFunctions.isLong(request.getSession(false).getAttribute("pdPropertyId")))
				tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong("" + request.getSession(false).getAttribute("pdPropertyId")));
		} else {
			tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong(request.getParameter("pdId")));
		}
		
		if(tPDPropertyObj != null && tPDPropertyObj.getCreatedBy() != null){
			UserLogin tempObj = loginManager.findLoginUserByName(tPDPropertyObj.getCreatedBy());
			if(tempObj != null){
				PropertyDeveloper propertyDeveloerObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tempObj);
				if(propertyDeveloerObj != null){

					ModelAndView mv = new ModelAndView("admin/pdProperty/pdDocuments");
						propertyDeveloperManager.loadPropertyDocuments(propertyDeveloerObj.getId(), tPDPropertyObj, tempObj.getId());
						mv.addObject("property", tPDPropertyObj);							
					return mv;
				}
			}
		}
		
		return new ModelAndView("admin/pdProperty/pdDocuments");
	}
	
	@RequestMapping("admin/viewPDAdminUploadedDocuments")
	public ModelAndView viewPDAdminUploadedDocuments(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		Long pdPropertyId = null;
		String pdId = request.getParameter("pdId");
		if(pdId == null || "undefined".equalsIgnoreCase(pdId)){
			sessionObj = request.getSession();
			if(sessionObj != null){
				Object pdValue = sessionObj.getAttribute("pdPropertyId");
				if(CommonFunctions.isLong("" + (String) pdValue))
					pdPropertyId = Long.parseLong("" + pdValue);
				else
					pdId = (String) pdValue;
			}
		}
		if(sessionObj != null && pdId != null && pdId.trim().length() != 0){
			UserLogin loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			if(pdPropertyId == null)
				pdPropertyId = Long.valueOf(pdId);
			PropertyDeveloper propertyDeveloperObj = propertyDeveloperManager.loadPropertyDeveloperByPropertyId(pdPropertyId);
			if(propertyDeveloperObj != null && pdPropertyId != null){
				PDProperty pdProperty = propertyDeveloperManager.loadPDPropertyById(pdPropertyId);
				if(pdProperty != null){
					propertyDeveloperManager.loadPropertyDocuments(propertyDeveloperObj.getId(), pdProperty, loginObj.getId());
					return new ModelAndView("admin/pdProperty/pdAdminUploadDocuments", "property", pdProperty);
				}
			}
		}
		return new ModelAndView("admin/pdProperty/pdAdminUploadDocuments");
	}
	
	@RequestMapping("admin/viewPropertyAdminUploadedDocuments")         		 // register PropertyDetails
	public ModelAndView properyUploadDocuments(HttpServletRequest request , HttpServletResponse response) throws JSONException {
		ModelAndView mv = new ModelAndView("admin/property/viewPropertyAdminUploadedDocuments");
		Property tPropertyObj = null;
		StringBuffer message = new StringBuffer();
		sessionObj = request.getSession(false);
		
		String propertyDescription = request.getParameter("propertyDescription");
		
		UserLogin loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj == null){
				mv.addObject("propertyId", request.getParameter("propertyId"));
				mv.addObject("dataMessage", "Session expired.");
			return mv;
		}
		
		if(CommonFunctions.isLong(request.getParameter("propertyId")))
			tPropertyObj = propertyManager.loadPropertyById(Long.parseLong(request.getParameter("propertyId")));
		
		if(tPropertyObj == null){
				mv.addObject("propertyId", null);
				mv.addObject("dataMessage", "Invalid Property or Property does not exist(s).");
			return mv;
		}
		
		propertyManager.loadAdminUploadDocument(tPropertyObj);
		
		mv.addObject("propertyObj", tPropertyObj);
		
		MultipartHttpServletRequest multiPartRequest = null;
		try{ 
			if(ServletFileUpload.isMultipartContent(request))
				multiPartRequest =  (MultipartHttpServletRequest) request;
			
			if(multiPartRequest == null){
					mv.addObject("propertyId", tPropertyObj.getId());
					mv.addObject("dataMessage", "No such file(s) attached");
				return mv;
			}
			
			List<MultipartFile> multipartFileList = multiPartRequest.getFiles("attachFiles");
			if(multipartFileList == null || multipartFileList.size() == 0){
					mv.addObject("propertyId", tPropertyObj.getId());
					mv.addObject("dataMessage", "No such file(s) attached");
				return mv;
			}
			
			
			List<PropertyDocument>  documentsList = tPropertyObj.getDocuments();
			if(documentsList == null)
				documentsList = new ArrayList<PropertyDocument>();
			
			String delim = "";
			for (MultipartFile tMultipartFileObj : multipartFileList) {
				if(tMultipartFileObj == null)
					continue;
				if(tMultipartFileObj.getOriginalFilename() == null || tMultipartFileObj.getOriginalFilename().trim().length() == 0)
					continue;
				if(tMultipartFileObj.getSize() == 0 || tMultipartFileObj.getSize() == -1)
					continue;
				if(tMultipartFileObj.getBytes() == null || tMultipartFileObj.getBytes().length == 0)
					continue;
				
				final File tFileObj = new File(tMultipartFileObj.getOriginalFilename(), tMultipartFileObj.getSize(), 0, tPropertyObj.getId(), tMultipartFileObj.getBytes(), tMultipartFileObj.getContentType(), DocumentType.DOCUMENT.id());
				if(tFileObj != null){
					tFileObj.setPropertyReference(tPropertyObj.getUniqueReference());
					tFileObj.setObjectId(tPropertyObj.getId());
					tFileObj.setObjectType(ObjectType.LANDLORD.id());
					
					String tPath = CommonFunctions.savePropertyFile(applicationSettings.getFolderPath(), applicationSettings.getFolderName(), tFileObj);
					if(tPath == null || tPath.trim().length() == 0){
						System.out.println("AdminController - properyUploadDocuments[admin/viewPropertyAdminUploadedDocuments] : COULD NOT SAVE FILE(" + tFileObj.getFileName() + ") FOR PROPERTY (" + tPropertyObj.getUniqueReference() + ") [PATH PROBLEM CHECK applicationSettinsg FOLDER PATH]");
						continue;
					}
					if(tPath.contains("\\"))
						tPath = tPath.replaceAll("\\\\", "/");
					
					tFileObj.setFilePath(tPath);
					fileDAO.saveFile(tFileObj, loginObj.getId());
					
					if(tFileObj.getId() == null || tFileObj.getId() == 0l){
						System.out.println("AdminController - properyUploadDocuments[admin/viewPropertyAdminUploadedDocuments] : COULD NOT SAVE FILE(" + tFileObj.getFileName() + ") FOR PROPERTY(" + tPropertyObj.getUniqueReference() + ")");
						continue;
					}
					
					System.out.println("AdminController - properyUploadDocuments[admin/viewPropertyAdminUploadedDocuments] : FILE SAVED => Name :" + tFileObj.getFileName() + ";Path :" + tFileObj.getFilePath() + ";Id :" + tFileObj.getId());
					PropertyDocument tPropertyDocumentObj = new PropertyDocument(tPropertyObj.getLandlordId(), tPropertyObj.getId(), tFileObj.getDocumentType(), tMultipartFileObj.getOriginalFilename(), tFileObj, propertyDescription);
					if(propertyManager.savePropertyDocument(tPropertyDocumentObj, loginObj.getId())){
						documentsList.add(tPropertyDocumentObj);
						message.append(delim + tMultipartFileObj.getOriginalFilename().trim());
						delim = ", ";
					} else {
						//fileDAO.deleteFileById(tFileObj.getId());
						System.out.println("AdminController - properyUploadDocuments[admin/viewPropertyAdminUploadedDocuments] : COULD NOT SAVE PropertyDocument DELETE FILE(" + tFileObj.getFilePath() + ")");
					}
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
				mv.addObject("propertyId", tPropertyObj.getId());
				mv.addObject("dataMessage", "Critical error occured(" + e.getMessage() + ")");
			return mv;
		}
		
			mv.addObject("propertyId", tPropertyObj.getId());
			mv.addObject("dataMessage", "File(s) <b>" + message.toString() + "</b> saved successfully.");
		return mv;
	}
	
	@RequestMapping("admin/uploadDocuments")         		 // register PropertyDetails
	public ModelAndView uploadDocuments(HttpServletRequest request , HttpServletResponse response) throws JSONException{ 
		PDProperty pdPropObj;
		String addOrUpdateCheck;
		sessionObj = request.getSession(false);
		String pdIdStr = request.getParameter("pdId");
		
		if(pdIdStr == null || "undefined".equalsIgnoreCase(pdIdStr)){
			HttpSession sessionObj = request.getSession();
			if(sessionObj != null){
				pdIdStr = (String) sessionObj.getAttribute("pdPropertyId");
			}
			
		}
		String param = request.getParameter("param");
		if(sessionObj != null && pdIdStr != null ){
			Long pdId = null;
			if(CommonFunctions.isLong(pdIdStr))
				pdId = Long.valueOf(pdIdStr);
			UserLogin loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
			pdPropObj = propertyDeveloperManager.loadPDPropertyById(pdId);
			if(pdPropObj != null && pdPropObj.getCreatedBy() != null){
				if(pdPropObj.getCreatedBy() != null ){
					UserLogin tempObj = loginManager.findLoginUserByName(pdPropObj.getCreatedBy());
					if(tempObj != null){
						PropertyDeveloper propertyDeveloperObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tempObj);
						if(propertyDeveloperObj != null){
							MultipartHttpServletRequest multiPartRequest = null;
							try{ 
								
								if(request instanceof MultipartHttpServletRequest)
									multiPartRequest =  (MultipartHttpServletRequest) request;
								
								if(ServletFileUpload.isMultipartContent(request))
									multiPartRequest =  (MultipartHttpServletRequest) request;
								
								File fileObj = null;
								PDProperty propertyObj = propertyDeveloperManager.loadPDPropertyById(pdId);
								if(propertyObj != null){
									List<PDDocuments>  documentsList = null;
									//List<PDDocuments>  documentsList = propertyDeveloperManager.loadAdminUploadDocument(pdId);
									if(documentsList == null)
										documentsList = new ArrayList<PDDocuments>();
									if(multiPartRequest != null){
										List<MultipartFile> files = multiPartRequest.getFiles("attachFiles");
										if(files != null && !files.isEmpty()){
											for (MultipartFile multipartFile : files) {
												if(multipartFile != null && multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename().length() != 0){
													fileObj = new File(multipartFile.getOriginalFilename(), multipartFile.getSize(), 0, pdId, multipartFile.getBytes(), multipartFile.getContentType(), DocumentType.IMAGES.id());
													if(fileObj != null){
														fileObj.setPropertyReference(propertyObj.getUniqueReference());
														if(param != null){
															PDDocuments documents = new PDDocuments(propertyDeveloperObj.getId(), pdId, Long.valueOf(param), multipartFile.getOriginalFilename(), fileObj);
															documentsList.add(documents);
														}
													}
												}
											}

											addOrUpdateCheck = "1";      // getCheckForUploadDocuments could be NULL for new upload
											if(propertyObj.getCheckForUploadDocuments() == null || propertyObj.getCheckForUploadDocuments().trim().length() == 0)
												addOrUpdateCheck = "2";        // 1 for add &  2 for update,  here file/s already exists
											
											String description = request.getParameter("adminDescription");
									
											execStatus = propertyDeveloperManager.saveDocumentsByAdmin(documentsList, loginObj.getId(), pdPropObj, addOrUpdateCheck, description);
											if(execStatus){
												pdPropObj = propertyDeveloperManager.loadPDPropertyById(pdId); 
												documentsList = propertyDeveloperManager.loadAdminUploadDocument(pdId);
												pdPropObj.setAdminUploadedDoc(documentsList);
												
												if(addOrUpdateCheck.equals("1")) 
													SwingUtilities.invokeLater(new  SuperAdminMailUtility(propertyDeveloperObj,pdPropObj,applicationSettings,mailSenderObj, MailEventType.ADMIN_UPLOAD_FOR_PDPROPERTY, mailEventManager, templateEngine, commonManager, loginObj));
												
												if(addOrUpdateCheck.equals("2")) 
													SwingUtilities.invokeLater(new  SuperAdminMailUtility(propertyDeveloperObj,pdPropObj,applicationSettings,mailSenderObj, MailEventType.ADMIN_UPDATE_FOR_PDPROPERTY, mailEventManager, templateEngine, commonManager, loginObj));
												
												return new ModelAndView("forward:viewPDAdminUploadedDocuments");
											}
										}
									}
								}
							}catch (Exception e) {
								e.printStackTrace();//
								return new ModelAndView("admin/pdProperty/pdAdminUploadDocuments", "propObj", pdPropObj);
							}
						 }
					}
				}
			}
		
		}
		return new ModelAndView("forward:viewPDAdminUploadedDocuments");
	}
	
	@RequestMapping("admin/viewPdPropertyMap")
	public void viewPdPropertyMap(HttpServletRequest request, HttpServletResponse response){
		JSONObject jObj = new JSONObject();
		String addressLine = null;
		Address address = null ;
		try {
			String pdId = request.getParameter("pdId");
			if(pdId != null && pdId.length()!= 0){
				PDProperty pdProperty =  propertyDeveloperManager.loadPDPropertyById(Long.valueOf(pdId));
				address = pdProperty.getAddressObj();
				//addressLine = address.getAddressLine1()+" "+address.getCity()+" "+address.getPostCode()+" "+address.getCounty();
				addressLine = address.getPostCode();
				// System.out.println("addressLine :: "+addressLine);
				 //addressLine = "1 Peverel Drive, Bletchley, Milton Keynes MK1 1NL";
				 jObj.put("address", addressLine);
				 jObj.put("success", true);
			}
			else {
				jObj.put("success", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("admin/removeDocuments")
	public ModelAndView removeDocuments(HttpServletRequest request){
			String docId = request.getParameter("docId");
			String pdId=request.getParameter("pdId");
			if(pdId == null | "undefined".equalsIgnoreCase(pdId)){
				HttpSession sessionObj = request.getSession();
				if(sessionObj != null){
					pdId = (String) sessionObj.getAttribute("pdPropertyId");
				}
			}
			if(docId != null){
				propertyDeveloperManager.removeDocuments(Long.valueOf(docId));
			}
			return new ModelAndView("forward:viewPDAdminUploadedDocuments");
		}
	
	@RequestMapping("admin/removePropertyDocuments")
	public void removePropertyDocuments(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
			
			if(!CommonFunctions.isLong(request.getParameter("docId")) && !CommonFunctions.isLong(request.getParameter("propertyId"))){
				jObj.put("success", false);
				jObj.put("message", "Invalid Document reference");
				
				JSONDelegates.setResponse(jObj, response);
				return;
			}
			
			if(propertyManager.deleteDocumentById(Long.parseLong(request.getParameter("docId")))){
				jObj.put("success", true);
				jObj.put("message", "Document deleted successfully");
				
				JSONDelegates.setResponse(jObj, response);
			} else {
				jObj.put("success", false);
				jObj.put("message", "Invalid Document reference");
				
				JSONDelegates.setResponse(jObj, response);
			}
		}
  }
