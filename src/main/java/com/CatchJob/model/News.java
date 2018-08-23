package com.CatchJob.model;

import java.util.Date;

public class News {
	private String title;//개별 검색 결과이며, title, originallink, link, description, pubDate 를 포함한다.
	private String originallink; //검색 결과 문서의 제공 언론사 하이퍼텍스트 link를 나타낸다.
	private String link; //검색 결과 문서의 제공 네이버 하이퍼텍스트 link를 나타낸다.
	private String description;//검색 결과 문서의 내용을 요약한 패시지 정보이다. 문서 전체의 내용은 link를 따라가면 읽을 수 있다. 패시지에서 검색어와 일치하는 부분은 태그로 감싸져 있다. 
	private String pubDate;//검색 결과 문서가 네이버에 제공된 시간이다. 
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOriginallink() {
		return originallink;
	}
	public void setOriginallink(String originallink) {
		this.originallink = originallink;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	@Override
	public String toString() {
		return "News [title=" + title + ", originallink=" + originallink + ", link=" + link + ", description="
				+ description + ", pubDate=" + pubDate + "]";
	}


	
	
}
