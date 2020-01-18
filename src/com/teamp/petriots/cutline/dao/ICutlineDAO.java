package com.teamp.petriots.cutline.dao;

import java.util.ArrayList;

import com.teamp.petriots.cutline.dto.CutlineDTO;

public interface ICutlineDAO
{
	public ArrayList<CutlineDTO> list();
	public int modify(CutlineDTO m);
	public int remove(int cutline_num);
}
