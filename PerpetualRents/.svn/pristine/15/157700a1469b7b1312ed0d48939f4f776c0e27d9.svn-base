package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.Address;
import com.pcs.perpetualRents.business.bean.Country;

public interface AddressDAO {
	
	public Long createAddress(Address addressObj, final Long createdUserId);
	
	public Address loadAddressById(Long id);
	
	public List<Address> loadAddressById(Long objectType, Long objectTypeId);
	
	public boolean updateAddress(final Address addressObj, final Long modifiedUserId);
	
	public boolean updateAddressById(final Address addressObj, final Long modifiedUserId);
	
	public Long createCountry(final Country countryObj);
	
	public boolean deleteAddress(Long objectType, Long objId);
	
	public List<Address> loadAddressByCity(String city, Long objectType);
	
	
	public List<Address> loadAddressByObjectId(String city, Long objectTypeId);
}
