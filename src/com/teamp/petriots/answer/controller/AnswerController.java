package com.teamp.petriots.answer.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.answer.dao.IAnswerDAO;
import com.teamp.petriots.answer.dto.AnswerDTO;
import com.teamp.petriots.question.dao.IQuestionDAO;
import com.teamp.petriots.util.MyUtil;

@Controller
public class AnswerController
{
	// mybatis 의존성 주입
	@Autowired
	private SqlSession sqlsession;
	
	// 답변 작성 폼으로 이동
	@RequestMapping(value = "/answercreated.action", method = RequestMethod.GET)
	public String AnswerCreate(Model model, HttpServletRequest request)
	{
		// 넘겨 받은 질문 번호, 페이지 번호 수신
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		model.addAttribute("qNum", qNum);
		model.addAttribute("pageNum", pageNum);
		
		return "/WEB-INF/views/answerCreated.jsp";
	}

	// 답변 insert
	@RequestMapping(value = "/answercreatedok.action", method = RequestMethod.POST)
	public void AnswerCreate(HttpServletRequest request, HttpServletResponse response)
	{
		// mapper를 이용해 dao 활용
		IAnswerDAO dao = sqlsession.getMapper(IAnswerDAO.class);
		
		// AnswerDTO 객체 생성
		AnswerDTO dto = new AnswerDTO();
		
		// 넘겨받은 질문번호, 페이지 번호, 닉네임, 내용
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String userId = request.getParameter("userId");
		String aMaintext = request.getParameter("content");
		
		// 질문번호, 내용, 닉네임 셋팅
		dto.setqNum(qNum);
		dto.setaMaintext(aMaintext);
		dto.setUserId(userId);
		
		// 닉네임으로 회원번호 찾기
		int aUserNum = dao.getANum(dto);
		dto.setaUserNum(aUserNum);
		
		// 답글 추가
		dao.insertData(dto);

		try
		{
			String cp = request.getContextPath();
			response.sendRedirect(cp + "/questionarticle.action?qNum="+qNum+"&pageNum="+pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	// 답글 수정 폼
	@RequestMapping(value = "/answerupdated.action", method = RequestMethod.GET)
	public String questionUpdated(Model model, HttpServletRequest request)
	{
		IAnswerDAO dao = sqlsession.getMapper(IAnswerDAO.class);
		
		// 수정 요청 시 넘어온 게시물 번호 데이터 수신
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		int aNum = Integer.parseInt(request.getParameter("aNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		AnswerDTO dto = new AnswerDTO();
		
		// 답글 읽기
		dto = dao.getReadData(aNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("aNum", aNum);
		model.addAttribute("qNum", qNum);
		model.addAttribute("pageNum", pageNum);
		
		return "/WEB-INF/views/answerUpdated.jsp";
	}

	// 답글 수정
	@RequestMapping("/answerupdatedok.action")
	public void questionUpdated(HttpServletRequest request, HttpServletResponse response)
	{
		// mapper를 이용해 dao 활용
		IAnswerDAO dao = sqlsession.getMapper(IAnswerDAO.class);
		
		// 넘겨받은 페이지번호, 질문번호, 답글 번호, 내용 수신
		String pageNum = request.getParameter("pageNum");
		String qNum = request.getParameter("qNum");
		String aNum = request.getParameter("aNum");
		String aMaintext = request.getParameter("content");
		
		try
		{
			AnswerDTO dto = new AnswerDTO();
			
			// update 쿼리 준비
			dto.setqNum(Integer.parseInt(qNum));
			dto.setaNum(Integer.parseInt(aNum));
			dto.setaMaintext(aMaintext);

			dao.updateData(dto);
			
			String cp = request.getContextPath();
			response.sendRedirect(cp + "/questionarticle.action?qNum=" + qNum + "&pageNum=" + pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	// 답글 삭제(deldate이용하여 데이터 삭제X)
	@RequestMapping("/answerdelete.action")
	public void questionDelete(HttpServletRequest request, HttpServletResponse response)
	{
		// mapper를 이용해 dao 활용
		IAnswerDAO dao = sqlsession.getMapper(IAnswerDAO.class);
		
		String cp = request.getContextPath();

		// 넘겨받은 페이지번호, 질문번호, 답글 번호, 내용 수신
		String pageNum = request.getParameter("pageNum");
		String qNum = request.getParameter("qNum");
		String aNum = request.getParameter("aNum");

		try
		{
			dao.deleteData(Integer.parseInt(aNum));

			response.sendRedirect(cp + "/questionarticle.action?qNum=" + qNum + "&pageNum=" + pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
}