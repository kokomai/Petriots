package com.teamp.petriots.signup.dto;

public class SignupDTO
{
	// 유저번호, 비밀번호, 아이디, 이름, 주민번호
	private String user_num, pwd, pwd2, userId, userName, ssn;
	// 우편번호, 주소, 상세주소
	private String zipcode, address, addrdetails;
	// 위경도 좌표
	private double addrLat, addrLong;
	// 회원 가입 시 입력 칸이 나누어져 있는 것을 감안해서 속성을 나눴습니다.
	private String tel1, tel2, tel3, tel;
	// 정보 수정 시 입력 칸이 나누어져 있는 것을 감안해서 속성을 나눴습니다.
	private String email, email1, email2;
	// 닉네임, 가입일 , 이미지
	private String nickName, su_date, profile_img;
	

	// 위탁 횟수
	private int count;
	
	// getter / setter 생성
	public String getPwd2()
	{
		return pwd2;
	}
	public void setPwd2(String pwd2)
	{
		this.pwd2 = pwd2;
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
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getZipcode()
	{
		return zipcode;
	}
	public void setZipcode(String zipcode)
	{
		this.zipcode = zipcode;
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
	public double getAddrLat()
	{
		return addrLat;
	}
	public void setAddrLat(double addrLat)
	{
		this.addrLat = addrLat;
	}
	public double getAddrLong()
	{
		return addrLong;
	}
	public void setAddrLong(double addrLong)
	{
		this.addrLong = addrLong;
	}
	public String getTel1()
	{
		return tel1;
	}
	public void setTel1(String tel1)
	{
		this.tel1 = tel1;
	}
	public String getTel2()
	{
		return tel2;
	}
	public void setTel2(String tel2)
	{
		this.tel2 = tel2;
	}
	public String getTel3()
	{
		return tel3;
	}
	public void setTel3(String tel3)
	{
		this.tel3 = tel3;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getEmail1()
	{
		return email1;
	}
	public void setEmail1(String email1)
	{
		this.email1 = email1;
	}
	public String getEmail2()
	{
		return email2;
	}
	public void setEmail2(String email2)
	{
		this.email2 = email2;
	}
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getSu_date()
	{
		return su_date;
	}
	public void setSu_date(String su_date)
	{
		this.su_date = su_date;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public String getProfile_img()
	{
		return profile_img;
	}
	public void setProfile_img(String profile_img)
	{
		this.profile_img = profile_img;
	}
	
}
