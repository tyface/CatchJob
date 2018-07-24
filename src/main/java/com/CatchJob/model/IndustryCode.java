package com.CatchJob.model;

public class IndustryCode {
	private int IndustryCode;
	private String largeCatagory;
	private String mediumCatagory;
	private String smallCatagory;
	private String detailsCatagory;
	
	public int getIndustryCode() {
		return IndustryCode;
	}
	public void setIndustryCode(int industryCode) {
		IndustryCode = industryCode;
	}
	public String getLargeCatagory() {
		return largeCatagory;
	}
	public void setLargeCatagory(String largeCatagory) {
		this.largeCatagory = largeCatagory;
	}
	public String getMediumCatagory() {
		return mediumCatagory;
	}
	public void setMediumCatagory(String mediumCatagory) {
		this.mediumCatagory = mediumCatagory;
	}
	public String getSmallCatagory() {
		return smallCatagory;
	}
	public void setSmallCatagory(String smallCatagory) {
		this.smallCatagory = smallCatagory;
	}
	public String getDetailsCatagory() {
		return detailsCatagory;
	}
	public void setDetailsCatagory(String detailsCatagory) {
		this.detailsCatagory = detailsCatagory;
	}
	@Override
	public String toString() {
		return "IndustryCode [IndustryCode=" + IndustryCode + ", largeCatagory=" + largeCatagory + ", mediumCatagory="
				+ mediumCatagory + ", smallCatagory=" + smallCatagory + ", detailsCatagory=" + detailsCatagory + "]";
	}
	
	
}