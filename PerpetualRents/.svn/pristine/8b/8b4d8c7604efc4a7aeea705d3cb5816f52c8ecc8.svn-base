package com.pcs.perpetualRents.manager.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Charity;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.LandLord;
import com.pcs.perpetualRents.business.bean.PDProperty;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.PropertyDeveloper;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.AddressDAO;
import com.pcs.perpetualRents.dao.AssignDAO;
import com.pcs.perpetualRents.dao.CityDAO;
import com.pcs.perpetualRents.dao.ContactDetailsDAO;
import com.pcs.perpetualRents.dao.ContractorDAO;
import com.pcs.perpetualRents.dao.ExpertiseDAO;
import com.pcs.perpetualRents.dao.LandLordDAO;
import com.pcs.perpetualRents.dao.PMCDAO;
import com.pcs.perpetualRents.dao.PropertyDAO;
import com.pcs.perpetualRents.dao.PropertyDeveloperDAO;
import com.pcs.perpetualRents.dao.UserAdminDAO;
import com.pcs.perpetualRents.dao.UserLoginDAO;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.PropertyManager;

@Service
public class CommonManagerImpl implements CommonManager{
	
	@Autowired
	private PropertyDeveloperDAO propertyDeveloperDAO;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private PropertyDAO propertyDAO;
	@Autowired
	private ContractorDAO contractorDAO;
	@Autowired
	private LandLordDAO landLordDAO;
	@Autowired
	private PMCDAO pmcDAO;
	@Autowired
	private UserAdminDAO userAdminDAO;
	@Autowired
	private ContactDetailsDAO contactDetailsDAO;
	@Autowired
	private ExpertiseDAO expertiseDAO;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private UserLoginDAO userLoginDAO;
	@Autowired
	private AssignDAO assignDAO;
	@Autowired
	private PropertyManager propertyManager;
	@Autowired
	private JavaMailSender mailSender;
	
	
	@Override
	public List<Property> loadPropertyByAdmin(Admin adminObj) {
		List<Property> propertyList = null;
		if(adminObj != null){
			List<City> tCityList = cityDAO.loadCityByObjectId(ObjectType.ADMIN.id(), adminObj.getId());
			
			if(tCityList != null && !tCityList.isEmpty()){
				propertyList = new ArrayList<Property>();
				for (City city : tCityList) {
					List<Address> addressList = addressDAO.loadAddressByCity(city.getCity(), ObjectType.PROPERTY.id());
					if(addressList != null && !addressList.isEmpty()){
						for (Address addressObj : addressList) {
							Property propertyObj = propertyDAO.loadPropertyById(addressObj.getObjectId());
							if(propertyObj != null){
								propertyList.add(propertyObj);
								List<Address> tAddressList = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), propertyObj.getId());
								if (tAddressList != null && !tAddressList.isEmpty()) {
									propertyObj.setAddressObj(tAddressList.get(0));
								}
							}
						}
					}
				}
				if(propertyList != null && !propertyList.isEmpty()){
					return propertyList;
				}
			}
		}
		return null;
	}

	@Override
	public List<Contractor> loadContractorByAdmin(Admin adminObj) {
		List<Contractor> contractorList = null;
		if(adminObj != null){
			List<City> tCityList = cityDAO.loadCityByObjectId(ObjectType.ADMIN.id(), adminObj.getId());
			
			if(tCityList != null && !tCityList.isEmpty()){
				Set<City> citySet = new HashSet<City>();
				for (City city : tCityList) {
					List<City> cityList = cityDAO.loadCityByNameAndObjectType(city.getCity(), ObjectType.CONTRACTOR_FUNCTIONALITY.id());
					if(cityList != null && !cityList.isEmpty()){
						for (City cityObj : cityList) {
							citySet.add(cityObj);
						}
					}
				}
				Set<Long> contractorIdSet = new HashSet<Long>();
				for (City tcityObj : citySet) {
					Expertise expertiseObj = expertiseDAO.loadExpertiseById(tcityObj.getObjectId());
					if(expertiseObj != null){
						contractorIdSet.add(expertiseObj.getContractorId());
					}
				}
				contractorList = new ArrayList<Contractor>();
				for (Long contId : contractorIdSet) {
					Contractor conObj = contractorDAO.loadContractorById(contId);
					if(conObj != null){
						contractorList.add(conObj);
					}
				}
				
				if(contractorList != null && !contractorList.isEmpty()){
					return contractorList;
				}
			}
		}
		return null;
	}

	@Override
	public List<LandLord> loadLandlordByAdmin(Admin adminObj) {
		if(adminObj != null){
			Set<Long> landlordIdSet = null;
			List<Property> propertyList = loadPropertyByAdmin(adminObj);
			if(propertyList != null && !propertyList.isEmpty()){
				 landlordIdSet = new HashSet<Long>();
				for (Property property : propertyList) {
					landlordIdSet.add(property.getLandlordId());
				}
			}
			List<LandLord> landlordList;
			if(landlordIdSet != null && !landlordIdSet.isEmpty()){
				landlordList = new ArrayList<LandLord>();
				for (Long id : landlordIdSet) {
				 LandLord landlordObj = landLordDAO.loadLandLordById(id);
				 if(landlordObj != null){
					 landlordList.add(landlordObj);
				 }
				}
				if(landlordList != null && !landlordList.isEmpty())
					return landlordList;
			}
		}
		return null;
	}

	@Override
	public List<Charity> loadPMCByAdmin(Admin adminObj) {
		List<Charity> charityList = null;
		Set<Long> charitySetId = new HashSet<Long>();
		if(adminObj == null)
			return null;
		
		Set<String> cityNameSet = new HashSet<String>();
		List<City> tCityList = cityDAO.loadCityByObjectId(ObjectType.ADMIN.id(), adminObj.getId());

		if(tCityList != null && !tCityList.isEmpty()){
			charityList = new ArrayList<Charity>();
			for (City city : tCityList) {
				cityNameSet.add(city.getCity());
			}
			if(cityNameSet != null && !cityNameSet.isEmpty()){
				for (String cityName : cityNameSet) {
					List<City> cityList = cityDAO.loadCityByNameAndObjectType(cityName, ObjectType.SUPER_PMC.id());
					if(cityList != null && !cityList.isEmpty()){
						for (City cityObj : cityList)
							charitySetId.add(cityObj.getObjectId());
					}
				}
				
				if(charitySetId != null && charitySetId.size() != 0){
					for (Long charityId : charitySetId) {
							Charity charityObj = pmcDAO.loadPMCById(charityId);
							if(charityObj != null)
								charityList.add(charityObj);
						}
					}
			}
		}
		
		return charityList;
	}

	@Override
	public List<Admin> loadAdminByProperty(Long propertyId) {
		if(propertyId != null){
			List<Admin> adminList = null;
			List<Address> addressList = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), propertyId);
			if(addressList != null && !addressList.isEmpty()){
				Address addressObj = addressList.get(0);
				if(addressObj != null){
					adminList = new ArrayList<Admin>();
					List<City> tCityList = cityDAO.loadCityByNameAndObjectType(addressObj.getCity(), ObjectType.ADMIN.id());
					if(tCityList != null){
						for (City city : tCityList) {
							Admin adminObj = userAdminDAO.loadAdminById(city.getObjectId(), true);
							if(adminList != null && adminObj != null){
								List<ContactDetails> detailList = contactDetailsDAO.loadById(ObjectType.ADMIN.id(), adminObj.getId());
								if(detailList != null){
									adminObj.setContactDetailsObj(detailList.get(0));
								}
								adminList.add(adminObj);
							}
						}
					}
					return adminList;
				}
			}
			
		}
		return null;
	}

	@Override
	public List<Admin> loadAdminByContractor(Long contractorId) {
		if(contractorId != null){
			List<Admin> adminList = null;
			Set<String> citySet = new HashSet<String>();
			List<City> cityList = cityDAO.loadCityByObjectId(ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorId);
			if(cityList != null && !cityList.isEmpty()){
				for (City city : cityList) {
					citySet.add(city.getCity());
				}
				
				
				if(citySet != null && citySet.size() != 0){
					adminList = new ArrayList<Admin>();
					List<City> tCityList = new ArrayList<City>();
					for (String cityName : citySet) {
						List<City> _list = cityDAO.loadCityByNameAndObjectType(cityName, ObjectType.ADMIN.id());
						if(_list != null){
							tCityList.addAll(_list);
						}
					}
					
					if(tCityList != null){
						for (City city : tCityList) {
							Admin adminObj = userAdminDAO.loadAdminById(city.getObjectId(), true);
							if(adminList != null && adminObj != null){
								List<ContactDetails> detailList = contactDetailsDAO.loadById(ObjectType.ADMIN.id(), adminObj.getId());
								if(detailList != null && detailList.size() != 0){
									adminObj.setContactDetailsObj(detailList.get(0));
								}
								adminList.add(adminObj);
							}
						}
					}
					return adminList;
				}
			}
			
		}
		return null;
	}

	@Override
	public List<Admin> loadAdminByLandlord(Long landlordId) {
		if(landlordId != null){
			List<Admin> adminList = null;
			Set<String> citySet = new HashSet<String>();
			LandLord landlordObj = landLordDAO.loadLandLordById(landlordId);
			if(landlordObj != null){
				List<Property> propertyList = propertyDAO.loadPropertyByLandlord(landlordObj);
				if(propertyList != null){
					
					for (Property propertyObj : propertyList) {
						List<Address> addressList = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), propertyObj.getId());
						if(addressList != null){
							Address addressObj = addressList.get(0);
							if(addressObj != null){
								citySet.add(addressObj.getCity());
							}
						}
					}
					
						if(citySet != null){
							adminList = new ArrayList<Admin>();
							List<City> tCityList = new ArrayList<City>();
							for (String cityName : citySet) {
								List<City> _list = cityDAO.loadCityByNameAndObjectType(cityName, ObjectType.ADMIN.id());
								if(_list != null){
									tCityList.addAll(_list);
								}
							}
							if(tCityList != null){
								for (City city : tCityList) {
									Admin adminObj = userAdminDAO.loadAdminById(city.getObjectId(), true);
									if(adminList != null && adminObj != null){
										List<ContactDetails> detailsList = contactDetailsDAO.loadById(ObjectType.ADMIN.id(), adminObj.getId());
										if(detailsList != null && detailsList.size() != 0){
											adminObj.setContactDetailsObj(detailsList.get(0));
										}
										adminList.add(adminObj);
									}
								}
							}
							return adminList;
						}
				}
			}
		}
		return null;
	}

	@Override
	public List<Admin> loadAdminByPMC(Long charityId) {
		if(charityId != null){
			List<Admin> adminList = null;
			List<City> cityList = cityDAO.loadCityByObjectId(ObjectType.SUPER_PMC.id(), charityId);
			if(cityList != null && !cityList.isEmpty()){
				City cityObj = cityList.get(0);
				if(cityObj != null){
					adminList = new ArrayList<Admin>();
					List<City> tCityList = cityDAO.loadCityByNameAndObjectType(cityObj.getCity(), ObjectType.ADMIN.id());
					if(tCityList != null){
						for (City city : tCityList) {
							Admin adminObj = userAdminDAO.loadAdminById(city.getObjectId(), true);
							List<ContactDetails> detailsList = contactDetailsDAO.loadById(ObjectType.ADMIN.id(), adminObj.getId());
							if(detailsList != null){
								adminObj.setContactDetailsObj(detailsList.get(0));
							}
								adminList.add(adminObj);
						}
					}
					return adminList;
				}
			}
			
		}
		return null;
	}
	
	
	
	@Override
	public List<Property> loadPropertyByPMC(Charity pmcObj){
		List<Property> propertyList = null;
		List<City> tCityList = null;
		Long objectTypeId = null;
		if(pmcObj != null){
			UserLogin uloginObj = pmcObj.getLoginObj();
			if(uloginObj != null){
				objectTypeId = ObjectType.SUPER_PMC.id();
				if(uloginObj.getUserTypeId() == UserType.PMC.id())
					objectTypeId = ObjectType.PMC.id();
			}

			tCityList = cityDAO.loadCityByObjectId(objectTypeId, pmcObj.getId());
			
			if(tCityList != null && !tCityList.isEmpty()){
				propertyList = new ArrayList<Property>();
				for (City city : tCityList) {
					List<Address> addressList = addressDAO.loadAddressByCity(city.getCity(), ObjectType.PROPERTY.id());
					if(addressList != null && !addressList.isEmpty()){
						for (Address addressObj : addressList) {
							Property propertyObj = propertyDAO.loadPropertyById(addressObj.getObjectId());
							if(propertyObj == null)
								continue;
							if(!propertyDAO.isPropertyApproved(propertyObj.getId()))
								continue;
							
							propertyList.add(propertyObj);
							List<Address> tAddressList = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), propertyObj.getId());
							if (tAddressList != null && !tAddressList.isEmpty())
								propertyObj.setAddressObj(tAddressList.get(0));
						}
					}
				}
				
				if(propertyList != null && !propertyList.isEmpty())
					return propertyList;
				
			}
		}
		return null;
	}
	
	
	
	@Override
	public List<AssignModel> loadJobsByAdmin(Admin adminObj){
		List<AssignModel> assignModelList = assignDAO.loadAllAssignModel(null, null);
		List<AssignModel> tAssignModelList = new ArrayList<AssignModel>();
		List<City> cityList = cityDAO.loadCityByObjectId(ObjectType.ADMIN.id(), adminObj.getId());
		if(assignModelList != null && assignModelList.size() != 0){
			for (AssignModel assignModel : assignModelList) {
				Property propertyObj = propertyManager.loadPropertyById(assignModel.getPropertyId());
				if(propertyObj != null){
					Address addressObj = propertyObj.getAddressObj();
					if(addressObj != null){
						if(cityList != null && cityList.size() > 0){
							City cityObj = new City();
								cityObj.setCity(addressObj.getCity());
							if(cityList.contains(cityObj)){
								tAssignModelList.add(assignModel);
							}
						}
					}
				}
			 }
		}
		return tAssignModelList;
	}
	
	
	
	
	
	@Override
	public Admin loadsuperAdmin(){
		UserLogin loginObj = userLoginDAO.findLoginUserByUserName(applicationSettings.getUserName());
		if(loginObj != null){
			Admin adminObj = userAdminDAO.loadAdminByLoginObj(loginObj);
			if(adminObj != null){
					List<Address> addressList = addressDAO.loadAddressById(ObjectType.SUPER_ADMIN.id(), adminObj.getId());
					if(addressList != null && !addressList.isEmpty()){
						adminObj.setAddressObj(addressList.get(0));
					}
					List<ContactDetails> detailsList = contactDetailsDAO.loadById(ObjectType.SUPER_ADMIN.id(), adminObj.getId());
					if(detailsList != null && !detailsList.isEmpty()){
						adminObj.setContactDetailsObj(detailsList.get(0));
					}
			}
			return adminObj;
		}
		return null;
	}
	
	
	
	
	
	@Override
	public boolean validateEmailId(String emailId){
		boolean execStatus = false;
		if(emailId != null && emailId.length() > 0){
			execStatus = contactDetailsDAO.validateEmailId(emailId);
			if(execStatus){
				return !execStatus;
			}
			
			else{
				execStatus = landLordDAO.validateEmailId(emailId);
				if(execStatus){
					return !execStatus;
				}
				execStatus = propertyDeveloperDAO.validateEmailId(emailId);    
				if(execStatus)
					return !execStatus;
				else{
					return !execStatus;
				}
			}
		}
		return execStatus;
	}

	
	@Override
	public boolean validateForgetPasswordEmailId(String emailId){
		boolean execStatus = false;
		if(emailId != null && emailId.length() > 0){
			   execStatus = contactDetailsDAO.validateEmailId(emailId);
			   System.out.println("In contact detailss dao "+execStatus);
				if(execStatus)
				{
					ContactDetails contactDetails=contactDetailsDAO.retrieveContactDetails(emailId);
					System.out.println("contactdetails"+contactDetails.getObjectId());
					//System.out.println("Inside contact detailss dao "+!execStatus);
					Long objectType=contactDetails.getObjectType();
					Long contactId=contactDetails.getObjectId();
					if(objectType==2)
					{
						Contractor contractor=contractorDAO.loadContractorById(contactId);
						String username=contractor.getLoginObj().getUsername();
						String pass=contractor.getLoginObj().getPassword();
						sendMailAtLoginUser(username,pass,emailId);
					}
					else if(objectType==3 || objectType==11)
					{
						Charity charity=pmcDAO.loadPMCById(contactId);
						String username=charity.getLoginObj().getUsername();
						String pass=charity.getLoginObj().getPassword();
						sendMailAtLoginUser(username,pass,emailId);
					}
					else if(objectType==7  || objectType==9)
					{
						Admin admin=userAdminDAO.loadAdminById(contactId,true);
						String username=admin.getLoginObj().getUsername();
						String pass=admin.getLoginObj().getPassword();
						sendMailAtLoginUser(username,pass,emailId);
					}
					return !execStatus;
				}
			
				execStatus = landLordDAO.validateEmailId(emailId);
				if(execStatus){
					System.out.println("In landlored detailss dao "+!execStatus);
					LandLord landlord=landLordDAO.loadUserLoginCredentials(emailId);
					String username=landlord.getLoginObj().getUsername();
					String pass = landlord.getLoginObj().getPassword();
					sendMailAtLoginUser(username,pass,emailId);
					System.out.println("landloard object inside commmanmanager"+landlord);
					System.out.println("landloard Username==="+username);
					System.out.println("landloard Password==="+pass);
					return !execStatus;
				}
			
				execStatus = propertyDeveloperDAO.validateEmailId(emailId);              // return false if emailId already Exist
				if(execStatus){
					System.out.println("In pd detailss dao false"+!execStatus);
					PropertyDeveloper propertyDeveloper=propertyDeveloperDAO.loadUserLoginCredentials(emailId);
					String username=propertyDeveloper.getLoginObj().getUsername();
					String pass = propertyDeveloper.getLoginObj().getPassword();
					sendMailAtLoginUser(username,pass,emailId);
					System.out.println("landloard object inside commmanmanager"+propertyDeveloper);
					System.out.println("landloard Username==="+username);
					System.out.println("landloard Password==="+pass);
					return !execStatus;
				}
				else{
					System.out.println("In pd detailss dao true"+!execStatus);
					return !execStatus;
				}
		}
		return execStatus;
	}
	
	@Override
	public void sendMailAtLoginUser(String username,String pass,String emailId)
	{
		String subject="Email From  Perpetual";
		String message ="Your Credentials are as : " +"\n"  +"UserName : " +username  +"\n" +"Password : "+pass; 
		
		// creates a simple e-mail object
		SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(emailId);
		email.setSubject(subject);
		email.setText(message);
		// sends the e-mail
		mailSender.send(email);	
	}
	
	
	@Override
	public List<PDProperty> loadProposedPropertyByPMC(Charity pmcObj) {
		List<PDProperty> propertyList = null;
		List<City> tCityList = null;
		Long objectTypeId = null;
		
		if(pmcObj == null)
			return null;
		
		UserLogin uloginObj = pmcObj.getLoginObj();
		if(uloginObj != null){
			objectTypeId = ObjectType.SUPER_PMC.id();
			if(uloginObj.getUserTypeId() == UserType.PMC.id())
				objectTypeId = ObjectType.PMC.id();
		}

		tCityList = cityDAO.loadCityByObjectId(objectTypeId, pmcObj.getId());
		if(tCityList != null && !tCityList.isEmpty()){
			propertyList = new ArrayList<PDProperty>();
			for (City city : tCityList) {
				List<Address> addressList = addressDAO.loadAddressByCity(city.getCity(), ObjectType.PD_PROPERTY.id());
				if(addressList != null && !addressList.isEmpty()){
					for (Address addressObj : addressList) {
						PDProperty propertyObj = propertyDeveloperDAO.loadPDPropertyById(addressObj.getObjectId());
						if(propertyObj == null)
							continue;
						
						if(propertyDeveloperDAO.isPropertyApproved(propertyObj.getId())){
							propertyList.add(propertyObj);
							List<Address> tAddressList = addressDAO.loadAddressById(ObjectType.PD_PROPERTY.id(), propertyObj.getId());
							if (tAddressList != null && !tAddressList.isEmpty())
								propertyObj.setAddressObj(tAddressList.get(0));
						
						}
					}
				}
			}
		}
		
		return propertyList;
	}
		
}