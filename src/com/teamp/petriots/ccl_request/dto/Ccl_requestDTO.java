package com.teamp.petriots.ccl_request.dto;

public class Ccl_requestDTO
{
  // 확정 체크리스트에 대한..
		//예약번호, 확정체크리스트번호, 요청체크리스트 항목 번호
	private String r_a_num, c_c_num, c_req_num;
		//실행여부 비디오, 이미지 링크,실행 시각
	private String excute, vidlink, imglink, time;
		//시작시간, 끝시간, 내용
	private String cksttdate, ckenddate, maintext;
	
	private String user_num;
	
	
	
	//getter ,setter
	
	public String getUser_num()
	{
		return user_num;
	}
	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}
	public String getExcute()
	{
		return excute;
	}
	public String getC_req_num()
	{
		return c_req_num;
	}
	public void setC_req_num(String c_req_num)
	{
		this.c_req_num = c_req_num;
	}
	public void setExcute(String excute)
	{
		this.excute = excute;
	}

	public String getR_a_num()
	{
		return r_a_num;
	}
	public void setR_a_num(String r_a_num)
	{
		this.r_a_num = r_a_num;
	}
	public String getC_c_num()
	{
		return c_c_num;
	}
	public void setC_c_num(String c_c_num)
	{
		this.c_c_num = c_c_num;
	}
	public String getVidlink()
	{
		return vidlink;
	}
	public void setVidlink(String vidlink)
	{
		this.vidlink = vidlink;
	}
	public String getImglink()
	{
		return imglink;
	}
	public void setImglink(String imglink)
	{
		this.imglink = imglink;
	}
	public String getTime()
	{
		return time;
	}
	public void setTime(String time)
	{
		this.time = time;
	}
	public String getMaintext()
	{
		return maintext;
	}
	public void setMaintext(String maintext)
	{
		this.maintext = maintext;
	}
	public String getCksttdate()
	{
		return cksttdate;
	}
	public void setCksttdate(String cksttdate)
	{
		this.cksttdate = cksttdate;
	}
	public String getCkenddate()
	{
		return ckenddate;
	}
	public void setCkenddate(String ckenddate)
	{
		this.ckenddate = ckenddate;
	}
   
	
	
	
}