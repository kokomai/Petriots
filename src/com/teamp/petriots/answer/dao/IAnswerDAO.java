package com.teamp.petriots.answer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.answer.dto.AnswerDTO;

public interface IAnswerDAO
{
	// 질문에 대한 답글 가져오기
	public List<AnswerDTO> getList(int qNum);
		
	// 답글 작성
	public int insertData(AnswerDTO dto);
	
	// 답글 수정
	public int updateData(AnswerDTO dto);
	
	// 답글 삭제
	public int deleteData(int aNum);
		
	// 한 게시물 읽기
	public AnswerDTO getReadData(int aNum);
	
	// 닉네임으로 번호찾기
	public int getANum(AnswerDTO dto);
}