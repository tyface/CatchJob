package com.CatchJob.model;

public class Enterprise {
	private int entIndex;
	private String entName;
	private int entBusinessRegNum;
	private int industryCode;
	private String entIndustryName;
	private String entFormType;
	private String entSubscriberFlag;
	private String entFlag;
	private String entFoundationDate;
	private String entRoadAddrName;
	private int entEmployeeCount;
	private float evaluationAvg;
	private int addrBcityCode;
	private int addrSignguCode;
	private int addrEmdCode;
	
	public int getEntIndex() {
		return entIndex;
	}
	public void setEntIndex(int entIndex) {
		this.entIndex = entIndex;
	}
	public String getEntName() {
		return entName;
	}
	public void setEntName(String entName) {
		this.entName = entName;
	}
	public int getEntBusinessRegNum() {
		return entBusinessRegNum;
	}
	public void setEntBusinessRegNum(int entBusinessRegNum) {
		this.entBusinessRegNum = entBusinessRegNum;
	}
	public int getIndustryCode() {
		return industryCode;
	}
	public void setIndustryCode(int industryCode) {
		this.industryCode = industryCode;
	}
	public String getEntIndustryName() {
		return entIndustryName;
	}
	public void setEntIndustryName(String entIndustryName) {
		this.entIndustryName = entIndustryName;
	}
	public String getEntFormType() {
		return entFormType;
	}
	public void setEntFormType(String entFormType) {
		this.entFormType = entFormType;
	}
	public String getEntSubscriberFlag() {
		return entSubscriberFlag;
	}
	public void setEntSubscriberFlag(String entSubscriberFlag) {
		this.entSubscriberFlag = entSubscriberFlag;
	}
	public String getEntFlag() {
		return entFlag;
	}
	public void setEntFlag(String entFlag) {
		this.entFlag = entFlag;
	}
	public String getEntFoundationDate() {
		return entFoundationDate;
	}
	public void setEntFoundationDate(String entFoundationDate) {
		this.entFoundationDate = entFoundationDate;
	}
	public String getEntRoadAddrName() {
		return entRoadAddrName;
	}
	public void setEntRoadAddrName(String entRoadAddrName) {
		this.entRoadAddrName = entRoadAddrName;
	}
	public int getEntEmployeeCount() {
		return entEmployeeCount;
	}
	public void setEntEmployeeCount(int entEmployeeCount) {
		this.entEmployeeCount = entEmployeeCount;
	}
	public float getEvaluationAvg() {
		return evaluationAvg;
	}
	public void setEvaluationAvg(float evaluationAvg) {
		this.evaluationAvg = evaluationAvg;
	}
	public int getAddrBcityCode() {
		return addrBcityCode;
	}
	public void setAddrBcityCode(int addrBcityCode) {
		this.addrBcityCode = addrBcityCode;
	}
	public int getAddrSignguCode() {
		return addrSignguCode;
	}
	public void setAddrSignguCode(int addrSignguCode) {
		this.addrSignguCode = addrSignguCode;
	}
	public int getAddrEmdCode() {
		return addrEmdCode;
	}
	public void setAddrEmdCode(int addrEmdCode) {
		this.addrEmdCode = addrEmdCode;
	}
	@Override
	public String toString() {
		return "Enterprise [entIndex=" + entIndex + ", entName=" + entName + ", entBusinessRegNum=" + entBusinessRegNum
				+ ", industryCode=" + industryCode + ", entIndustryName=" + entIndustryName + ", entFormType="
				+ entFormType + ", entSubscriberFlag=" + entSubscriberFlag + ", entFlag=" + entFlag
				+ ", entFoundationDate=" + entFoundationDate + ", entRoadAddrName=" + entRoadAddrName
				+ ", entEmployeeCount=" + entEmployeeCount + ", evaluationAvg=" + evaluationAvg + ", addrBcityCode="
				+ addrBcityCode + ", addrSignguCode=" + addrSignguCode + ", addrEmdCode=" + addrEmdCode + "]";
	}
	
	
	
}
