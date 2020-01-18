/*===========================
    MemberDAO.java
=============================*/

package com.teamp.petriots.signup.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.teamp.petriots.signup.login.dto.MemberDTO;
import com.teamp.petriots.signup.login.util.DBCPConn;

public class MemberDAO
{
	private Connection conn = DBCPConn.getConnection();
	
	public MemberDTO getReadData(String userId, String pwd)
	{
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try
		{
			sql = "SELECT USER_NUM, USERID, CRYPTPACK.DECRYPT(PWD, ?) AS PWD"
					+ ", USERNAME, SSN, ZIPCODE, ADDRESS, ADDRDETAILS, ADDRLAT"
					+ ", ADDRLONG, TEL, EMAIL, NICKNAME, SU_DATE, PROFILE_IMG "
					+ "FROM SIGNUP "
					+ "WHERE USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dto = new MemberDTO();
				dto.setUser_num(rs.getString("USER_NUM"));
				dto.setUserId(rs.getString("USERID"));
				dto.setPwd(rs.getString("PWD"));
				dto.setUserName(rs.getString("USERNAME"));
				dto.setSsn(rs.getString("SSN"));
				dto.setZipcode(rs.getString("ZIPCODE"));
				dto.setAddress(rs.getString("ADDRESS"));
				dto.setAddrDetails(rs.getString("ADDRDETAILS"));
				dto.setAddrLat(rs.getDouble("ADDRLAT"));
				dto.setAddrLong(rs.getDouble("ADDRLONG"));
				dto.setTel(rs.getString("TEL"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setNickName(rs.getString("NICKNAME"));
				dto.setSu_date(rs.getString("SU_DATE"));
				dto.setProfile_img(rs.getString("PROFILE_IMG"));
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		try
		{
			sql = "SELECT PS.P_S_NUM AS \"P_S_NUM\" "
					+ "FROM SIGNUP SU, PST_SHIFT PS "
					+ "WHERE SU.USER_NUM = PS.USER_NUM AND SU.USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setP_s_num(rs.getString("P_S_NUM"));
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return dto;
	}
	
	public boolean loginCheck(String userId, String pwd)
	{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try
		{
			sql = "SELECT COUNT(*) AS LOGINCHECK FROM SIGNUP WHERE USERID = ? AND PWD = CRYPTPACK.ENCRYPT(?, ?)";
			System.out.println(sql);
			System.out.println(conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, pwd);
			pstmt.setString(3, pwd);
			
			rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				int check = rs.getInt("LOGINCHECK");
				if (check == 0)
				{
					return false;
				}
			}
			rs.close();
			pstmt.close();
			
		} catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		
		
		return true;
	}
	
}
