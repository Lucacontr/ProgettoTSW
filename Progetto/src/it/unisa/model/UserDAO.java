package it.unisa.model;


import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO{
	
   private static Connection currentCon = null;
   private static ResultSet rs = null;
   private static Statement stmt = null;    
   private static PreparedStatement preparedStatement = null;
   private static DataSource ds;
   private static final String TABLE_NAME = "utente";
   
	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/cc");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}
   
   public static UserBean doRetrieve(UserBean bean) {
	
      //preparing some objects for connection 
      
	
      String username = bean.getUsername();    
      String password = bean.getPassword();   
	    
      String searchQuery = "SELECT * FROM " + UserDAO.TABLE_NAME + " WHERE username = ? AND pw = ?";
      
	   // "System.out.println" prints in the console; Normally used to trace the process
	   System.out.println("Your user name is " + username);          
	   System.out.println("Your password is " + password);
	   System.out.println("Query: "+searchQuery);
   
	   try{
	      //connect to DB 
		  currentCon = ds.getConnection();
	      preparedStatement=currentCon.prepareStatement(searchQuery);
	      preparedStatement.setString(1, username);
	      preparedStatement.setString(2, password);
	      rs = preparedStatement.executeQuery();	        
	      boolean more = rs.next();
		       
	      // if user does not exist set the isValid variable to false
	      if (!more){
	         System.out.println("Sorry, you are not a registered user! Please sign up first");
	         bean.setValid(false);
	      } 
		        
	      //if user exists set the isValid variable to true
	      else{
	         String firstName = rs.getString("nome");
	         String lastName = rs.getString("cognome");
	         bean.setFirstName(firstName);
	         bean.setLastName(lastName);
	         bean.setValid(true);
	      }
	   } 
	   catch (Exception ex){
	      System.out.println("Log In failed: An Exception has occurred! " + ex);
	   } 
	   //some exception handling
	   finally{
	      if (rs != null)	{
	         try {
	            rs.close();
	         } catch (Exception e) {}
	            rs = null;
	         }
		
	      if (stmt != null) {
	         try {
	            stmt.close();
	         } catch (Exception e) {}
	            stmt = null;
	         }
		
	      if (currentCon != null) {
	         try {
	            currentCon.close();
	         } catch (Exception e) {
	         }
	
	         currentCon = null;
	      }
	   }
	   return bean;
   }
   
   public static boolean doSave(UserBean bean) {
	   
	   String insert="insert into utente() values()"
	   
   }
   
}

