package com.CatchJob.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/* 회원 정보 */
public class Member implements UserDetails {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	private int mberIndex; // 회원 식별번호
	private String mberId; // 아이디(email)
	private String mberPw; // 비밀번호
	private String mberType; //회원구분(USER:일반,AUTHENTICATED:기업인증,ADMIN:관리자)
	private String mberFlag; // 계정상태(1:등록,2:탈퇴)
	private String regDate; // 회원가입일
	private String lastDate; // 마지막방문일
	private String oauthId; // oauth 아이디

	private boolean accountNonExpired = true;
	private boolean accountNonLocked = true;
	private boolean credentialsNonExpired = true;
	private boolean enabled = true;

	private List<Role> authorities;

	public Member() {
		authorities = new ArrayList<Role>();
	}

	public void addAuthority(Role role) {
		authorities.add(role);
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

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

	public String getOauthId() {
		return oauthId;
	}

	public void setOauthId(String oauthId) {
		this.oauthId = oauthId;
	}

	@Override
	public String toString() {
		return "Member [mberIndex=" + mberIndex + ", mberId=" + mberId + ", mberPw=" + mberPw + ", mberType=" + mberType
				+ ", mberFlag=" + mberFlag + ", regDate=" + regDate + ", lastDate="
				+ lastDate + ", oauthId=" + oauthId + "]";
	}

	public void setAccountNonExpired(boolean accountNonExpired) {
		this.accountNonExpired = accountNonExpired;
	}

	public void setAccountNonLocked(boolean accountNonLocked) {
		this.accountNonLocked = accountNonLocked;
	}

	public void setCredentialsNonExpired(boolean credentialsNonExpired) {
		this.credentialsNonExpired = credentialsNonExpired;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public String getPassword() {
		return mberPw;
	}

	@Override
	public String getUsername() {
		return mberId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return accountNonExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return accountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return credentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return enabled;
	}

}