package com.CatchJob.model;

/* 국민연금 납입 내역 (월 기준)*/
public class NationalPension {
	private int npnIndex; // 국민연금납입내역 식별번호
	private int entIndex; // 사업장 식별번호
	private int npnSubscriberCount; // 국민연금 총 가입자수
	private int npnNewSubscriberCount; // 국민연금 신규가입자수
	private int npnSubscriberTerminateCount; // 국민연금 가입해지자수
	private String payDate; // 납입날짜
	private String payAmount; // 납입금액

	public int getNpnIndex() {
		return npnIndex;
	}

	public void setNpnIndex(int npnIndex) {
		this.npnIndex = npnIndex;
	}

	public int getEntIndex() {
		return entIndex;
	}

	public void setEntIndex(int entIndex) {
		this.entIndex = entIndex;
	}

	public int getNpnSubscriberCount() {
		return npnSubscriberCount;
	}

	public void setNpnSubscriberCount(int npnSubscriberCount) {
		this.npnSubscriberCount = npnSubscriberCount;
	}

	public int getNpnNewSubscriberCount() {
		return npnNewSubscriberCount;
	}

	public void setNpnNewSubscriberCount(int npnNewSubscriberCount) {
		this.npnNewSubscriberCount = npnNewSubscriberCount;
	}

	public int getNpnSubscriberTerminateCount() {
		return npnSubscriberTerminateCount;
	}

	public void setNpnSubscriberTerminateCount(int npnSubscriberTerminateCount) {
		this.npnSubscriberTerminateCount = npnSubscriberTerminateCount;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(String payAmount) {
		this.payAmount = payAmount;
	}

	@Override
	public String toString() {
		return "NationalPension [npnIndex=" + npnIndex + ", entIndex=" + entIndex + ", npnSubscriberCount="
				+ npnSubscriberCount + ", npnNewSubscriberCount=" + npnNewSubscriberCount
				+ ", npnSubscriberTerminateCount=" + npnSubscriberTerminateCount + ", payDate=" + payDate
				+ ", payAmount=" + payAmount + "]";
	}

}