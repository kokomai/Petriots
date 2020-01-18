package com.teamp.petriots.sit_approve.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.ccl_request.dao.ICcl_requestDAO;
import com.teamp.petriots.ccl_request.dto.Ccl_requestDTO;
import com.teamp.petriots.pet_register.dao.IPet_registerDAO;
import com.teamp.petriots.reg_my_ccl.dto.Reg_my_cclDTO;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.sit_approve.dao.IPst_reserveDAO;
import com.teamp.petriots.sit_approve.dto.Pst_reserveDTO;


@Controller
public class IPst_reserveController
{
   @Autowired
   private SqlSession sqlSession;
   
   // 예약 요청 폼으로!
   /*@RequestMapping(value="/reservationform.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String reservationform(Model model, Pst_reserveDTO dto)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      Pdao.reservationform(dto);
      
      view = "/WEB-INF/views/reservationForm.jsp"; 
      return view;
   }*/
   
   @RequestMapping(value="/reservationform.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String reservationform(Model model, Pst_reserveDTO dto)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      
      model.addAttribute("petsittercard", Pdao.petsittercard(dto));
      model.addAttribute("detaildata", Pdao.detaildata(dto));
      model.addAttribute("checkin", dto.getCheckin());
      model.addAttribute("checkout", dto.getCheckout());
      String ci = dto.getCheckin();
      String co = dto.getCheckout();
  	
      long diff = 0;
	  long diffDays = 0;
      
  	try {
  		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
  		Date beginDate = formatter.parse(ci);
  		Date endDate = formatter.parse(co);
  		
  		// 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
  		diff = endDate.getTime() - beginDate.getTime();
  		diffDays = diff / (24 * 60 * 60 * 1000);
  		
  		} catch (Exception e) {
  		e.printStackTrace();
  		}
  	
  	model.addAttribute("counts", diffDays);
  	
  	IPet_registerDAO dao = sqlSession.getMapper(IPet_registerDAO.class);
	
	SignupDTO signupDTO = new SignupDTO();
	signupDTO.setUser_num(SessionInfo.getUser_num());
	
	model.addAttribute("petlist", dao.petlist(signupDTO.getUser_num()));
      
      view = "/WEB-INF/views/reservationForm.jsp"; 
      return view;
   }
   
   @RequestMapping(value="/reserveapply.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String researveapply(Pst_reserveDTO dto, Ccl_requestDTO ccldto)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      Pdao.reserveapply(dto);
      
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      String [] cksstdate = ccldto.getCksttdate().split(",");
      String [] ckenddate = ccldto.getCkenddate().split(",");
      String [] maintext = ccldto.getMaintext().split(",");
      
      List<Ccl_requestDTO> list = new ArrayList<Ccl_requestDTO>();
      Map<String, Object> map = new HashMap<String, Object>();
      
      for(int i=0; i<cksstdate.length; i++)
      {
    	  Ccl_requestDTO ccldto2 = new Ccl_requestDTO();

    	  ccldto2.setCksttdate(cksstdate[i]);
    	  ccldto2.setCkenddate(ckenddate[i]);
    	  ccldto2.setMaintext(maintext[i]);

    	  list.add(ccldto2);
      }
      
      map.put("list", list);
      
      Cdao.cklistapply(map);
      
		/*
		 * for(int j=0; j<cksstdate.length; j++) { Cdao.cklistapprove();
		 * Cdao.cklistconfirm(); }
		 */
      
      view = "mainpage.action"; 
      return view;
   }
   
   
   
   // 현재 위탁중인 리스트
   @RequestMapping(value="/petsitterreservationnow.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String PetsitterReserveNow(Model model)
   {
      String view = null;
      
      IPst_reserveDAO dao = sqlSession.getMapper(IPst_reserveDAO.class);
      
      Pst_reserveDTO dto = new Pst_reserveDTO();
      dto.setUser_num(SessionInfo.getUser_num());
      
      
      model.addAttribute("reservenowlist", dao.reservenowlist(dto.getUser_num()));
      model.addAttribute("reserveapprovelist", dao.reserveapprovelist(dto.getUser_num()));
         
      
      view = "/WEB-INF/views/petsitterReservationNow.jsp"; return view;
   }
   
      // 현재 위탁중인 항목 자세히
      @RequestMapping(value="/petsitterreservationnowdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterReserveNowDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         dto2.setR_a_num(dto.getR_a_num());
      
         
         model.addAttribute("reservenowdetail", Pdao.reservenowdetail(dto));
         model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
         
         view = "/WEB-INF/views/petsitterNowSittingDetail.jsp"; return view;
      }
   
      // 승인한 위탁건 자세히
      @RequestMapping(value="/petsitterapprovedetail.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterApproveDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         dto2.setR_a_num(dto.getR_a_num());
      
         
         model.addAttribute("reserveapprovedetail", Pdao.reserveapprovedetail(dto));
         model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
         
         view = "/WEB-INF/views/petsitterApproveReservationDetail.jsp"; return view;
      }
      // 승인한 위탁건 취소
      @RequestMapping(value="/petsittercancelapprovereserve.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterApproveCancel(Model model, Pst_reserveDTO dto)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         Pdao.reserveapprovecancel(dto);
         
         view = "petsittermain.action"; return view;
      }

   // 지난 위탁 리스트
   @RequestMapping(value="/petsitterreservationlist.action", method= RequestMethod.GET)
   public String PetsitterReserveList(Model model)
   {
      String view = null;
      
      IPst_reserveDAO dao = sqlSession.getMapper(IPst_reserveDAO.class);
      
      Pst_reserveDTO dto = new Pst_reserveDTO();
      dto.setUser_num(SessionInfo.getUser_num());
      
      
      model.addAttribute("reservelist", dao.reservelist(dto.getUser_num()));
         
      
      view = "/WEB-INF/views/petsitterReservationList.jsp"; return view;
   }
   
   // 지난 위탁건 자세히
   @RequestMapping(value="/petsitterreservelistdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String PetsitterPastDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      dto2.setR_a_num(dto.getR_a_num());
   
      
      model.addAttribute("reservepastdetail", Pdao.reservepastdetail(dto));
      model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
      
      view = "/WEB-INF/views/petsitterPastsittingDetail.jsp"; return view;
   }
   
   // 요청 위탁건 리스트
   @RequestMapping(value="/petsitterreservationrequest.action", method= RequestMethod.GET)
   public String PetsitterReserveRequest(Model model)
   {
      String view = null;
      
      IPst_reserveDAO dao = sqlSession.getMapper(IPst_reserveDAO.class);
      
      Pst_reserveDTO dto = new Pst_reserveDTO();
      dto.setUser_num(SessionInfo.getUser_num());
      
      model.addAttribute("reserverequestlist", dao.reserverequestlist(dto.getUser_num()));
         
      
      view = "/WEB-INF/views/petsitterReservationRequest.jsp"; return view;
   }
   
   // 요청 위탁건 자세히
   @RequestMapping(value="/petsitterrequestdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String PetsitterRequestDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      dto2.setR_a_num(dto.getR_a_num());
   
      
      model.addAttribute("reserverequestdetail", Pdao.reserverequestdetail(dto));
      model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
      
      view = "/WEB-INF/views/petsitterRequestReservationDetail.jsp"; return view;
   }
   
   // 요청 위탁건 거절
   @RequestMapping(value="/petsittercancelrequestreserve.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String PetsitterRequestCancel(Model model, Pst_reserveDTO dto)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      Pdao.reserveapprovecancel(dto);
      
      view = "petsittermain.action"; return view;
   }
   // 요청 위탁건 승낙
      @RequestMapping(value="/petsitterokayrequestreserve.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterRequestOkay(Model model, Pst_reserveDTO dto)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         Pdao.reserveokay(dto);
         
         view = "petsittermain.action"; return view;
      }
      
   
      
      // 펫시터 위탁 완료
      @RequestMapping(value="/petsittersittingcomplete.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterSittingComplete(Model model, Pst_reserveDTO dto)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         Pdao.sittingcomplete1(dto);
         Pdao.sittingcomplete2(dto);
         
         view = "petsittermain.action"; return view;
      }
      
      // 펫시터 위탁 시작
      @RequestMapping(value="/startsitting.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String PetsitterSittingStart(Model model, Pst_reserveDTO dto)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         Pdao.sittingstart(dto);
         
         view = "petsitterreservationnow.action"; return view;
      }
      
   //----------------------------------유저의 영역
   
   // user현재 위탁중인 항목 자세히
   @RequestMapping(value="/userreservationnowdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String UserReserveNowDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      dto2.setR_a_num(dto.getR_a_num());
   
      
      model.addAttribute("reservenowdetail", Pdao.reservenowdetail_u(dto));
      model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
      
      view = "/WEB-INF/views/mypageNowSittingDetail.jsp"; return view;
   }
   
   // user지난 위탁건 자세히
      @RequestMapping(value="/userreservelistdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String UserPastDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         dto2.setR_a_num(dto.getR_a_num());
      
         
         model.addAttribute("reservepastdetail", Pdao.reservepastdetail_u(dto));
         model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
         
         view = "/WEB-INF/views/mypagePastsittingDetail.jsp"; return view;
      }
      
   // user 요청 위탁건 자세히
   @RequestMapping(value="/userrequestdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String UserRequestDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      dto2.setR_a_num(dto.getR_a_num());
   
      
      model.addAttribute("reserverequestdetail", Pdao.reserverequestdetail_u(dto));
      model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
      
      view = "/WEB-INF/views/mypageRequestReservationDetail.jsp"; return view;
   }
   
   // 요청/승인한 위탁건 취소
   @RequestMapping(value="/usercancelapprovereserve.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String UserApproveCancel(Model model, Pst_reserveDTO dto)
   {
      String view = null;
      
      IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
      ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
      
      dto.setUser_num(SessionInfo.getUser_num());
      
      Pdao.reserveapprovecancel(dto);
      
      view = "mypagemain.action"; return view;
   }

   
   // user 승인 위탁건 자세히
      @RequestMapping(value="/reserveapprovedetail.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String UserApproveDetail(Model model, Pst_reserveDTO dto, Ccl_requestDTO dto2)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         dto2.setR_a_num(dto.getR_a_num());
      
         
         model.addAttribute("reserveapprovedetail", Pdao.reserveapprovedetail_u(dto));
         model.addAttribute("checklist", Cdao.p_sitting_checklist(dto2));
         
         view = "/WEB-INF/views/mypageApproveReservationDetail.jsp"; return view;
      }
   
      // 유저 위탁 완료
      @RequestMapping(value="/usersittingcomplete.action", method = {RequestMethod.GET, RequestMethod.POST})
      public String UserSittingComplete(Model model, Pst_reserveDTO dto)
      {
         String view = null;
         
         IPst_reserveDAO Pdao = sqlSession.getMapper(IPst_reserveDAO.class);
         ICcl_requestDAO Cdao = sqlSession.getMapper(ICcl_requestDAO.class);
         
         dto.setUser_num(SessionInfo.getUser_num());
         
         Pdao.sittingcomplete1(dto);
         Pdao.sittingcomplete2(dto);
         
         view = "mypagemain.action"; return view;
      }
      
      
      
}