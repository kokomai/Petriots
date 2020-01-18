package com.teamp.petriots.ccl_request.dao;

import java.util.ArrayList;
import java.util.Map;

import com.teamp.petriots.ccl_request.dto.Ccl_requestDTO;

public interface ICcl_requestDAO
{
	public ArrayList<Ccl_requestDTO> p_sitting_checklist(Ccl_requestDTO dto); // 현재 위탁 중 체크리스트
	
	public int checkok(Ccl_requestDTO dto);
	
	public int cklistapply(Map<String, Object> map);
	
	public int cklistconfirm();
	public int cklistapprove();
}
