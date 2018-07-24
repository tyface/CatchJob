package com.CatchJob.model;


public class Member {
	
	private int mIndex;
	private String mId;
	private String mPw;
	private String mType;
	private String userFlag;
	private String regDate;
	private String lastDate;
	public int getmIndex() {
		return mIndex;
	}
	public void setmIndex(int mIndex) {
		this.mIndex = mIndex;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmType() {
		return mType;
	}
	public void setmType(String mType) {
		this.mType = mType;
	}
	public String getUserFlag() {
		return userFlag;
	}
	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
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
		return "Member [mIndex=" + mIndex + ", mId=" + mId + ", mPw=" + mPw + ", mType=" + mType + ", userFlag="
				+ userFlag + ", regDate=" + regDate + ", lastDate=" + lastDate + "]";
	}
	
	
}
