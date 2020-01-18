package com.teamp.petriots.p_q_b.dto;

public class P_q_bDTO
{
	// 인성검사 테이블 변수 getter / setter 구성을 위한 변수 선언
	private int p_t_q_num, correct;
	private String maintext;
	private String chioce1, chioce2, chioce3, chioce4, chioce5;
	private int admin_num;
	
	// 검색을 위한 변수 생성
	private int search;
	
	public int getSearch()
	{
		return search;
	}
	public void setSearch(int search)
	{
		this.search = search;
	}
	public int getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(int admin_num)
	{
		this.admin_num = admin_num;
	}
	public int getP_t_q_num()
	{
		return p_t_q_num;
	}
	public void setP_t_q_num(int p_t_q_num)
	{
		this.p_t_q_num = p_t_q_num;
	}
	public int getCorrect()
	{
		return correct;
	}
	public void setCorrect(int correct)
	{
		this.correct = correct;
	}
	public String getMaintext()
	{
		return maintext;
	}
	public void setMaintext(String maintext)
	{
		this.maintext = maintext;
	}
	public String getChioce1()
	{
		return chioce1;
	}
	public void setChioce1(String chioce1)
	{
		this.chioce1 = chioce1;
	}
	public String getChioce2()
	{
		return chioce2;
	}
	public void setChioce2(String chioce2)
	{
		this.chioce2 = chioce2;
	}
	public String getChioce3()
	{
		return chioce3;
	}
	public void setChioce3(String chioce3)
	{
		this.chioce3 = chioce3;
	}
	public String getChioce4()
	{
		return chioce4;
	}
	public void setChioce4(String chioce4)
	{
		this.chioce4 = chioce4;
	}
	public String getChioce5()
	{
		return chioce5;
	}
	public void setChioce5(String chioce5)
	{
		this.chioce5 = chioce5;
	}
	
}
