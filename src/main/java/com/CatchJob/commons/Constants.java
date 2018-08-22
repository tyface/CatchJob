package com.CatchJob.commons;

public class Constants {
	public static class Config{
		public static final int RANK_VIEW_COUNT = 5; //메인페이지에 기업랭킹 출력될 기업의 수
		public static final double NPN_PERCENT = 0.09; //메인페이지에 기업랭킹 출력될 기업의 수
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
