package com.teamp.petriots.mtom_q.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.mtom_q.dao.IMtom_qDAO;
import com.teamp.petriots.mtom_q.dto.Mtom_qDTO;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;

@Controller
public class Mtom_qController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mypageqform.action", method=RequestMethod.GET)
	public String questiondata(Model model)
	{
		String view = null;
		
		IMtom_qDAO dao = sqlSession.getMapper(IMtom_qDAO.class);
		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());
		
		model.addAttribute("usernum",dto.getUser_num());
		model.addAttribute("questiondata", dao.questiondata());
		
		view = "/WEB-INF/views/mypageQForm.jsp";
		return view;
	}

	@RequestMapping(value = "/questionok.action", method=RequestMethod.GET)
	public String sendquestion(Mtom_qDTO dto)
	{
		String view = null;
		
		IMtom_qDAO dao = sqlSession.getMapper(IMtom_qDAO.class);
		
		dao.sendquestion(dto);
		
		view = "mypagemain.action";
		return view;
		
	}
	
	@RequestMapping(value = "/questionlistpage.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String mtom_qList(Model model)
	{
		String view = null;
		
		IMtom_qDAO dao = sqlSession.getMapper(IMtom_qDAO.class);
		
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/adminQuestion.jsp";
		return view;
	}
	
	@RequestMapping(value = "/questionupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String mtom_qModify(Mtom_qDTO m)
	{
		String view = "redirect:questionlistpage.action";

		IMtom_qDAO dao = sqlSession.getMapper(IMtom_qDAO.class);
		dao.modify(m);

		return view;
	}
	

}
