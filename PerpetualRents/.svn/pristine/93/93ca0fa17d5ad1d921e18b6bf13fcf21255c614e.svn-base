package com.pcs.perpetualRents.dao;

import java.util.List;

import com.pcs.perpetualRents.business.bean.City;
import com.pcs.perpetualRents.business.bean.PerpetualCity;

public interface CityDAO {
	
	public Long createCity(City cityObj);
	
	public List<City> loadCityByObjectId(final Long objectType , final Long objectId);
	
	public List<City> loadCityByObjectType(Long objectType);
	
	public City loadCityById(final Long cityId);
	
	public City loadCityByName(final String cityName);
	
	public List<City> loadCityByNameAndObjectType(final String cityName, final Long objectTypeId);
	
	public void deleteCityByObjectType(final Long objectType , final Long objectId);
	
	public List<PerpetualCity> loadAllPerpetualCity();
	
	public PerpetualCity loadPerpetualCityById(final Long cityId);
	
	public boolean removePerpetualCity(String city);
	
	public boolean addPerpetualCity(String city);
	
}
