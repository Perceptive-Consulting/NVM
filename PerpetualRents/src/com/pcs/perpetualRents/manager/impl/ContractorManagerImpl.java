package com.pcs.perpetualRents.manager.impl;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.swing.SwingUtilities;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.spring3.SpringTemplateEngine;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Admin;
import com.pcs.perpetualRents.business.bean.AssignModel;
import com.pcs.perpetualRents.business.bean.Authorities;
import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.ContactDetails;
import com.pcs.perpetualRents.business.bean.Contractor;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep2;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep3;
import com.pcs.perpetualRents.business.bean.ContractorRegisterationStep4;
import com.pcs.perpetualRents.business.bean.Documents;
import com.pcs.perpetualRents.business.bean.Expertise;
import com.pcs.perpetualRents.business.bean.File;
import com.pcs.perpetualRents.business.bean.FunctionalityCostMatrix;
import com.pcs.perpetualRents.business.bean.PerpetualCity;
import com.pcs.perpetualRents.business.bean.Property;
import com.pcs.perpetualRents.business.bean.TurnOverDetails;
import com.pcs.perpetualRents.business.bean.UserLogin;
import com.pcs.perpetualRents.common.bean.ApplicationSettings;
import com.pcs.perpetualRents.dao.AddressDAO;
import com.pcs.perpetualRents.dao.AssignDAO;
import com.pcs.perpetualRents.dao.CityDAO;
import com.pcs.perpetualRents.dao.ContactDetailsDAO;
import com.pcs.perpetualRents.dao.ContractorDAO;
import com.pcs.perpetualRents.dao.DocumentsDAO;
import com.pcs.perpetualRents.dao.ExpertiseDAO;
import com.pcs.perpetualRents.dao.IdentityGeneratorDAO;
import com.pcs.perpetualRents.dao.PropertyDAO;
import com.pcs.perpetualRents.dao.UserAdminDAO;
import com.pcs.perpetualRents.dao.UserLoginDAO;
import com.pcs.perpetualRents.enm.CompanyType;
import com.pcs.perpetualRents.enm.ContractorFunctionality;
import com.pcs.perpetualRents.enm.IdentityGeneratorObjective;
import com.pcs.perpetualRents.enm.MailEventType;
import com.pcs.perpetualRents.enm.ObjectType;
import com.pcs.perpetualRents.enm.Status;
import com.pcs.perpetualRents.enm.UserType;
import com.pcs.perpetualRents.manager.CommonManager;
import com.pcs.perpetualRents.manager.ContractorManager;
import com.pcs.perpetualRents.manager.FileManager;
import com.pcs.perpetualRents.manager.MailEventManager;
import com.pcs.perpetualRents.util.mail.ContractorMailUtility;

@Service
@Transactional
public class ContractorManagerImpl implements ContractorManager{
	
	private static Logger logger = ApplicationSettings.getLogger(ContractorManagerImpl.class.getName());

	@Autowired
	private UserLoginDAO userLoginDAO;
	@Autowired
	private ContractorDAO contractorDAO;
	@Autowired
	private CityDAO cityDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private ExpertiseDAO expertiseDAO;
	@Autowired
	private ContactDetailsDAO contactDetailsDAO;
	@Autowired
	private DocumentsDAO documentsDAO;
	@Autowired
	private IdentityGeneratorDAO gereratorDAO;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private AssignDAO assignDAO;
	@Autowired
	private PropertyDAO propertyDAO;
	@Autowired
	private ApplicationSettings applicationSettings;
	@Autowired
	private JavaMailSender mailSenderObj;
	@Autowired
	private SpringTemplateEngine templateEngine;
	@Autowired
	private MailEventManager mailEventManager;
	@Autowired
	private CommonManager commonManager;
	@Autowired
	private UserAdminDAO userAdminDAO;
	
	
	@Override
	public boolean createContractor(Contractor infoObj, Long createdUserId) {
		if(infoObj == null)
			return false;
		
		UserLogin loginObj = infoObj.getLoginObj();
		ContactDetails contactDetailsObj = infoObj.getContactDetailsObj();
		
		if(loginObj != null){
			loginObj.setUserTypeId(UserType.CONTRACTOR.id());
			Long loginId = userLoginDAO.createLoginUser(loginObj, createdUserId);
						   userLoginDAO.createAuthority(new Authorities(loginObj.getUsername(), "ALL"));
						   
			   if(loginId != null){
				   infoObj.setUserLoginId(loginId);
				   String uniqueReference = gereratorDAO.getUniqueReference(IdentityGeneratorObjective.CONTRACTOR_IDENTITY.value());
				   infoObj.setUniqueReference(uniqueReference);
				   infoObj.setStatusId((short)Status.UNAPPROVED.id());
					Long contractorId = contractorDAO.createContractor(infoObj, createdUserId);
					if(contractorId != null){
						infoObj.setId(contractorId);
						if(contactDetailsObj != null){
							contactDetailsObj.setObjectType(ObjectType.CONTRACTOR.id());
							contactDetailsObj.setObjectId(contractorId);
							contactDetailsDAO.createContactDetails(contactDetailsObj, createdUserId);
						}
						List<TurnOverDetails> turnOverList = infoObj.getTurnoverDetails();
						System.out.println(turnOverList);
						if(turnOverList != null){
							for (TurnOverDetails turnOverObj : turnOverList) {
								turnOverObj.setContractorId(contractorId);
								contractorDAO.saveTurnover(turnOverObj);
							}
						}
						List<Integer> funIdList = infoObj.getFunctionality();
						if(funIdList != null){
							Expertise expObj = null;
							for (Integer _tempId : funIdList) {
								 expObj = new Expertise();
								 expObj.setContractorId(contractorId);
									expObj.setFunctionalityId(_tempId.shortValue());
									expertiseDAO.createExpertise(expObj, createdUserId);
							}
						}
						List<Integer> citiesIdList =  infoObj.getCities();
						if(citiesIdList != null){
							for (Integer tCityId : citiesIdList) {
								PerpetualCity tCityObj = cityDAO.loadPerpetualCityById(Long.valueOf(tCityId));
								if(tCityObj != null){
									cityDAO.createCity(new City(tCityObj.getCity(), tCityObj.getId(), ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorId));
								}
							}
						}
						SwingUtilities.invokeLater(new ContractorMailUtility(infoObj, this, applicationSettings, mailSenderObj, MailEventType.REGISTER, mailEventManager, templateEngine, commonManager));
						return true;
					}
			   }
		}
		
		return false;
	}
	
	@Override
	public boolean saveContractorRegisterationStep2(ContractorRegisterationStep2 infoObj, Long createdUserId){
		try{
			if(infoObj == null)
				return false;
			
			Address registeredAddressObj = infoObj.getOfficeAddObj();
			if(registeredAddressObj != null){
				Long rAddId = addressDAO.createAddress(registeredAddressObj, createdUserId);
				if(rAddId != null){
					infoObj.setOfficeAddressId(rAddId);
				}
			}
			Address corresPondenceOfficeAddObj = infoObj.getCorrespondenceAddObj();
			if(corresPondenceOfficeAddObj != null){
				Long cAddId = addressDAO.createAddress(corresPondenceOfficeAddObj, createdUserId);
				if(cAddId != null){
					infoObj.setCorrespondenceAddressId(cAddId);
				}
			}
			
			Long id = contractorDAO.saveContractorRegisterationStep2(infoObj, createdUserId);
			if(id != null)
				return true;
			
			return false;
		
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean saveContractorRegisterationStep3(ContractorRegisterationStep3 infoObj, Long createdUserId){
		if(infoObj == null)
			return false;
		
		List<FunctionalityCostMatrix> lCostSheet = infoObj.getCostSheet();
		File writtenPolciyFile = infoObj.getWrittenHealthPolicyFile();
		if(writtenPolciyFile != null){
			Long writtenPolicyfileId = fileManager.saveFile(writtenPolciyFile, createdUserId);
			if(writtenPolicyfileId != null){
				infoObj.setWrittenHealthPolicyFileId(writtenPolicyfileId);
			}
		}
		File equalityPolciyFile = infoObj.getEqualityPolicyFile();
		if(equalityPolciyFile != null){
			Long equalityPolciyFileId = fileManager.saveFile(equalityPolciyFile, createdUserId);
			if(equalityPolciyFileId != null){
				infoObj.setEqualityPolicyFileId(equalityPolciyFileId);
			}
		}
		Long id = contractorDAO.saveContractorRegisterationStep3(infoObj, createdUserId);
		if(id != null){
			if(lCostSheet != null){
				contractorDAO.deleteFunctionalityCostMatrix(infoObj.getContractorId());
				for (FunctionalityCostMatrix tCostObj : lCostSheet) {
					tCostObj.setObjectId(id);
					tCostObj.setContractorId(infoObj.getContractorId());
					contractorDAO.saveFunctionalityCostMatrix(tCostObj);
				}
				return true;
			}
		}
		return false;
	}
	
	public boolean saveContractorRegisterationStep4(ContractorRegisterationStep4 infoObj, Long createdUserId){
		if(infoObj == null)
			return false;
		
		Long id = contractorDAO.saveContractorRegisterationStep4(infoObj, createdUserId);
		if(infoObj.getContractorId() != null){
			Contractor conObj = contractorDAO.loadContractorById(infoObj.getContractorId());
			if(conObj != null && id != null){
				return true;
			}
		}
		if(id != null){}
		return false;
	}
	
	@Override
	public Contractor getContractorByUserLogin(UserLogin loginObj) {
			try{
				Contractor contractorObj = null;
				if(loginObj != null){
					 contractorObj = contractorDAO.findContractorByLoginId(loginObj.getId());
					if(contractorObj != null){
						List<Expertise> expertiseList = expertiseDAO.findByContractorId(contractorObj.getId());
						if(expertiseList != null && !expertiseList.isEmpty()){
							contractorObj.setExpertiseList(expertiseList);
						}
						List<ContactDetails> detailsList = contactDetailsDAO.loadById(ObjectType.CONTRACTOR.id(), contractorObj.getId());
						if(detailsList != null && !detailsList.isEmpty()){
							contractorObj.setContactDetailsObj(detailsList.get(0));
						}
						List<TurnOverDetails> tList = contractorDAO.loadTurnOver(contractorObj.getId());
						if(tList != null){
							contractorObj.setTurnoverDetails(tList);
						}
						List<City> lCities = cityDAO.loadCityByObjectId(ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorObj.getId());
						if(lCities != null){
							contractorObj.setCityList(lCities);
						}
						ContractorRegisterationStep2 conStep2Obj = contractorDAO.loadContractorStep2Info(contractorObj.getId());
						if(conStep2Obj != null){
							Address officeAddressObj = addressDAO.loadAddressById(conStep2Obj.getOfficeAddressId());
							if(officeAddressObj != null){
								contractorObj.setOfficeAddressObj(officeAddressObj);
							}
						}
					}
				}
				return contractorObj;
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}
	}
	
	@Override
	public Contractor loadContractorById(Long id) {
		Contractor contractorObj = null;
		if(id != null){
			 contractorObj = contractorDAO.loadContractorById(id);
			if(contractorObj != null){
				List<Expertise> expertiseList = expertiseDAO.findByContractorId(contractorObj.getId());
				if(expertiseList != null && !expertiseList.isEmpty()){
					contractorObj.setExpertiseList(expertiseList);
				}
				List<ContactDetails> detailsList = contactDetailsDAO.loadById(ObjectType.CONTRACTOR.id(), id);
				if(detailsList != null){
					contractorObj.setContactDetailsObj(detailsList.get(0));
				}
				List<TurnOverDetails> turnOverDetails = contractorDAO.loadTurnOver(contractorObj.getId());
				if(turnOverDetails != null){
					contractorObj.setTurnoverDetails(turnOverDetails);
				}
				List<City> cities = cityDAO.loadCityByObjectId(ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorObj.getId());
				if(cities != null){
					contractorObj.setCityList(cities);
				}
			}
		}
		return contractorObj;
		
	}
	
	public ContractorRegisterationStep2 loadContractorStep2Info(Long contractorId){
		ContractorRegisterationStep2 conObj =  contractorDAO.loadContractorStep2Info(contractorId);
		if(conObj != null){
			Address officeAddObj = addressDAO.loadAddressById(conObj.getOfficeAddressId());
			if(officeAddObj != null){
				conObj.setOfficeAddObj(officeAddObj);
			}
			Address correspondenceAddObj = addressDAO.loadAddressById(conObj.getCorrespondenceAddressId());
			if(correspondenceAddObj != null){
				conObj.setCorrespondenceAddObj(correspondenceAddObj);
			}
			return conObj;
		}
		return null;
	}
	
	public ContractorRegisterationStep3 loadContractorStep3Info(Long contractorId){
		ContractorRegisterationStep3 conObj = contractorDAO.loadContractorStep3Info(contractorId);
		if(conObj != null){
			if(conObj.getWrittenHealthPolicyFileId() != null){
				File wFileObj = fileManager.loadFileById(conObj.getWrittenHealthPolicyFileId());
				if(wFileObj != null){
					conObj.setWrittenHealthPolicyFile(wFileObj);
					conObj.setWrittenPolicyFileName(wFileObj.getFileName());
				}
				File eFileObj = fileManager.loadFileById(conObj.getEqualityPolicyFileId());
				if(eFileObj != null){
					conObj.setEqualityPolicyFile(eFileObj);
					conObj.setEqualityPolicyFileName(eFileObj.getFileName());
				}
			}
			List<FunctionalityCostMatrix> costList = contractorDAO.loadFunctionalityCostMatrix(contractorId);
			if(costList != null){
				conObj.setCostSheet(costList);
			}
			
			List<Expertise> expertiseList = expertiseDAO.loadExpertiseByContractorId(contractorId);
			if(expertiseList != null && expertiseList.size() != 0){
				conObj.setExpertiseList(expertiseList);
			}
		}
		return conObj;
	}
	
	public ContractorRegisterationStep4 loadContractorStep4Info(Long contractorId){
		return contractorDAO.loadContractorStep4Info(contractorId);
	}
	
	@Override
	public List<Status> loadStatus(Long assignModelId){
		AssignModel assignModel = assignDAO.loadAssignModelById(assignModelId);
			List<Status> statusList = new ArrayList<Status>();
			if(assignModel != null){
				if(Status.ASSIGNED.id() == assignModel.getStatusId()){
					statusList.add(Status.ACCEPTED);
					statusList.add(Status.REJECTED);
				}else if(Status.ACCEPTED.id() == assignModel.getStatusId()){
					statusList.add(Status.UNDEFINED);
					statusList.add(Status.ON_WORK);
					statusList.add(Status.PARTIAL_COMPLETE);
					statusList.add(Status.COMPLETE);
				}else if(Status.ON_WORK.id() == assignModel.getStatusId()){
					statusList.add(Status.ON_WORK);
					statusList.add(Status.PARTIAL_COMPLETE);
					statusList.add(Status.COMPLETE);
				}else if(Status.PARTIAL_COMPLETE.id() == assignModel.getStatusId()){
					statusList.add(Status.PARTIAL_COMPLETE);
					statusList.add(Status.COMPLETE);
				}else if(Status.COMPLETE.id() == assignModel.getStatusId()){
					statusList.add(Status.PARTIAL_COMPLETE);
					statusList.add(Status.COMPLETE);
				}
			}
		return statusList;
	}
	
	
	@Override
	public boolean updateContractorDetails(Contractor contractorObj, Long modifiedUserId){
		
		return false;
	}
	
	@Override
	public boolean updateContractorFiles(Long lastFileId, File fileObj, Long userId){
			Long fileId = fileManager.saveFile(fileObj, userId);
			if(fileId != null){
				fileObj.setId(fileId);
				fileManager.deleteFileById(lastFileId);
			}
			
		return true;
	}
	
	public List<Contractor> loadContractorByExpertise(ContractorFunctionality functionality, Long propertyId){
		try{
			List<Contractor> contList = new ArrayList<Contractor>();
			List<Address> addressList = addressDAO.loadAddressById(ObjectType.PROPERTY.id(), propertyId);
			
			if(addressList != null){
				for (Address _addressObj : addressList) {
					List<Contractor> cList = contractorDAO.loadContractorByExpertise(functionality, _addressObj.getCity());
					if(cList != null && !cList.isEmpty()){
						contList.addAll(cList);
					}
				}
			}
			
			if(contList != null && !contList.isEmpty())
				return contList;
			
			return null;
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Expertise loadExpertiseByContractorAndCity(Long contractorId, Long functionalityId){
		Expertise expObj = expertiseDAO.loadExpertiseByContractorAndCity(contractorId, functionalityId);
		if(expObj != null)
			return expObj;
		
		return null;
	}
	
	@Override
	public List<Contractor> loadAll(Integer start, Integer limit, UserLogin loginObj) {
		List<Contractor> contractorList = null;
		if(loginObj != null){
			if(loginObj.getUserTypeId() == UserType.SUPER_ADMIN.id()){
				contractorList = contractorDAO.loadAll(start, limit);
			}else if(loginObj.getUserTypeId() == UserType.ADMIN.id()){
				Admin adminObj = userAdminDAO.loadAdminByLoginObj(loginObj);
					if(adminObj != null){
						contractorList = commonManager.loadContractorByAdmin(adminObj);
					}
			}
			
			if(contractorList != null && !contractorList.isEmpty()){
				for (Contractor obj : contractorList) {
					List<ContactDetails> details = contactDetailsDAO.loadById(ObjectType.CONTRACTOR.id(), obj.getId());
					if(details != null){
						obj.setContactDetailsObj(details.get(0));
					}
					List<Expertise> expertiseList = expertiseDAO.findByContractorId(obj.getId());
					if(expertiseList != null && !expertiseList.isEmpty()){
						obj.setExpertiseObj(expertiseList.get(0));
					}
					ContractorRegisterationStep2 conStepObj = contractorDAO.loadContractorStep2Info(obj.getId());
					if(conStepObj != null){
						if(conStepObj.getCompanyTypeId() != null){
							obj.setCompanyTypeStr(CompanyType.get(conStepObj.getCompanyTypeId()).value());
						}else{
							obj.setCompanyTypeStr(conStepObj.getOtherCompanyType());
						}
						
					}
				}
				return contractorList;
			}
		}
		return null;

	}
	
	@Override
	public List<Contractor> loadContractorsByCity(Integer start, Integer limit, String city) {
		List<City> cityList = cityDAO.loadCityByNameAndObjectType(city, ObjectType.CONTRACTOR_FUNCTIONALITY.id());
		List<Contractor> contractorList = null;
		if(cityList != null){
			contractorList = new ArrayList<Contractor>();
			for (City cityObj : cityList) {
				Contractor cObj = contractorDAO.loadContractorById(cityObj.getObjectId());
				if(cObj != null){
					contractorList.add(cObj);
				}
			}
		}
		return contractorList;
	}
	
	@Override
	public List<Property> loadJobsByStatus(Long contractorId, Long... statusId){
		List<AssignModel> assignList = assignDAO.loadAssignedToValues(ObjectType.CONTRACTOR.id(), contractorId, statusId);
		List<Property> properties =  new ArrayList<Property>();
		if(assignList != null && !assignList.isEmpty()){
			for (AssignModel assignModel : assignList) {
				Property propertyObj = propertyDAO.loadPropertyById(assignModel.getPropertyId());
				
				if(propertyObj != null){
					propertyObj.setAssignModel(assignModel);
					properties.add(propertyObj);
				}
			}
		}
		if(properties != null && !properties.isEmpty())
			return properties;
			
		return null;
	}
	
	@Override
	public List<Contractor> contractorList(Integer start, Integer limit) {
		List<Contractor> contractorList = contractorDAO.loadAll(start, limit);
		for (Contractor _obj : contractorList) {
			if(_obj !=  null){
				List<ContactDetails> details = contactDetailsDAO.loadById(ObjectType.CONTRACTOR.id(), _obj.getId());
				if(details != null){
					_obj.setContactDetailsObj(details.get(0));
				}
			}
		}
		return contractorList;
	}
	
	@Override
	public List<AssignModel> loadAssignModelByContractorAndProperty(Long contractorId, Long propertyId){
		return assignDAO.loadAssignedByPropertyAndAssignedTo(ObjectType.CONTRACTOR.id(), contractorId, propertyId);
	}
	
	@Override
	public boolean deleteContractor(Contractor contractorObj, Long objectType) {
		boolean status = false;
		Long objId = contractorObj.getId();
		if(objId!=null){
			status = contractorDAO.deleteContractor(objId);
			if(status){
				status = addressDAO.deleteAddress(objectType, objId);
				expertiseDAO.deleteExpertiseObj(contractorObj.getId());
				status = status && userLoginDAO.deleteLoginUser(contractorObj.getLoginObj().getId());
			}
		}
		return status;
	}
	
	@Override
	public List<PerpetualCity> loadAllPerpetualCity(){
		List<PerpetualCity> cityList = cityDAO.loadAllPerpetualCity();
		
		if(cityList != null && !cityList.isEmpty())
			return cityList;
		
		return null;
	}
	
	@Override
	public boolean updateAssignModelStatus(Long assignModelId, Long statusId, Long userId, String remarks){
			return assignDAO.updateStatusById(assignModelId, statusId, userId, remarks);
		}
	
	@Override
	public boolean uploadFiles(final Documents docObj , final Long userId){
		try{
			if(docObj != null){
				File fileObj = docObj.getFileObj();
				if(fileObj != null){
					Long fileId = fileManager.saveFile(fileObj, userId);
					if(fileId != null){
						docObj.setFileId(fileId);
						docObj.setFileName(fileObj.getFileName());
						Long docId =  documentsDAO.saveDocuments(docObj, userId);
						if(docId != null)
							return true;
					}
				}
			}
			
			return false;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println(e.toString());
			
			return false;
		}
	}
	
	@Override
	public List<File> loadContracotrFile() {
		try{
			java.io.File folderPath = new java.io.File(applicationSettings.getContractorDocumentFolderPath());
			if(folderPath.canRead()){
				String files[] = folderPath.list();
				if(files != null){
					if(files.length == 0){
						logger.severe("No Files found at path " + applicationSettings.getContractorDocumentFolderPath());
						return null;
					}else if(files.length == 1){
						java.io.File contractorFileObj = new java.io.File(applicationSettings.getContractorDocumentFolderPath() + java.io.File.separator + files[0]);
						logger.info("File path : " + contractorFileObj.getPath());
						if(contractorFileObj != null && contractorFileObj.canRead()){
							List<File> fileList = new ArrayList<File>();
							File fileObj = new File();
							ByteArrayOutputStream bOut = new ByteArrayOutputStream();
							FileInputStream fis = new FileInputStream(contractorFileObj);
							IOUtils.copy(fis, bOut);
							fileObj.setFileData(bOut.toByteArray());
							fileObj.setFileName(contractorFileObj.getName());
							
							System.out.println(fileObj.toString());
							
							fileList.add(fileObj);
							
							return fileList;
						}
					}else{
						List<File> fileList = new ArrayList<File>();
						for (String fileName : files) {
							java.io.File adplFileObj = new java.io.File(applicationSettings.getContractorDocumentFolderPath() + java.io.File.separator + fileName);
							if(adplFileObj != null && adplFileObj.canRead()){
								File fileObj = new File();
								ByteArrayOutputStream bOut = new ByteArrayOutputStream();
								FileInputStream fis = new FileInputStream(adplFileObj);
								IOUtils.copy(fis, bOut);
								fileObj.setFileData(bOut.toByteArray());
								fileObj.setFileName(adplFileObj.getName());
								
								fileList.add(fileObj);
							}
						}
						return fileList;
					}
				}
			}else{
				System.out.println("Unable to read the Contractor Folder path " + applicationSettings.getContractorDocumentFolderPath());
				logger.severe("Unable to read the Contractor Folder path " + applicationSettings.getContractorDocumentFolderPath());
			}
		}catch(IOException fne){
			return null;
		}
		return null;
	}
	
	@Override
	public List<Documents> loadDocumentsByContractorsJob(final Long assignModelId){
		AssignModel assignModel = assignDAO.loadAssignModelById(assignModelId);
		if(assignModel != null){
			List<Documents> documents = documentsDAO.loadDocumentsByContractorFunctionalityAndPropertyId(assignModel.getAssignToId(), assignModel.getFunctionalityId(), assignModel.getPropertyId());
			if(documents != null && !documents.isEmpty()){
				for (Documents _docObj : documents) {
				 File fileObj = fileManager.loadFileById(_docObj.getFileId());
				 if(fileObj != null){
					 _docObj.setFileObj(fileObj);
				 }
				}
				return documents;
			}
		}
		return null;
	}
	
	@Override
	public void approveContractor(Contractor contractorObj, Long userId) {
		contractorDAO.approveContractor(contractorObj, userId);
	}

	@Override
	public void disapproveContractor(Contractor contractorObj, Long userId) {
		contractorDAO.disapproveContractor(contractorObj, userId);
	}

	public JavaMailSender getMailSenderObj() {
		return mailSenderObj;
	}

	public void setMailSenderObj(JavaMailSender mailSenderObj) {
		this.mailSenderObj = mailSenderObj;
	}

	@Override
	public String resetPassword(Long id) {
		Contractor contractorObj = loadContractorById(id);
		int status = 0;
		if(contractorObj != null){
		UserLogin loginObj = contractorObj.getLoginObj();
		if(loginObj != null){
			loginObj.createPassword();
			status = contractorDAO.updatePassword(loginObj.getId(), loginObj.getPassword());
			if(status > 0){
				Contractor contractor = loadContractorById(id);
				if(contractor != null){
					UserLogin userLoginObj = contractor.getLoginObj();
					if(userLoginObj != null){
						return userLoginObj.getPassword();
					}
				}
			}
		}
		}
		return null;
	}
	
	@Override
	public boolean update(String tableName, String[] fields, String[] values, String[] whereCondition, String[] whereValues, Long contractorId){
		 if(tableName.equalsIgnoreCase(ContactDetails.TABLE_NAME))
			contactDetailsDAO.update(tableName, fields, values, whereCondition, whereValues);
		 else{
			 if(Contractor.TABLE_NAME.equalsIgnoreCase(tableName)){
					  contractorDAO.update(tableName, fields, values, whereCondition, whereValues);
			 }else{
				  boolean execStatus =  contractorDAO.checkContractorData(tableName, Long.valueOf(whereValues[0]));
				  if(execStatus){
					  contractorDAO.update(tableName, fields, values, whereCondition, whereValues);
				  }else{
					  contractorDAO.insertContractorData(tableName, fields, values,"contractorId",contractorId);
				  }
			 }
		 }
		return true;
	}
	
	@Override
	public boolean updateAddress(Address addressObj, Long userId, Long contractorId){
		if(addressObj != null){
			if(addressObj.getId() != null){
				return addressDAO.updateAddressById(addressObj, userId);
			}else{
				Long addressId = addressDAO.createAddress(addressObj, userId);
				if(addressId != null){
					if(addressObj.getObjectType() == 1){
						boolean execStatus = contractorDAO.checkContractorData(ContractorRegisterationStep2.TABLE_NAME, contractorId);
						if(execStatus){
							contractorDAO.update(ContractorRegisterationStep2.TABLE_NAME, new String[]{ContractorRegisterationStep2.OFFICE_ADDRESS_ID},  new String[]{""+addressId},  new String[]{ContractorRegisterationStep2.CONTRACTOR_ID},  new String[]{""+contractorId});
						}else{
							contractorDAO.insertContractorData(ContractorRegisterationStep2.TABLE_NAME, new String[]{ContractorRegisterationStep2.OFFICE_ADDRESS_ID},  new String[]{""+addressId}, "contractorId", contractorId);
						}
						
						return true;
					}else if(addressObj.getObjectType() == 2){
						boolean execStatus = contractorDAO.checkContractorData(ContractorRegisterationStep2.TABLE_NAME, contractorId);
						if(execStatus){
							contractorDAO.update(ContractorRegisterationStep2.TABLE_NAME, new String[]{ContractorRegisterationStep2.CORRESPONDENCE_ADDRESS_ID},  new String[]{""+addressId},  new String[]{ContractorRegisterationStep2.CONTRACTOR_ID},  new String[]{""+contractorId});
						}else{
							contractorDAO.insertContractorData(ContractorRegisterationStep2.TABLE_NAME, new String[]{ContractorRegisterationStep2.CORRESPONDENCE_ADDRESS_ID},  new String[]{""+addressId}, "contractorId", contractorId);
						}
						return true;
					}
				}
			}
		}
		return false;
	}
	
	@Override
	public boolean updateFunctionaltyCostMatrix(List<FunctionalityCostMatrix> costMatrixList, Long contractorId){
		if(costMatrixList != null){
			if(costMatrixList.get(0).getContractorId() != null){
				contractorDAO.deleteFunctionalityCostMatrix(costMatrixList.get(0).getContractorId());
				for (FunctionalityCostMatrix functionalityCostMatrix : costMatrixList) {
					contractorDAO.saveFunctionalityCostMatrix(functionalityCostMatrix);
				}
				return true;
			}else{
				boolean execStatus = contractorDAO.checkContractorData(ContractorRegisterationStep3.TABLE_NAME, contractorId);
					if(execStatus){
						contractorDAO.deleteFunctionalityCostMatrix(contractorId);
						for (FunctionalityCostMatrix costObj : costMatrixList) {
							costObj.setObjectId(0l);
							costObj.setContractorId(contractorId);
							contractorDAO.saveFunctionalityCostMatrix(costObj);
						}
				}else{
					contractorDAO.deleteFunctionalityCostMatrix(contractorId);
					Long objectId = contractorDAO.insertContractorData(ContractorRegisterationStep3.TABLE_NAME, null, null, ContractorRegisterationStep3.CONTRACTOR_ID, contractorId);
					if(objectId != null){
						for (FunctionalityCostMatrix costObj : costMatrixList) {
							costObj.setObjectId(objectId);
							costObj.setContractorId(contractorId);
							contractorDAO.saveFunctionalityCostMatrix(costObj);
						}
					}
				}
			}
		}
			
		return false;
	}
	
	@Override
	public Long insertContractorData(String tableName, String[] fields, String[] values, String contractorField, Long contractorId){
		return contractorDAO.insertContractorData(tableName, fields, values, contractorField, contractorId);
	}

	@Override
	public boolean updateContractorFunctionality(List<Expertise> functionalities , Long contractorId) {
			boolean execStatus = true;
			Long id = null;
			expertiseDAO.deleteExpertiseObj(contractorId);
			if(functionalities != null && functionalities.size() != 0){
				for (Expertise expertise : functionalities) {
					id = expertiseDAO.createExpertise(expertise,  contractorId);
					if(id == null){
						execStatus = false;
						break;
					}else{
						continue;
					}
				}
			}
			return execStatus;
	}
	
	@Override
	public boolean updateContractorCities(String[] cityIdArr , Long contractorId) {
			boolean execStatus = true;
			Long id = null;
			cityDAO.deleteCityByObjectType(ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorId);
			if(cityIdArr != null && cityIdArr.length != 0){
				PerpetualCity pCityObj = null;
				for (String cityId : cityIdArr) {
					pCityObj = cityDAO.loadPerpetualCityById(Long.valueOf(cityId));
					if(pCityObj != null){
						id = cityDAO.createCity(new City(pCityObj.getCity(), pCityObj.getId(), ObjectType.CONTRACTOR_FUNCTIONALITY.id(), contractorId));
						if(id == null){
							execStatus = false;
							break;
						}else{
							continue;
						}
					}
				}
			}
			return execStatus;
	}
	
}
