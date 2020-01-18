package com.teamp.petriots.i_q_b.dao;

import java.util.ArrayList;

import com.teamp.petriots.i_q_b.dto.I_q_bDTO;

public interface II_q_bDAO
{
	//----------------------------------------------------------지식검사 메소드 구성 ------------------------------------------------------
	public ArrayList<I_q_bDTO> list();
	public int modify(I_q_bDTO m); 
	public int remove(int num);
	public int add(I_q_bDTO m);
	
}
