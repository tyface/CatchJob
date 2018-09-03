package com.CatchJob.model;

public class IndustryCode {
	private int industryCode;
	private String largeCatagory;
	private String largeCatagoryName;
	private String mediumCatagory;
	private String smallCatagory;
	private String detailsCatagory;

	public int getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(int industryCode) {
		this.industryCode = industryCode;
	}

	public String getLargeCatagory() {
		return largeCatagory;
	}

	public void setLargeCatagory(String largeCatagory) {
		this.largeCatagory = largeCatagory;
	}

	public String getLargeCatagoryName() {
		return largeCatagoryName;
	}

	public void setLargeCatagoryName(String largeCatagoryName) {
		this.largeCatagoryName = largeCatagoryName;
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
		return "IndustryCode [industryCode=" + industryCode + ", largeCatagory=" + largeCatagory
				+ ", largeCatagoryName=" + largeCatagoryName + ", mediumCatagory=" + mediumCatagory + ", smallCatagory="
				+ smallCatagory + ", detailsCatagory=" + detailsCatagory + "]";
	}

}