package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO extends AbstractDAO<UtenteBean> {
	
	private static final String TABLE_NAME = "utente";
	
	@Override
	public synchronized void doSave(UtenteBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + UtenteDAO.TABLE_NAME + 
					" (username,password,email,nome,cognome,sesso,admin) VALUES (?,?,?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getUsername());
			statement.setString(2, bean.getPassword());
			statement.setString(3, bean.getEmail());
			statement.setString(4, bean.getNome());
			statement.setString(5, bean.getCognome());
			statement.setString(6, bean.getSesso());
			statement.setBoolean(7, bean.isAdmin());
			
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
		String query = "DELETE FROM " + UtenteDAO.TABLE_NAME + " WHERE username = ?";
		
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
	public synchronized UtenteBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		UtenteBean user = new UtenteBean();
		
		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE username = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("email"));
				user.setNome(result.getString("nome"));
				user.setCognome(result.getString("cognome"));
				user.setSesso(result.getString("sesso"));
				user.setAdmin(result.getBoolean("admin"));
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
		
		return user;
	}

	@Override
	public synchronized List<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<UtenteBean> users = new ArrayList<>();
		
		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		non ora TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				UtenteBean user = new UtenteBean();
				
				user.setUsername(result.getString("username"));
				user.setPassword(result.getString("password"));
				user.setEmail(result.getString("email"));
				user.setNome(result.getString("nome"));
				user.setCognome(result.getString("cognome"));
				user.setSesso(result.getString("sesso"));
				user.setAdmin(result.getBoolean("admin"));
				
				users.add(user);
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
		
		return users;
	}

	public synchronized boolean doUpdate(UtenteBean bean, String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + UtenteDAO.TABLE_NAME + " SET username = ?, password = ?, email = ?, nome = ?, cognome = ?, sesso = ? "
				+ "WHERE username = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getUsername());
			statement.setString(2, bean.getPassword());
			statement.setString(6, bean.getSesso());
			statement.setString(7, key);
			
			result = statement.executeUpdate();
			
			con.commit();
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

	public synchronized boolean checkEmail(String email) throws SQLException{
		boolean alreadyUsed = false;
		Connection con = null;
		PreparedStatement statement = null;

		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE email = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, email);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				alreadyUsed = true;
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

		return alreadyUsed;
	}
	
	public synchronized boolean checkUsername(String username) throws SQLException{
		boolean alreadyUsed = false;
		Connection con = null;
		PreparedStatement statement = null;

		String query = "SELECT * FROM " + UtenteDAO.TABLE_NAME + " WHERE username = ?";

		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);

			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				alreadyUsed = true;
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

		return alreadyUsed;
	}
}
