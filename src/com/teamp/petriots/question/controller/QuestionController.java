package com.teamp.petriots.question.controller;

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
import org.springframework.web.context.request.SessionScope;

import com.teamp.petriots.answer.dto.AnswerDTO;
import com.teamp.petriots.answer.dao.IAnswerDAO;
import com.teamp.petriots.question.dao.IQuestionDAO;
import com.teamp.petriots.question.dto.QuestionDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;
import com.teamp.petriots.util.MyUtil;

@Controller
public class QuestionController
{
	@Autowired
	private SqlSession sqlsession;
	
	// Q/A 리스트 페이지
	@RequestMapping(value = "/questionlist.action", method = RequestMethod.GET)
	public String questionList(Model model, HttpServletRequest request)
	{
		IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);

		MyUtil myUtil = new MyUtil();

		// 넘어온 페이지 번호
		String pageNum = request.getParameter("pageNum");
		
		// 현재 표시되어야 하는 페이지
		int current_page = 1;

		if (pageNum != null)
			current_page = Integer.parseInt(pageNum);

		// 검색 키와 검색 값 수신
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");

		if (searchKey != null)
		{
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
		else
		{
			searchKey = "q_subject";
			searchValue = "";
		}

		// -------------------------------------------------------------------- 검색 기능 추가

		// 전체 데이터 갯수 구하기
		int data_count = dao.getDataCount(searchKey, searchValue);

		// 전체 데이터를 기준을 총 페이지 수를 계산한다.
		int numPerPage = 10;
		int total_page = myUtil.getPageCount(numPerPage, data_count);

		if (current_page > total_page) // 데이터를 삭제해서 페이지가 줄었을 경우
			current_page = total_page;

		int start = (current_page - 1) * numPerPage + 1;
		int end = current_page * numPerPage;
		
		List<QuestionDTO> lists = dao.getLists(start, end, searchKey, searchValue);

		String param = "";

		// 검색값이 존재한다면
		if (!searchValue.equals(""))
		{
			param += "?searchKey=" + searchKey;
			
			try
			{
				param += "&searchValue=" + URLDecoder.decode(searchValue, "UTF-8");
			}
			catch (UnsupportedEncodingException e)
			{
				System.out.println(e.toString());
			}
		}
		
		String cp = request.getContextPath();
		String listUrl = cp + "/questionlist.action" + param;
		String pageIndexList = myUtil.pageIndexList(current_page, total_page, listUrl);

		// 글 내용 보기 주소
		String articleUrl = "/questionlist.action";

		if (param.equals(""))
			articleUrl = articleUrl + "?pageNum=" + current_page;
		else
			articleUrl = articleUrl + param + "?pageNum=" + current_page;

		model.addAttribute("lists", lists);
		model.addAttribute("data_count", data_count);
		model.addAttribute("pageIndexList", pageIndexList);
		model.addAttribute("current_page", current_page);

		return "/WEB-INF/views/questionList.jsp";
	}

	// Q/A 각 질문 페이지
	@RequestMapping(value = "/questionarticle.action", method = RequestMethod.GET)
	public String questionArticle(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
		IAnswerDAO dao1 = sqlsession.getMapper(IAnswerDAO.class);

		// 넘어온 페이지 번호, 질문 번호
		String pageNum = request.getParameter("pageNum");
		int qNum = Integer.parseInt(request.getParameter("qNum"));

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
		// ------------------------------------------------------ 검색 추가

		// 조회수 증가
		dao.updateHitCount(qNum);

		// 해당 게시물 가져오기
		QuestionDTO dto = dao.getReadData(qNum);

		// 해당 게시물 댓글 가져오기
		List<QuestionDTO> lists = dao.getComment(qNum);
		
		// 해당 게시물 답글 가져오기
		List<AnswerDTO> aLists = dao1.getList(qNum);
		
		// 이전, 다음 게시물 번호 확인
		int beforeNum = dao.getBeforeNum(qNum);
		int nextNum = dao.getNextNum(qNum);

		QuestionDTO dtoBefore = null;
		QuestionDTO dtoNext = null;

		if (beforeNum != -1)
			dtoBefore = dao.getReadData(beforeNum);

		if (nextNum != -1)
			dtoNext = dao.getReadData(nextNum);

		if (dto == null)
		{
			try
			{
				response.sendRedirect("/questionlist.action");
			}
			catch (IOException e)
			{
				System.out.println(e.toString());
			}
		}

		// 게시물의 라인 수 처리
		int lineSu = dto.getqMaintext().split("\n").length;

		// 게시물 내용의 엔터를 <br> 로 변경
		dto.setqMaintext(dto.getqMaintext().replaceAll("\n", "<br>"));

		// 검색 추가 ------------------------------------------------------------
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

		// --------------------------------------------------------- 검색 추가

		model.addAttribute("dto", dto);
		model.addAttribute("dtoBefore", dtoBefore);
		model.addAttribute("dtoNext", dtoNext);
		model.addAttribute("lists", lists);
		model.addAttribute("aLists", aLists);
		model.addAttribute("lineSu", lineSu);
		model.addAttribute("beforeNum", beforeNum);
		model.addAttribute("nextNum", nextNum);
		model.addAttribute("pageNum", pageNum);

		return "/WEB-INF/views/questionArticle.jsp";
	}

	// Q/A 게시글 등록 폼
	@RequestMapping(value = "/questioncreated.action", method = RequestMethod.GET)
	public String questionCreate()
	{
		return "/WEB-INF/views/questionCreated.jsp";
	}

	// Q/A 게시글 등록 실행
	@RequestMapping(value = "/questioncreatedok.action", method = RequestMethod.POST)
	public void questionCreate(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			// mybatis mapper 를 이용한 DAO 활용
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			
			QuestionDTO dto = new QuestionDTO();
			
			// 넘겨받은 userId, qSubject, content 를 받아
			// dto에 세팅
			dto.setUserId(request.getParameter("userId"));
			dto.setqSubject(request.getParameter("qSubject"));
			dto.setqMaintext(request.getParameter("content"));

			// 닉네임에서 유저 번호 알아낸 후
			// dto에 세팅
			dto.setqUserNum(dao.getQNum(dto));

			// 공지사항게시판에 삽입
			dao.insertData(dto);
			
			String cp = request.getContextPath();
			response.sendRedirect(cp + "/questionlist.action");
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	// Q/A 게시글 수정 폼
	@RequestMapping(value = "/questionupdated.action", method = RequestMethod.GET)
	public String questionUpdated(Model model, HttpServletRequest request, HttpServletResponse response)
	{
		// mybatis mapper 를 이용한 DAO 활용
		IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
		
		// 수정 요청 시 넘어온 게시물 번호 데이터 수신
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		QuestionDTO dto = dao.getReadData(qNum);

		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);

		// 데이터가 없다면
		if (dto == null)
		{
			try
			{
				String cp = request.getContextPath();
				response.sendRedirect(cp + "/questionlist.action");
			}
			catch (IOException e)
			{
				System.out.println(e.toString());
			}
		}

		return "/WEB-INF/views/questionUpdated.jsp";
	}

	// Q/A 게시글 수정 실행
	@RequestMapping(value = "/questionupdatedok.action", method = RequestMethod.POST)
	public void questionUpdated(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			// 
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			
			String pageNum = request.getParameter("pageNum");
			int qNum = Integer.parseInt(request.getParameter("qNum"));
			QuestionDTO dto = new QuestionDTO();

			dto.setqNum(qNum);
			dto.setqSubject(request.getParameter("qSubject"));
			dto.setqMaintext(request.getParameter("content"));

			dao.updateData(dto);
			
			String cp = request.getContextPath();
			response.sendRedirect(cp + "/questionarticle.action?qNum=" + qNum + "&pageNum=" + pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}

	// Q/A 게시글 삭제 실행
	@RequestMapping(value = "/questiondelete.action", method = RequestMethod.GET)
	public void questionDelete(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			String cp = request.getContextPath();

			// Delete.jsp
			int qNum = Integer.parseInt(request.getParameter("qNum"));
			
			// 데이터 유지를 위해
			// DEL_DATE 컬럼에 SYSDATE를 입력하고
			// 뷰에서 출력되지 않도록 한다.
			dao.deleteData(qNum);
			
			response.sendRedirect(cp + "/questionlist.action");
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
	
	// Q/A 게시글 댓글 및 대댓글 작성
	@RequestMapping(value = "/qcommentcreatedok.action", method = RequestMethod.POST)
	public void qCommentCreateOk(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			QuestionDTO dto = new QuestionDTO();
			
			String cp = request.getContextPath();
			
			int qNum = Integer.parseInt(request.getParameter("qNum"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String qComment = request.getParameter("qComment");
			String qCUserNum = SessionInfo.getUser_num();

			// 대댓글인 경우에만 부모 번호를 참조하도록 함
			String qCNum = request.getParameter("qCNum");
			if (qCNum != null)
				dto.setqCNum(qCNum);
			else
			{
				qCNum = "";
				dto.setqCNum(qCNum);
			}
			
			dto.setqNum(qNum);
			dto.setqCMaintext(qComment);
			dto.setqCUserNum(qCUserNum);
			
			dao.qCommentCreateOk(dto);
			
			response.sendRedirect(cp + "/questionarticle.action?qNum="+qNum+"&pageNum="+pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
	
	// Q/A 게시글 댓글 및 대댓글 수정
	@RequestMapping(value = "/qcommentupdatedok.action", method = RequestMethod.POST)
	public void qCommentUpdated(HttpServletRequest request, HttpServletResponse response)
	{
		String cp = request.getContextPath();
		
		// 넘겨받은 질문번호, 페이지번호, 댓글 번호 수신
		int qNum = Integer.parseInt(request.getParameter("qNum"));
		String pageNum = request.getParameter("pageNum");
		String qCNum = request.getParameter("qCNum");
		String qComment = request.getParameter("qComment");
		
		QuestionDTO dto = new QuestionDTO();
		
		try
		{
			// mybatis 의존성 주입
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			
			dto.setqCNum(qCNum);
			dto.setqCMaintext(qComment);
			
			// dao를 통한 쿼리 실행
			dao.qCommentUpdated(dto);
			
			response.sendRedirect(cp + "/questionarticle.action?qNum="+qNum+"&pageNum="+pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
	
	
	// Q/A 게시글 댓글 및 대댓글 삭제
	// 데이터 삭제가 아닌 DELDATE 를 이용한 트리거 사용
	@RequestMapping(value = "/qcommentdelete.action", method = RequestMethod.GET)
	public void qqCommentDelete(HttpServletRequest request, HttpServletResponse response)
	{
		String cp = request.getContextPath();
		
		// 넘겨받은 질문번호, 페이지번호, 댓글 번호 수신
		String qNum = request.getParameter("qNum");
		String pageNum = request.getParameter("pageNum");
		String qCNum = request.getParameter("qCNum");
		
		try
		{
			// mybatis 의존성 주입
			IQuestionDAO dao = sqlsession.getMapper(IQuestionDAO.class);
			
			// dao를 통한 쿼리 실행
			dao.qqCommentDeleteOk(Integer.parseInt(qCNum));
			
			response.sendRedirect(cp + "/questionarticle.action?qNum="+qNum+"&pageNum="+pageNum);
		}
		catch (IOException e)
		{
			System.out.println(e.toString());
		}
	}
}