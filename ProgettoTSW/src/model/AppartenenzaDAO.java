package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AppartenenzaDAO extends AbstractDAO<AppartenenzaBean> {
	
	private static final String TABLE_NAME = "appartenenza";
	
	@Override
	public synchronized void doSave(AppartenenzaBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + AppartenenzaDAO.TABLE_NAME + 
					" (prodotto,sottocategoria) VALUES (?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getProdotto());
			statement.setString(2, bean.getSottocategoria());
			
			statement.executeUpdate();
			
			con.commit();
		} finally {
			try {
				if (statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
	}

	@Override
	public synchronized boolean doDelete(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + AppartenenzaDAO.TABLE_NAME + " WHERE prodotto = ? AND sottocategoria = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			
			result = statement.executeUpdate();
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return result != 0;
	}

	@Override
	public synchronized AppartenenzaBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		AppartenenzaBean appartenenza = new AppartenenzaBean();
		
		String query = "SELECT * FROM " + AppartenenzaDAO.TABLE_NAME + " WHERE prodotto = ? "
				+ "AND sottocategoria = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				appartenenza.setProdotto(result.getString("prodotto"));
				appartenenza.setSottocategoria(result.getString("sottocategoria"));
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return appartenenza;
	}

	@Override
	public synchronized List<AppartenenzaBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<AppartenenzaBean> appartenenze = new ArrayList<>();
		
		String query = "SELECT * FROM " + AppartenenzaDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				AppartenenzaBean appartenenza = new AppartenenzaBean();
				
				appartenenza.setProdotto(result.getString("prodotto"));
				appartenenza.setSottocategoria(result.getString("sottocategoria"));
				
				appartenenze.add(appartenenza);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return appartenenze;
	}
	
	public synchronized List<AppartenenzaBean> filterByCategoria(String categoria) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		List<AppartenenzaBean> listaProd = new ArrayList<>();
		
		String query = "SELECT * FROM " + AppartenenzaDAO.TABLE_NAME + " WHERE sottocategoria = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, categoria);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				AppartenenzaBean appartenenza = new AppartenenzaBean();
				appartenenza.setProdotto(result.getString("prodotto"));
				appartenenza.setSottocategoria(result.getString("sottocategoria"));
				
				listaProd.add(appartenenza);
			}
		} finally {
			try {
				if(statement != null) {
					statement.close();
				}
			} finally {
				DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
		return listaProd;
	}
}
