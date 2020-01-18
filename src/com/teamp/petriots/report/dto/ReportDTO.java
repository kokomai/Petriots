package com.teamp.petriots.report.dto;

public class ReportDTO
{
	// 신고 테이블 변수 getter / setter 구성
	private int rpt_num, reporter, reported, rpt_type_num, sct_num, admin_num, sct_type_num, sctday;
	private String isudate, details, s_isudate;
	
	public int getRpt_num()
	{
		return rpt_num;
	}
	public void setRpt_num(int rpt_num)
	{
		this.rpt_num = rpt_num;
	}
	public int getReporter()
	{
		return reporter;
	}
	public void setReporter(int reporter)
	{
		this.reporter = reporter;
	}
	public int getReported()
	{
		return reported;
	}
	public void setReported(int reported)
	{
		this.reported = reported;
	}
	public int getRpt_type_num()
	{
		return rpt_type_num;
	}
	public void setRpt_type_num(int rpt_type_num)
	{
		this.rpt_type_num = rpt_type_num;
	}
	public int getSct_num()
	{
		return sct_num;
	}
	public void setSct_num(int sct_num)
	{
		this.sct_num = sct_num;
	}
	public int getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(int admin_num)
	{
		this.admin_num = admin_num;
	}
	public int getSct_type_num()
	{
		return sct_type_num;
	}
	public void setSct_type_num(int sct_type_num)
	{
		this.sct_type_num = sct_type_num;
	}
	public int getSctday()
	{
		return sctday;
	}
	public void setSctday(int sctday)
	{
		this.sctday = sctday;
	}
	public String getIsudate()
	{
		return isudate;
	}
	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}
	public String getDetails()
	{
		return details;
	}
	public void setDetails(String details)
	{
		this.details = details;
	}
	public String getS_isudate()
	{
		return s_isudate;
	}
	public void setS_isudate(String s_isudate)
	{
		this.s_isudate = s_isudate;
	}
	
	
	
}
