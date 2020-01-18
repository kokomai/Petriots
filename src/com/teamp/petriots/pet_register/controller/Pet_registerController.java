package com.teamp.petriots.pet_register.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.petriots.pet_register.dao.IPet_registerDAO;
import com.teamp.petriots.pet_register.dto.Pet_registerDTO;
import com.teamp.petriots.reg_my_ccl.dto.Reg_my_cclDTO;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;

@Controller
public class Pet_registerController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mypagepetlist.action", method=RequestMethod.GET)
	public String list(Model model)
	{
		String view = null;
		
		IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
		
		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());
		
		model.addAttribute("petlist", dao.petlist(dto.getUser_num()));
		
		view = "/WEB-INF/views/mypagePetList.jsp";
		return view;
		
	}
	
	@RequestMapping(value = "/mypagepetmodify.action", method=RequestMethod.GET)
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView();
		
		IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
		
		Pet_registerDTO dto = new Pet_registerDTO();
		String p_r_num = request.getParameter("p_r_num");
		dto.setP_r_num(p_r_num);
		
		mav.addObject("petdata", dao.petdata(dto.getP_r_num()));
		
		Reg_my_cclDTO dto2 = new Reg_my_cclDTO();
		dto2.setP_r_num(p_r_num);
		
		mav.addObject("cklist", dao.cklist(dto.getP_r_num()));
		mav.setViewName("/WEB-INF/views/mypagePetModify.jsp");
		return mav;
		
	}
	
	@RequestMapping(value = "/mypagepetadd.action")
	public String rule()
	{
		String view = null;
		
		view = "/WEB-INF/views/mypagePetAdd.jsp";
		return view;
	}
	
	@RequestMapping(value = "/petaddok.action", method=RequestMethod.GET)
	public String petregister(Pet_registerDTO dto)
	{
		String view = null;
		
		IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
		
		String p_t_num = dto.typeConvert(dto.getMaintype(), dto.getSubtype());
		SignupDTO Signupdto = new SignupDTO();
		Signupdto.setUser_num(SessionInfo.getUser_num());
		
		dto.setP_t_num(p_t_num);
		dto.setUser_num(Signupdto.getUser_num());
		
		dao.petregister(dto);
		
		view = "mypagepetlist.action";
		return view;
		
	}
	
	@RequestMapping(value = "/petmodifyok.action", method=RequestMethod.GET)
	public String petmodify(Pet_registerDTO dto, Reg_my_cclDTO ccldto)
	{
		String view = null;
		
		IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
		
		String p_t_num = dto.typeConvert(dto.getMaintype(), dto.getSubtype());
		SignupDTO Signupdto = new SignupDTO();
		Signupdto.setUser_num(SessionInfo.getUser_num());
		
		dto.setP_t_num(p_t_num);
		dto.setUser_num(Signupdto.getUser_num());
		
		dao.petmodify(dto);
		
		String [] stttime = ccldto.getStttime().split(",");
		String [] endtime = ccldto.getEndtime().split(",");
		String [] maintxt = ccldto.getMaintxt().split(",");
		
		List<Reg_my_cclDTO> list = new ArrayList<Reg_my_cclDTO>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<stttime.length; i++)
		{
			Reg_my_cclDTO ccldto2 = new Reg_my_cclDTO();
			
			ccldto2.setP_r_num(dto.getP_r_num());
			ccldto2.setStttime(stttime[i]);
			ccldto2.setEndtime(endtime[i]);
			ccldto2.setMaintxt(maintxt[i]);
			
			list.add(ccldto2);
		}
		
		map.put("list", list);
		
		dao.petccldelete(dto.getP_r_num());
		dao.petcclregister(map);
		
		view = "mypagepetlist.action";
		return view;
		
	}
	
	@RequestMapping(value = "/petdelete.action", method=RequestMethod.GET)
	public ModelAndView delete(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView();
		
		IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
		
		Pet_registerDTO dto = new Pet_registerDTO();
		String p_r_num = request.getParameter("p_r_num");
		dto.setP_r_num(p_r_num);
		
		dao.petdelete(p_r_num);
		
		mav.setViewName("mypagepetlist.action");
		return mav;
		
	}

}
