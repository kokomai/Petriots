/*
 *  펫시터 측면에서 위탁/예약 중인 카드 정보 저장하는 DTO 입니다. 
 * */

package com.teamp.petriots.sit_approve.dto;

public class Pst_reserveDTO
{
	//USER_NUM, nickName, P_R_NUM, PROFILE_IMG, PET_IMG, R_A_NUM, ADDRESS
	//USERID, PROFILE_IMG, PET_NAME, PET_IMG, R_A_NUM, STTDATE, ENDDATE, ISUDATE
		// 유저 번호, 닉네임,  펫등록번호
	private String user_num, nickName, p_r_num, p_s_num;
		// 프로필 이미지, 펫 이미지
	private String profile_img, pet_img;
		// 예약 승인 번호 , 주소
	private String r_a_num, address, addrdetails;
		// 펫 이름
	private String pet_name;
	
	   // 체크인, 체크아웃, 요청날짜, 펫시팅날짜
	private String checkin, checkout, isudate, sttdate, enddate;
		//종류, 병, 특이사항, 약
	private String speices, illness, additional, drug;
	private int price;
	
	public String getNickName()
	{
		return nickName;
	}

	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}

	public int getPrice()
	{
		return price;
	}

	public void setPrice(int price)
	{
		this.price = price;
	}

	// getter / setter
	public String getIllness()
	{
		return illness;
	}

	public void setIllness(String illness)
	{
		this.illness = illness;
	}

	public String getAdditional()
	{
		return additional;
	}

	public void setAdditional(String additional)
	{
		this.additional = additional;
	}

	public String getDrug()
	{
		return drug;
	}

	public void setDrug(String drug)
	{
		this.drug = drug;
	}

	public String getSpeices()
	{
		return speices;
	}

	public void setSpeices(String speices)
	{
		this.speices = speices;
	}

	public String getSttdate()
	{
		return sttdate;
	}

	public void setSttdate(String sttdate)
	{
		this.sttdate = sttdate;
	}

	
	public String getCheckin()
	{
		return checkin;
	}

	public void setCheckin(String checkin)
	{
		this.checkin = checkin;
	}

	public String getCheckout()
	{
		return checkout;
	}

	public void setCheckout(String checkout)
	{
		this.checkout = checkout;
	}

	public String getIsudate()
	{
		return isudate;
	}

	public void setIsudate(String isudate)
	{
		this.isudate = isudate;
	}

	public String getPet_name()
	{
		return pet_name;
	}

	public void setPet_name(String pet_name)
	{
		this.pet_name = pet_name;
	}

	public String getUser_num()
	{
		return user_num;
	}

	public void setUser_num(String user_num)
	{
		this.user_num = user_num;
	}

	public String getnickName()
	{
		return nickName;
	}

	public void setnickName(String nickName)
	{
		this.nickName = nickName;
	}

	public String getP_r_num()
	{
		return p_r_num;
	}

	public void setP_r_num(String p_r_num)
	{
		this.p_r_num = p_r_num;
	}

	public String getProfile_img()
	{
		return profile_img;
	}

	public void setProfile_img(String profile_img)
	{
		this.profile_img = profile_img;
	}

	public String getPet_img()
	{
		return pet_img;
	}

	public void setPet_img(String pet_img)
	{
		this.pet_img = pet_img;
	}

	public String getR_a_num()
	{
		return r_a_num;
	}

	public void setR_a_num(String r_a_num)
	{
		this.r_a_num = r_a_num;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getAddrdetails()
	{
		return addrdetails;
	}

	public void setAddrdetails(String addrdetails)
	{
		this.addrdetails = addrdetails;
	}

	public String getP_s_num()
	{
		return p_s_num;
	}

	public void setP_s_num(String p_s_num)
	{
		this.p_s_num = p_s_num;
	}

	public String getEnddate()
	{
		return enddate;
	}

	public void setEnddate(String enddate)
	{
		this.enddate = enddate;
	} 
	
}
