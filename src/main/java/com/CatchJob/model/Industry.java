package com.CatchJob.model;

public class Industry {
	private String industryCode;
	private String largeCatagory;
	private String largeCatagoryName;
	private String regDate;
	private String mediumCatagory;
	private String smallCatagory;
	private String detailsCatagory;

	public String getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(String industryCode) {
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
				+ ", largeCatagoryName=" + largeCatagoryName + ", regDate=" + regDate + ", mediumCatagory="
				+ mediumCatagory + ", smallCatagory=" + smallCatagory + ", detailsCatagory=" + detailsCatagory + "]";
	}

}