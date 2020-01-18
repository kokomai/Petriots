package com.teamp.petriots.withdrawal.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.teamp.petriots.withdrawal.dto.WithdrawalDTO;

public interface IWithdrawalDAO
{
	public ArrayList<WithdrawalDTO> withdrawaldata(@Param("user_num")String user_num, @Param("pwd")String pwd);
	public ArrayList<WithdrawalDTO> withdrawalreason();
	public int withdrawaladd(WithdrawalDTO dto);
}
