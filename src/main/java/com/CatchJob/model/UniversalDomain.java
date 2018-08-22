package com.CatchJob.model;

/*범용 도메인 객체*/
public class UniversalDomain {
	
	private int domainIndex;
	private String domainAddress;
	private String domainName;
	
	public int getDomainIndex() {
		return domainIndex;
	}
	public void setDomainIndex(int domainIndex) {
		this.domainIndex = domainIndex;
	}
	public String getDomainAddress() {
		return domainAddress;
	}
	public void setDomainAddress(String domainAddress) {
		this.domainAddress = domainAddress;
	}
	public String getDomainName() {
		return domainName;
	}
	public void setDomainName(String domainName) {
		this.domainName = domainName;
	}
	
	@Override
	public String toString() {
		return "UniversalDomain [domainIndex=" + domainIndex + ", domainAddress=" + domainAddress + ", domainName="
				+ domainName + "]";
	}
	
}
