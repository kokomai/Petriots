package com.teamp.petriots.ccl_d_r.dao;

import java.util.ArrayList;

import com.teamp.petriots.ccl_d_r.dto.Ccl_d_rDTO;

public interface ICcl_d_rDAO
{
	public ArrayList<Ccl_d_rDTO> list();
	public int modify(Ccl_d_rDTO m);
	public int remove(int c_d_r_num);
}
