package com.pcs.perpetualRents.business.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

import com.pcs.perpetualRents.common.bean.ApplicationSettings;


public class PropertyMarketingInformation implements Serializable{

	private static final long serialVersionUID = 1L;
	public static final String TABLE_NAME = "tbl_" + ApplicationSettings.APP_NAME + "_" + PropertyMarketingInformation.class.getSimpleName().toLowerCase();
	
	public static final String ID = "id";
	public static final String AVAILABILITY = "availability";
	public static final String RENT_AMOUNT = "rentAmount";
	public static final String PROPERTY_TYPE = "propertyType";
	public static final String PROPERTY_OTHER_TYPE = "propertyOtherType";
	public static final String RENT_PERIOD = "rentPeriod";
	public static final String RENT_REASON_COMMENT = "rentReasonComment";
	public static final String BEDROOM_COUNT = "bedroomCount";
	public static final String BATHROOM_COUNT = "bathroomCount";
	public static final String SEPERATE_WC = "seprateWC";
	public static final String FURNISHED = "furnished";
	public static final String FLOORING = "flooring";
	public static final String FLOORING_COMMENTS = "flooringComments";
	public static final String CURTAIN = "curtains";
	public static final String CURTAIN_COMMENTS = "curtainsComments";
	public static final String REAR_GARDEN = "rearGarden";
	public static final String REAR_GARDEN_COMMENTS = "rearGardenComments";
	public static final String FRONT_GARDEN = "frontGarden";
	public static final String FRONT_GARDEN_COMMENTS = "frontGardenComments";
	public static final String WHEEL_CHAIR_ACCESS = "wheelChairAccess";
	public static final String WHEEL_CHAIR_ACCESS_COMMENTS = "wheelChairAccessComments";
	public static final String EXTRA_STAIR = "extraStairs";
	public static final String EXTRA_STAIR_COMMENTS = "extraStairsComments";
	public static final String OTHER_PROPERTY_INFORMATION = "otherPropertyInformation";
	public static final String PROPERTY_ID = "propertyId";
	
	private Long id;
	private String availability;
	private String rentAmount;
	private String propertyType;
	private String propertyOtherType;
	private String rentPeriod;
	private String rentReasonComment;
	private Short bedroomCount;
	private Short bathroomCount;
	private Short seprateWC;
	private boolean furnished;
	private boolean flooring;
	private String  flooringComments;
	private boolean curtains;
	private String  curtainsComments;
	private boolean frontGarden;
	private String  frontGardenComments;
	private boolean rearGarden;
	private String  rearGardenComments;
	private boolean wheelChairAccess;
	private String  wheelChairAccessComments;
	private boolean extraStairs;
	private String  extraStairsComments;
	private String otherPropertyInformation;
	private Long propertyId;
	
	private List<File> files;
	
	public List<File> getFiles() {
		if(this.files == null)
			files = new ArrayList<File>();
		
		return files;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}
	public String getRentAmount() {
		return rentAmount;
	}
	public void setRentAmount(String rentAmount) {
		this.rentAmount = rentAmount;
	}
	public String getPropertyType() {
		return propertyType;
	}
	public void setPropertyType(String propertyType) {
		this.propertyType = propertyType;
	}
	public String getPropertyOtherType() {
		return propertyOtherType;
	}
	public void setPropertyOtherType(String propertyOtherType) {
		this.propertyOtherType = propertyOtherType;
	}
	public String getRentPeriod() {
		return rentPeriod;
	}
	public void setRentPeriod(String rentPeriod) {
		this.rentPeriod = rentPeriod;
	}
	
	public String getRentReasonComment() {
		return rentReasonComment;
	}
	public void setRentReasonComment(String rentReasonComment) {
		this.rentReasonComment = rentReasonComment;
	}
	public Short getBedroomCount() {
		return bedroomCount;
	}
	public void setBedroomCount(Short bedroomCount) {
		this.bedroomCount = bedroomCount;
	}
	public Short getBathroomCount() {
		return bathroomCount;
	}
	public void setBathroomCount(Short bathroomCount) {
		this.bathroomCount = bathroomCount;
	}
	public Short getSeprateWC() {
		return seprateWC;
	}
	public void setSeprateWC(Short seprateWC) {
		this.seprateWC = seprateWC;
	}
	public boolean isFurnished() {
		return furnished;
	}
	public void setFurnished(boolean furnished) {
		this.furnished = furnished;
	}
	public boolean isFlooring() {
		return flooring;
	}
	public void setFlooring(boolean flooring) {
		this.flooring = flooring;
	}
	public boolean isCurtains() {
		return curtains;
	}
	public void setCurtains(boolean curtains) {
		this.curtains = curtains;
	}
	public boolean isFrontGarden() {
		return frontGarden;
	}
	public void setFrontGarden(boolean frontGarden) {
		this.frontGarden = frontGarden;
	}
	public boolean isRearGarden() {
		return rearGarden;
	}
	public void setRearGarden(boolean rearGarden) {
		this.rearGarden = rearGarden;
	}
	public boolean isWheelChairAccess() {
		return wheelChairAccess;
	}
	public void setWheelChairAccess(boolean wheelChairAccess) {
		this.wheelChairAccess = wheelChairAccess;
	}
	public boolean isExtraStairs() {
		return extraStairs;
	}
	public void setExtraStairs(boolean extraStairs) {
		this.extraStairs = extraStairs;
	}
	public String getExtraStairsComments() {
		return extraStairsComments;
	}
	public void setExtraStairsComments(String extraStairsComments) {
		this.extraStairsComments = extraStairsComments;
	}
	public String getOtherPropertyInformation() {
		return otherPropertyInformation;
	}
	public void setOtherPropertyInformation(String otherPropertyInformation) {
		this.otherPropertyInformation = otherPropertyInformation;
	}
	public Long getPropertyId() {
		return propertyId;
	}
	public void setPropertyId(Long propertyId) {
		this.propertyId = propertyId;
	}
	public String getFlooringComments() {
		return flooringComments;
	}
	public void setFlooringComments(String flooringComments) {
		this.flooringComments = flooringComments;
	}
	public String getCurtainsComments() {
		return curtainsComments;
	}
	public void setCurtainsComments(String curtainsComments) {
		this.curtainsComments = curtainsComments;
	}
	public String getFrontGardenComments() {
		return frontGardenComments;
	}
	public void setFrontGardenComments(String frontGardenComments) {
		this.frontGardenComments = frontGardenComments;
	}
	public String getRearGardenComments() {
		return rearGardenComments;
	}
	public void setRearGardenComments(String rearGardenComments) {
		this.rearGardenComments = rearGardenComments;
	}
	public String getWheelChairAccessComments() {
		return wheelChairAccessComments;
	}
	public void setWheelChairAccessComments(String wheelChairAccessComments) {
		this.wheelChairAccessComments = wheelChairAccessComments;
	}
	@Override
	public String toString() {
		return "PropertyMarketingInformation [id=" + id + ", availability="
				+ availability + ", rentAmount=" + rentAmount
				+ ", propertyType=" + propertyType + ", propertyOtherType="
				+ propertyOtherType +  ", rentPeriod="
				+ rentPeriod + " , rentReasonComment="
				+ rentReasonComment + ", bedroomCount=" + bedroomCount
				+ ", bathroomCount=" + bathroomCount + ", seprateWC="
				+ seprateWC + ", furnished=" + furnished + ", flooring="
				+ flooring + ", curtains=" + curtains + ", frontGarden="
				+ frontGarden + ", rearGarden=" + rearGarden
				+ ", wheelChairAccess=" + wheelChairAccess + ", extraStairs="
				+ extraStairs + ", extraStairsComments=" + extraStairsComments
				+ ", otherPropertyInformation=" + otherPropertyInformation
				+ ", propertyId=" + propertyId + ", files=" + files + "]";
	}
	public JSONObject toJSON() throws JSONException{
		JSONObject jObj = new JSONObject();
			
			jObj.put(PropertyMarketingInformation.ID, this.id);
			jObj.put(PropertyMarketingInformation.AVAILABILITY, this.availability);
			jObj.put(PropertyMarketingInformation.RENT_AMOUNT, this.rentAmount);
			jObj.put(PropertyMarketingInformation.PROPERTY_TYPE, this.propertyType);
			jObj.put(PropertyMarketingInformation.PROPERTY_OTHER_TYPE, this.propertyOtherType == null ? "" : this.propertyOtherType);
			jObj.put(PropertyMarketingInformation.RENT_PERIOD, this.rentPeriod);
			jObj.put(PropertyMarketingInformation.RENT_REASON_COMMENT, this.rentReasonComment == null ? "comment to JSON" : this.rentReasonComment);
			jObj.put(PropertyMarketingInformation.BEDROOM_COUNT, this.bedroomCount);
			jObj.put(PropertyMarketingInformation.BATHROOM_COUNT, this.bathroomCount);
			jObj.put(PropertyMarketingInformation.SEPERATE_WC, this.seprateWC);
			jObj.put(PropertyMarketingInformation.FURNISHED, this.furnished);
			jObj.put(PropertyMarketingInformation.FLOORING, this.flooring);
			jObj.put(PropertyMarketingInformation.FLOORING_COMMENTS, this.flooringComments);
			jObj.put(PropertyMarketingInformation.CURTAIN, this.curtains);
			jObj.put(PropertyMarketingInformation.CURTAIN_COMMENTS, this.curtainsComments);
			jObj.put(PropertyMarketingInformation.REAR_GARDEN, this.rearGarden);
			jObj.put(PropertyMarketingInformation.REAR_GARDEN_COMMENTS, this.rearGardenComments);
			jObj.put(PropertyMarketingInformation.FRONT_GARDEN, this.frontGarden);
			jObj.put(PropertyMarketingInformation.FRONT_GARDEN_COMMENTS, this.frontGardenComments);
			jObj.put(PropertyMarketingInformation.WHEEL_CHAIR_ACCESS, this.wheelChairAccess);
			jObj.put(PropertyMarketingInformation.WHEEL_CHAIR_ACCESS_COMMENTS, this.wheelChairAccessComments);
			jObj.put(PropertyMarketingInformation.EXTRA_STAIR, this.extraStairs);
			jObj.put(PropertyMarketingInformation.EXTRA_STAIR_COMMENTS, this.extraStairsComments == null ? "" : this.extraStairsComments);
			jObj.put(PropertyMarketingInformation.OTHER_PROPERTY_INFORMATION, this.otherPropertyInformation == null ? "" : this.otherPropertyInformation);
			jObj.put(PropertyMarketingInformation.PROPERTY_ID, this.propertyId);
		System.out.println("Jobj : " + jObj);
		return jObj;
	}
	
}
