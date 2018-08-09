package com.CatchJob.model;

/* 면접 정보 */
public class Interview {
	private int mberIndex; // 회원 식별번호
	private int entIndex; // 기업 식별번호
	private String entName; // 사업장명
	private String intrvwDifficulty; // 면접난이도(1~5)
	private String intrvwDate; // 면접날짜
	private String intrvwRoute; // 면접경로(1:공채,2:온라인지원,3:직원추천,4:헤드헌터,5:학교 취업지원센터,6:기타)
	private String intrvwReview; // 면접후기
	private String intrvwQuestion; // 면접질문
	private String intrvwAnswer; // 질문에대한 답변
	private String intrvwFlag; // 면접내용 상태(1:사용,2:삭제,3:대기) TODO
	private String intrvwResult; // 면접결과(1:합격,2:불합격,3:대기중,4:합격했으나 취업하지않음)
	private String intrvwExperience; // 면접경험(1:부정적,2:보통,3:긍정적)
	private int presentationDate; // 발표기시(ex:21일 후)
	private String regDate; // 작성일

	public int getMberIndex() {
		return mberIndex;
	}

	public void setMberIndex(int mberIndex) {
		this.mberIndex = mberIndex;
	}

	public int getEntIndex() {
		return entIndex;
	}

	public void setEntIndex(int entIndex) {
		this.entIndex = entIndex;
	}

	public String getIntrvwDifficulty() {
		return intrvwDifficulty;
	}

	public void setIntrvwDifficulty(String intrvwDifficulty) {
		this.intrvwDifficulty = intrvwDifficulty;
	}

	public String getIntrvwDate() {
		return intrvwDate;
	}

	public void setIntrvwDate(String intrvwDate) {
		this.intrvwDate = intrvwDate;
	}

	public String getIntrvwRoute() {
		return intrvwRoute;
	}

	public void setIntrvwRoute(String intrvwRoute) {
		this.intrvwRoute = intrvwRoute;
	}

	public String getIntrvwReview() {
		return intrvwReview;
	}

	public void setIntrvwReview(String intrvwReview) {
		this.intrvwReview = intrvwReview;
	}

	public String getIntrvwQuestion() {
		return intrvwQuestion;
	}

	public void setIntrvwQuestion(String intrvwQuestion) {
		this.intrvwQuestion = intrvwQuestion;
	}

	public String getIntrvwAnswer() {
		return intrvwAnswer;
	}

	public void setIntrvwAnswer(String intrvwAnswer) {
		this.intrvwAnswer = intrvwAnswer;
	}

	public String getIntrvwFlag() {
		return intrvwFlag;
	}

	public void setIntrvwFlag(String intrvwFlag) {
		this.intrvwFlag = intrvwFlag;
	}

	public String getIntrvwResult() {
		return intrvwResult;
	}

	public void setIntrvwResult(String intrvwResult) {
		this.intrvwResult = intrvwResult;
	}

	public String getIntrvwExperience() {
		return intrvwExperience;
	}

	public void setIntrvwExperience(String intrvwExperience) {
		this.intrvwExperience = intrvwExperience;
	}

	public int getPresentationDate() {
		return presentationDate;
	}

	public void setPresentationDate(int presentationDate) {
		this.presentationDate = presentationDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	@Override
	public String toString() {
		return "Interview [mberIndex=" + mberIndex + ", entIndex=" + entIndex + ", entName=" + entName
				+ ", intrvwDifficulty=" + intrvwDifficulty + ", intrvwDate=" + intrvwDate + ", intrvwRoute="
				+ intrvwRoute + ", intrvwReview=" + intrvwReview + ", intrvwQuestion=" + intrvwQuestion
				+ ", intrvwAnswer=" + intrvwAnswer + ", intrvwFlag=" + intrvwFlag + ", intrvwResult=" + intrvwResult
				+ ", intrvwExperience=" + intrvwExperience + ", presentationDate=" + presentationDate + ", regDate="
				+ regDate + "]";
	}

	

}
