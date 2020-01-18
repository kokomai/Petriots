package com.teamp.petriots.mtom_q.dto;

public class Mtom_qDTO
{
	// 문의번호, 유저번호, 문의일자, 내용, 삭제일자
	private String m_q_num, user_num, isudate, maintext, deldate;
	// 문의 분류 번호, 문의 분류
	private String m_q_t_num, type;
	
	//1대1문의 답글 테이블
	private int m_a_num, admin_num;
	private String a_maintext, a_deldate, a_isudate;
		
	
	public int getM_a_num()
	{
		return m_a_num;
	}
	public void setM_a_num(int m_a_num)
	{
		this.m_a_num = m_a_num;
	}
	public int getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(int admin_num)
	{
		this.admin_num = admin_num;
	}
	public String getA_maintext()
	{
		return a_maintext;
	}
	public void setA_maintext(String a_maintext)
	{
		this.a_maintext = a_maintext;
	}
	public String getA_deldate()
	{
		return a_deldate;
	}
	public void setA_deldate(String a_deldate)
	{
		this.a_deldate = a_deldate;
	}
	public String getA_isudate()
	{
		return a_isudate;
	}
	public void setA_isudate(String a_isudate)
	{
		this.a_isudate = a_isudate;
	}
	
	public String getM_q_num()
	{
		return m_q_num;
	}
	public void setM_q_num(String m_q_num)
	{
		this.m_q_num = m_q_num;
	}
	public String getUser_num()
	{
		return user_num;
	}
	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}
	public String getIsudate()
	{
		return isudate;
	}
	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}
	public String getMaintext()
	{
		return maintext;
	}
	public void setMaintext(String maintext)
	{
		this.maintext = maintext;
	}
	public String getDeldate()
	{
		return deldate;
	}
	public void setDeldate(String deldate)
	{
		this.deldate = deldate;
	}
	public String getM_q_t_num()
	{
		return m_q_t_num;
	}
	public void setM_q_t_num(String m_q_t_num)
	{
		this.m_q_t_num = m_q_t_num;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	
	
}
