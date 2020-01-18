package com.teamp.petriots.ccl_request.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.ccl_request.dao.ICcl_requestDAO;
import com.teamp.petriots.ccl_request.dto.Ccl_requestDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.sit_approve.dto.Pst_reserveDTO;


@Controller
public class Ccl_requestController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/checklistcheckok.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String checkok(Ccl_requestDTO dto,Model model, Pst_reserveDTO dto2)
	{
		String view = null;
		
		ICcl_requestDAO dao = sqlSession.getMapper(ICcl_requestDAO.class);
		
		dto.setUser_num(SessionInfo.getUser_num());
		dto2.setUser_num(SessionInfo.getUser_num());
		dto2.setR_a_num(dto.getR_a_num());
		model.addAttribute("dto", dto2);
		
		dao.checkok(dto);
		
		view = "petsitterreservationnowdetail.action";
		return view;
		
	}


}
