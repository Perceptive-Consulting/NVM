package com.pcs.perpetualRents.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Country;

public class AddressMapper implements RowMapper<Address> {

	@Override
	public Address mapRow(ResultSet rst, int arg1) throws SQLException {
		Address obj = null;
		try{
			obj = new Address();
				obj.setId(rst.getLong(Address.ID));
				obj.setAddressLine1(rst.getString(Address.ADDRESS_LINE1));
				obj.setAddressLine2(rst.getString(Address.ADDRESS_LINE2));
				obj.setCity(rst.getString(Address.CITY));
				obj.setCounty(rst.getString(Address.COUNTY));
				obj.setLandmark(rst.getString(Address.LANDMARK));
				obj.setLatitude(rst.getString(Address.LATITUDE));
				obj.setLongitude(rst.getString(Address.LONGITUDE));
				obj.setTelephoneNumber(rst.getString(Address.TELEPHONE_NUMBER));
				obj.setPostCode(rst.getString(Address.POSTCODE));
				obj.setCountryId(rst.getLong(Address.COUNTRY_ID));
				obj.setObjectId(rst.getLong(Address.OBJECT_ID));
				
			Country countryObj = new Country();
				countryObj.setId(rst.getLong(Country.ID));
				countryObj.setCountryName(rst.getString(Country.COUNTRY_NAME));
				countryObj.setCountryAlias(rst.getString(Country.COUNTRY_ALIAS));
				countryObj.setCountryCode(rst.getString(Country.COUNTRY_CODE));
				countryObj.setCurrency(rst.getString(Country.CURRENCY));
				countryObj.setTimezone(rst.getString(Country.TIME_ZONE));
			obj.setCountryObj(countryObj);
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return obj;
	}
}
