/*=========================
   MemberServlet.java
=========================*/

package com.teamp.petriots.signup.login.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teamp.petriots.signup.login.dao.MemberDAO;
import com.teamp.petriots.signup.login.dto.MemberDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;

public class MemberServlet extends HttpServlet
{

   private static final long serialVersionUID = 1L;

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      process(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      process(request, response);
   }
   
   private void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException
   {
      // 포워딩
      RequestDispatcher rd = request.getRequestDispatcher(path);
      rd.forward(request, response);
   }
   
   protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      request.setCharacterEncoding("UTF-8");
      
      // 업무 구분 : uri → cp 부터 끝까지...
      String uri = request.getRequestURI();
      
      String cp = request.getContextPath();
      MemberDAO dao = new MemberDAO();
      
      if(uri.indexOf("login.action") != -1)
      {
         // 로그인 폼
         String path = "/WEB-INF/views/login.jsp";
         forward(request, response, path);
      }
      else if(uri.indexOf("login_ok.action") != -1)
      {
         // 로그인 액션 처리
         HttpSession session = request.getSession(true);
         //-- session 객체를 생성하는 과정에서 true 값을 넘기게 되면
         //   세션을 초기화하여 다시 생성
         //   즉, 로그인을 할 때에만 true 값을 부여해야 한다.
         
         String userId = request.getParameter("userId");
         String pwd = request.getParameter("pwd");
         
         
         MemberDTO dto = dao.getReadData(userId, pwd);
         
         if (userId == null || pwd == null || !dao.loginCheck(userId, pwd))
         {
            String path = "/WEB-INF/views/login.jsp";
            forward(request, response, path);
            return;
         }
         
         
         // 여기서부터는 로그인 성공한 경우
         SessionInfo info = new SessionInfo();
         info.setUserId(dto.getUserId());
         info.setUserName(dto.getUserName());
         info.setUser_num(dto.getUser_num());
         info.setP_s_num(dto.getP_s_num());
         info.setProfile_img(dto.getProfile_img());
         info.setAddress(dto.getAddress());
         info.setAddrLat(dto.getAddrLat());
         info.setAddrLong(dto.getAddrLong());
         info.setPwd(dto.getPwd());
         
         // 세션에 저장
         session.setAttribute("login", info);
         
         // 메인 페이지로 다시 리다이렉트
         response.sendRedirect("mainpage.action");
      }
      else if(uri.indexOf("logout.action") != -1)
      {
         // 로그아웃
         
         HttpSession session = request.getSession();
         
         session.removeAttribute("login");
         session.invalidate();
         SessionInfo info = new SessionInfo();
         info.setUser_num("");
         info.setP_s_num("");
         info.setAddress("");
         info.setAddrLat(0);
         info.setAddrLong(0);
         info.setPwd("");
         
         
         // 로그아웃 이후 다시 리다이렉트
         response.sendRedirect("mainpage.action");
         
      }
   }
}