package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class DettaglioProdottoDAO implements ModelDAO<DettaglioProdottoBean> {
	
	private static final String TABLE_NAME = "dettaglioProdotto";
	
	@Override
	public void doSave(DettaglioProdottoBean bean) throws SQLException {
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
			statement.setDouble(3, bean.getCostoUnitario());
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
	public boolean doDelete(String key) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + DettaglioProdottoDAO.TABLE_NAME + " WHERE codiceSeriale = ?";
		
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
	public DettaglioProdottoBean doRetrieveByKey(String key) throws SQLException {
		throw new UnsupportedOperationException("Operazione non valida per questo DAO");
	}
	
	@Override
	public DettaglioProdottoBean doRetrieveByKey(String key1, String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		DettaglioProdottoBean dettaglioProdotto = new DettaglioProdottoBean();
		
		String query = "SELECT * FROM " + DettaglioProdottoDAO.TABLE_NAME + " WHERE tipo = ? AND prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
			statement.setString(2, key2); //prova
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				dettaglioProdotto.setTipo(result.getString("tipo"));
				dettaglioProdotto.setProdotto(result.getString("prodotto"));
				dettaglioProdotto.setCostoUnitario(Double.parseDouble(result.getString("costoUnitario")));
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
	public List<DettaglioProdottoBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	

}
