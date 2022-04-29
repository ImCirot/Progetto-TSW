package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProdottoDAO extends AbstractDAO<ProdottoBean> {
	
	private static final String TABLE_NAME = "prodotto";
	
	@Override
	public synchronized void doSave(ProdottoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + ProdottoDAO.TABLE_NAME + 
					" (codiceSeriale,nome,marca,descrizioneBreve,edLimitata) VALUES (?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getCodiceSeriale());
			statement.setString(2, bean.getNome());
			statement.setString(3, bean.getMarca());
			statement.setString(4, bean.getDescrizioneBreve());
			statement.setBoolean(5, bean.isEdLimitata());
			
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
		String query = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE (codiceSeriale = ?)";
		
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
	public synchronized ProdottoBean doRetrieveByKey(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		ProdottoBean prodotto = new ProdottoBean();
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE codiceSeriale = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				prodotto.setCodiceSeriale(result.getString("codiceSeriale"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setDescrizioneBreve(result.getString("descrizioneBreve"));
				prodotto.setEdLimitata(result.getBoolean("edLimitata"));
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
		
		return prodotto;
	}

	@Override
	public synchronized List<ProdottoBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		List<ProdottoBean> prodotti = new ArrayList<>();
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setCodiceSeriale(result.getString("codiceSeriale"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setDescrizioneBreve(result.getString("descrizioneBreve"));
				prodotto.setEdLimitata(result.getBoolean("edLimitata"));
				
				prodotti.add(prodotto);
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
		
		return prodotti;
	}
}
