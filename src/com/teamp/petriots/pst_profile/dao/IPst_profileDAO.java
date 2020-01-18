package com.teamp.petriots.pst_profile.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.pst_profile.dto.Pst_profileDTO;

public interface IPst_profileDAO
{
	public ArrayList<Pst_profileDTO> petsitterlist(@Param("addrLat")double addrLat, @Param("addrLong")double addrLong);
	public ArrayList<Pst_profileDTO> reservenowlist(String user_num);
	public ArrayList<Pst_profileDTO> reserverequestlist(String user_num);
	public ArrayList<Pst_profileDTO> reservelist(String user_num);
	public ArrayList<Pst_profileDTO> reserveapprove(String user_num);
	public ArrayList<Pst_profileDTO> favoritelist(String user_num); 

	/* public ArrayList<Pst_reservenowDTO> reservenowlist(String user_num); */	// 펫시터 입장에서는 예약 한 유저 / 반려동물 정보 보여야함.
	public ArrayList<Pst_profileDTO> reservereqlist(String user_num);	// 펫시터 요청된 예약
	public ArrayList<Pst_profileDTO> favoritemember(String user_num); 	// 펫시터 나를 찜한 사람
	public ArrayList<Pst_profileDTO> blockmember(String user_num); 		// 펫시터 블랙리스트
	public int blockmemberRemove(String user_num); 						// 펫시터 블랙리스트 삭제
	public ArrayList<Pst_profileDTO> mypetsitterdata(String user_num);	// 펫시터 내정보
	public int countendreserve(String user_num);						// 펫시터 총 위탁 수
	
   public Pst_profileDTO getReadData(int p_s_p_num);    			// 프로필 리드 데이터
   public int petsitterprofileadd(Pst_profileDTO p);               // 펫시터 프로필 추가 메소드
   public int petsitterprofilemodify(Pst_profileDTO dto);            // 펫시터 프로필 수정 메소드
   public ArrayList<Pst_profileDTO> searchpetsitterlist(Pst_profileDTO dto);   // 메인 서치 필터 
   
   
   public ArrayList<Pst_profileDTO> questlist(String user_num);		// 업적 리스트 출력
   public int questListOk(Pst_profileDTO dto);						// 업적 선택한 것 적용
   public ArrayList<Pst_profileDTO> reserveDetail(@Param("user_num") String user_num);  // 펫시터 더보기 클릭시 프로필 출력 메소드
   
   public void insertFavorite(@Param("p_s_num") String p_s_num, @Param("user_num") String user_num);
   public void deleteFavorite(@Param("p_s_num") String p_s_num, @Param("user_num") String user_num);
   public Pst_profileDTO checkFavorite(@Param("p_s_num") String p_s_num, @Param("user_num") String user_num);
}
