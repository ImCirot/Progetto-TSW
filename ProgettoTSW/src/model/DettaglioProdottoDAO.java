package model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DettaglioProdottoDAO extends AbstractDAO<DettaglioProdottoBean> {
	
	private static final String TABLE_NAME = "dettaglioProdotto";
	
	@Override
	public synchronized void doSave(DettaglioProdottoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + DettaglioProdottoDAO.TABLE_NAME + 
					" (tipo,prodotto,costoUnitario,IVA,quantita,origine,scadenza,peso,volume,immagine) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getTipo());
			statement.setString(2, bean.getProdotto());
			statement.setBigDecimal(3, bean.getCostoUnitario());
			statement.setInt(4, bean.getIVA());
			statement.setInt(5, bean.getQuantita());
			statement.setString(6, bean.getOrigine());
			statement.setString(7, bean.getScadenza());
			statement.setString(8, bean.getPeso());
			statement.setString(9, bean.getVolume());
			statement.setString(10, bean.getImmagine());
			
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
		String query = "DELETE FROM " + DettaglioProdottoDAO.TABLE_NAME + " WHERE tipo = ? AND prodotto = ?";
		
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
	public synchronized DettaglioProdottoBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		DettaglioProdottoBean dettaglioProdotto = new DettaglioProdottoBean();
		
		String query = "SELECT * FROM " + DettaglioProdottoDAO.TABLE_NAME + " WHERE tipo = ? AND prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				dettaglioProdotto.setTipo(result.getString("tipo"));
				dettaglioProdotto.setProdotto(result.getString("prodotto"));
				dettaglioProdotto.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				dettaglioProdotto.setIVA(Integer.parseInt(result.getString("IVA")));
				dettaglioProdotto.setQuantita(Integer.parseInt(result.getString("quantita")));
				dettaglioProdotto.setOrigine(result.getString("origine"));
				dettaglioProdotto.setScadenza(result.getString("scadenza"));
				dettaglioProdotto.setPeso(result.getString("peso"));
				dettaglioProdotto.setVolume(result.getString("volume"));
				dettaglioProdotto.setImmagine(result.getString("immagine"));
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
		
		return dettaglioProdotto;
	}
	
	

	@Override
	public synchronized DettaglioProdottoBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		DettaglioProdottoBean dettaglioProdotto = new DettaglioProdottoBean();
		
		String query = "SELECT * FROM " + DettaglioProdottoDAO.TABLE_NAME + " WHERE prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				dettaglioProdotto.setTipo(result.getString("tipo"));
				dettaglioProdotto.setProdotto(result.getString("prodotto"));
				dettaglioProdotto.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				dettaglioProdotto.setIVA(Integer.parseInt(result.getString("IVA")));
				dettaglioProdotto.setQuantita(Integer.parseInt(result.getString("quantita")));
				dettaglioProdotto.setOrigine(result.getString("origine"));
				dettaglioProdotto.setScadenza(result.getString("scadenza"));
				dettaglioProdotto.setPeso(result.getString("peso"));
				dettaglioProdotto.setVolume(result.getString("volume"));
				dettaglioProdotto.setImmagine(result.getString("immagine"));
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
		
		return dettaglioProdotto;
	}

	@Override
	public synchronized List<DettaglioProdottoBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<DettaglioProdottoBean> dettagliProdotti = new ArrayList<>();
		
		String query = "SELECT * FROM " + DettaglioProdottoDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				DettaglioProdottoBean dettaglioProdotto = new DettaglioProdottoBean();
				
				dettaglioProdotto.setTipo(result.getString("tipo"));
				dettaglioProdotto.setProdotto(result.getString("prodotto"));
				dettaglioProdotto.setCostoUnitario(result.getBigDecimal("costoUnitario"));
				dettaglioProdotto.setIVA(Integer.parseInt(result.getString("IVA")));
				dettaglioProdotto.setQuantita(Integer.parseInt(result.getString("quantita")));
				dettaglioProdotto.setOrigine(result.getString("origine"));
				dettaglioProdotto.setScadenza(result.getString("scadenza"));
				dettaglioProdotto.setPeso(result.getString("peso"));
				dettaglioProdotto.setVolume(result.getString("volume"));
				dettaglioProdotto.setImmagine(result.getString("immagine"));
				
				dettagliProdotti.add(dettaglioProdotto);
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
		
		return dettagliProdotti;
	}
	
	@Override
	public synchronized void doUpdate(DettaglioProdottoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "UPDATE " + DettaglioProdottoDAO.TABLE_NAME + " SET "
				+ "tipo = ?,prodotto = ?,costoUnitario = ?,IVA = ?,quantita = ?,origine = ?, scadenza = ?,"
				+ " peso = ?, volume = ?, immagine = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getTipo());
			statement.setString(2, bean.getProdotto());
			statement.setDouble(3, bean.getCostoUnitario().doubleValue());
			statement.setInt(4, bean.getIVA());
			statement.setInt(5, bean.getQuantita());
			statement.setString(6, bean.getScadenza());
			statement.setString(7, bean.getPeso());
			statement.setString(8, bean.getVolume());
			statement.setString(9, bean.getImmagine());
			
			statement.executeUpdate();
			
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
	}
}
