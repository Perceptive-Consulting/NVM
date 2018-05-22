package com.pcs.perpetualRents.web.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.EditPassword;
import com.pcs.perpetualRents.business.bean.Mail;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.commonFunction.CommonFunctions;
import com.pcs.perpetualRents.enm.ADPL2Page;
import com.pcs.perpetualRents.enm.PropertyType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.MailManager;
import com.pcs.perpetualRents.manager.PMCManager;
import com.pcs.perpetualRents.manager.PropertyDeveloperManager;
import com.pcs.perpetualRents.manager.PropertyManager;
import com.pcs.perpetualRents.manager.UserLoginManager;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class PmcController {

	@Autowired
	private PropertyDeveloperManager propertyDeveloperManager;
	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private UserLoginManager loginManager;
	@Autowired
	private PMCManager pmcManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	@Autowired
	private CommonManager commonManager;
	@Autowired
	private MailManager mailManager;
	@Autowired
	private ConversationManager conversationManager;
	
	private HttpSession sessionObj;
	private UserLogin loginObj;
	private ObjectMapper mapper = new ObjectMapper();
	private Boolean execStatus;

	@RequestMapping("/pmc/userNameAllowed")
	public void userNameAllowed(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject jObj = new JSONObject();
		String name = request.getParameter("name");
		boolean status = loginManager.validateUser(name);
		jObj.put("success", status);
		JSONDelegates.setResponse(jObj, response);
	}

	@RequestMapping("pmc/updatePassword")
	public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		loginObj = loginManager.findLoginUserByName(loginObj.getUsername());
		
		EditPassword pwdObj = mapper.readValue(request.getInputStream(), EditPassword.class);
		JSONObject jObj = new JSONObject();
		if(pwdObj != null && loginObj != null){
			pwdObj.setId(loginObj.getId());
			if(pwdObj.getCurrentPassword() == null || pwdObj.getCurrentPassword() == ""){
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
					loginObj = loginManager.findLoginUserByName(loginObj.getUsername());
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
	
	@RequestMapping("pmc/loadPMCUserType")
	public void loadPMCUserType(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession();
		UserLogin loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
			if(loginObj.getUserTypeId()==5)
				jObj.put("show", true);
			else if(loginObj.getUserTypeId()==6){
				jObj.put("show", false);
			}
			jObj.put("success", true);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/changeStatus")
	public void changeStatus(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
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
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/createPMCUser")
	public void createPMCUser(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONObject jObj = new JSONObject();
		
		Charity tCharityObj = mapper.readValue(request.getInputStream(), Charity.class);
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		
		UserLogin _loginObj = tCharityObj.getLoginObj();
		
		jObj.put("success", false);
		if(_loginObj != null){
			_loginObj.setUserTypeId(UserType.PMC.id());
			jObj.put("success", pmcManager.createPMC(tCharityObj, loginObj.getId()));
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/updatePMCUser")
	public void updatePMCUser(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
			Charity charityObj = mapper.readValue(request.getInputStream(), Charity.class);
			execStatus = pmcManager.updatePMC(charityObj, loginObj.getId());
			if(execStatus)
				jObj.put("success", true);
			else
				jObj.put("success", false);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/loadAllPMCUsers")
	public void loadAllUsers(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		
		jObj.put("data", jArray);
		jObj.put("success", false);
		
		List<Charity> pmcList = null;
		if(loginObj != null)
			pmcList = pmcManager.loadAllPMC(null, null , loginObj);
		
		if(pmcList != null && !pmcList.isEmpty()){
			JSONObject _jObj  = null;
			for (Charity charityObj : pmcList) {
				_jObj = new JSONObject();
					_jObj.put("pmc", charityObj.toJSON(true));
				if(charityObj.getAddressObj() != null)
					_jObj.put("addressObj", charityObj.getAddressObj().toJSON(false));
				if(charityObj.getContactDetailsObj() != null)
					_jObj.put("detailsObj", charityObj.getContactDetailsObj().toJSON(false));
				if(charityObj.getLoginObj() != null)
					_jObj.put("loginObj", charityObj.getLoginObj().toJSON(false));
				jArray.put(_jObj);
			}
			jObj.put("success", true);
			jObj.put("data", jArray);
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/viewPMCUserDetail")
	public void viewPMCUserDetail(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj= new JSONObject();
		JSONArray jArray = new JSONArray();
		loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
		Charity tCharityObj = null;
		
		if(CommonFunctions.isLong(request.getParameter("pmcId")))
			tCharityObj = pmcManager.loadPMCById(Long.parseLong(request.getParameter("pmcId")));
		
		jObj.put("success", false);
		jObj.put("data", jArray);
		if(tCharityObj != null && loginObj != null){
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
	
	@RequestMapping("pmc/viewProfile")
	public void viewProfile(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
			Charity charity = pmcManager.loadCharityByUserLogin(loginObj);
			if(charity != null){
				JSONObject _jObj = new JSONObject();
				Charity charity1 = pmcManager.loadPMCById(charity.getId());
				if(charity1 != null){
					_jObj.put("charityObj", charity1.toJSON(true));
					if(charity1.getAddressObj() != null){
						_jObj.put("addressObj", charity1.getAddressObj().toJSON(true));
					}
					if(charity1.getLoginObj() != null){
						_jObj.put("loginObj", charity1.getLoginObj().toJSON(true));
					}
					if(charity1.getContactDetailsObj() != null){
						_jObj.put("detailsObj", charity1.getContactDetailsObj().toJSON(true));
					}
					jObj.put("data", _jObj);
					jObj.put("success", true);
				}
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
		}
	
	@RequestMapping("pmc/loadAllProperties")
	public void loadAllProperties(HttpServletRequest request , HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		sessionObj = request.getSession(false);

		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");

 		if(loginObj != null){
			Charity pmcObj = pmcManager.loadCharityByUserLogin(loginObj);
			if(pmcObj != null){
				List<Property> propertyList = commonManager.loadPropertyByPMC(pmcObj);
				if(propertyList != null && !propertyList.isEmpty()){
					for (Property property : propertyList) {
						JSONObject _jObj;
							List<ADPL2Page> adplList = ADPL2Page.list();
							 Double status = 0.0;
							 for (ADPL2Page adplObj : adplList)
								 status += propertyManager.getStatus(property.getId(), adplObj);
							
							 status = Math.floor(status);
							 if(status > 100)
								 status = 100.0;
							 
							 DecimalFormat dc = new DecimalFormat("#");
							 String st = dc.format(status);
							 property.setStatusPercentage(Integer.parseInt(st));
							 _jObj = property.toJSON(true);
						if (property.getAddressObj() != null)
							_jObj.put("addressObj", property.getAddressObj().toJSON(true));
						
						jArray.put(_jObj);
					}
					jObj.put("data", jArray);
					jObj.put("success", true);
				}else{
					jObj.put("data", jArray);
					jObj.put("success", false);
				}
				}else{
					jObj.put("data", jArray);
					jObj.put("success", false);
				}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	
	
	@RequestMapping("pmc/viewPropertyDetails")
	public void viewPropertyDetails(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception{
	String propertyIdStr = request.getParameter("propertyId");
	UserLogin loginObj = (UserLogin) request.getSession(false).getAttribute("loginObj");
	JSONObject jObj = new JSONObject();
	if(propertyIdStr != null){
		Property propObj = propertyManager.loadPropertyById(Long.valueOf(propertyIdStr));
		if(propObj != null){
			JSONObject _jObj = new JSONObject();
		List<ADPL2Page> adplList = ADPL2Page.list();
		 Double status = 0.0;
		 for (ADPL2Page adplObj : adplList) {
			 status += propertyManager.getStatus(propObj.getId(), adplObj);
		}
		 status = Math.floor(status);
		 if(status > 100)
			 status = 100.0;
		 
		 DecimalFormat dc = new DecimalFormat("#");
		 String st = dc.format(status);
		 propObj.setStatusPercentage(Integer.parseInt(st));
		 _jObj.put("propObj", propObj.toJSON(true));
		 
	if (propObj.getAddressObj() != null) {
		_jObj.put("addressObj", propObj.getAddressObj().toJSON(true));
		}
	
	
	if(propObj.getCreatedBy() != null && propObj.getCreatedBy().length() > 0){/*
		UserLogin tempObj = loginManager.findLoginUserByName(propObj.getCreatedBy());
		if(tempObj != null){
			LandLord landLordObj = landLordManager.loadLandLordByUserLogin(tempObj);
			if(landLordObj != null){
				JSONObject lJsonObj = landLordObj.toJSON(true);
				Address lAddressObj = landLordObj.getAddressObj();
					if(lAddressObj != null){
						lJsonObj.put("address", lAddressObj.toJSON(false));
					}
				_jObj.put("landlord", lJsonObj);
			}
		}
	*/
	}
	Charity charityObj = pmcManager.loadCharityByUserLogin(loginObj);
		if(charityObj != null){
			List<Conversation> conversationList = conversationManager.loadConversationByActorOne(charityObj.getId(), loginObj.getObjectType().id(), Long.parseLong(propertyIdStr), PropertyType.CURRENT_DEVELOPMENT.id());
			if(conversationList != null)
				_jObj.put("convObj", conversationList.get(0).toJSON(true));
			}
		
			jObj.put("data", _jObj);
		}
	}
		jObj.put("success", true);
		JSONDelegates.setResponse(jObj, response);
	}
	
	
	
	
	@RequestMapping("pmc/updateProperty")
	public void updateProperty(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONObject jObj = new JSONObject();
		Property propertyObj = mapper.readValue(request.getInputStream(), Property.class);
		jObj.put("success", false);
		if(propertyObj != null)
			jObj.put("success", propertyManager.updateProperty(propertyObj, loginObj.getId()));
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("/pmc/updateCities")
	public void updateCities(HttpServletRequest request, HttpServletResponse response) throws JSONException{ // change  ---> contractorManager ---->managerImpl ----> ExpertiesDaoImpl
		JSONObject jObj = new JSONObject();
		Map<String, String[]> dataMap = request.getParameterMap();
		String cityIdArr[] = dataMap.get("citiesStr[]");
		Long id = Long.parseLong(request.getParameter("id"));
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		
		if(cityIdArr != null && id != null)
			jObj.put("success", execStatus = pmcManager.updatePMCCities(cityIdArr, id, loginObj));
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/startLandlordConversation")
	public void startLandlordConversation(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		JSONObject jObj = new JSONObject();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
			Mail mailObj = mapper.readValue(request.getInputStream(), Mail.class);
			Charity charity = pmcManager.loadCharityByUserLogin(loginObj);
			if(charity != null){
				Long conversationId = mailManager.createPMCConversation(mailObj, charity, loginObj, Long.parseLong(request.getParameter("propertyId")), PropertyType.CURRENT_DEVELOPMENT.id());
				jObj.put("success", false);
				if(conversationId != null){
					jObj.put("data", conversationId);
					jObj.put("success", true);
				}
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/loadAllPMCCities")
	public void loadAllPMCCities(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		List<PerpetualCity> cityList = pmcManager.loadAllCities();
		if(cityList != null && !cityList.isEmpty())
			for (PerpetualCity _cityObj : cityList)
				jArray.put(_cityObj.toJSON(true));
			
		jObj.put("success", true);
		jObj.put("data", jArray);
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/loadPMCCities")
	public void loadPMCCities(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		if(loginObj != null){
			Charity charityObj = pmcManager.loadCharityByUserLogin(loginObj);
			if(charityObj != null){
				List<City> cityList = pmcManager.loadPMCCities(Long.valueOf(charityObj.getId()));
				if(cityList != null && !cityList.isEmpty())
					for (City _cityObj : cityList)
						jArray.put(_cityObj.toJSON(true));
					
				
				jObj.put("success", true);
				jObj.put("data", jArray);
			
			}
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/validateUserName")
	public void validateUserName(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		jObj.put("success", loginManager.validateUser(request.getParameter("name")));
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/resetPassword")
	public void resetPassword(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		if(CommonFunctions.isLong(request.getParameter("pmcId"))){
			String password = pmcManager.resetPassword(Long.parseLong(request.getParameter("pmcId")));
			jObj.put("success", (password != null) ? true : false);
		}
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("pmc/redirectADPL2")
	public ModelAndView redirectADPL2(){
		return new ModelAndView("pmc/property/adpl2Form");
	}
	
	@RequestMapping("pmc/redirectProperty")
	public ModelAndView redirectProperty(){
		return new ModelAndView("pmc/property/property");
	}
	
	@RequestMapping("pmc/redirectPMCUsers")
	public ModelAndView redirectPMCUsers(){
		return new ModelAndView("pmc/pmc-users/pmc-users");
	}
	
	@RequestMapping("pmc/redirectViewPMCUser")
	public ModelAndView redirectViewPMCUser(){
		return new ModelAndView("pmc/pmc-users/pmcDetails-users");
	}
	
	@RequestMapping("pmc/redirectConversation")
	public ModelAndView redirectConversation(){
		return new ModelAndView("pmc/conversations/conversations");
	}
	
	@RequestMapping("pmc/redirectPropertyDetails")
	public ModelAndView redirectPropertyDetails(){
		return new ModelAndView("pmc/property/propertyDetails");
	}
	
	@RequestMapping("pmc/redirectPMCSettings")
	public ModelAndView redirectPMCSettings(){
		return new ModelAndView("pmc/settings/settings");
	}
	
	@RequestMapping("pmc/redirectProposedDevelopment")
	public ModelAndView redirectProposedDevelopment(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("pmc/proposedProperty/proposedDevelopment");
	}
	
	@RequestMapping("pmc/viewPropertyDeveloper")
	public ModelAndView viewPropertyDeveloper(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("pmc/proposedProperty/propertyDeveloperDetail");
	}
	
	@RequestMapping("/pmc/viewPDDocuments")
	public ModelAndView viewPDDocuments(HttpServletRequest request, HttpServletResponse response) throws JSONException{

		PDProperty tPDPropertyObj = null;
		if(CommonFunctions.isLong(request.getParameter("pdId")))
			tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong(request.getParameter("pdId")));
		
		if(tPDPropertyObj.getCreatedBy() != null ){
			UserLogin tempObj = loginManager.findLoginUserByName(tPDPropertyObj.getCreatedBy());
			if(tempObj != null){
				PropertyDeveloper propertyDeveloerObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tempObj);
				if(propertyDeveloerObj != null){

					ModelAndView mv = new ModelAndView("pmc/proposedProperty/pdDocuments");
					propertyDeveloperManager.loadPropertyDocuments(propertyDeveloerObj.getId(), tPDPropertyObj, tempObj.getId());
					mv.addObject("property", tPDPropertyObj);
					return mv;
				}
			}
		}
		
		return new ModelAndView("pmc/proposedProperty/pdDocuments");
	}
	
	@RequestMapping("pmc/loadAllpdProperties")
	public void loadAllpdProperties(HttpServletRequest request , HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		JSONArray jArray = new JSONArray();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
 		if(loginObj != null){
			Charity pmcObj = pmcManager.loadCharityByUserLogin(loginObj);
			if(pmcObj != null){
				List<PDProperty> propertyList = commonManager.loadProposedPropertyByPMC(pmcObj);  

				if(propertyList != null && !propertyList.isEmpty()){
					for (PDProperty property : propertyList) {
						if(property == null)
							continue;
						JSONObject _jObj = new JSONObject();
							_jObj = property.toJSON(true);
						if (property.getAddressObj() != null) 
							_jObj.put("addressObj", property.getAddressObj().toJSON(true));
						
						jArray.put(_jObj);
					}
					jObj.put("data", jArray);
					jObj.put("success", true);
				} else {
					jObj.put("data", jArray);
					jObj.put("success", false);
				}
			} else {
				jObj.put("data", jArray);
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	
	@RequestMapping("pmc/viewPDPropertyDetailsInPMC")
	public void viewPDPropertyDetailsInPMC(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException, Exception{

		String propertyIdStr = request.getParameter("PDId");
		JSONObject jObj = new JSONObject();
		PDProperty tPDPropertyObj = null;
				
		if(CommonFunctions.isLong(request.getParameter("PDId")))
			tPDPropertyObj = propertyDeveloperManager.loadPDPropertyById(Long.parseLong(request.getParameter("PDId")));
		
		if(tPDPropertyObj != null){
			JSONObject _jObj = new JSONObject();
			_jObj.put("propObj", tPDPropertyObj.toJSON(true));
		 
			if (tPDPropertyObj.getAddressObj() != null)
				_jObj.put("addressObj", tPDPropertyObj.getAddressObj().toJSON(true));
		
			if(tPDPropertyObj.getCreatedBy() != null && tPDPropertyObj.getCreatedBy().length() > 0){
				UserLogin tempObj = loginManager.findLoginUserByName(tPDPropertyObj.getCreatedBy());
				if(tempObj != null){
					PropertyDeveloper propertyDeveloerObj = propertyDeveloperManager.loadPropertyDeveloperByUserLogin(tempObj);
					if(propertyDeveloerObj != null){
						JSONObject lJsonObj = propertyDeveloerObj.toJSON(true);
						Address lAddressObj = propertyDeveloerObj.getAddressObj();
							if(lAddressObj != null)
								lJsonObj.put("address", lAddressObj.toJSON(false));
						_jObj.put("propertyDeveloper", lJsonObj);
					}
				}
			}
	
			Charity charityObj = pmcManager.loadCharityByUserLogin(loginObj);
			if(charityObj != null){
				List<Conversation> conversationList = conversationManager.loadConversationByActorOne(charityObj.getId(), loginObj.getObjectType().id(), Long.parseLong(propertyIdStr), PropertyType.PROPOSED_DEVELOPMENT.id());
				if(conversationList != null)
					_jObj.put("convObj", conversationList.get(0).toJSON(true));
			}
	
			jObj.put("data", _jObj);
		}
		
		jObj.put("success", true);
		JSONDelegates.setResponse(jObj, response);
	}
	
}