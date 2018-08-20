package com.CatchJob.model;

/* 회원 정보 */
public class Member {
	private int mberIndex; // 회원 식별번호
	private String mberId; // 아이디(email)
	private String mberPw; // 비밀번호
	private String mberType; // 회원구분(1:일반,2:기업인증)
	private String entIndex; // 기업회원일 경우 해당기업 식별번호
	private String mberFlag; // 계정상태(1:등록,2:탈퇴)
	private String regDate; // 회원가입일
	private String lastDate; // 마지막방문일
	private String oauthId; // oauth 아이디
	
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
	public String getEntIndex() {
		return entIndex;
	}
	public void setEntIndex(String entIndex) {
		this.entIndex = entIndex;
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
	public String getOauthId() {
		return oauthId;
	}
	public void setOauthId(String oauthId) {
		this.oauthId = oauthId;
	}
	
	@Override
	public String toString() {
		return "Member [mberIndex=" + mberIndex + ", mberId=" + mberId + ", mberPw=" + mberPw + ", mberType=" + mberType
				+ ", entIndex=" + entIndex + ", mberFlag=" + mberFlag + ", regDate=" + regDate + ", lastDate="
				+ lastDate + ", oauthId=" + oauthId + "]";
	}
	
}
