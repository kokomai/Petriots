package com.teamp.petriots.notice.dto;

public class NoticeDTO
{
	// 게시글 번호 속성
	private int rNum;
	
	// NOTICE 테이블 컬럼
	private int ntcNum, adminNum, views;				// 번호, 관리자번호, 조회수
	private String adminId, subject, maintext, isudate;	// 제목, 내용, 입력 날짜

	// getter / setter 구성
	public int getrNum()
	{
		return rNum;
	}
	public void setrNum(int rNum)
	{
		this.rNum = rNum;
	}
	public int getNtcNum()
	{
		return ntcNum;
	}
	public void setNtcNum(int ntcNum)
	{
		this.ntcNum = ntcNum;
	}
	
	public int getAdminNum()
	{
		return adminNum;
	}
	
	public void setAdminNum(int adminNum)
	{
		this.adminNum = adminNum;
	}
	
	public int getViews()
	{
		return views;
	}
	public void setViews(int views)
	{
		this.views = views;
	}
	
	public String getAdminId()
	{
		return adminId;
	}
	public void setAdminId(String adminId)
	{
		this.adminId = adminId;
	}
	
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getMaintext()
	{
		return maintext;
	}
	public void setMaintext(String maintext)
	{
		this.maintext = maintext;
	}
	public String getIsudate()
	{
		return isudate;
	}
	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}
}