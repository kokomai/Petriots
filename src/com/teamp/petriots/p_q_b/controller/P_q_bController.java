// 인성문제 관련 컨트롤러
package com.teamp.petriots.p_q_b.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.p_q_b.dao.IP_q_bDAO;
import com.teamp.petriots.p_q_b.dto.P_q_bDTO;
import com.teamp.petriots.register_admin.dto.Register_adminDTO;
import com.teamp.petriots.register_admin.dto.Register_adminSessionInfo;


@Controller
public class P_q_bController
{
	@Autowired
	private SqlSession sqlSession;
	
	//인성문제 리스트
	@RequestMapping(value = "/p_q_blist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String p_q_bList(Model model)
	{
		String view = null;
		
		IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
		
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/adminExamTenacitySearch.jsp";
		return view;
		
	}
	
	//인성문제 삭제
	@RequestMapping(value = "/p_q_bdelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String p_q_bRemove(int p_t_q_num)
		{
			String view = "redirect:p_q_blist.action";

			IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
			dao.remove(p_t_q_num);

			return view;
		}
		
		// 인성문제 수정
		@RequestMapping(value = "/p_q_bupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String p_q_bModify(P_q_bDTO m)
		{
			String view = "redirect:p_q_blist.action";

			IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
			Register_adminSessionInfo sessionDTO = new Register_adminSessionInfo();
			m.setAdmin_num(sessionDTO.getAdmin_num());
			
			dao.modify(m);

			return view;
		}
		
		// 인성문제 페이지 요청 
		@RequestMapping(value = "/p_q_binsertpage.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String p_q_bInsertpage()
		{
			String view = null;

			view = "/WEB-INF/views/adminExamTenacitySubmit.jsp";

			return view;

		}
		
		// 인성문제제출 삽입
		@RequestMapping(value = "/p_q_binsert.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String p_q_bInsert(P_q_bDTO m)
		{
			String view = "redirect:p_q_blist.action";

			IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
			dao.add(m);

			return view;

		}

		
		//@RequestMapping(value = "/p_q_bsearch.action", method ={ RequestMethod.GET, RequestMethod.POST })
		//public String p_q_bsearch(P_q_bDTO m)
		//{
			//String view = "/WEB-INF/views/adminExamTenacitySearch.jsp";
		//	
			//int search = m.getSearch();
			//
			//IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
			//dao.searchlist(search);
			//
			//return view;
		//}
	
		
		//검색기능 
		@RequestMapping(value = "/p_q_bsearch.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String p_q_bsearchlist(Model model)
		{
			String view = null;
			
			IP_q_bDAO dao = sqlSession.getMapper(IP_q_bDAO.class);
			
			P_q_bDTO dto = new P_q_bDTO();
			
			int search = dto.getSearch();
			
			model.addAttribute("searchlist", dao.searchlist(search));
			
			view = "/WEB-INF/views/adminExamTenacitySearch.jsp";
			return view;
			
		}


}
