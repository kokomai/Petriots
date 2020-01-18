package com.teamp.petriots.question.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.question.dto.QuestionDTO;

public interface IQuestionDAO
{
	// 데이터 몇 개인지 찾아보기
	public int getDataCount(@Param("searchKey")String searchKey, @Param("searchValue")String searchValue);
	
	// 게시물 목록 가져오기
	public List<QuestionDTO> getLists(@Param("start")int start, @Param("end")int end, @Param("searchKey")String searchKey, @Param("searchValue")String searchValue);
	
	// 게시물 작성
	public int insertData(QuestionDTO dto);
	
	// 게시물 수정
	public int updateData(QuestionDTO dto);
	
	// 게시물 삭제
	public int deleteData(int qNum);
	
	// 조회수 증가
	public int updateHitCount(int qNum);
	
	// 한 게시물 읽기
	public QuestionDTO getReadData(int qNum);
	
	// 이전 게시물 번호 얻어내기
	public int getBeforeNum(int qNum);
	
	// 다음 게시물 번호 얻어내기
	public int getNextNum(int qNum);
	
	// 닉네임으로 번호찾기
	public String getQNum(QuestionDTO dto);
	
	// 댓글 가져오기
	public List<QuestionDTO> getComment(int qNum);
		
	// 댓글 및 대댓글 삽입
	public int qCommentCreateOk(QuestionDTO dto);
	
	// 댓글 및 대댓글 수정
	public int qCommentUpdated(QuestionDTO dto);
	
	// 댓글 및 대댓글 삭제
	public int qqCommentDeleteOk(int qCNum);
}