package com.teamp.petriots.signup.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.pet_register.dao.IPet_registerDAO;
import com.teamp.petriots.pst_profile.dao.IPst_profileDAO;
import com.teamp.petriots.signup.dao.ISignupDAO;
import com.teamp.petriots.signup.dto.SignupDTO;

@Controller
public class SignupController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/mypageusermodify.action",method=RequestMethod.GET) 
	public String modify(Model model) 
	{ 
		String view = null;

		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);

		SignupDTO dto = new SignupDTO(); 
		dto.setUser_num(SessionInfo.getUser_num());
		dto.setPwd(SessionInfo.getPwd());

		model.addAttribute("memberdata", dao.memberdata(dto.getUser_num(), dto.getPwd()));

		view = "/WEB-INF/views/mypageUserModify.jsp";
		return view;

	}
	
	// 회원가입 폼
	@RequestMapping(value = "/signupform.action", method=RequestMethod.GET)
	public ModelAndView signUp()
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/WEB-INF/views/signUp.jsp");
		
		return mav;
	}
	
	// 회원가입 액션
		@RequestMapping(value = "/signupinsert.action", method= RequestMethod.POST)
		public ModelAndView signUpInsert(SignupDTO dto)
		{
			ModelAndView mav = new ModelAndView();
			
			ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
			
			dao.add(dto);
			
			mav.addObject("dto", dto);
			
			mav.setViewName("/signupcomplete.action");
			
			return mav;
		}
		
		// 회원가입 완료
		@RequestMapping(value = "/signupcomplete.action", method=RequestMethod.POST)
		public String signUpComplete()
		{
			String view = "/WEB-INF/views/signUpComplete.jsp";
			
			return view;
		}

	@RequestMapping(value = "/modifyok.action", method=RequestMethod.GET)
	public String membermodify(SignupDTO dto) 
	{ 
		String view = null;

		ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
		dao.membermodify(dto);

		view = "mypagemain.action"; 
		return view;

	}

	@RequestMapping(value = "/mypagemain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String gomypage(Model model)
	{
		String view = null;

		ISignupDAO signUpDao = sqlSession.getMapper(ISignupDAO.class);
		IPet_registerDAO petRegisterDao = sqlSession.getMapper(IPet_registerDAO.class);
		IPst_profileDAO pstProfileDao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("mydata", signUpDao.mypage(dto.getUser_num()));
		model.addAttribute("mycount", signUpDao.mycount(dto.getUser_num()));
		model.addAttribute("mypetdata", petRegisterDao.mypetdata(dto.getUser_num()));
		model.addAttribute("reservenowlist", pstProfileDao.reservenowlist(dto.getUser_num()));
		model.addAttribute("reserverequestlist", pstProfileDao.reserverequestlist(dto.getUser_num()));

		view = "/WEB-INF/views/mypageMain.jsp";
		return view;
		
	}
	
	@RequestMapping(value = "/mypagerulepetsitter.action")
	public String rule()
	{
		String view = null;
		
		view = "/WEB-INF/views/mypageRulePetsitter.jsp";
		return view;
		
	}
	
	@RequestMapping(value = "/mypagefaq.action")
	public String faq()
	{
		String view = null;
		
		view = "/WEB-INF/views/mypageFAQ.jsp";
		return view;
		
	}
	
	@RequestMapping(value = "/idsearch.action", method = RequestMethod.GET)
	   public String idsearch(Model model, String userName, String ssn) 
	   {
	       String view = null;
	       
	       SignupDTO dto = new SignupDTO();
	       dto.setUserName(userName);
	       dto.setSsn(ssn);
	       
	       ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
	       model.addAttribute("userId1", dao.idsearch(dto));
	       
	       view = "redirect:login_ok.action";
	       return view;
	   }
	   
	   @RequestMapping(value = "/pwsearch.action", method = RequestMethod.GET)
	   public String pwsearch(Model model, String userId, String userName, String ssn) 
	   {
	       String view = null;
	       
	       SignupDTO dto = new SignupDTO();
	       dto.setUserId(userId);
	       dto.setUserName(userName);
	       dto.setSsn(ssn);
	       
	       ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
	       model.addAttribute("pwd1", dao.pwsearch(dto));
	       
	       view = "redirect:login_ok.action";
	       return view;
	   }
	   
	   @RequestMapping(value = "/signuplist.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String signupList(Model model)
		{
			String view = null;
			
			ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
			
			model.addAttribute("list", dao.list());
			
			view = "/WEB-INF/views/adminUserModify.jsp";
			return view;
		}
		
		//회원정보 삭제
		@RequestMapping(value = "/signupdelete.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String signupdelete(SignupDTO m)
		{
			String view = "redirect:signuplist.action";

			ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
			dao.deletemember(m);

			return view;

		}
		
		//회원정보 수정
		@RequestMapping(value = "/signupupdate.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String singupModify(SignupDTO m)
		{
			String view = "redirect:signuplist.action";

			ISignupDAO dao = sqlSession.getMapper(ISignupDAO.class);
			dao.modifymember(m);

			return view;
		}
		
		//회원정보 페이지요청
		@RequestMapping(value = "/signuplistpage.action", method ={ RequestMethod.GET, RequestMethod.POST })
		public String signuppage()
		{
			String view = null;

			view = "/WEB-INF/views/adminUserModify.jsp";

			return view;
		}

	
}
