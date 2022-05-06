package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ComposizioneOrdineDAO extends AbstractDAO<ComposizioneOrdineBean> {

	private static final String TABLE_NAME = "composizioneOrdine";
	
	@Override
	public synchronized void doSave(ComposizioneOrdineBean bean) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		
		String query = "INSERT INTO " + ComposizioneOrdineDAO.TABLE_NAME + 
					" (ordine,prodotto,quantitaProdotto,costoUnitario VALUES (?,?,?);";
		
		try {
			con = DriverManagerConnectionPool.getConnection();
			statement = con.prepareStatement(query);
			
			statement.setInt(1, bean.getOrdine());
			statement.setString(2, bean.getProdotto());
			statement.setInt(3, bean.getQuantitaProdotto());
			statement.setBigDecimal(4, bean.getCostoUnitario());
			
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
	public synchronized boolean doDelete(String key1,String key2) throws SQLException {
		Connection con = null;
		PreparedStatement statement = null;
		int result = 0;
		String query = "DELETE FROM " + ComposizioneOrdineDAO.TABLE_NAME + " WHERE ordine = ? AND prodotto = ?";
		
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
	public synchronized ComposizioneOrdineBean doRetrieveByKey(String key) throws SQLException {
		// TODO Auto-generated method stub
		return super.doRetrieveByKey(key);
	}

	@Override
	public synchronized List<ComposizioneOrdineBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return super.doRetrieveAll(order);
	}

	@Override
	public synchronized boolean doUpdate(ComposizioneOrdineBean bean) throws SQLException {
		// TODO Auto-generated method stub
		return super.doUpdate(bean);
	}
	
}
