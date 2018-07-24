package com.CatchJob.model;

public class Review {
	private int reviewIndex;
	private int entIndex;
	private int mIndex;
	private int QuestionNum;
	private String contents;
	private int evaluationScore;
	private String reviewFlag;
	private String regDate;
	public int getReviewIndex() {
		return reviewIndex;
	}
	public void setReviewIndex(int reviewIndex) {
		this.reviewIndex = reviewIndex;
	}
	public int getEntIndex() {
		return entIndex;
	}
	public void setEntIndex(int entIndex) {
		this.entIndex = entIndex;
	}
	public int getmIndex() {
		return mIndex;
	}
	public void setmIndex(int mIndex) {
		this.mIndex = mIndex;
	}
	public int getQuestionNum() {
		return QuestionNum;
	}
	public void setQuestionNum(int questionNum) {
		QuestionNum = questionNum;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getEvaluationScore() {
		return evaluationScore;
	}
	public void setEvaluationScore(int evaluationScore) {
		this.evaluationScore = evaluationScore;
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
	@Override
	public String toString() {
		return "Review [reviewIndex=" + reviewIndex + ", entIndex=" + entIndex + ", mIndex=" + mIndex + ", QuestionNum="
				+ QuestionNum + ", contents=" + contents + ", evaluationScore=" + evaluationScore + ", reviewFlag="
				+ reviewFlag + ", regDate=" + regDate + "]";
	}
	
	
	
}
