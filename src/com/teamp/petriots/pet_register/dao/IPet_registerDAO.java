package com.teamp.petriots.pet_register.dao;

import java.util.ArrayList;
import java.util.Map;

import com.teamp.petriots.pet_register.dto.Pet_registerDTO;
import com.teamp.petriots.reg_my_ccl.dto.Reg_my_cclDTO;

public interface IPet_registerDAO
{
	public ArrayList<Pet_registerDTO> petlist(String user_num);
	public ArrayList<Pet_registerDTO> mypetdata(String user_num);
	public ArrayList<Pet_registerDTO> petdata(String p_r_num);
	public ArrayList<Reg_my_cclDTO> cklist(String p_r_num);
	public int petregister(Pet_registerDTO dto);
	public int petmodify(Pet_registerDTO dto);
	public int petccldelete(String p_r_num);
	public int petcclregister(Map<String, Object> map);
	public void petdelete(String p_r_num);
}
