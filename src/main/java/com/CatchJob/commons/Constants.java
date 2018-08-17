package com.CatchJob.commons;

public class Constants {
	public static class Config{
		public static final int RANK_VIEW_COUNT = 5; //메인페이지에 기업랭킹 출력될 기업의 수
		public static final double NPN_PERCENT = 0.09; //메인페이지에 기업랭킹 출력될 기업의 수
	}
	
	public static class Member{
		public static final String MBERINDEX = "MBERINDEX";
		public static final String MBERID = "MBERID";
		public static final String MBERPW = "MBERPW";
		public static final String MBERTYPE = "MBERTYPE";
		public static final String MBERFLAG = "MBERFLAG";
		public static final String REGDATE = "REGDATE";
		public static final String LASTDATE = "LASTDATE";
	}
	
	public static class Follow{
		public static final int LIMIT_NUMBER_OF_FOLLOW = 10; //회원 한 명이 팔로우 할 수 있는 기업의 수
	}
}
