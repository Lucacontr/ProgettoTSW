package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO{

	private static DataSource ds;

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

	private static final String TABLE_NAME = "prodotto";

	public static synchronized void doSave(ProductBean product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductDAO.TABLE_NAME
				+ " (nome, descrizione, prezzo, quantit�, thumbnail) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setDouble(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());
			preparedStatement.setString(5, product.getThumbnail());
			preparedStatement.executeUpdate();
			connection.setAutoCommit(false);
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	public static synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantit�"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzo_scontato"));
				bean.setNvendite(rs.getInt("nvendite"));
				bean.setNvisualizzazioni(rs.getInt("nvisualizzazioni"));
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	public static synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + ProductDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	public static synchronized boolean doUpdate(ProductBean bean) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "update " + ProductDAO.TABLE_NAME + " SET nome= ?, prezzo= ?, descrizione= ?, sconto= ?, prezzo_scontato= ?, "
				+ " nVendite= ?, nVisualizzazioni= ?, iva= ?, quantit�= ? WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, bean.getName());
			preparedStatement.setDouble(2, bean.getPrice());
			preparedStatement.setString(3, bean.getDescription());
			preparedStatement.setDouble(4, bean.getSconto());
			preparedStatement.setDouble(5, bean.getPrezzoScontato());
			preparedStatement.setInt(6, bean.getNvendite());
			preparedStatement.setInt(7, bean.getNvisualizzazioni());
			preparedStatement.setDouble(8, bean.getIva());
			preparedStatement.setInt(9, bean.getQuantity());
			preparedStatement.setInt(10, bean.getCode());
			result = preparedStatement.executeUpdate();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	public static synchronized Collection<ProductBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantit�"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzo_scontato"));
				bean.setNvendite(rs.getInt("nvendite"));
				bean.setNvisualizzazioni(rs.getInt("nvisualizzazioni"));
				bean.setThumbnail(rs.getString("thumbnail"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public static synchronized int getIdThumbnail(String thumb) throws SQLException {
		String selectSQL = "SELECT id FROM prodotto WHERE thumbnail= ?";
		int id=-1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, thumb);
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			id=rs.getInt(1);
		}
		catch (Exception ex){
		      System.out.println("ProductDAO.getIdThumbnail failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return id;
	}

	public static synchronized Collection<ProductBean> doRetrievePiuVisti() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " ORDER BY nVisualizzazioni DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantit�"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzo_scontato"));
				bean.setNvendite(rs.getInt("nvendite"));
				bean.setNvisualizzazioni(rs.getInt("nvisualizzazioni"));
				bean.setThumbnail(rs.getString("thumbnail"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public static synchronized Collection<ProductBean> doRetrievePiuVenduti() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " ORDER BY nVendite DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantit�"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzo_scontato"));
				bean.setNvendite(rs.getInt("nvendite"));
				bean.setNvisualizzazioni(rs.getInt("nvisualizzazioni"));
				bean.setThumbnail(rs.getString("thumbnail"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	public static synchronized Collection<ProductBean> doRetrieveOfferte() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDAO.TABLE_NAME + " WHERE sconto > 0";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("id"));
				bean.setName(rs.getString("nome"));
				bean.setDescription(rs.getString("descrizione"));
				bean.setPrice(rs.getDouble("prezzo"));
				bean.setQuantity(rs.getInt("quantit�"));
				bean.setIva(rs.getDouble("iva"));
				bean.setSconto(rs.getDouble("sconto"));
				bean.setPrezzoScontato(rs.getDouble("prezzo_scontato"));
				bean.setNvendite(rs.getInt("nvendite"));
				bean.setNvisualizzazioni(rs.getInt("nvisualizzazioni"));
				bean.setThumbnail(rs.getString("thumbnail"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
}