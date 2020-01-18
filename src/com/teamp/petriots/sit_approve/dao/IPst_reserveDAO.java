package com.teamp.petriots.sit_approve.dao;

import java.util.ArrayList;

import com.teamp.petriots.pst_profile.dto.Pst_profileDTO;
import com.teamp.petriots.sit_approve.dto.Pst_reserveDTO;

public interface IPst_reserveDAO
{

   public int reservationform(Pst_reserveDTO dto); // 예약 신청 폼으로..
   
   public ArrayList<Pst_reserveDTO> reservenowlist(String user_num);   // 펫시터 현재 위탁건
   public ArrayList<Pst_reserveDTO> reservenowdetail(Pst_reserveDTO dto);         // 펫시터 현재 위탁건 자세히!
   public ArrayList<Pst_reserveDTO> reservelist(String user_num);      // 펫시터 지난 위탁건
   public ArrayList<Pst_reserveDTO> reservepastdetail(Pst_reserveDTO dto);         // 펫시터 지난 위탁건 자세히!
   public ArrayList<Pst_reserveDTO> reserveapprovelist(String user_num);   // 펫시터 승인한 위탁건
   public ArrayList<Pst_reserveDTO> reserveapprovedetail(Pst_reserveDTO dto);         // 펫시터 승인한 위탁건 자세히!
   public int reserveapprovecancel(Pst_reserveDTO dto);      // 위탁건 취소
   public ArrayList<Pst_reserveDTO> reserverequestlist(String user_num);   // 펫시터 요청된 위탁건
   public ArrayList<Pst_reserveDTO> reserverequestdetail(Pst_reserveDTO dto);         // 펫시터 요청된 위탁건 자세히!
   
   public int reserveokay(Pst_reserveDTO dto);            // 요청된 위탁건 승인
   public int sittingcomplete1(Pst_reserveDTO dto);         // 위탁 완료 1 (SIT 테이블에 넣기)
   public int sittingcomplete2(Pst_reserveDTO dto);         // 위탁 완료 2 (SIT_COMPLETE 테이블에 넣기)
   public int sittingstart(Pst_reserveDTO dto);         //위탁 시작
   
   //user~
   public ArrayList<Pst_reserveDTO> reservenowdetail_u(Pst_reserveDTO dto);         // 유저 현재 위탁건 자세히!
   public ArrayList<Pst_reserveDTO> reservepastdetail_u(Pst_reserveDTO dto);         // 유저 지난 위탁건 자세히!
   public ArrayList<Pst_reserveDTO> reserverequestdetail_u(Pst_reserveDTO dto);         // 유저 요청된 위탁건 자세히!
   public ArrayList<Pst_reserveDTO> reserveapprovedetail_u(Pst_reserveDTO dto);         // 유저승인한 위탁건 자세히!
   
   public ArrayList<Pst_reserveDTO> petsittercard(Pst_reserveDTO dto);
   public ArrayList<Pst_reserveDTO> detaildata(Pst_reserveDTO dto);
   public int reserveapply(Pst_reserveDTO dto);
   
}