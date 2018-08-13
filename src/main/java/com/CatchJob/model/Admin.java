package com.CatchJob.model;

public class Admin {
	private int adminIndex; // 관리자 식별번호
	private String adminId; // 관리자 아이디
	private String adminPw; // 관리자 비밀번호
	private String adminLv; // 관리자 권한레벨(1~5)
	private String regDate; // 회원가입일
	private String lastDate; // 마지막방문일

	public int getAdminIndex() {
		return adminIndex;
	}

	public void setAdminIndex(int adminIndex) {
		this.adminIndex = adminIndex;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminLv() {
		return adminLv;
	}

	public void setAdminLv(String adminLv) {
		this.adminLv = adminLv;
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
		return "Admin [adminIndex=" + adminIndex + ", adminId=" + adminId + ", adminPw=" + adminPw + ", adminLv="
				+ adminLv + ", regDate=" + regDate + ", lastDate=" + lastDate + "]";
	}

}
