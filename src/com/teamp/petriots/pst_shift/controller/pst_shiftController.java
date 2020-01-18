package com.teamp.petriots.pst_shift.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.petriots.pst_shift.dao.IPst_shiftDAO;
import com.teamp.petriots.pst_shift.dto.Conduct_pDTO;
import com.teamp.petriots.pst_shift.dto.CutlineDTO;
import com.teamp.petriots.pst_shift.dto.Marking_pDTO;
import com.teamp.petriots.pst_shift.dto.P_q_bDTO;
import com.teamp.petriots.pst_shift.dto.Pass_pDTO;
import com.teamp.petriots.pst_shift.dto.Pass_tDTO;
import com.teamp.petriots.pst_shift.dto.Solve_pDTO;
import com.teamp.petriots.signup.dao.ISignupDAO;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;

@Controller
public class pst_shiftController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/ruleForPetsitter.action", method=RequestMethod.GET)
	public ModelAndView ruleForPetsitter()
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/WEB-INF/views/myPageRuleForPetsitter.jsp");
		
		return mav;
	}
	
	@RequestMapping(value = "/personalitytest.action", method = RequestMethod.POST)
	public String personalityTest(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IPst_shiftDAO dao = sqlSession.getMapper(IPst_shiftDAO.class);
		
		String user_num = SessionInfo.getUser_num();
		
		dao.selectRandomPersonalityQuestion(user_num);
		
		Conduct_pDTO conductDTO = new Conduct_pDTO();
		
		conductDTO = dao.conductPersonalityQuestion(user_num);
		
		ArrayList<String> arrQuestion = new ArrayList<String>();
		
		arrQuestion.add(conductDTO.getQ1());
		arrQuestion.add(conductDTO.getQ2());
		arrQuestion.add(conductDTO.getQ3());
		arrQuestion.add(conductDTO.getQ4());
		arrQuestion.add(conductDTO.getQ5());
		arrQuestion.add(conductDTO.getQ6());
		arrQuestion.add(conductDTO.getQ7());
		arrQuestion.add(conductDTO.getQ8());
		arrQuestion.add(conductDTO.getQ9());
		arrQuestion.add(conductDTO.getQ10());
		arrQuestion.add(conductDTO.getQ11());
		arrQuestion.add(conductDTO.getQ12());
		arrQuestion.add(conductDTO.getQ13());
		arrQuestion.add(conductDTO.getQ14());
		arrQuestion.add(conductDTO.getQ15());
		arrQuestion.add(conductDTO.getQ16());
		arrQuestion.add(conductDTO.getQ17());
		arrQuestion.add(conductDTO.getQ18());
		arrQuestion.add(conductDTO.getQ19());
		arrQuestion.add(conductDTO.getQ20());
		

		ArrayList<P_q_bDTO> arrP_q_bDTO = new ArrayList<P_q_bDTO>();
		
		for (int i = 0; i < arrQuestion.size(); i++)
		{
			arrP_q_bDTO.add(dao.getP_q_bData(arrQuestion.get(i), user_num));
		}
		HttpSession session = request.getSession();
		session.setAttribute("c_p_t_num", conductDTO.getC_p_t_num());
		
		// model.addAttribute("c_p_t_num", conductDTO.getC_p_t_num());
		model.addAttribute("lists", arrP_q_bDTO);
		
		view = "/WEB-INF/views/myPageTestPersonality.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/personalitytestresult.action", method = RequestMethod.POST)
	public ModelAndView personalityTestResult(HttpServletRequest request, Solve_pDTO userSolve_pDTO)
	{
		ModelAndView mav = new ModelAndView();
		
		int result = 0;
		IPst_shiftDAO dao = sqlSession.getMapper(IPst_shiftDAO.class);
		
		HttpSession session = request.getSession(); 
		String c_p_t_num = (String)session.getAttribute("c_p_t_num");
		userSolve_pDTO.setC_p_t_num(c_p_t_num);
		
		dao.insertPersonalityTestAnswer(userSolve_pDTO);
		
		Solve_pDTO dbSolve_pDTO = new Solve_pDTO(); 
		
		dbSolve_pDTO = dao.getSolve_pData(c_p_t_num);
		
		ArrayList<String> userAnswer = new ArrayList<String>();
		
		
		userAnswer.add(dbSolve_pDTO.getA1());
		userAnswer.add(dbSolve_pDTO.getA2());
		userAnswer.add(dbSolve_pDTO.getA3());
		userAnswer.add(dbSolve_pDTO.getA4());
		userAnswer.add(dbSolve_pDTO.getA5());
		userAnswer.add(dbSolve_pDTO.getA6());
		userAnswer.add(dbSolve_pDTO.getA7());
		userAnswer.add(dbSolve_pDTO.getA8());
		userAnswer.add(dbSolve_pDTO.getA9());
		userAnswer.add(dbSolve_pDTO.getA10());
		userAnswer.add(dbSolve_pDTO.getA11());
		userAnswer.add(dbSolve_pDTO.getA12());
		userAnswer.add(dbSolve_pDTO.getA13());
		userAnswer.add(dbSolve_pDTO.getA14());
		userAnswer.add(dbSolve_pDTO.getA15());
		userAnswer.add(dbSolve_pDTO.getA16());
		userAnswer.add(dbSolve_pDTO.getA17());
		userAnswer.add(dbSolve_pDTO.getA18());
		userAnswer.add(dbSolve_pDTO.getA19());
		userAnswer.add(dbSolve_pDTO.getA20());
		
		dao.insertMarkingTestPersonalityTest(dbSolve_pDTO.getS_p_t_num(), c_p_t_num);
		
		Marking_pDTO marking_pDTO = new Marking_pDTO();
		
		marking_pDTO = dao.getMarking_pData(dbSolve_pDTO.getS_p_t_num());
		
		result = Integer.parseInt(marking_pDTO.getT1())
				+ Integer.parseInt(marking_pDTO.getT2())
				+ Integer.parseInt(marking_pDTO.getT3())
				+ Integer.parseInt(marking_pDTO.getT4())
				+ Integer.parseInt(marking_pDTO.getT5())
				+ Integer.parseInt(marking_pDTO.getT6())
				+ Integer.parseInt(marking_pDTO.getT7())
				+ Integer.parseInt(marking_pDTO.getT8())
				+ Integer.parseInt(marking_pDTO.getT9())
				+ Integer.parseInt(marking_pDTO.getT10())
				+ Integer.parseInt(marking_pDTO.getT11())
				+ Integer.parseInt(marking_pDTO.getT12())
				+ Integer.parseInt(marking_pDTO.getT13())
				+ Integer.parseInt(marking_pDTO.getT14())
				+ Integer.parseInt(marking_pDTO.getT15())
				+ Integer.parseInt(marking_pDTO.getT16())
				+ Integer.parseInt(marking_pDTO.getT17())
				+ Integer.parseInt(marking_pDTO.getT18())
				+ Integer.parseInt(marking_pDTO.getT19())
				+ Integer.parseInt(marking_pDTO.getT20());
		
		CutlineDTO cutLineDTO = new CutlineDTO();
		
		cutLineDTO = dao.getCutLine();
		
		if (result >= Integer.parseInt(cutLineDTO.getP_cl()))
		{
			mav.setViewName("/WEB-INF/views/myPageSuccessKnow.jsp");
			dao.insertPass_p(marking_pDTO.getM_p_t_num(), cutLineDTO.getCutline_num());
			
			Pass_pDTO pass_pDTO = new Pass_pDTO();
			
			pass_pDTO = dao.getPass_pData(marking_pDTO.getM_p_t_num());
			
			dao.insertPass_t(pass_pDTO.getP_p_t_num());
			
			Pass_tDTO pass_tDTO = new Pass_tDTO();
			
			pass_tDTO = dao.getPass_t(pass_pDTO.getP_p_t_num(), "0");
			
			dao.insertPst_shift(pass_tDTO.getP_s_num(), SessionInfo.getUser_num());
		}
		else
		{
			mav.setViewName("/WEB-INF/views/myPageFailPersonality.jsp");
		}
		
		ISignupDAO signUpDAO = sqlSession.getMapper(ISignupDAO.class);
		
		String user_num = SessionInfo.getUser_num();
		
		SignupDTO signUpDTO = new SignupDTO();
		
		signUpDTO = signUpDAO.getData(user_num);
		
		mav.addObject("nickName", signUpDTO.getNickName());
		
		return mav;
	}
	
}
