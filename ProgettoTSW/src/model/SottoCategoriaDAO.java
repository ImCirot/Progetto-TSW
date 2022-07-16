package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SottoCategoriaDAO extends AbstractDAO<SottoCategoriaBean> {
	
	private static final String TABLE_NAME = "sottocategoria";
	
	@Override
	public synchronized void doSave(SottoCategoriaBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + SottoCategoriaDAO.TABLE_NAME + 
					" (nome) VALUES (?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getNome());
			
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
	public synchronized boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + SottoCategoriaDAO.TABLE_NAME + " WHERE nome = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
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
	public synchronized SottoCategoriaBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		SottoCategoriaBean sottocategoria = new SottoCategoriaBean();
		
		String query = "SELECT * FROM " + SottoCategoriaDAO.TABLE_NAME + " WHERE nome = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				sottocategoria.setNome(result.getString("nome"));
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
		
		return sottocategoria;
	}

	@Override
	public synchronized List<SottoCategoriaBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<SottoCategoriaBean> sottocategorie = new ArrayList<>();
		
		String query = "SELECT * FROM " + SottoCategoriaDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				SottoCategoriaBean sottocategoria = new SottoCategoriaBean();
				
				sottocategoria.setNome(result.getString("nome"));
				
				sottocategorie.add(sottocategoria);
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
		
		return sottocategorie;
	}

	public synchronized List<SottoCategoriaBean> searchBy(String search) throws SQLException{
		List<SottoCategoriaBean> listaSottoCategorie = new ArrayList<>();
		SottoCategoriaBean sottoCategoria = new SottoCategoriaBean();
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT " + SottoCategoriaDAO.TABLE_NAME + ".* FROM " + SottoCategoriaDAO.TABLE_NAME + " WHERE nome LIKE ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, "%" + search + "%");
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				sottoCategoria = new SottoCategoriaBean();
				
				sottoCategoria.setNome(result.getString("nome"));
				
				listaSottoCategorie.add(sottoCategoria);
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
		return listaSottoCategorie;
	}
	
	
}
