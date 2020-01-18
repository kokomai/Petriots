package com.teamp.petriots.pst_shift.dao;


import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.pst_shift.dto.Conduct_pDTO;
import com.teamp.petriots.pst_shift.dto.CutlineDTO;
import com.teamp.petriots.pst_shift.dto.Marking_pDTO;
import com.teamp.petriots.pst_shift.dto.P_q_bDTO;
import com.teamp.petriots.pst_shift.dto.Pass_pDTO;
import com.teamp.petriots.pst_shift.dto.Pass_tDTO;
import com.teamp.petriots.pst_shift.dto.Pst_shiftDTO;
import com.teamp.petriots.pst_shift.dto.Solve_pDTO;

public interface IPst_shiftDAO
{
	public void selectRandomPersonalityQuestion(@Param("user_num") String user_num);
	
	public Conduct_pDTO conductPersonalityQuestion(@Param("user_num") String user_num);
	
	public P_q_bDTO getP_q_bData(@Param("question") String question,@Param("user_num") String user_num);
	
	public void insertPersonalityTestAnswer(Solve_pDTO dto);
	
	public Solve_pDTO getSolve_pData(@Param("c_p_t_num") String c_p_t_num);
	
	public void insertMarkingTestPersonalityTest(@Param("s_p_t_num") String s_p_t_num,@Param("c_p_t_num") String c_p_t_num);
	
	public Marking_pDTO getMarking_pData(@Param("s_p_t_num") String s_p_t_num);
	
	public CutlineDTO getCutLine();
	
	public void insertPass_p(@Param("m_p_t_num") String m_p_t_num, @Param("cutline_num") String cutline_num);
	
	public Pass_pDTO getPass_pData(@Param("m_p_t_num") String m_p_t_num);
	
	public void insertPass_t(@Param("p_p_t_num") String p_p_t_num);
	
	public Pass_tDTO getPass_t(@Param("p_p_t_num") String p_p_t_num, @Param("p_i_t_num") String p_i_t_num);
	
	public void insertPst_shift(@Param("p_s_num") String p_s_num, @Param("user_num") String user_num);
	
}
