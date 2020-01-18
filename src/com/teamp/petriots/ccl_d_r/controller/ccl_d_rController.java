package com.teamp.petriots.ccl_d_r.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.ccl_d_r.dao.ICcl_d_rDAO;
import com.teamp.petriots.ccl_d_r.dto.Ccl_d_rDTO;


@Controller
public class ccl_d_rController
{
	@Autowired
	private SqlSession sqlSession;
	
	//체크리스트 기본값 리스트 출력
		@RequestMapping(value = "/ccl_d_rlist.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String Ccl_d_rList(Model model)
		{
			String view = null;
			
			ICcl_d_rDAO dao = sqlSession.getMapper(ICcl_d_rDAO.class);
			
			model.addAttribute("list", dao.list());
			
			view = "/WEB-INF/views/adminChecklistModify.jsp";
			return view;
		}
		
		//체크리스트 수정
		@RequestMapping(value = "/checklistmodify.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String Ccl_d_rModify(Ccl_d_rDTO m)
		{
			String view = "redirect:ccl_d_rlist.action";

			ICcl_d_rDAO dao = sqlSession.getMapper(ICcl_d_rDAO.class);
			dao.modify(m);

			return view;
		}
		
		//체크리스트 삭제
		@RequestMapping(value = "/ccl_d_rdelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String Ccl_d_rRemove(int c_d_r_num)
		{
			String view = "redirect:ccl_d_rlist.action";

			ICcl_d_rDAO dao = sqlSession.getMapper(ICcl_d_rDAO.class);
			dao.remove(c_d_r_num);

			return view;
		}
		
		
		
}
