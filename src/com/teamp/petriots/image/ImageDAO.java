/*========================
    ImageDAO.java
========================*/

package com.teamp.petriots.image;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.teamp.petriots.signup.login.util.DBCPConn;


public class ImageDAO
{
   private Connection conn = DBCPConn.getConnection();

   public int insertUserData(String fileName, String user_num)
   {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = null;
      
      try
      {
         sql = "UPDATE SIGNUP SET PROFILE_IMG = ? WHERE USER_NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "/Petriots/pds/image/" + fileName);
         pstmt.setString(2, user_num);
         
         result = pstmt.executeUpdate();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return result;
   }
   
   public int insertPetData(String fileName, String p_r_num)
   {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = null;
      
      try
      {
         sql = "UPDATE PET_REGISTER SET PET_IMG = ? WHERE P_R_NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "/Petriots/pds/petimage/" + fileName);
         pstmt.setString(2, p_r_num);
         
         result = pstmt.executeUpdate();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return result;
   }
   
   public int insertPetsitterData(String fileName, String p_s_num)
   {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = null;
      
      try
      {
         sql = "UPDATE PST_PROFILE SET PST_IMG1 = ? WHERE P_S_NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, "/Petriots/pds/petsitterimage/" + fileName);
         pstmt.setString(2, p_s_num);
         
         result = pstmt.executeUpdate();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return result;
   }
   
}