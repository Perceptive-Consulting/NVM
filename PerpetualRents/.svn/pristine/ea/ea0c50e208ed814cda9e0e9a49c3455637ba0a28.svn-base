package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.PropertyMarketingInformation;


public class PropertMarketingInformationMapper implements RowMapper<PropertyMarketingInformation> {

	@Override
	public PropertyMarketingInformation mapRow(ResultSet rst, int arg1) throws SQLException {
		PropertyMarketingInformation obj = null;
		try{
			obj = new PropertyMarketingInformation();
				obj.setId(rst.getLong(PropertyMarketingInformation.ID));
				obj.setAvailability(rst.getString(PropertyMarketingInformation.AVAILABILITY));
				obj.setRentAmount(rst.getString(PropertyMarketingInformation.RENT_AMOUNT));
				obj.setPropertyType(rst.getString(PropertyMarketingInformation.PROPERTY_TYPE));
				obj.setPropertyOtherType(rst.getString(PropertyMarketingInformation.PROPERTY_OTHER_TYPE));
				obj.setRentPeriod(rst.getString(PropertyMarketingInformation.RENT_PERIOD));
				obj.setRentReasonComment(rst.getString(PropertyMarketingInformation.RENT_REASON_COMMENT));
				obj.setBedroomCount(rst.getShort(PropertyMarketingInformation.BEDROOM_COUNT));
				obj.setBathroomCount(rst.getShort(PropertyMarketingInformation.BATHROOM_COUNT));
				obj.setSeprateWC(rst.getShort(PropertyMarketingInformation.SEPERATE_WC));
				obj.setFurnished(rst.getBoolean(PropertyMarketingInformation.FURNISHED));
				obj.setFlooring(rst.getBoolean(PropertyMarketingInformation.FLOORING));
				obj.setFlooringComments(rst.getString(PropertyMarketingInformation.FLOORING_COMMENTS));
				obj.setCurtains(rst.getBoolean(PropertyMarketingInformation.CURTAIN));
				obj.setCurtainsComments(rst.getString(PropertyMarketingInformation.CURTAIN_COMMENTS));
				obj.setFrontGarden(rst.getBoolean(PropertyMarketingInformation.FRONT_GARDEN));
				obj.setFrontGardenComments(rst.getString(PropertyMarketingInformation.FRONT_GARDEN_COMMENTS));
				obj.setRearGarden(rst.getBoolean(PropertyMarketingInformation.REAR_GARDEN));
				obj.setRearGardenComments(rst.getString(PropertyMarketingInformation.REAR_GARDEN_COMMENTS));
				obj.setWheelChairAccess(rst.getBoolean(PropertyMarketingInformation.WHEEL_CHAIR_ACCESS));
				obj.setWheelChairAccessComments(rst.getString(PropertyMarketingInformation.WHEEL_CHAIR_ACCESS_COMMENTS));
				obj.setExtraStairs(rst.getBoolean(PropertyMarketingInformation.EXTRA_STAIR));
				obj.setExtraStairsComments(rst.getString(PropertyMarketingInformation.EXTRA_STAIR_COMMENTS));
				obj.setOtherPropertyInformation(rst.getString(PropertyMarketingInformation.OTHER_PROPERTY_INFORMATION));
				obj.setId(rst.getLong(PropertyMarketingInformation.ID));
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}

	

}
