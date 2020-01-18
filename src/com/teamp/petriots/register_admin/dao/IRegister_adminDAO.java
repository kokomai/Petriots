package com.teamp.petriots.register_admin.dao;



import com.teamp.petriots.register_admin.dto.Register_adminDTO;
import com.teamp.petriots.register_admin.dto.Register_adminSessionInfo;

public interface IRegister_adminDAO
{
	     public int login(Register_adminDTO dto);
	     
	     public Register_adminDTO getData(Register_adminDTO dto);
	     
	     public Register_adminSessionInfo getDataForSession(Register_adminDTO dto);
}
