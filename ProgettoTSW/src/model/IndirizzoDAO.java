package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class IndirizzoDAO extends AbstractDAO<IndirizzoBean> {
	
	private static final String TABLE_NAME = "indirizzo";

	@Override
	public synchronized void doSave(IndirizzoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + IndirizzoDAO.TABLE_NAME + 
					" (numIndirizzoProgessivo,utente,via,citta,CAP,civico,provincia,scala,interno,preferito) VALUES (?,?,?,?,?,?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getNumIndirizzoProgressivo());
			statement.setString(2, bean.getUtente());
			statement.setString(3, bean.getVia());
			statement.setString(4, bean.getCitta());
			statement.setString(5, bean.getCAP());
			statement.setString(6, bean.getCivico());
			statement.setString(7, bean.getProvincia());
			statement.setString(8, bean.getScala());
			statement.setString(9, bean.getInterno());
			statement.setString(10, bean.getPreferito());
			
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
		// TODO Auto-generated method stub
		return super.doDelete(key);
	}

	@Override
	public synchronized boolean doDelete(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + IndirizzoDAO.TABLE_NAME + " WHERE numIndirizzoProgessivo = ? AND utente = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			
			result = statement.executeUpdate();
			
			//con.commit(); // togliere commento se vuoi cancellare davvero dal db ad ogni delete
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
	public synchronized IndirizzoBean doRetrieveByKey(String key) throws SQLException {
		// TODO Auto-generated method stub
		return super.doRetrieveByKey(key);
	}

	@Override
	public synchronized IndirizzoBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		IndirizzoBean indirizzo = new IndirizzoBean();
		
		String query = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME + " WHERE numIndirizzoProgessivo = ? AND utente = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				indirizzo.setNumIndirizzoProgressivo(result.getInt("numIndirizzoProgessivo"));
				indirizzo.setUtente(result.getString("utente"));
				indirizzo.setVia(result.getString("via"));
				indirizzo.setCitta(result.getString("citta"));
				indirizzo.setCAP(result.getString("CAP"));
				indirizzo.setCivico(result.getString("civico"));
				indirizzo.setProvincia(result.getString("provincia"));
				indirizzo.setScala(result.getString("scala"));
				indirizzo.setInterno(result.getString("interno"));
				indirizzo.setPreferito(result.getString("preferito"));
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
		
		return indirizzo;
	}

	@Override
	public synchronized List<IndirizzoBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<IndirizzoBean> indirizzi = new ArrayList<>();
		
		String query = "SELECT * FROM " + IndirizzoDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				IndirizzoBean indirizzo = new IndirizzoBean();
				
				indirizzo.setNumIndirizzoProgressivo(result.getInt("numIndirizzoProgessivo"));
				indirizzo.setUtente(result.getString("utente"));
				indirizzo.setVia(result.getString("via"));
				indirizzo.setCitta(result.getString("citta"));
				indirizzo.setCAP(result.getString("CAP"));
				indirizzo.setCivico(result.getString("civico"));
				indirizzo.setProvincia(result.getString("provincia"));
				indirizzo.setScala(result.getString("scala"));
				indirizzo.setInterno(result.getString("interno"));
				indirizzo.setPreferito(result.getString("preferito"));
				
				indirizzi.add(indirizzo);
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
		
		return indirizzi;
	}

	@Override
	public synchronized boolean doUpdate(IndirizzoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + IndirizzoDAO.TABLE_NAME + " SET "
				+ " via = ?, citta = ?, CAP = ?, civico = ?, "
				+ "provincia = ?, scala = ?, interno = ?, preferito = ? WHERE numIndirizzoProgessivo = ? AND utente = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getVia());
			statement.setString(2, bean.getCitta());
			statement.setString(3, bean.getCAP());
			statement.setString(4, bean.getCivico());
			statement.setString(5, bean.getProvincia());
			statement.setString(6, bean.getScala());
			statement.setString(7, bean.getInterno());
			statement.setString(8, bean.getPreferito());
			statement.setInt(9, bean.getNumIndirizzoProgressivo());
			statement.setString(10, bean.getUtente());
			
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

}
