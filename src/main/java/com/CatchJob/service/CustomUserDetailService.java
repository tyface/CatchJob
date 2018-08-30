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
	public UserDetails loadUserByUsername(String mberid) throws UsernameNotFoundException {
		System.out.println("----------CustomUserDetailService start-------");
		
		Member member = memberDao.selectById(mberid);
		
		//db에 아이디가 존재하면  ROLE_USER 권한 부여 		
		if(member != null) {
			
		//사용자 이름으로 auth table가서 권한 조회
//		List<String> authentifications = authDao.selectMemberType(mberid);
		
		
		member.addAuthority(new Role(authDao.selectMemberType(mberid)));
					
	} 
		return member;
	}
}
