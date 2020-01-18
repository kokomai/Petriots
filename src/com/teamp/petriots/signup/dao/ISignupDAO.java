package com.teamp.petriots.signup.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.signup.dto.SignupDTO;


public interface ISignupDAO
{
	public ArrayList<SignupDTO> memberdata(@Param("user_num")String user_num, @Param("pwd")String pwd);
	public int membermodify(SignupDTO dto);
	public ArrayList<SignupDTO> mypage(String user_num);
	public int mycount(String user_num);
	public String idsearch(SignupDTO dto);
	public String pwsearch(SignupDTO dto);
	
	//DML 메소드
	public int add(SignupDTO dto);
	public int remove(String user_num);
	public int modify(SignupDTO dto);
		
	//회원번호로 회원정보 받기
	public SignupDTO getData(String user_num);
		
	//로그인
	public int login();
	
	// 관리자 영역
	public ArrayList<SignupDTO> list();
	public int modifymember(SignupDTO m);
	public int deletemember(SignupDTO m);
	
}
