package com.CatchJob.model;

public class NationalPension {
	private int npnIndex;
	private int entIndex;
	private int npnSubscriberCount;
	private int npnNewSubscriberCount;
	private int npnSubscriberTerminateCount;
	private String payDate;
	private String payAmount;
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