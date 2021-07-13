package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AppartenenzaDAO {

	 private static DataSource ds;
	 private static Connection currentCon = null;
	 private static PreparedStatement preparedStatement = null;

	   static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/cc");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
			e.printStackTrace();
		}
	}

	public static boolean doSave(AppartenenzaBean bean) {
		   
		   String insert="insert into appartenenza(categoria, prodotto) values(?, ?)";
		   try{
			   		System.out.println(bean.getCategoria());
			      //connect to DB 
				  currentCon = ds.getConnection();
			      preparedStatement=currentCon.prepareStatement(insert);
			      preparedStatement.setString(1, bean.getCategoria());
			      preparedStatement.setInt(2, bean.getProdotto());
			      if(preparedStatement.executeUpdate()==1) {
			    	  return true;
			      }
			      return false;
		   }
		   catch (Exception ex){
				System.out.println("Insert failed: An Exception has occurred! " + ex);
				return false;
		   } 
	   }
	
}
