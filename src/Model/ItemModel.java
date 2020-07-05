package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConnection.DriverManagerConnectionPool;

public class ItemModel {
private static final String TABLE_NAME = "item";
	
	/**
	 * genera id item
	 * @return
	 * @throws SQLException
	 */
	public synchronized String generateID() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String id = "";

		String selectSQL = "SELECT * FROM "+ItemModel.TABLE_NAME;
		
		ArrayList<Integer> idList = new ArrayList<Integer>();
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				id = rs.getString("id");
				System.out.println("ID: "+id);
				idList.add(Integer.parseInt(id));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		int index = 0;
		int max=0;
		
		for(int i=0; i<idList.size();i++) {
			index=idList.get(i);
			if(index>max) {
				max=index;
			}
		}
		max= max+1;
		
		String idNew = Integer.toString(max);
		System.out.println("\n\n\n\nid restituito da generateID(): "+idNew+"\n\n\n");
		return idNew;
		}
	
	

	/**
	 * Inserisce un nuovo item
	 * @param nome
	 * @param cognome
	 * @param sesso
	 * @param email
	 * @param telefono
	 * @param codiceFiscale
	 * @param tipo
	 * @param password
	 * @throws SQLException
	 */
	public synchronized int doSave(String nome, String tipo, String quantita, String idUtente) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = this.generateID();
		String descrizione = nome + " è un item di tipo " + tipo +" disponibile con la quantita di "+ quantita +" kg";
        
		
		String insertSQL = "INSERT INTO " + ItemModel.TABLE_NAME + " (id, nome, tipo, quantita, descrizione) VALUES (?,?,?,?,?)";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, nome);
			preparedStatement.setString(3, tipo);
			preparedStatement.setString(4, quantita);
			preparedStatement.setString(5, descrizione);
			
			

			System.out.println(preparedStatement.executeUpdate());

			connection.commit();
			
			InventarioModel inv = new InventarioModel();
			int ins= inv.doSave(idUtente, id);
			
			if(ins==1) {
			i=1;
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return i;
			
	}
	
	
	/**
	 * Ricerca item per id
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public synchronized Item doRetrieveById(String id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Item item = new Item();
		
		String selectSQL = "SELECT * FROM "+ItemModel.TABLE_NAME+" WHERE id = "+id;
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				id = rs.getString("id");
				System.out.println("ID: "+id);
				
				item.setId(rs.getString("id"));
				item.setNome(rs.getString("nome"));
				item.setTipo(rs.getString("tipo"));
				item.setQuantita(rs.getString("quantita"));
				item.setDescrizione(rs.getString("descrizione"));
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return item;
		}
	
	
	/**
	 * Rimuove item cercandolo per ID
	 * @param idItem
	 * @return
	 * @throws SQLException
	 */
	public synchronized int removeItemByID(String idItem) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		
		String insertSQL = "DELETE FROM " + ItemModel.TABLE_NAME + " WHERE id = ? ";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, idItem);
		
			
			

			System.out.println(preparedStatement.executeUpdate());

			connection.commit();
			i=1;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return i;
			
	}

	/**
	 * Rimuove item cercandolo per ID
	 * @param idItem
	 * @return
	 * @throws SQLException
	 */
	public synchronized int updateItem(String idItem, String nome, String tipo, String quantita) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE "+ItemModel.TABLE_NAME +" SET nome='"+nome+"' , tipo='"+tipo+"' , quantita='"+quantita+"' WHERE id='"+idItem+"'";
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
		

			System.out.println(preparedStatement.executeUpdate());

			connection.commit();
			i=1;
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return i;
			
	}
	
	
	
}
