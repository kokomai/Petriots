package com.teamp.petriots.pst_profile.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.petriots.pst_profile.dao.IPst_profileDAO;
import com.teamp.petriots.pst_profile.dto.FavoriteDTO;
import com.teamp.petriots.pst_profile.dto.Pst_profileDTO;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.sit_approve.dao.IPst_reserveDAO;
import com.teamp.petriots.sit_approve.dto.Pst_reserveDTO;


@Controller
public class Pst_profileController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/searchpetsitter.action", method=RequestMethod.GET)
	public String list(Model model)
	{
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
		SignupDTO dto = new SignupDTO();
		dto.setAddrLat(SessionInfo.getAddrLat());
		dto.setAddrLong(SessionInfo.getAddrLong());

		model.addAttribute("petsitterlist", dao.petsitterlist(dto.getAddrLat(), dto.getAddrLong()));

		view = "/WEB-INF/views/searchPetsitter.jsp";
		return view;

	}
	
	@RequestMapping(value = "/mypagereservationnow.action", method=RequestMethod.GET) 
	public String reservenowlist(Model model) 
	{ 
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO(); 
		dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("reservenowlist", dao.reservenowlist(dto.getUser_num()));

		view = "/WEB-INF/views/mypageReservationNow.jsp";
		return view;
	}
	
	@RequestMapping(value = "/mypagereservationrequest.action", method=RequestMethod.GET) 
	public String reservereqlist(Model model) 
	{ 
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("reserverequestlist", dao.reserverequestlist(dto.getUser_num()));

		view = "/WEB-INF/views/mypageReservationRequest.jsp"; 
		return view;
	}
	
	@RequestMapping(value = "/mypagereservationlist.action", method=RequestMethod.GET) 
	public String reservelist(Model model) 
	{ 
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO(); dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("reservelist", dao.reservelist(dto.getUser_num()));

		view = "/WEB-INF/views/mypageReservationList.jsp"; 
		return view;
	}
	
	@RequestMapping(value = "/mypagereservationapprove.action", method=RequestMethod.GET) 
	public String reserveapprove(Model model) 
	{ 
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO(); dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("reserveapprove", dao.reserveapprove(dto.getUser_num()));

		view = "/WEB-INF/views/mypageReservationApprove.jsp"; 
		return view;
	}

	@RequestMapping(value = "/mypagelikelist.action", method=RequestMethod.GET)
	public String likelist(Model model) 
	{ 
		String view = null;

		IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

		SignupDTO dto = new SignupDTO();
		dto.setUser_num(SessionInfo.getUser_num());

		model.addAttribute("favoritelist", dao.favoritelist(dto.getUser_num()));

		view = "/WEB-INF/views/mypageLikeList.jsp"; 
		return view;
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 펫시터 나를 찜한 사람 컨트롤러
		@RequestMapping(value = "/petsitterlikelist.action", method=RequestMethod.GET)
		public String petsitterlikelist(Model model) 
		{
			String view = null;

			IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

			SignupDTO dto = new SignupDTO(); 
			dto.setUser_num(SessionInfo.getUser_num());

			model.addAttribute("favoritemember", dao.favoritemember(dto.getUser_num()));

			view = "/WEB-INF/views/petsitterLikeList.jsp"; return view;

		}
		
		// 펫시터 블랙리스트 컨트롤러
		@RequestMapping(value = "/petsitterblacklist.action", method=RequestMethod.GET) 
		public String petsitterblacklist(Model model) 
		{
			String view = null;

			IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);

			SignupDTO dto = new SignupDTO(); dto.setUser_num(SessionInfo.getUser_num());

			model.addAttribute("blockmember", dao.blockmember(dto.getUser_num()));

			view = "/WEB-INF/views/petsitterBlacklist.jsp"; return view;

		}
		
		// 펫시터 블랙리스트 삭제 컨트롤러
		@RequestMapping(value = "/removeblacklist.action", method = {RequestMethod.GET, RequestMethod.POST}) 
		public String petsitterremoveblacklist(Pst_profileDTO dto) 
		{
			String view = null;

			IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
			
			dao.blockmemberRemove(dto.getUser_num());

			view = "/WEB-INF/views/petsitterMain.jsp"; return view;

		}
		
		// 펫시터 메인 페이지 컨트롤러
		@RequestMapping(value = "/petsittermain.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String mypetsitterdata(Model model) 
		{ 
			String view = null;

			IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
			
			IPst_reserveDAO dao2 = sqlSession.getMapper(IPst_reserveDAO.class);
			
			Pst_profileDTO dto = new Pst_profileDTO();
			dto.setUser_num(SessionInfo.getUser_num());
			
			Pst_reserveDTO dto2 = new Pst_reserveDTO();
			dto2.setUser_num(SessionInfo.getUser_num());
			
			
			model.addAttribute("mypetsitterdata",
					dao.mypetsitterdata(dto.getUser_num()));
			model.addAttribute("countendreserve",
					dao.countendreserve(dto.getUser_num()));
			
			
			  model.addAttribute("reservenowlist",
			  dao2.reservenowlist(dto2.getUser_num()));
			 
			
			model.addAttribute("reservelist", dao2.reservelist(dto2.getUser_num()));
			

			view = "/WEB-INF/views/petsitterMain.jsp";
			return view;

		}
		
		// 펫시터 프로필 입력 컨트롤러
		@RequestMapping(value= "/petsitterprofileinsert.action", method = {RequestMethod.GET, RequestMethod.POST})
		public String profileInsert(Pst_profileDTO p)
		{
			String view = "redirect:petsitterprofile.action";
			
			IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
			dao.petsitterprofileadd(p);
			
			return view;
			
		}
		
		  // 펫시터 프로필 수정 폼 액션 컨트롤러
	    @RequestMapping(value = "/petsitterprofilemodifyform.action", method = {RequestMethod.GET, RequestMethod.POST})
	    public String modifyForm(Model model)
	    {
	       String view= null;
	       
	       IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	       
	       Pst_profileDTO dto = new Pst_profileDTO();
	       
	       dto.setUser_num(SessionInfo.getUser_num());
	       
	       
	       model.addAttribute("dto",dao.mypetsitterdata(dto.getUser_num()));
	       
	    
	       view = "/WEB-INF/views/petsitterProfileModify.jsp";
	       return view;
	    }
	 
	 
	    // 펫시터 프로필 수정 컨트롤러
	    @RequestMapping(value = "/petsitterprofilemodify.action", method = {RequestMethod.GET, RequestMethod.POST})
	    public String modify(Pst_profileDTO dto)
	    {
	      /* ModelAndView mav = new ModelAndView(); */
	       
	       IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	       
	      dto.setP_s_num(SessionInfo.getP_s_num());
	       
	       dao.petsitterprofilemodify(dto);
	       
	      /* mav.setViewName("/Petsitter_main.action"); */
	       
	       String view = "/petsittermain.action";
	       
	       return view;
	    }
		 
	    // 메인페이지 searchfilter 검색 컨트롤러
	       @RequestMapping(value = "/searchfilter.action", method=RequestMethod.GET)
	       public String searchfilter(Pst_profileDTO dto, Model model)
	       {
	          String view = null;
	          
	          IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	          
	          model.addAttribute("petsitterlist", dao.searchpetsitterlist(dto));

	          view = "/WEB-INF/views/searchPetsitter.jsp";
	          return view;

	       }
		
	    // 펫시터 업적 컨트롤러
	    @RequestMapping(value = "/petsitterquestlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	    public String questList(Model model)
	    {
	       String view= null;
	       
	       IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	       
	       Pst_profileDTO dto = new Pst_profileDTO();
	       
	       dto.setUser_num(SessionInfo.getUser_num());
	       
	       
	       model.addAttribute("questlist",dao.questlist(dto.getUser_num()));
	       
	    
	       view = "/WEB-INF/views/petsitterQuestList.jsp";
	       return view;
	    }
			
	    
	    // 펫시터 업적 적용 컨트롤러
	    @RequestMapping(value = "/petsitterquestlist_ok.action", method = {RequestMethod.GET, RequestMethod.POST})
	    public String questListOk(Pst_profileDTO dto)
	    {
	       String view= null;
	       
	       IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	       
	       dto.setP_s_num(SessionInfo.getP_s_num());
	       
	       dao.questListOk(dto); 
	    
	       view = "/petsitterquestlist.action";
	       
	       return view;
	    }

	    // 펫시터 카드 더보기 출력 컨트롤러
	       @RequestMapping(value = "/userpetsitterreservedetail.action", method ={RequestMethod.GET, RequestMethod.POST})
	       public String reserveDetail(Model model, Pst_profileDTO pst_profileDTO)
	       {
	         String view = null;
	         
	          IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	          String f = "1";
	             if(dao.checkFavorite(pst_profileDTO.getP_s_num(), SessionInfo.getUser_num()) == null)
	             {
	                f = "0";
	             }
	             else
	             {
	                f = "1";
	             }
	             
	          model.addAttribute("favorite", f);
	          
	          model.addAttribute("reserveDetail", dao.reserveDetail(pst_profileDTO.getUser_num()));
	          model.addAttribute("myAddress", SessionInfo.getAddress());
	          view = "/WEB-INF/views/userPetsitterReserveDetail.jsp";
	          return view;
	       }
	       
	       @RequestMapping(value = "/favorite.action", method = {RequestMethod.GET, RequestMethod.POST})
	          @ResponseBody
	          public ModelAndView favorite(FavoriteDTO dto, HttpServletRequest request, HttpServletResponse response)
	          {
	             ModelAndView mav = new ModelAndView();
	             IPst_profileDAO dao = sqlSession.getMapper(IPst_profileDAO.class);
	             
	          
	             String checkFavorite = request.getParameter("checkFavorite");
	             
	             if (checkFavorite.equals("1"))
	             {
	                dao.deleteFavorite(dto.getP_s_num(), SessionInfo.getUser_num());
	             }
	             else if(checkFavorite.equals("0"))
	             {
	                dao.insertFavorite(dto.getP_s_num(), SessionInfo.getUser_num());
	             } 
	             
	             
	             return null;
	          }
	    

}