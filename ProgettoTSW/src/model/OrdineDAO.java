package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrdineDAO extends AbstractDAO<OrdineBean> {
	
	private static final String TABLE_NAME = "ordine";
	
	@Override
	public synchronized void doSave(OrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + OrdineDAO.TABLE_NAME + 
					" (numOrdineProgressivo,cliente,tipoPagamento,IBAN,numCarta,citta,CAP,via,civico,provincia,nazione,dataAcquisto,costoTotale) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getNumOrdineProgressivo());
			statement.setString(2, bean.getCliente());
			statement.setString(3, bean.getTipoPagamento());
			statement.setString(4, bean.getIBAN());
			statement.setString(5, bean.getNumCarta());
			statement.setString(6, bean.getCitta());
			statement.setString(7, bean.getCAP());
			statement.setString(8, bean.getVia());
			statement.setString(9, bean.getCivico());
			statement.setString(10, bean.getProvincia());
			statement.setString(11, bean.getNazione());
			statement.setString(12, bean.getDataAcquisto());
			statement.setBigDecimal(13, bean.getCostoTotale());
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
		String query = "DELETE FROM " + OrdineDAO.TABLE_NAME + " WHERE numOrdineProgressivo = ? AND cliente = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setInt(1, Integer.parseInt(key1));
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
	public synchronized OrdineBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		OrdineBean ordine = new OrdineBean();
		
		String query = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE numOrdineProgressivo = ? AND cliente = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setInt(1, Integer.parseInt(key1));
			statement.setString(2, key2);
			
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ordine.setNumOrdineProgressivo(result.getInt("numOrdineProgressivo"));
				ordine.setCliente(result.getString("cliente"));
				ordine.setTipoPagamento(result.getString("tipoPagamento"));
				ordine.setIBAN(result.getString("IBAN"));
				ordine.setNumCarta(result.getString("numCarta"));
				ordine.setCitta(result.getString("citta"));
				ordine.setCAP(result.getString("CAP"));
				ordine.setVia(result.getString("via"));
				ordine.setCivico(result.getString("civico"));
				ordine.setProvincia(result.getString("provincia"));
				ordine.setNazione(result.getString("nazione"));
				ordine.setDataAcquisto(result.getString("dataAcquisto"));
				ordine.setCostoTotale(result.getBigDecimal("costoTotale"));
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

		return ordine;
	}


	@Override
	public synchronized List<OrdineBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<OrdineBean> ordini = new ArrayList<>();
		
		String query = "SELECT * FROM " + OrdineDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				OrdineBean ordine = new OrdineBean();
				
				ordine.setNumOrdineProgressivo(result.getInt("numOrdineProgressivo"));
				ordine.setCliente(result.getString("cliente"));
				ordine.setTipoPagamento(result.getString("tipoPagamento"));
				ordine.setIBAN(result.getString("IBAN"));
				ordine.setNumCarta(result.getString("numCarta"));
				ordine.setCitta(result.getString("citta"));
				ordine.setCAP(result.getString("CAP"));
				ordine.setVia(result.getString("via"));
				ordine.setCivico(result.getString("civico"));
				ordine.setProvincia(result.getString("provincia"));
				ordine.setNazione(result.getString("nazione"));
				ordine.setDataAcquisto(result.getString("dataAcquisto"));
				ordine.setCostoTotale(result.getBigDecimal("costoTotale"));
				
				ordini.add(ordine);
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
		
		return ordini;
	}

	@Override
	public synchronized boolean doUpdate(OrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + OrdineDAO.TABLE_NAME + " SET "
				+ "numOrdineProgressivo = ?, cliente = ?, tipoPagamento = ?, IBAN = ?, numCarta = ?, citta = ?,"
				+ " CAP = ?, via = ?, civico = ?, provincia = ?, nazione = ?, dataAcquisto = ?, costoTotale = ? WHERE numOrdineProgressivo = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getNumOrdineProgressivo());
			statement.setString(2, bean.getCliente());
			statement.setString(3, bean.getTipoPagamento());
			statement.setString(4, bean.getIBAN());
			statement.setString(5, bean.getNumCarta());
			statement.setString(6, bean.getCitta());
			statement.setString(7, bean.getCAP());
			statement.setString(8, bean.getVia());
			statement.setString(9, bean.getCivico());
			statement.setString(10, bean.getProvincia());
			statement.setString(11, bean.getNazione());
			statement.setString(12, bean.getDataAcquisto());
			statement.setBigDecimal(13, bean.getCostoTotale());
			
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

	@Override
	public synchronized List<OrdineBean> doRetrieveAllByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<OrdineBean> ordini = new ArrayList<>();
		
		String query = "SELECT * FROM " + OrdineDAO.TABLE_NAME + " WHERE numOrdineProgressivo = ?";
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				OrdineBean ordine = new OrdineBean();
				
				ordine.setNumOrdineProgressivo(result.getInt("numOrdineProgressivo"));
				ordine.setCliente(result.getString("cliente"));
				ordine.setTipoPagamento(result.getString("tipoPagamento"));
				ordine.setIBAN(result.getString("IBAN"));
				ordine.setNumCarta(result.getString("numCarta"));
				ordine.setCitta(result.getString("citta"));
				ordine.setCAP(result.getString("CAP"));
				ordine.setVia(result.getString("via"));
				ordine.setCivico(result.getString("civico"));
				ordine.setProvincia(result.getString("provincia"));
				ordine.setNazione(result.getString("nazione"));
				ordine.setDataAcquisto(result.getString("dataAcquisto"));
				ordine.setCostoTotale(result.getBigDecimal("costoTotale"));
				
				ordini.add(ordine);
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
		
		return ordini;
	}
	
	
}
	
