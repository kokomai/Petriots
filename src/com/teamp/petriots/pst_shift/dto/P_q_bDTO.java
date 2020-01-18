package com.teamp.petriots.pst_shift.dto;

// 인성 검사 문제 은행
public class P_q_bDTO
{
	// 인성 검사 문제 번호
	private String p_t_q_num;
	// 관리자 번호(문제를 등록한 관리자 번호)
	private String admin_num;
	// 문제, 정답
	private String mainText, correct;
	// 보기 1,2,3,4,5
	private String chioce1, chioce2, chioce3, chioce4, chioce5;
	
	public String getP_t_q_num()
	{
		return p_t_q_num;
	}
	public void setP_t_q_num(String p_t_q_num)
	{
		this.p_t_q_num = p_t_q_num;
	}
	public String getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(String admin_num)
	{
		this.admin_num = admin_num;
	}
	public String getMainText()
	{
		return mainText;
	}
	public void setMainText(String mainText)
	{
		this.mainText = mainText;
	}
	public String getCorrect()
	{
		return correct;
	}
	public void setCorrect(String correct)
	{
		this.correct = correct;
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
