// 지식문제 관련 컨트롤러
package com.teamp.petriots.i_q_b.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.i_q_b.dao.II_q_bDAO;
import com.teamp.petriots.i_q_b.dto.I_q_bDTO;


@Controller
public class I_q_bController
{
	@Autowired
	private SqlSession sqlSession;
	
	//지식검사문제 리스트 출력
	@RequestMapping(value = "/i_q_blist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String i_q_bList(Model model)
	{
		String view = null;
		
		II_q_bDAO dao = sqlSession.getMapper(II_q_bDAO.class);
		
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/adminExamKnowledgeSearch.jsp";
		return view;
	}
	
	//지식검사문제 삭제
	@RequestMapping(value = "/i_q_bdelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String i_q_bRemove(int num)
	{
		String view = "redirect:i_q_blist.action";

		II_q_bDAO dao = sqlSession.getMapper(II_q_bDAO.class);
		dao.remove(num);

		return view;
	}

	//지식검사문제 수정
	@RequestMapping(value = "/i_q_bupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String i_q_bModify(I_q_bDTO m)
	{
		String view = "redirect:i_q_blist.action";

		II_q_bDAO dao = sqlSession.getMapper(II_q_bDAO.class);
		dao.modify(m);

		return view;
	}
	
	
	
	//지식검사문제 삽입
	@RequestMapping(value = "/i_q_binsert.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String i_q_bInsert(I_q_bDTO m)
	{
		String view = "redirect:i_q_blist.action";

		II_q_bDAO dao = sqlSession.getMapper(II_q_bDAO.class);
		dao.add(m);

		return view;
	}
	
	//지식검사문제  페이지 요청
	@RequestMapping(value = "/i_q_binsertpage.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String i_q_bInsertpage()
	{
		String view = null;

		view = "/WEB-INF/views/adminExamKnowledgeSubmit.jsp";

		return view;

	}
	
	//adminMypage(관리자 메인페이지) 액션처리
	@RequestMapping(value = "/adminMypage.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String adminMypage()
	{
		String view = null;

		view = "/WEB-INF/views/adminMypage.jsp";

		return view;

	}


	
	
	
	
	
}
