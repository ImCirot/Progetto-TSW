package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecensioneDAO {
    private static final String TABLE_NAME = "recensione";

    public synchronized void doSave(RecensioneBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + RecensioneDAO.TABLE_NAME + 
					" (cliente,codiceSerialeProdotto,prodotto,voto,testoRecensione,data,anonimo) VALUES (?,?,?,?,?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setString(1, bean.getCliente());
			statement.setString(2, bean.getCodiceSerialeProdotto());
			statement.setString(3, bean.getProdotto());
			statement.setInt(4, bean.getVoto());
			statement.setString(5, bean.getTestoRecensione());
			statement.setString(6, bean.getData());
			statement.setBoolean(7, bean.isAnonimo());

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

    public synchronized boolean doDelete(String key1,String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + RecensioneDAO.TABLE_NAME + " WHERE cliente = ? AND codiceSerialeProdotto = ?";
		
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

    public synchronized RecensioneBean doRetrieveByKey(String key1,String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		RecensioneBean recensione = new RecensioneBean();
		
		String query = "SELECT * FROM " + RecensioneDAO.TABLE_NAME + " WHERE cliente = ? AND prodotto = ?";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, key1);
            statement.setString(2, key2);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				recensione.setCliente(result.getString("cliente"));
				recensione.setCodiceSerialeProdotto(result.getString("codiceSerialeProdotto"));
                recensione.setProdotto(result.getString("prodotto"));
                recensione.setVoto(result.getInt("voto"));
                recensione.setTestoRecensione(result.getString("testoRecensione"));
                recensione.setData(result.getString("data"));
                recensione.setAnonimo(result.getBoolean("anonimo"));
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
		
		return recensione;
	}

    public synchronized List<RecensioneBean> doRetrieveAll(String order) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		RecensioneBean recensione = new RecensioneBean();
		List<RecensioneBean> recensioni = new ArrayList<>();
		
		String query = "SELECT * FROM " + RecensioneDAO.TABLE_NAME;
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				recensione = new RecensioneBean();
				recensione.setCliente(result.getString("cliente"));
				recensione.setCodiceSerialeProdotto(result.getString("codiceSerialeProdotto"));
                recensione.setProdotto(result.getString("prodotto"));
                recensione.setVoto(result.getInt("voto"));
                recensione.setTestoRecensione(result.getString("testoRecensione"));
                recensione.setData(result.getString("data"));
                recensione.setAnonimo(result.getBoolean("anonimo"));
				
				recensioni.add(recensione);
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
		
		return recensioni;
	}
    
    public synchronized List<RecensioneBean> doRetrieveAllByKey(String cliente) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		RecensioneBean recensione = new RecensioneBean();
		List<RecensioneBean> recensioni = new ArrayList<>();
		
		String query = "SELECT * FROM " + RecensioneDAO.TABLE_NAME + " WHERE cliente = ?";
		
//		if(checkOrder(order)) {
//			query += " ORDER BY" + order;
//		}
//		se ne parla dopo TODO
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			statement.setString(1, cliente);
			
			ResultSet result = statement.executeQuery();
			
			while(result.next()) {
				recensione = new RecensioneBean();
				recensione.setCliente(result.getString("cliente"));
				recensione.setCodiceSerialeProdotto(result.getString("codiceSerialeProdotto"));
                recensione.setProdotto(result.getString("prodotto"));
                recensione.setVoto(result.getInt("voto"));
                recensione.setTestoRecensione(result.getString("testoRecensione"));
                recensione.setData(result.getString("data"));
                recensione.setAnonimo(result.getBoolean("anonimo"));
				
				recensioni.add(recensione);
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
		
		return recensioni;
	}

    public synchronized boolean doUpdate(RecensioneBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		
		String query = "UPDATE " + RecensioneDAO.TABLE_NAME + " SET "
				+ "voto = ?, testoRecensione = ?, data = ?, anonimo = ? WHERE cliente = ? AND codiceSerialeProdotto = ?;";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
            statement.setInt(1, bean.getVoto());
            statement.setString(2, bean.getTestoRecensione());
            statement.setString(3, bean.getData());
            statement.setBoolean(4, bean.isAnonimo());
            statement.setString(5, bean.getCliente());
            statement.setString(6, bean.getCodiceSerialeProdotto());
            
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

    public synchronized List<RecensioneBean> filterByCliente(String cliente) throws SQLException{
        Connection con = null;
        PreparedStatement statement = null;
        List<RecensioneBean> recensioniCliente = new ArrayList<>();
        RecensioneBean recensione = new RecensioneBean();

        String query = "SELECT * FROM " + RecensioneDAO.TABLE_NAME + " WHERE cliente = ?;";

        try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
            statement.setString(1, cliente);

			ResultSet result = statement.executeQuery();
			
            while(result.next()){
            	recensione = new RecensioneBean();
                recensione.setCliente(result.getString("cliente"));
                recensione.setCodiceSerialeProdotto(result.getString("codiceSerialeProdotto"));
                recensione.setProdotto(result.getString("prodotto"));
                recensione.setVoto(result.getInt("voto"));
                recensione.setTestoRecensione(result.getString("testoRecensione"));
                recensione.setData(result.getString("data"));
                recensione.setAnonimo(result.getBoolean("anonimo"));
				
				recensioniCliente.add(recensione);
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

        return recensioniCliente;
    }

    public synchronized List<RecensioneBean> filterByProdotto(String prodotto) throws SQLException{
        Connection con = null;
        PreparedStatement statement = null;
        List<RecensioneBean> recensioniProdotto = new ArrayList<>();
        RecensioneBean recensione = new RecensioneBean();

        String query = "SELECT * FROM " + RecensioneDAO.TABLE_NAME + " WHERE codiceSerialeProdotto = ?;";

        try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
            statement.setString(1, prodotto);

			ResultSet result = statement.executeQuery();
			
            while(result.next()){
            	recensione = new RecensioneBean();
                recensione.setCliente(result.getString("cliente"));
                recensione.setCodiceSerialeProdotto(result.getString("codiceSerialeProdotto"));
                recensione.setProdotto(result.getString("prodotto"));
                recensione.setVoto(result.getInt("voto"));
                recensione.setTestoRecensione(result.getString("testoRecensione"));
                recensione.setData(result.getString("data"));
                recensione.setAnonimo(result.getBoolean("anonimo"));
				
				recensioniProdotto.add(recensione);
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

        return recensioniProdotto;
    }
}
