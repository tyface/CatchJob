package com.CatchJob.service;

import java.util.List;
import java.util.Map;

import com.CatchJob.model.Admin;

public interface AdminService {

	public Admin getAdmin(int adminIndex);

	public boolean login(String adminId, String adminPw);

	public Admin getAdminById(String adminId);

	public boolean modify(Admin admin);
	/* 페이징 처리 */
	public int calPageTotalCount(int totalCount, int numOfMsgPage);

	public int getStartPage(int pageNum);

	public int getEndPage(int pageNum);

	public Map<String, Object> getMessageList(Map<String, Object> data);

}
