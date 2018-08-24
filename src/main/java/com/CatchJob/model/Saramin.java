package com.CatchJob.model;

public class Saramin {
	private String href;// 기업주소
	private String name;// 기업이름
	private String title;
	private String location;
	private String jobType;
	private String industry;
	private String jobCategory;
	private String openQuantity;
	private String experienceLevel;
	private String requiredEducationLevel;
	private String expirationTimestamp; //마감일

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getJobCategory() {
		return jobCategory;
	}

	public void setJobCategory(String jobCategory) {
		this.jobCategory = jobCategory;
	}

	public String getOpenQuantity() {
		return openQuantity;
	}

	public void setOpenQuantity(String openQuantity) {
		this.openQuantity = openQuantity;
	}

	public String getExperienceLevel() {
		return experienceLevel;
	}

	public void setExperienceLevel(String experienceLevel) {
		this.experienceLevel = experienceLevel;
	}

	public String getRequiredEducationLevel() {
		return requiredEducationLevel;
	}

	public void setRequiredEducationLevel(String requiredEducationLevel) {
		this.requiredEducationLevel = requiredEducationLevel;
	}

	public String getExpirationTimestamp() {
		return expirationTimestamp;
	}

	public void setExpirationTimestamp(String expirationTimestamp) {
		this.expirationTimestamp = expirationTimestamp;
	}

	@Override
	public String toString() {
		return "Saramin [href=" + href + ", name=" + name + ", title=" + title + ", location=" + location + ", jobType="
				+ jobType + ", industry=" + industry + ", jobCategory=" + jobCategory + ", openQuantity=" + openQuantity
				+ ", experienceLevel=" + experienceLevel + ", requiredEducationLevel=" + requiredEducationLevel
				+ ", expirationTimestamp=" + expirationTimestamp + "]";
	}

	

}
