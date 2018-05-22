package com.pcs.perpetualRents.test;

import java.text.DecimalFormat;

public class CostMatrix {
	
	private String countryName;
	private String city;
	private String startValue;
	private String endValue;
	private Double baseCost;
	private String costUnit;
	private String costFactor;
	private String transitdays;
	private Double nonDocBaseCost;
	
	
	public Double getNonDocBaseCost() {
		return nonDocBaseCost;
	}

	public void setNonDocBaseCost(Double nonDocBaseCost) {
		this.nonDocBaseCost = nonDocBaseCost;
	}

	public String getTransitdays() {
		return transitdays;
	}

	public void setTransitdays(String transitdays) {
		this.transitdays = transitdays;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getStartValue() {
		return startValue;
	}

	public void setStartValue(String startValue) {
		this.startValue = startValue;
	}

	public String getEndValue() {
		return endValue;
	}

	public void setEndValue(String endValue) {
		this.endValue = endValue;
	}

	public Double getBaseCost() {
		return baseCost;
	}

	public void setBaseCost(Double baseCost) {
		this.baseCost = baseCost;
	}

	public String getCostUnit() {
		return costUnit;
	}

	public void setCostUnit(String costUnit) {
		this.costUnit = costUnit;
	}

	public String getCostFactor() {
		return costFactor;
	}

	public void setCostFactor(String costFactor) {
		this.costFactor = costFactor;
	}

	@Override
	public String toString() {
		return "CostMatrix [countryName=" + countryName + ", city=" + city
				+ ", startValue=" + startValue + ", endValue=" + endValue
				+ ", baseCost=" + baseCost + ", costUnit=" + costUnit
				+ ", costFactor=" + costFactor + ", transitdays=" + transitdays
				+ ", nonDocBaseCost=" + nonDocBaseCost + "]";
	}

	public CostMatrix(String countryName, String city, String startValue,
			String endValue, Double baseCost, String costUnit,
			String costFactor) {
		super();
		this.countryName = countryName;
		this.city = city;
		this.startValue = startValue;
		this.endValue = endValue;
		DecimalFormat dc = new DecimalFormat("#.00");
		this.baseCost = Double.valueOf(dc.format(baseCost));
		this.costUnit = costUnit;
		this.costFactor = costFactor;
	}
	
	
	
	
}
