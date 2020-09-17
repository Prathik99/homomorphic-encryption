/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.upload;

import cloud.upload.Ftpcon;
import com.database.*;

import com.encryption.BlowFishEncryption;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class UploadImage extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try{
            HttpSession session=request.getSession();
            String username=(String)session.getAttribute("username");
          String key=request.getParameter("key");  
          Part p=request.getPart("File");  
         
  String fname=p.getSubmittedFileName();
          
          
          InputStream is=p.getInputStream();
         
          
         byte[] content=new byte[is.available()];
          String cipher=BlowFishEncryption.encrypt(content,key);
          
           File f=new File("F:\\Patient_Monitoring_System\\Patient_Monitoring_System\\web\\ALL IMAGES\\" +fname);
           if(f.createNewFile()){
           
           
          FileWriter filew=new FileWriter(f);
          filew.append(cipher);
           }else{
             FileWriter filew=new FileWriter(f);
          filew.append(cipher);   
           }
           
         
          Connection con=DatabaseConnection.getCon();
          int count=0;
          ResultSet r=DatabaseConnection.getExecuteQuery("select count(*) from image where skey='"+key+"'");
          while(r.next()){
           count=r.getInt(1);   
          }
          if(count==0){
          PreparedStatement pst=con.prepareStatement("insert into image values(null,'"+username+"','"+fname+"','"+cipher+"','"+key+"',?)");
          pst.setBlob(1,is);
          int ii=pst.executeUpdate();
        
         if(ii>0){
             File f1 = new File("E:\\",fname);
                                FileWriter fw = new FileWriter(f1);
                                fw.write(cipher);
                                fw.close();
                               
             Ftpcon ftp=new Ftpcon();
             Boolean b=ftp.upload(f,fname);
            if(b==true){
               System.out.println("Uploaded into the cloud success"); 
            }else{
              System.out.println("Uploaded into the cloud failed");    
            }
           response.sendRedirect("UserHome.jsp?msg=successfully");  
         }else{
            response.sendRedirect("UserHome.jsp?msg=failed"); 
         }
          }else{
           response.sendRedirect("UserHome.jsp?msg=Key Already Exist");    
          }
          
          
        }catch(Exception e){
          System.out.println(e);  
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
