package com.teamp.petriots.register_admin.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.petriots.register_admin.dao.IRegister_adminDAO;
import com.teamp.petriots.register_admin.dto.Register_adminDTO;
import com.teamp.petriots.register_admin.dto.Register_adminSessionInfo;


@Controller
public class register_adminController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/adminloginpage.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminLoginPage()
	{
		String view = null;
		
		view = "/WEB-INF/views/adminLogin.jsp";
		return view;
	}
	
		@RequestMapping(value = "/adminlogin.action", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView adminLogin(Register_adminDTO dto, HttpServletRequest request)
		{
			ModelAndView mav = new ModelAndView();
			
			IRegister_adminDAO dao = sqlSession.getMapper(IRegister_adminDAO.class);
			
			HttpSession session = request.getSession();
			
			int loginCheck = dao.login(dto);
			
			if (loginCheck == 1)
			{
				Register_adminDTO forSessionDTO = new Register_adminDTO();
				forSessionDTO = dao.getData(dto);
				
				Register_adminSessionInfo sessionDTO = new Register_adminSessionInfo();
				sessionDTO.setAdmin_num(forSessionDTO.getAdmin_num());
				sessionDTO.setId(forSessionDTO.getId());
				
				session.setAttribute("admin_num", sessionDTO);
				
				//mav.addObject("admin_num", forSessionDTO.getAdmin_num());
				mav.setViewName("/WEB-INF/views/adminMypage.jsp");
			}
			else if (dto.getId()==null || dto.getPw()==null ||  loginCheck == 0) 
			{
				mav.setViewName("/WEB-INF/views/adminLogin.jsp");
			}
			
			
			return mav;
		}
		
		@RequestMapping(value = "/adminlogout.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String adminLogOut(HttpServletRequest request)
		{
			String view = null;
			
			HttpSession session = request.getSession();
			
			session.removeAttribute("admin_num");
			
			view =  "/WEB-INF/views/adminLogin.jsp";
			
			return view;
		}
}
