package com.CatchJob.model;

/* 연봉정보 (당월) */
public class Salary {
	private int salaryAvg; // 평균 연봉(당월)
	private String date; // 날짜

	public int getSalaryAvg() {
		return salaryAvg;
	}

	public void setSalaryAvg(int salaryAvg) {
		this.salaryAvg = salaryAvg;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Salary [salaryAvg=" + salaryAvg + ", date=" + date + "]";
	}

}
