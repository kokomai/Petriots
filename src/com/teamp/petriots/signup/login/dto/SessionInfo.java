package com.teamp.petriots.signup.login.dto;

public class SessionInfo
{
   private String userName, userId, profile_img;
   private static String user_num, p_s_num, address, pwd;
   private static double addrLat, addrLong;

   public String getUserName()
   {
      return userName;
   }

   public void setUserName(String userName)
   {
      this.userName = userName;
   }

   public String getUserId()
   {
      return userId;
   }

   public void setUserId(String userId)
   {
      this.userId = userId;
   }

   public static String getUser_num()
   {
      return user_num;
   }

   public void setUser_num(String user_num)
   {
      this.user_num = user_num;
   }

   public static String getP_s_num()
   {
      return p_s_num;
   }

   public void setP_s_num(String p_s_num)
   {
      SessionInfo.p_s_num = p_s_num;
   }

   public String getProfile_img()
   {
      return profile_img;
   }

   public void setProfile_img(String profile_img)
   {
      this.profile_img = profile_img;
   }

   public static String getAddress()
   {
	   return address;
   }

   public void setAddress(String address)
   {	
	   this.address = address;
   }

   public static double getAddrLat()
   {
	   return addrLat;
   }

   public void setAddrLat(double addrLat)
   {
	   this.addrLat = addrLat;
   }

   public static double getAddrLong()
   {
	   return addrLong;
   }

   public void setAddrLong(double addrLong)
   {
	   this.addrLong = addrLong;
   }

   public static String getPwd()
   {
	   return pwd;
   }

   public void setPwd(String pwd)
   {
	   SessionInfo.pwd = pwd;
   }

}