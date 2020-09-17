
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author KishanVenky
 */
public class DatabaseConnection {
    
    //here iam declraring the static method for connection
    static Connection con=null;
    static ResultSet rs=null;
   static int i=0;
    public static Connection getCon(){
        try{
           Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/patinet_monitoring","root","root");
         }catch(Exception e){
          System.out.println(e);  
        }
           return con;
    }
    public static ResultSet getExecuteQuery(String query){
      try{
          Connection con1=DatabaseConnection.getCon();
          if(con1!=null){
              
          Statement st=con1.createStatement();
          rs=st.executeQuery(query);
          }else{
              System.out.println("connection error in 2nd method");
          }
      } catch(Exception e){
          System.out.println(e);
      }
        
        return rs;
    }
    public static int getExecuteUpdate(String query){
      try{
            Connection con1=DatabaseConnection.getCon();
          if(con1!=null){
          Statement st=con1.createStatement();
          i=st.executeUpdate(query);
          }else{
               System.out.println("connection error in 3rd method");    
          }
      } catch(Exception e){
          System.out.println(e);
      }
         
       return i;
    }
    
}
