package com.CatchJob.commons;

public class Constants {
	public static class Config{
		public static final int RANK_VIEW_COUNT = 5; //메인페이지에 기업랭킹 출력될 기업의 수
		public static final double NPN_PERCENT = 0.09; //메인페이지에 기업랭킹 출력될 기업의 수
		public static final String HOST = "http://192.168.0.87:8090/catchjob"; //관리자 이메일
		public static final String ADMIN_EMAIL = "catchjob33@gmail.com"; //관리자 이메일
		public static final String ADMIN_NAME = "CatchJob";//관리자명
		 
	}
	
	public static class File{
		public static final String PW_RESET = "resources/mail-template/password-reset-mail.html"; //비밀번호 재설정 메일 탬플릿
		
		public static final String IMG_SUCSSES = "resources/img/image-1.gif"; //비밀번호 재설정 메일 탬플릿
		public static final String IMG_LOGO_1 = "resources/img/logo.png"; //비밀번호 재설정 메일 탬플릿
	}
	
	public static class Follow{
		public static final int LIMIT_NUMBER_OF_FOLLOW = 10; //회원 한 명이 팔로우 할 수 있는 기업의 수
	}
	public static class Interview{
		public static final int NUM_OF_ITVW_PER_PAGE = 1; //view 페이지에서 화면에 표시할 row 수
		public static final int NUM_OF_NAVI_PAGE = 5;	  //view 페이지에서  화면에 표시할 nav 수
	}
	public static class Review{
		public static final int NUM_OF_RVW_PER_PAGE = 2; //view 페이지에서 화면에 표시할 row 수
		public static final int NUM_OF_NAVI_PAGE = 2;	  //view 페이지에서  화면에 표시할 nav 수
	}
	public static class Admin{
		public static final int NUM_OF_NAVI_PAGE = 5;	  //ADMIN 페이지에서  화면에 표시할 nav 수
	}
	
}
