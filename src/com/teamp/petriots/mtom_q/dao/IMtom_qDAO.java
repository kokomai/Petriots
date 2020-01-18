package com.teamp.petriots.mtom_q.dao;

import java.util.ArrayList;

import com.teamp.petriots.mtom_q.dto.Mtom_qDTO;

public interface IMtom_qDAO
{
	public ArrayList<Mtom_qDTO> questiondata();
	public int sendquestion(Mtom_qDTO dto);
	public ArrayList<Mtom_qDTO> list();
	public int modify(Mtom_qDTO m); 
}
