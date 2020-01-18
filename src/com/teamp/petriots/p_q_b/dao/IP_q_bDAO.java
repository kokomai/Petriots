package com.teamp.petriots.p_q_b.dao;

import java.util.ArrayList;

import com.teamp.petriots.p_q_b.dto.P_q_bDTO;


public interface IP_q_bDAO
{
	
	//--------------------------------------------------- 인성문제 추상 메소드 구성 ------------------------------------------
	public ArrayList<P_q_bDTO> list();
	public int modify(P_q_bDTO m); 
	public int remove(int p_t_q_num);
	public int add(P_q_bDTO m); 
	public ArrayList<P_q_bDTO> searchlist(int search);
	//public ArrayList<P_q_bDTO> searchlist(int search);
	
}
