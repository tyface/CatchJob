package com.CatchJob.model;

public class Member {

	private int mberIndex;
	private String mberId;
	private String mberPw;
	private String mberType;
	private String mberFlag;
	private String regDate;
	private String lastDate;

	public int getMberIndex() {
		return mberIndex;
	}

	public void setMberIndex(int mberIndex) {
		this.mberIndex = mberIndex;
	}

	public String getMberId() {
		return mberId;
	}

	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	public String getMberPw() {
		return mberPw;
	}

	public void setMberPw(String mberPw) {
		this.mberPw = mberPw;
	}

	public String getMberType() {
		return mberType;
	}

	public void setMberType(String mberType) {
		this.mberType = mberType;
	}

	public String getMberFlag() {
		return mberFlag;
	}

	public void setMberFlag(String mberFlag) {
		this.mberFlag = mberFlag;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}

	@Override
	public String toString() {
		return "Member [mberIndex=" + mberIndex + ", mberId=" + mberId + ", mberPw=" + mberPw + ", mberType=" + mberType
				+ ", mberFlag=" + mberFlag + ", regDate=" + regDate + ", lastDate=" + lastDate + "]";
	}

}
