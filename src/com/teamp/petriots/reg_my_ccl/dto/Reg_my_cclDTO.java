package com.teamp.petriots.reg_my_ccl.dto;

public class Reg_my_cclDTO
{
	// 체크리스트번호, 동물번호, 시작시간, 끝시간, 할 일
	private String r_m_c_num, p_r_num, stttime, endtime, maintxt;

	public String getR_m_c_num()
	{
		return r_m_c_num;
	}

	public void setR_m_c_num(String r_m_c_num)
	{
		this.r_m_c_num = r_m_c_num;
	}

	public String getP_r_num()
	{
		return p_r_num;
	}

	public void setP_r_num(String p_r_num)
	{
		this.p_r_num = p_r_num;
	}

	public String getStttime()
	{
		return stttime;
	}

	public void setStttime(String stttime)
	{
		this.stttime = stttime;
	}

	public String getEndtime()
	{
		return endtime;
	}

	public void setEndtime(String endtime)
	{
		this.endtime = endtime;
	}

	public String getMaintxt()
	{
		return maintxt;
	}

	public void setMaintxt(String maintxt)
	{
		this.maintxt = maintxt;
	}
	
}
