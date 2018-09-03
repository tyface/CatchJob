package com.CatchJob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.CatchJob.dao.AuthorityDao;
import com.CatchJob.dao.MemberDao;
import com.CatchJob.model.Member;
import com.CatchJob.model.Role;

@Service
public class CustomUserDetailService implements UserDetailsService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private AuthorityDao authDao;

	@Override
	public UserDetails loadUserByUsername(String mberId) throws UsernameNotFoundException {
		System.out.println("----------CustomUserDetailService start-------");

		Member member = memberDao.selectById(mberId);

		if (member != null) {
			member.addAuthority(new Role(authDao.selectMemberType(mberId)));
		}
		return member;
	}
}
