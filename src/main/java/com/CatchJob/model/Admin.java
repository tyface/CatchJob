package com.CatchJob.model;

public class Admin {
	private int adminIndex; // 관리자 식별번호
	private String adminId; // 관리자아이디
	private String adminPw; // 관리자비밀번호
	private String adminLv; // 관리자권한레벨(1~5)
	
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
	@Override
	public String toString() {
		return "Admin [adminIndex=" + adminIndex + ", adminId=" + adminId + ", adminPw=" + adminPw + ", adminLv="
				+ adminLv + "]";
	}
}
