package model;

import java.sql.SQLException;
import java.util.List;

public interface ModelDAO<T> {
	public void doSave(T bean) throws SQLException;
	public boolean doDelete(String key) throws SQLException;
	public T doRetrieveByKey(String key) throws SQLException;
	public  List<T> doRetrieveAll(String order) throws SQLException;
}

