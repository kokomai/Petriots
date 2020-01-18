package com.teamp.petriots.cutline.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.teamp.petriots.cutline.dao.ICutlineDAO;
import com.teamp.petriots.cutline.dto.CutlineDTO;

@Controller
public class cutlineController
{
	@Autowired
	private SqlSession sqlSession;
	
	//커트라인 리스트 출력
	@RequestMapping(value = "/cutline.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String CutlineList(Model model)
	{
		String view = null;
		
		ICutlineDAO dao = sqlSession.getMapper(ICutlineDAO.class);
		
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/adminCutline.jsp";
		return view;
	}
	
	
	//커트라인 수정
	@RequestMapping(value = "/cutlineupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String CutlineModify(CutlineDTO m)
	{
		String view = "redirect:cutline.action";

		ICutlineDAO dao = sqlSession.getMapper(ICutlineDAO.class);
		dao.modify(m);

		return view;
	}
	
	
	//커트라인 삭제
	@RequestMapping(value = "/cutlinedelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String CutlineRemove(int cutline_num)
	{
		String view = "redirect:cutline.action";

		ICutlineDAO dao = sqlSession.getMapper(ICutlineDAO.class);
		dao.remove(cutline_num);

		return view;
	}
}
