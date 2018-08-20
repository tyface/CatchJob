package com.CatchJob.model;

/* 리뷰 */
public class Review {
	private String entName;
	private String question;
	private String mberId;
	private int entIndex; // 기업 식별번호
	private int mberIndex; // 회원 식별번호
	private int questionNum; // 질문 식별번호
	private int evaluationScore; // 기업 평가 점수
	private String contents; // 리뷰 내용
	private String reviewFlag; // 리뷰 상태(1:사용,2:삭제,3:대기) TODO
	private String regDate; // 작성일

	public String getMberId() {
		return mberId;
	}

	public void setMberId(String mberId) {
		this.mberId = mberId;
	}

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	public int getEntIndex() {
		return entIndex;
	}

	public void setEntIndex(int entIndex) {
		this.entIndex = entIndex;
	}

	public int getMberIndex() {
		return mberIndex;
	}

	public void setMberIndex(int mberIndex) {
		this.mberIndex = mberIndex;
	}

	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public int getEvaluationScore() {
		return evaluationScore;
	}

	public void setEvaluationScore(int evaluationScore) {
		this.evaluationScore = evaluationScore;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getReviewFlag() {
		return reviewFlag;
	}

	public void setReviewFlag(String reviewFlag) {
		this.reviewFlag = reviewFlag;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Override
	public String toString() {
		return "Review [entName=" + entName + ", question=" + question + ", entIndex=" + entIndex + ", mberIndex="
				+ mberIndex + ", questionNum=" + questionNum + ", evaluationScore=" + evaluationScore + ", contents="
				+ contents + ", reviewFlag=" + reviewFlag + ", regDate=" + regDate + "]";
	}

}
