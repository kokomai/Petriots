// 커트라인 테이블 DTO 구성
package com.teamp.petriots.cutline.dto;

public class CutlineDTO
{
	private int cutline_num, admin_num, p_cl, i_cl;
	private String isudate;
	
	public int getCutline_num()
	{
		return cutline_num;
	}
	public void setCutline_num(int cutline_num)
	{
		this.cutline_num = cutline_num;
	}
	public int getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(int admin_num)
	{
		this.admin_num = admin_num;
	}
	public int getP_cl()
	{
		return p_cl;
	}
	public void setP_cl(int p_cl)
	{
		this.p_cl = p_cl;
	}
	public int getI_cl()
	{
		return i_cl;
	}
	public void setI_cl(int i_cl)
	{
		this.i_cl = i_cl;
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
