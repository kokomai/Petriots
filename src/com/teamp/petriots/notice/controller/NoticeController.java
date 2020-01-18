package com.teamp.petriots.notice.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.teamp.petriots.notice.dao.INoticeDAO;
import com.teamp.petriots.notice.dto.NoticeDTO;
import com.teamp.petriots.util.MyUtil;

@Controller
public class NoticeController
{
	// mybatis 의존성 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 공지사항 리스트 출력 매핑
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model, HttpServletRequest request)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		// 페이징 처리 util.java
		MyUtil myUtil = new MyUtil();

		// 넘어온 페이지 번호
		String pageNum = request.getParameter("pageNum");

		// 현재 표시되어야 하는 페이지
		int current_page = 1;

		// 1페이지가 아닌 경우 현재페이지 변경
		if (pageNum != null)
			current_page = Integer.parseInt(pageNum);

		// 검색 키와 검색 값 수신
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		// 검색 값이 있다면
		if (searchKey != null)
		{
			// 지정된 경로로 들어오지 않고
			// 직접 특정 URL을 치고 들어올 경우(GET) 처리
			if (request.getMethod().equalsIgnoreCase("GET"))
			{
				try
				{
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
				catch (UnsupportedEncodingException e)
				{
					System.out.println(e.toString());
				}
			}
		}
		// 검색 값이 없다면
		else
		{
			searchKey = "subject";
			searchValue = "";
		}

		// 전체 데이터 갯수 구하기
		int data_count = dao.getDataCount(searchKey, searchValue);
		
		// 전체 데이터를 기준을 총 페이지 수를 계산한다.
		int numPerPage = 10;
		int total_page = myUtil.getPageCount(numPerPage, data_count);

		if (current_page > total_page) // 데이터를 삭제해서 페이지가 줄었을 경우
			current_page = total_page;

		// 한 페이지에 몇 개의 데이터를 출력할 것인지
		int start = (current_page - 1) * numPerPage + 1;
		int end = current_page * numPerPage;
		
		// 게시물 목록 출력
		List<NoticeDTO> lists = dao.getLists(start, end, searchKey, searchValue);

		String param = "";

		// 검색값이 존재한다면
		if (!searchValue.equals(""))
		{
			try
			{
				// get방식을 통해 넘겨준다.
				param += "?searchKey=" + searchKey;
				param += "&searchValue=" + URLDecoder.decode(searchValue, "UTF-8");
			}
			catch (UnsupportedEncodingException e)
			{
				System.out.println(e.toString());
			}
		}

		String cp = request.getContextPath();
		String listUrl = cp + "/noticelist.action" + param;
		String pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);

		// 글 내용 보기 주소
		String articleUrl = "/noticelist.action";

		// 검색을 하지 않을 때
		if (param.equals(""))
			articleUrl = articleUrl + "?pageNum=" + current_page;
		
		// 검색을 할 때
		else
			articleUrl = articleUrl + param + "?pageNum=" + current_page;

		model.addAttribute("lists", lists);
		model.addAttribute("data_count", data_count);
		model.addAttribute("pageIndexList", pageIndexList);
		model.addAttribute("current_page", current_page);

		return "/WEB-INF/views/noticeList.jsp";
	}

	@RequestMapping(value = "/noticearticle.action", method = RequestMethod.GET)
	public String noticeArticle(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);

		// 넘어온 페이지 번호
		String pageNum = request.getParameter("pageNum");
		
		// 공지사항 게시글 번호
		int ntcNum = Integer.parseInt(request.getParameter("ntcNum"));

		// 검색 키와 검색 값 수신
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		// 검색 값이 있다면
		if (searchKey != null)
		{
			try
			{
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			catch (UnsupportedEncodingException e)
			{
				System.out.println(e.toString());
			}
		}
		
		// 검색 값이 없다면
		else
		{
			searchKey = "subject";
			searchValue = "";
		}

		// 조회수 증가
		dao.updateHitCount(ntcNum);

		// 해당 게시물 가져오기
		NoticeDTO dto = dao.getReadData(ntcNum);

		// 이전, 다음 게시물 번호 확인
		int beforeNum = dao.getBeforeNum(ntcNum);
		int nextNum = dao.getNextNum(ntcNum);

		NoticeDTO dtoBefore = null;
		NoticeDTO dtoNext = null;

		// 이전 게시글 읽기
		if (beforeNum != -1)
			dtoBefore = dao.getReadData(beforeNum);

		// 다음 게시글 읽기
		if (nextNum != -1)
			dtoNext = dao.getReadData(nextNum);

		// 해당 게시물이 없다면
		// 목록 페이지 재요청
		if (dto == null)
		{
			try
			{
				response.sendRedirect("/noticelist.action");
			}
			catch (IOException e)
			{
				System.out.println(e.toString());
			}
		}

		// 게시물의 라인 수 처리
		int lineSu = dto.getMaintext().split("\n").length;

		// 게시물 내용의 엔터를 <br> 로 변경
		dto.setMaintext(dto.getMaintext().replaceAll("\n", "<br>"));

		String param = "";

		// 검색 데이터가 있으면...
		if (searchValue != null && !searchValue.equals(""))
		{
			param = "searchKey=" + searchKey;

			try
			{
				param = "&searchValue" + URLDecoder.decode(searchValue, "UTF-8");
			}
			catch (UnsupportedEncodingException e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("dtoBefore", dtoBefore);
		model.addAttribute("dtoNext", dtoNext);
		model.addAttribute("lineSu", lineSu);
		model.addAttribute("beforeNum", beforeNum);
		model.addAttribute("nextNum", nextNum);
		model.addAttribute("pageNum", pageNum);

		return "/WEB-INF/views/noticeArticle.jsp";
	}

	@RequestMapping(value = "/noticecreated.action", method = RequestMethod.GET)
	public String noticeCreate()
	{
		return "/WEB-INF/views/noticeCreated.jsp";
	}

	@RequestMapping(value = "/noticecreatedok.action", method = RequestMethod.POST)
	public void noticeCreate(HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		NoticeDTO dto = new NoticeDTO();

		// 넘겨받은 관리자ID, 제목, 내용
		dto.setAdminId(request.getParameter("adminId"));
		dto.setSubject(request.getParameter("subject"));
		dto.setMaintext(request.getParameter("content"));

		// 관리자Id에서 관리자번호찾는 메소드		
		 dto.setAdminNum(dao.getAdminNum(dto));

		// 공지사항게시판에 삽입
		dao.insertData(dto);

		try
		{
			String cp = request.getContextPath();
			response.sendRedirect(cp + "/noticelist.action");
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	@RequestMapping(value = "/noticeupdated.action", method = RequestMethod.GET)
	public String noticeUpdated(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		// 수정 요청 시 넘어온 게시물 번호 데이터 수신
		int ntcNum = Integer.parseInt(request.getParameter("ntcNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		NoticeDTO dto = dao.getReadData(ntcNum);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);

		if (dto == null)
		{
			try
			{
				String cp = request.getContextPath();
				response.sendRedirect(cp + "/noticelist.action");
			}
			catch (IOException e)
			{
				System.out.println(e.toString());
			}
		}

		return "/WEB-INF/views/noticeUpdated.jsp";
	}

	@RequestMapping(value = "/noticeupdatedok.action", method = RequestMethod.POST)
	public void noticeUpdated(HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		String cp = request.getContextPath();
		
		// 넘겨받은 페이지 번호, 게시물 번호, 제목, 내용 수신
		String pageNum = request.getParameter("pageNum");
		String ntcNum = request.getParameter("ntcNum");
		String subject = request.getParameter("subject");
		String maintext = request.getParameter("content");
		
		try
		{
			NoticeDTO dto = new NoticeDTO();

			dto.setNtcNum(Integer.parseInt(ntcNum));
			dto.setSubject(subject);
			dto.setMaintext(maintext);

			// update 쿼리문 실행
			dao.updateData(dto);

			response.sendRedirect(cp + "/noticelist.action?pageNum=" + pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	@RequestMapping(value = "/noticedelete.action", method = RequestMethod.GET)
	public void noticeDelete(HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		INoticeDAO dao = sqlSession.getMapper(INoticeDAO.class);
		
		String cp = request.getContextPath();

		// 넘겨받은 페이지 번호 수신
		int ntcNum = Integer.parseInt(request.getParameter("ntcNum"));

		try
		{
			// 기록 유지를 위해 deldate에
			// sysdate 를 업데이트 한 후
			// 뷰에는 보이지 않도록 함
			dao.deleteData(ntcNum);
			response.sendRedirect(cp + "/noticelist.action");
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
}