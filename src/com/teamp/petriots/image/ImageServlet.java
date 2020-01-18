package com.teamp.petriots.image;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.teamp.petriots.signup.dto.SignupDTO;
import com.teamp.petriots.signup.login.dto.SessionInfo;

public class ImageServlet extends HttpServlet
{

      private static final long serialVersionUID = 1L;

      @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
         process(request, response);
      }

      @Override
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
         process(request, response);
      }
      
      protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
      {
         request.setCharacterEncoding("UTF-8");
         
         String uri = request.getRequestURI();
         ImageDAO dao = new ImageDAO();
         
        
         if(uri.indexOf("userprofile.img") != -1)
         {
            HttpSession session = request.getSession();

            String root = session.getServletContext().getRealPath("/");
            String savePath = root + File.separator + "pds" + File.separator + "image";
            
            File dir = new File(savePath);
            
            if(!dir.exists())
               dir.mkdirs();
            
            String encType = "UTF-8";
            int maxFileSize = 10*1024*1024;

            try
            {
               MultipartRequest req = null;
               req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
               
               String saveFileName = req.getFilesystemName("imgUpload");
               String user_num = req.getParameter("user_num");
               
               dao.insertUserData(saveFileName, user_num);

            } catch (Exception e)
            {
               System.out.println(e.toString());
            }
            response.sendRedirect("mypageusermodify.action");
         }
         else if(uri.indexOf("petprofile.img") != -1)
         {
            HttpSession session = request.getSession();

            String root = session.getServletContext().getRealPath("/");
            String savePath = root + File.separator + "pds" + File.separator + "petimage";
            
            File dir = new File(savePath);
            
            if(!dir.exists())
               dir.mkdirs();
            
            String encType = "UTF-8";
            int maxFileSize = 10*1024*1024;
            String p_r_num = "";
            try
            {
               MultipartRequest req = null;
               req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
               
               String saveFileName = req.getFilesystemName("imgUpload");
               p_r_num = req.getParameter("p_r_num");
               
               dao.insertPetData(saveFileName, p_r_num);

            } catch (Exception e)
            {
               System.out.println(e.toString());
            }
            response.sendRedirect("mypagepetmodify.action?p_r_num=" + p_r_num);
         }
         else if(uri.indexOf("petsitter.img") != -1)
         {
            HttpSession session = request.getSession();

            String root = session.getServletContext().getRealPath("/");
            String savePath = root + File.separator + "pds" + File.separator + "petsitterimage";
            
            File dir = new File(savePath);
            
            if(!dir.exists())
               dir.mkdirs();
            
            String encType = "UTF-8";
            int maxFileSize = 10*1024*1024;
            String p_s_num = "";
            try
            {
               MultipartRequest req = null;
               req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
               
               String saveFileName = req.getFilesystemName("imgUpload");
               p_s_num = req.getParameter("p_s_num");
               
               dao.insertPetsitterData(saveFileName, p_s_num);

            } catch (Exception e)
            {
               System.out.println(e.toString());
            }
            response.sendRedirect("petsitterprofilemodifyform.action");
         }
            
      }
}