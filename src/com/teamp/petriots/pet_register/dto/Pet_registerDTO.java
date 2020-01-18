package com.teamp.petriots.pet_register.dto;

public class Pet_registerDTO
{
	// 반려동물번호, 이름, 등록일자, 유저번호, 동물타입번호
	private String p_r_num, name, isudate, user_num, p_t_num;
	// 질병, 복용 약, 특이사항, 
	private String illness, drug, additional, pet_img;
	// 생일, 종, 삭제일자
	private String birth, speices, deldate;
	// 종류, 사이즈
	private String maintype, subtype;
	
	// getter / setter 생성
	public String getP_r_num()
	{
		return p_r_num;
	}
	public void setP_r_num(String p_r_num)
	{
		this.p_r_num = p_r_num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getIsudate()
	{
		return isudate;
	}
	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}
	public String getUser_num()
	{
		return user_num;
	}
	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}
	public String getP_t_num()
	{
		return p_t_num;
	}
	public void setP_t_num(String p_t_num)
	{
		this.p_t_num = p_t_num;
	}
	public String getIllness()
	{
		return illness;
	}
	public void setIllness(String illness)
	{
		this.illness = illness;
	}
	public String getDrug()
	{
		return drug;
	}
	public void setDrug(String drug)
	{
		this.drug = drug;
	}
	public String getAdditional()
	{
		return additional;
	}
	public void setAdditional(String additional)
	{
		this.additional = additional;
	}
	public String getPet_img()
	{
		return pet_img;
	}
	public void setPet_img(String pet_img)
	{
		this.pet_img = pet_img;
	}
	public String getBirth()
	{
		return birth;
	}
	public void setBirth(String birth)
	{
		this.birth = birth;
	}
	public String getSpeices()
	{
		return speices;
	}
	public void setSpeices(String speices)
	{
		this.speices = speices;
	}
	public String getDeldate()
	{
		return deldate;
	}
	public void setDeldate(String deldate)
	{
		this.deldate = deldate;
	}
	public String getMaintype()
	{
		return maintype;
	}
	public void setMaintype(String maintype)
	{
		this.maintype = maintype;
	}
	public String getSubtype()
	{
		return subtype;
	}
	public void setSubtype(String subtype)
	{
		this.subtype = subtype;
	}
	
	// 반려동물타입 지정 메소드
	public String typeConvert(String maintype, String subtype)
	{
		if (maintype.equals("개") && subtype.equals("소형"))
			p_t_num = "1";
		else if (maintype.equals("개") && subtype.equals("중형"))
			p_t_num = "2";
		else if (maintype.equals("개") && subtype.equals("대형"))
			p_t_num = "3";
		else if (maintype.equals("고양이") && subtype.equals("소형"))
			p_t_num = "4";
		else if (maintype.equals("고양이") && subtype.equals("중형"))
			p_t_num = "5";
		else if (maintype.equals("고양이") && subtype.equals("대형"))
			p_t_num = "6";
		else if (maintype.equals("새") && subtype.equals("소형"))
			p_t_num = "10";
		else if (maintype.equals("새") && subtype.equals("중형"))
			p_t_num = "11";
		else if (maintype.equals("새") && subtype.equals("대형"))
			p_t_num = "12";
		else if (maintype.equals("기타") && subtype.equals("소형"))
			p_t_num = "7";
		else if (maintype.equals("기타") && subtype.equals("중형"))
			p_t_num = "8";
		else if (maintype.equals("기타") && subtype.equals("대형"))
			p_t_num = "9";
		
		return p_t_num;
	}
	
	
}
