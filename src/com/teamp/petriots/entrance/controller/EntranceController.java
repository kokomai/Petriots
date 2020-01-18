package com.teamp.petriots.entrance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EntranceController
{
	// 대문 페이지로 이동
	@RequestMapping(value = "/bigdoor.action")
	public String door()
	{
		String view = null;
		
		view = "/WEB-INF/views/bigDoor.jsp";
		return view;
	}
	
	// 메인 페이지로 이동
	@RequestMapping(value = "/mainpage.action")
	public String main()
	{
		String view = null;
		
		view = "/WEB-INF/views/mainPage.jsp";
		return view;
	}
	
	// 메인 페이지로 이동
	@RequestMapping(value = "/signup.action")
	public String signup()
	{
		String view = null;
			
		view = "/WEB-INF/views/signUp.jsp";
		return view;
	}
}
