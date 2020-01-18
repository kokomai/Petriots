package com.teamp.petriots.question.dto;

public class QuestionDTO
{
	// 게시글 번호 속성
	private int rNum;
	
	// QUESTION 테이블
	private int qNum, qViews;
	private String qUserNum, qDelDate, qIsudate, qSubject, qMaintext, userId;
	
	// Q_COMMENT 테이블
	private int qCParentNum;
	private String qCNum, qCUserNum, qCMaintext, qCDelDate, qCIsudate, oriQCMaintext, deldate;
	
	// getter / setter 구성
	public int getrNum()
	{
		return rNum;
	}
	public void setrNum(int rNum)
	{
		this.rNum = rNum;
	}
	public int getqNum()
	{
		return qNum;
	}
	public void setqNum(int qNum)
	{
		this.qNum = qNum;
	}
	public String getqUserNum()
	{
		return qUserNum;
	}
	public void setqUserNum(String qUserNum)
	{
		this.qUserNum = qUserNum;
	}
	public int getqViews()
	{
		return qViews;
	}
	public void setqViews(int qViews)
	{
		this.qViews = qViews;
	}
	public String getqDelDate()
	{
		return qDelDate;
	}
	public void setqDelDate(String qDelDate)
	{
		this.qDelDate = qDelDate;
	}
	public String getqIsudate()
	{
		return qIsudate;
	}
	public void setqIsudate(String qIsudate)
	{
		this.qIsudate = qIsudate;
	}
	public String getqSubject()
	{
		return qSubject;
	}
	public void setqSubject(String qSubject)
	{
		this.qSubject = qSubject;
	}
	public String getqMaintext()
	{
		return qMaintext;
	}
	public void setqMaintext(String qMaintext)
	{
		this.qMaintext = qMaintext;
	}
	public String getqCNum()
	{
		return qCNum;
	}
	public void setqCNum(String qCNum)
	{
		this.qCNum = qCNum;
	}
	public String getqCUserNum()
	{
		return qCUserNum;
	}
	public void setqCUserNum(String qCUserNum)
	{
		this.qCUserNum = qCUserNum;
	}
	public int getqCParentNum()
	{
		return qCParentNum;
	}
	public void setqCParentNum(int qCParentNum)
	{
		this.qCParentNum = qCParentNum;
	}
	public String getqCMaintext()
	{
		return qCMaintext;
	}
	public void setqCMaintext(String qCMaintext)
	{
		this.qCMaintext = qCMaintext;
	}
	public String getqCDelDate()
	{
		return qCDelDate;
	}
	public void setqCDelDate(String qCDelDate)
	{
		this.qCDelDate = qCDelDate;
	}
	public String getqCIsudate()
	{
		return qCIsudate;
	}
	public void setqCIsudate(String qCIsudate)
	{
		this.qCIsudate = qCIsudate;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getOriQCMaintext()
	{
		return oriQCMaintext;
	}
	public void setOriQCMaintext(String oriQCMaintext)
	{
		this.oriQCMaintext = oriQCMaintext;
	}
	public String getDeldate()
	{
		return deldate;
	}
	public void setDeldate(String deldate)
	{
		this.deldate = deldate;
	}
}