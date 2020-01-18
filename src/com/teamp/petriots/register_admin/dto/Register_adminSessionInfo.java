package com.teamp.petriots.register_admin.dto;

public class Register_adminSessionInfo
{
	private String id, pw;
	private static int admin_num;
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	public static int getAdmin_num()
	{
		return admin_num;
	}
	public void setAdmin_num(int admin_num)
	{
		Register_adminSessionInfo.admin_num = admin_num;
	}
}
