package model;

import java.sql.SQLException;
import java.util.List;

public abstract class AbstractDAO<T> implements ModelDAO<T> {

	@Override
	public synchronized void doSave(T bean) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}

	@Override
	public synchronized boolean doDelete(String key) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}

	@Override
	public synchronized boolean doDelete(String key1, String key2) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}

	@Override
	public synchronized T doRetrieveByKey(String key) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}

	@Override
	public synchronized T doRetrieveByKey(String key1, String key2) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}

	@Override
	public synchronized List<T> doRetrieveAll(String order) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}
	
	@Override
	public synchronized void doUpdate(T bean) throws SQLException {
		throw new UnsupportedOperationException("Operazione non supportata da questo DAO");
	}
	
}
