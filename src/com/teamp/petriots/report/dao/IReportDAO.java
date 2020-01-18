package com.teamp.petriots.report.dao;

import java.util.ArrayList;

import com.teamp.petriots.report.dto.ReportDTO;

public interface IReportDAO
{
	public ArrayList<ReportDTO> list();
	public int  insert(ReportDTO m);
}
