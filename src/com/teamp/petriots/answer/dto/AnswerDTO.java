package com.teamp.petriots.answer.dto;

public class AnswerDTO
{
	// ANSWER 테이블
	private int qNum ,aNum, aUserNum;
	private String aDelDate, aIsudate, aMaintext, userId;
	
	// A_COMMENT 테이블
	private int aCNum, aCUserNum, aCParentNum;
	private String aCMaintext, aCDelDate, aCIsudate;
	
	// getter / setter 구성
	public int getqNum()
	{
		return qNum;
	}
	public void setqNum(int qNum)
	{
		this.qNum = qNum;
	}
	public int getaNum()
	{
		return aNum;
	}
	public void setaNum(int aNum)
	{
		this.aNum = aNum;
	}
	public int getaUserNum()
	{
		return aUserNum;
	}
	public void setaUserNum(int aUserNum)
	{
		this.aUserNum = aUserNum;
	}
	public String getaDelDate()
	{
		return aDelDate;
	}
	public void setaDelDate(String aDelDate)
	{
		this.aDelDate = aDelDate;
	}
	public String getaIsudate()
	{
		return aIsudate;
	}
	public void setaIsudate(String aIsudate)
	{
		this.aIsudate = aIsudate;
	}
	public String getaMaintext()
	{
		return aMaintext;
	}
	public void setaMaintext(String aMaintext)
	{
		this.aMaintext = aMaintext;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public int getaCNum()
	{
		return aCNum;
	}
	public void setaCNum(int aCNum)
	{
		this.aCNum = aCNum;
	}
	public int getaCUserNum()
	{
		return aCUserNum;
	}
	public void setaCUserNum(int aCUserNum)
	{
		this.aCUserNum = aCUserNum;
	}
	public int getaCParentNum()
	{
		return aCParentNum;
	}
	public void setaCParentNum(int aCParentNum)
	{
		this.aCParentNum = aCParentNum;
	}
	public String getaCMaintext()
	{
		return aCMaintext;
	}
	public void setaCMaintext(String aCMaintext)
	{
		this.aCMaintext = aCMaintext;
	}
	public String getaCDelDate()
	{
		return aCDelDate;
	}
	public void setaCDelDate(String aCDelDate)
	{
		this.aCDelDate = aCDelDate;
	}
	public String getaCIsudate()
	{
		return aCIsudate;
	}
	public void setaCIsudate(String aCIsudate)
	{
		this.aCIsudate = aCIsudate;
	}
}