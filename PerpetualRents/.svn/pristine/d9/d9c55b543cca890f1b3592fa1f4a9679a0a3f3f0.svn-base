package com.pcs.perpetualRents.web.controller;

import java.io.IOException;
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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Conversation;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.EditPassword;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.PerpetualCounty;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.PropertyType;
import com.pcs.perpetualRents.manager.AssignManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.ConversationManager;
import com.pcs.perpetualRents.manager.LandLordManager;
import com.pcs.perpetualRents.manager.MailManager;
import com.pcs.perpetualRents.manager.PMCManager;
import com.pcs.perpetualRents.manager.UserLoginManager;
import com.pcs.perpetualRents.web.delegates.AjaxJSONDelegate;

@Controller
public class LandLordController {
	
	@Autowired
	private LandLordManager landLordManager;
	@Autowired
	private ContractorManager contractorManager;
	@Autowired
	private AjaxJSONDelegate JSONDelegates;
	@Autowired
	private UserLoginManager loginManager;
	@Autowired
	private MailManager mailManager;
	@Autowired
	private ConversationManager conversationManager;
	@Autowired
	private AssignManager assignManager;
	@Autowired
	private PMCManager pmcManager;
	
	private HttpSession sessionObj;
	private UserLogin loginObj;
	private LandLord landlordObj;
	private ObjectMapper mapper = new ObjectMapper();
	
	private boolean execStatus;
	
	@RequestMapping("landlord/inviteContractors")
	public void inviteContractors(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
			if(loginObj != null){
				String functionalityId = request.getParameter("functionalityId");
				Map<String, String[]> dataMap = request.getParameterMap();
				String contractorIdArr[] = dataMap.get("dataStr[]");
				String propertyId = String.valueOf(sessionObj.getAttribute("propertyId"));
				String jobsDescription = request.getParameter("jobsDescription");
				if(functionalityId != null && contractorIdArr != null && propertyId != null && jobsDescription != null){
				List<Contractor> rejectedContractorList = mailManager.contractorQuotationFromLandlord(contractorIdArr,loginObj,propertyId,functionalityId, jobsDescription);
				if(rejectedContractorList != null && !rejectedContractorList.isEmpty()){
						jObj.put("data", rejectedContractorList.get(0).toJSON(true));
						jObj.put("success", false);
					}else{
						jObj.put("success", true);
					}
				}
			}
			JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadProfile")
	public void loadProfile(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		JSONObject jObj = new JSONObject();
		if(loginObj != null){
			LandLord landLordObj = landLordManager.loadLandLordByUserLogin(loginObj);
			if(landLordObj != null){
				JSONObject _jObj = new JSONObject();
					_jObj.put("landlord", landLordObj.toJSON(true));
					if(landLordObj.getAddressObj() != null)
						_jObj.put("address", landLordObj.getAddressObj().toJSON(true));
					if(landLordObj.getLoginObj() != null)
						_jObj.put("login", landLordObj.getLoginObj().toJSON(true));
					
				jObj.put("data", _jObj);
				jObj.put("success", true);
			}
		}
		 JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/updatePassword")
	public void updatePassword(HttpServletRequest request, HttpServletResponse response) throws JsonParseException, JsonMappingException, IOException, JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		loginObj = loginManager.findLoginUserByName(loginObj.getUsername());
		
		EditPassword pwdObj = mapper.readValue(request.getInputStream(), EditPassword.class);
		JSONObject jObj = new JSONObject();
		if(pwdObj != null){
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
	
	@RequestMapping("landlord/updateProfile")
	public void updateProfile(HttpServletRequest request, HttpServletResponse response) throws JSONException, JsonParseException, JsonMappingException, IOException{
		 sessionObj = request.getSession(false);
		 loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		 landlordObj = landLordManager.loadLandLordByUserLogin(loginObj);
		 JSONObject jObj = new JSONObject();
		LandLord tLandlordObj = mapper.readValue(request.getInputStream(), LandLord.class);
		if(landlordObj != null){
			tLandlordObj.setId(landlordObj.getId());
			execStatus = landLordManager.updateLandLord(tLandlordObj, loginObj.getId());
			if(execStatus){
				sessionObj.setAttribute("loginObj", loginObj);
				jObj.put("success", true);
				jObj.put("message", "Your profile has been successfully updated.");
			}else{
				jObj.put("success", false);
				jObj.put("message", tLandlordObj.getErrorMessage());
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/updateDocumentStatus")
	public void updateDocumentStatus(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		String statusIdStr = request.getParameter("statusId");
		String documentIdStr = request.getParameter("documentId");
		JSONObject jObj = new JSONObject();
		if(statusIdStr != null && documentIdStr != null){
			Documents tDocObj = new Documents();
				tDocObj.setId(Long.valueOf(documentIdStr));
				tDocObj.setStatusId(Short.valueOf(statusIdStr));
				execStatus = landLordManager.updateDocumentStatus(tDocObj, loginObj.getId());
				if(execStatus){
					jObj.put("success", true);
				}else{
					jObj.put("success", false);
				}
		}
	JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadAllDocuments")
	public void loadAllDocuments(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		 String assignIdStr = request.getParameter("assignModelId");
		 JSONObject jObj = new JSONObject();
		 JSONArray jArray = new JSONArray();
		 if(assignIdStr != null){
			AssignModel tAssignModelObj = assignManager.loadAssignModelById(Long.valueOf(assignIdStr));
			if(tAssignModelObj != null){
			 List<Documents> lDocuments = landLordManager.loadDocumentsByJob(tAssignModelObj);
			 JSONObject _jObj = null;
			  if(lDocuments != null && !lDocuments.isEmpty()){
				for (Documents tDocObj : lDocuments) {
					 _jObj = new JSONObject();
					 _jObj.put("document", tDocObj.toJSON(true));
					 
					jArray.put(_jObj);
				}
				jObj.put("success", true);
				jObj.put("data", jArray);
			 }else{
				 jObj.put("success", false);
			 }
			}else{
				jObj.put("success", false);
			}
		 }
	 JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadJobsDetails")
	public void loadJobsDetails(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		 String assignIdStr = request.getParameter("assignModelId");
		 JSONObject jObj = new JSONObject();
		 if(assignIdStr != null){
			AssignModel tAssignModelObj = assignManager.loadAssignModelById(Long.valueOf(assignIdStr));
			if(tAssignModelObj != null){
				Contractor tContractorObj = contractorManager.loadContractorById(tAssignModelObj.getAssignToId());
				if(tContractorObj != null)
					tAssignModelObj.setContractorName(tContractorObj.getCompanyName());
				
				JSONObject _jObj = new JSONObject();
					_jObj.put("assignObj", tAssignModelObj.toJSON(true));
					
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}else{
				jObj.put("success", false);
			}
		 }
		 JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadJobsDetailsByProperty")
	public void loadJobsDetailsByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		String propId = request.getParameter("propertyId");
		String funId = request.getParameter("functionalityId");
		JSONObject jObj = new JSONObject();
		Long propertyId = null;
		if(propId != null && funId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		LandLord tLandlordObj = landLordManager.loadLandLordByUserLogin(loginObj);
		if(propertyId != null && tLandlordObj != null){
		List<Conversation> lConversation = conversationManager.loadConversationByPropertyAndFunctionality(propertyId, PropertyType.CURRENT_DEVELOPMENT.id(), Long.valueOf(funId));
		if(lConversation != null){
			Conversation tconversationObj = lConversation.get(0);
			if(tconversationObj != null){
				JSONObject _jObj = new JSONObject();
					_jObj.put("jobName", tconversationObj.getFunctionalityString());
					_jObj.put("invitationCount", lConversation.size());
					_jObj.put("jobsDescription", tconversationObj.getJobsDescription());
				
					 AssignModel tAssignModel = assignManager.loadAssignedByPropertyAndFunctionality(Long.valueOf(tconversationObj.getPropertyId()), tconversationObj.getFunctionalityId());
					  if(tAssignModel != null){
						  System.out.println(tAssignModel.getStatus());
					 	_jObj.put("jobStatus", tAssignModel.getStatus());
					 }else{
						 _jObj.put("jobStatus", "Not Assigned");
					 }
					
				jObj.put("success", true);
				jObj.put("data", _jObj);
			}else{
				jObj.put("success", false);
			}
		}
	   }
	 JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadFunctionalityByProperty")
	public void loadFunctionalityByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
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
			List<Conversation> lFunctionalities = conversationManager.loadConversationByPropertyAndActorOneTypeId(propertyId,PropertyType.CURRENT_DEVELOPMENT.id(), ObjectType.LANDLORD.id());
			JSONObject mainJsonObj = null;
			JSONArray mainJsonArr = null;
			if(lFunctionalities != null && !lFunctionalities.isEmpty()){
				Set<Long> functionalityIdSet = new HashSet<Long>();
				for (Conversation _funObj : lFunctionalities) {
					functionalityIdSet.add(_funObj.getFunctionalityId());
				}
				System.out.println("functionalitySet : " + functionalityIdSet);
				for (Long functionalityId : functionalityIdSet) {
					List<Conversation> lContractors = conversationManager.loadConversationByPropertyAndFunctionality(propertyId,PropertyType.CURRENT_DEVELOPMENT.id(), functionalityId);
					
					mainJsonObj = new JSONObject();
					 mainJsonArr = new JSONArray();
						mainJsonObj.put("functionality", ContractorFunctionality.get(functionalityId).value());
						mainJsonObj.put("functionalityId",functionalityId);
						
						AssignModel tAssignObj = assignManager.loadAssignedByPropertyAndFunctionality(propertyId, functionalityId);
						if(tAssignObj != null)
							mainJsonObj.put("assigned", true);
						else{
							mainJsonObj.put("assigned", false);
						}
						
					if(lContractors != null && !lContractors.isEmpty()){
						for (Conversation _conObj : lContractors) {
							JSONObject tJobj = new JSONObject();
							Contractor contObj = contractorManager.loadContractorById(_conObj.getActorTwoId());
							if(contObj != null){
								tJobj.put("conversationObj", _conObj.toJSON(true));
								tJobj.put("contractorObj", contObj.toJSON(false));
							}
							mainJsonArr.put(tJobj);
						}
						
						mainJsonObj.put("contractors", mainJsonArr);
						System.out.println(functionalityId + " : mainJsonObj : " + mainJsonObj);
					}
					jArray.put(mainJsonObj);
				}
				jObj.put("success", true);
				jObj.put("data", jArray);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadAssignedJobsByProperty")
	public void loadAssignedJobsByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject jObj = new JSONObject();
		 JSONArray jArray = new JSONArray();
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		String propId = request.getParameter("propertyId");
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		if(propertyId != null){
			LandLord tLandlordObj = landLordManager.loadLandLordByUserLogin(loginObj);
			if(tLandlordObj != null){
				List<AssignModel> lAssigendJobs = landLordManager.loadAssignedJobsByPropertyId(tLandlordObj.getId(), propertyId);
				if(lAssigendJobs != null && !lAssigendJobs.isEmpty()){
					for (AssignModel tAssignObj : lAssigendJobs) {
						Contractor contractorObj = contractorManager.loadContractorById(tAssignObj.getAssignToId());
							tAssignObj.setContractorName(contractorObj.getCompanyName());
						jArray.put(tAssignObj.toJSON(true));
					}
					jObj.put("success", true);
					jObj.put("data", jArray);
				}else{
					jObj.put("success", false);
				}
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadPMCConversationByProperty")
	public void loadPMCConversationByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		loginObj = (UserLogin) sessionObj.getAttribute("loginObj");
		String propId = request.getParameter("propertyId");
		JSONObject jObj = new JSONObject();
		 JSONArray jArray = new JSONArray();
		
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		LandLord tLandlordObj = landLordManager.loadLandLordByUserLogin(loginObj);
		if(propertyId != null && tLandlordObj != null){
		List<Conversation> tlconversation = conversationManager.loadConversationByActorTwo(tLandlordObj.getId(), ObjectType.LANDLORD.id(), propertyId, PropertyType.CURRENT_DEVELOPMENT.id());
		if(tlconversation != null){
			for (Conversation tConversationObj : tlconversation) {
				Charity tCharityObj = pmcManager.loadPMCById(tConversationObj.getActorOneId());
				tConversationObj.setActorOneDetailsStr(tCharityObj.getCompanyName());
				jArray.put(new JSONObject().put("conversationObj", tConversationObj.toJSON(true)));
			}
			jObj.put("success", true);
			jObj.put("data", jArray);
		}else{
			jObj.put("success", false);
		}
	}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadConversationByProperty")
	public void loadConversationByProperty(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		sessionObj = request.getSession(false);
		String propId = request.getParameter("propertyId");
		JSONObject jObj = new JSONObject();
		
		Long propertyId = null;
		if(propId != null){
			propertyId = Long.valueOf(propId.trim());
			sessionObj.setAttribute("propertyId", propertyId);
		}else{
			propertyId = (Long) sessionObj.getAttribute("propertyId");
		}
		if(propertyId != null){
			List<Conversation> lConversation = conversationManager.loadConversationByPropertyId(propertyId, PropertyType.CURRENT_DEVELOPMENT.id());
			if(lConversation != null && !lConversation.isEmpty()){
				jObj.put("success", true);
			}else{
				jObj.put("success", false);
			}
		}
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/loadCountyForLandlord")
	public void loadCountyForLandlord(HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONArray jArray = new JSONArray();
		JSONObject jObj = new JSONObject();
		List<PerpetualCounty> countyList = landLordManager.loadAllPerpetualCounty();
		if(countyList != null && !countyList.isEmpty()){
				
			for (PerpetualCounty city : countyList) {
				jArray.put(city.toJSON(true));
			}
			jObj.put("success", true);
			jObj.put("data", jArray);
		}else{
			jObj.put("success", false);
		}
		
		
		JSONDelegates.setResponse(jObj, response);
	}
	
	@RequestMapping("landlord/success")
	public ModelAndView success(){
		return new ModelAndView("user/landlord/success");
	}
	
	@RequestMapping("landlord/redirectProperties")
	public ModelAndView redirectProperties(){
		return new ModelAndView("user/landlord/propertyList");
	}
	
	@RequestMapping("landlord/redirectEditProfile")
	public ModelAndView redirectEditProfile(HttpServletRequest request, HttpServletResponse response){
			return new ModelAndView("user/landlord/editLandlord");
	}
	
	@RequestMapping("landlord/redirectEditPassword")
	public ModelAndView redirectEditPassword(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("user/landlord/changePassword");
	}
	
	@RequestMapping("landlord/loadAllProperty")
	public ModelAndView loadAllProperty(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("user/landlord/completejsp/propertyList");
	}
	
	@RequestMapping("landlord/registerNewProperty")
	public ModelAndView registerNewProperty(){
		return new ModelAndView("user/landlord/completejsp/registerProperty");
	}
	
	@RequestMapping("landlord/redirectLandlordProfile")
	public ModelAndView redirectLandlordProfile(){
		return new ModelAndView("user/landlord/landlordDetail");
	}
	
	@RequestMapping("landlord/redirectCompleteProfile")
	public ModelAndView redirectCompleteProfile(){
		return new ModelAndView("user/landlord/completejsp/landlordProfile");
	}
	
	@RequestMapping("landlord/redirectCompleteEditProfile")
	public ModelAndView redirectCompleteEditProfile(){
		return new ModelAndView("user/landlord/completejsp/editLandlordProfile");
	}
	
	@RequestMapping("landlord/redirectCompleteChangePassword")
	public ModelAndView redirectCompleteChangePassword(){
		return new ModelAndView("user/landlord/completejsp/changeLandlordPassword");
	}
	
	@RequestMapping("landlord/redirectCompleteProperties")
	public ModelAndView redirectCompleteProperties(){
		return new ModelAndView("user/landlord/completejsp/propertyList");
	}
	
	@RequestMapping("landlord/redirectCompleteRegisterProperty")
	public ModelAndView redirectCompleteRegisterProperty(){
		return new ModelAndView("user/landlord/completejsp/registerProperty");
	}
}
