package com.teamp.petriots.withdrawal.dto;

public class WithdrawalDTO
{
	// 탈퇴 번호, 탈퇴 일자, 탈퇴 사유 번호, 자세한 탈퇴 사유, 유저번호, 비밀번호
	private String wd_num, isudate, wd_r_num, details, user_num, pwd;
	// 셀렉트 박스 탈퇴 사유
	private String reason;

	public String getWd_num()
	{
		return wd_num;
	}

	public void setWd_num(String wd_num)
	{
		this.wd_num = wd_num;
	}

	public String getIsudate()
	{
		return isudate;
	}

	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}

	public String getWd_r_num()
	{
		return wd_r_num;
	}

	public void setWd_r_num(String wd_r_num)
	{
		this.wd_r_num = wd_r_num;
	}

	public String getDetails()
	{
		return details;
	}

	public void setDetails(String details)
	{
		this.details = details;
	}

	public String getUser_num()
	{
		return user_num;
	}

	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}

	public String getPwd()
	{
		return pwd;
	}

	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}

	public String getReason()
	{
		return reason;
	}

	public void setReason(String reason)
	{
		this.reason = reason;
	}
	
	
}
