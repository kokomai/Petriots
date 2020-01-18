package com.teamp.petriots.withdrawal.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.withdrawal.dao.IWithdrawalDAO;
import com.teamp.petriots.withdrawal.dto.WithdrawalDTO;
import com.teamp.petriots.signup.dto.SignupDTO;

@Controller
public class WithdrawalController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mypagewithdrawal.action", method=RequestMethod.GET) 
	public String withdrawaldata(Model model) 
	{ 
		String view = null;

		IWithdrawalDAO dao = sqlSession.getMapper(IWithdrawalDAO.class);

		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());
		dto.setPwd(SessionInfo.getPwd());

		model.addAttribute("withdrawaldata", dao.withdrawaldata(dto.getUser_num(), dto.getPwd()));
		model.addAttribute("withdrawalreason", dao.withdrawalreason());

		view = "/WEB-INF/views/mypageWithdrawal.jsp";
		return view;

	}
	
	@RequestMapping(value = "/userdelete.action", method=RequestMethod.POST) 
	public String withdrawaladd(WithdrawalDTO dto) 
	{ 
		String view = null;

		IWithdrawalDAO dao = sqlSession.getMapper(IWithdrawalDAO.class);
		
		dto.setUser_num(SessionInfo.getUser_num());
		dao.withdrawaladd(dto);

		view = "mainpage.action";
		return view;

	}
	

}
