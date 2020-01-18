package com.teamp.petriots.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.notice.dto.NoticeDTO;

public interface INoticeDAO
{
	// 데이터 몇 개인지 찾아보기
	public int getDataCount(@Param("searchKey")String searchKey, @Param("searchValue")String searchValue);
	
	// 게시물 작성
	public int insertData(NoticeDTO dto);
	
	// 리스트 출력
	public List<NoticeDTO> getLists(@Param("start")int start, @Param("end")int end, @Param("searchKey")String searchKey, @Param("searchValue")String searchValue);
	
	// 조회수 증가
	public int updateHitCount(int ntcNum);
	
	// 게시물 진입
	public NoticeDTO getReadData(int ntcNum);
	
	// 게시물 삭제
	public int deleteData(int ntcNum);
	
	// 게시물 수정
	public int updateData(NoticeDTO dto);
	
	// 이전 게시물 번호 얻어내기
	public int getBeforeNum(int ntcNum);
	
	// 다음 게시물 번호 얻어내기
	public int getNextNum(int ntcNum);
	
	// 관리자ID로 관리자 번호 찾기
	public int getAdminNum(NoticeDTO dto);
}