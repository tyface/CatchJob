package com.CatchJob.model;

/* 인사 정보(당월) */
public class HumanResource {
	private int employeeCount; // 사원수(당월)
	private int EntranceCount; // 입사자수(당월)
	private int retirementCount; // 퇴사자수(당월)
	private String date; // 날짜

	public int getEmployeeCount() {
		return employeeCount;
	}

	public void setEmployeeCount(int employeeCount) {
		this.employeeCount = employeeCount;
	}

	public int getEntranceCount() {
		return EntranceCount;
	}

	public void setEntranceCount(int entranceCount) {
		EntranceCount = entranceCount;
	}

	public int getRetirementCount() {
		return retirementCount;
	}

	public void setRetirementCount(int retirementCount) {
		this.retirementCount = retirementCount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "HumanResource [employeeCount=" + employeeCount + ", EntranceCount=" + EntranceCount
				+ ", retirementCount=" + retirementCount + ", date=" + date + "]";
	}

}
