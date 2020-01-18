package com.teamp.petriots.report.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.report.dao.IReportDAO;
import com.teamp.petriots.report.dto.ReportDTO;

@Controller
public class ReportController
{
	// mybatis 객체 의존성 (자동) 주입
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/declarationlist.action", method ={ RequestMethod.GET, RequestMethod.POST })
	public String reportlist(Model model)
	{
		String view = null;

		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);

		model.addAttribute("list", dao.list());

		view = "/WEB-INF/views/adminDeclaration.jsp";
		return view;
	}
	
	@RequestMapping(value = "/declarationupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String reportModify(ReportDTO m)
		{
			String view = "redirect:declarationlist.action";

			IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
			dao.insert(m);

			return view;
		}
}
