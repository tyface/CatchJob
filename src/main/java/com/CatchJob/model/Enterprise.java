package com.CatchJob.model;

/* 기업정보 */
public class Enterprise {
	private int entIndex; // 사업장 식별번호
	private String entName; // 사업장명
	private String entBizRegNum; // 사업자등록번호 (앞자리6자리만 노출)
	private String industryCode; // 업종코드 TODO
	private String industryName; // 업종명
	private String entStyleType; // 사업장형태구분(1:법인,2:개인)
	private String entSubscriberFlag; // 사업장가입상태(1:등록,2:탈퇴) TODO
	private String entFlag; // 사업장 표출상태(1:사용,2:삭제,3:대기)
	private String entFoundationDate; // 설립일
	private int following; // 팔로잉 기업..(팔로잉된 기업이면..1, 아니면0)
	private String bcityName; // 시,도 이름
	private String signguName; // 시,군,구 이름
	private int employeeCount; // 사원수(월단위 갱신)
	private int entranceCount; // 입사자수(년간)
	private int retirementCount; // 퇴사자수(년간)
	private int salaryAvg; // 평균연봉(년간)
	private int reviewCount; // 리뷰개수
	private int interviewCount; // 면접후기개수
	private float evaluationAvg;// 기업 평가점수(리뷰등록마다 갱신) TODO

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

	public String getEntBizRegNum() {
		return entBizRegNum;
	}

	public void setEntBizRegNum(String entBizRegNum) {
		this.entBizRegNum = entBizRegNum;
	}

	public String getIndustryCode() {
		return industryCode;
	}

	public void setIndustryCode(String industryCode) {
		this.industryCode = industryCode;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public String getEntStyleType() {
		return entStyleType;
	}

	public void setEntStyleType(String entStyleType) {
		this.entStyleType = entStyleType;
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

	public int getFollowing() {
		return following;
	}

	public void setFollowing(int following) {
		this.following = following;
	}

	public String getBcityName() {
		return bcityName;
	}

	public void setBcityName(String bcityName) {
		this.bcityName = bcityName;
	}

	public String getSignguName() {
		return signguName;
	}

	public void setSignguName(String signguName) {
		this.signguName = signguName;
	}

	public int getEmployeeCount() {
		return employeeCount;
	}

	public void setEmployeeCount(int employeeCount) {
		this.employeeCount = employeeCount;
	}

	public int getEntranceCount() {
		return entranceCount;
	}

	public void setEntranceCount(int entranceCount) {
		this.entranceCount = entranceCount;
	}

	public int getRetirementCount() {
		return retirementCount;
	}

	public void setRetirementCount(int retirementCount) {
		this.retirementCount = retirementCount;
	}

	public int getSalaryAvg() {
		return salaryAvg;
	}

	public void setSalaryAvg(int salaryAvg) {
		this.salaryAvg = salaryAvg;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getInterviewCount() {
		return interviewCount;
	}

	public void setInterviewCount(int interviewCount) {
		this.interviewCount = interviewCount;
	}

	public float getEvaluationAvg() {
		return evaluationAvg;
	}

	public void setEvaluationAvg(float evaluationAvg) {
		this.evaluationAvg = evaluationAvg;
	}

	@Override
	public String toString() {
		return "Enterprise [entIndex=" + entIndex + ", entName=" + entName + ", entBizRegNum=" + entBizRegNum
				+ ", industryCode=" + industryCode + ", industryName=" + industryName + ", entStyleType=" + entStyleType
				+ ", entSubscriberFlag=" + entSubscriberFlag + ", entFlag=" + entFlag + ", entFoundationDate="
				+ entFoundationDate + ", following=" + following + ", bcityName=" + bcityName + ", signguName="
				+ signguName + ", employeeCount=" + employeeCount + ", entranceCount=" + entranceCount
				+ ", retirementCount=" + retirementCount + ", salaryAvg=" + salaryAvg + ", reviewCount=" + reviewCount
				+ ", interviewCount=" + interviewCount + ", evaluationAvg=" + evaluationAvg + "]";
	}

}