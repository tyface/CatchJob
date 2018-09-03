package com.CatchJob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.CatchJob.model.Member;
@Service
public class testMember {
	@Autowired
	static
	MemberService memberService;
	
	public static void main(String[] args) {
		
		
		Member memberOne = memberService.getMemberById("11");
		Member member = new Member();
		member.setMberIndex(memberOne.getMberIndex());
		member.setMberId("11");

		PasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setMberPw(encoder.encode("123"));

	
			member.setMberType("ROLE_ADMIN");
	
		member.setMberFlag(memberOne.getMberFlag());
		
		boolean result = memberService.modify(member);
		if(result) {				
			System.out.println("ok");
		} else {
			System.out.println("not ok hon	");
		}

		
		
		
	}

}
