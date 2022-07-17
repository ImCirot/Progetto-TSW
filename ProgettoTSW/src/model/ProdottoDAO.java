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
		String query = "DELETE FROM " + ProdottoDAO.TABLE_NAME + " WHERE codiceSeriale = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key);
			
			result = statement.executeUpdate();
			
			con.commit(); // togliere commento se vuoi cancellare davvero dal db ad ogni delete
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

	@Override
	public synchronized boolean doUpdate(ProdottoBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + ProdottoDAO.TABLE_NAME + " SET "
				+ "nome = ?, marca = ?, descrizioneBreve = ?, edLimitata = ? WHERE codiceSeriale = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getNome());
			statement.setString(2, bean.getMarca());
			statement.setString(3, bean.getDescrizioneBreve());
			statement.setBoolean(4, bean.isEdLimitata());
			statement.setString(5, bean.getCodiceSeriale());
			
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
	
	public synchronized List<ProdottoBean> searchBy(String search) throws SQLException {
		List<ProdottoBean> prodottiTrovati = new ArrayList<>();
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT " + ProdottoDAO.TABLE_NAME + ".* FROM " + ProdottoDAO.TABLE_NAME + " WHERE nome LIKE ? OR marca LIKE ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, ("%" + search + "%"));
			statement.setString(2, ("%" + search + "%"));
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setCodiceSeriale(result.getString("codiceSeriale"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setDescrizioneBreve(result.getString("descrizioneBreve"));
				prodotto.setEdLimitata(result.getBoolean("edLimitata"));
				
				prodottiTrovati.add(prodotto);
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
		return prodottiTrovati;
	}
	
	public synchronized List<ProdottoBean> filterByEDLimitata() throws SQLException{
		List<ProdottoBean> listaProdotti = new ArrayList<>();
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE edLimitata = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setBoolean(1, true);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setCodiceSeriale(result.getString("codiceSeriale"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setDescrizioneBreve(result.getString("descrizioneBreve"));
				prodotto.setEdLimitata(result.getBoolean("edLimitata"));
				
				listaProdotti.add(prodotto);
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
		return listaProdotti;
	}
	
	public synchronized List<ProdottoBean> filterByMarca(String marca) throws SQLException{
		List<ProdottoBean> listaProdotti = new ArrayList<>();
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "SELECT * FROM " + ProdottoDAO.TABLE_NAME + " WHERE marca = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, marca);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				ProdottoBean prodotto = new ProdottoBean();
				
				prodotto.setCodiceSeriale(result.getString("codiceSeriale"));
				prodotto.setNome(result.getString("nome"));
				prodotto.setMarca(result.getString("marca"));
				prodotto.setDescrizioneBreve(result.getString("descrizioneBreve"));
				prodotto.setEdLimitata(result.getBoolean("edLimitata"));
				
				listaProdotti.add(prodotto);
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
		return listaProdotti;
	}
	
}
