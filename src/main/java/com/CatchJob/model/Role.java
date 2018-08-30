package com.CatchJob.model;

import org.springframework.security.core.GrantedAuthority;

public class Role implements GrantedAuthority {

	private static final long serialVersionUID = 1L;
	// 권한 정보를 가지고 있는 클래스
	private String authority;

	public Role() {
	}

	public Role(String authority) {
		this.authority = authority;
	}

	@Override
	public String getAuthority() {
		return authority;
	}

	@Override
	public String toString() {
		return "Role [authority=" + authority + "]";
	}

}
