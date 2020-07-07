package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import DBConnection.DriverManagerConnectionPool;

public class DispositivoModel 
{
	public synchronized Collection<Dispositivo> getSensori(String utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Dispositivo> dispositivo = new LinkedList<Dispositivo>();

		String selectSQL = "SELECT * FROM dispositivo WHERE tipo = 'sensore' AND  utente = ?";
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, utente);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Dispositivo bean = new Dispositivo();
				
				bean.setId(rs.getString("id"));
				bean.setNome(rs.getString("nome"));
				bean.setCampo(rs.getString("campo"));
				bean.setStato(rs.getString("stato"));
				bean.setTipo(rs.getString("tipo"));
				bean.setUtente(rs.getString("utente"));
				bean.setStato(rs.getString("stato"));

				
				
				if(bean!=null) {	
					dispositivo.add(bean);
				}
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return dispositivo;
	}
	public synchronized Collection<Dispositivo> getRobot(String utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Dispositivo> dispositivo = new LinkedList<Dispositivo>();

		String selectSQL = "SELECT * FROM dispositivo WHERE tipo = 'robot' AND utente = ?";
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, utente);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Dispositivo bean = new Dispositivo();
				
				bean.setId(rs.getString("id"));
				bean.setNome(rs.getString("nome"));
				bean.setCampo(rs.getString("campo"));
				bean.setStato(rs.getString("stato"));
				bean.setTipo(rs.getString("tipo"));
				bean.setUtente(rs.getString("utente"));
				bean.setStato(rs.getString("stato"));

				
				
				if(bean!=null) {	
					dispositivo.add(bean);
				}
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return dispositivo;
	}
	
	private static final String TABLE_NAME = "dispositivo";
	
	/**
	 * Restituisce tutti i dispositivi associati a un campo
	 * @param nome_campo
	 * @return
	 * @throws SQLException
	 */
	public synchronized ArrayList<Dispositivo> doRetrieveByNomeCampo(String nome_campo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Campo campo = new Campo();
		ArrayList<Dispositivo> dispositiviList  = new ArrayList<Dispositivo>();
		String selectSQL = "SELECT * FROM "+DispositivoModel.TABLE_NAME+" WHERE campo = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome_campo);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				Dispositivo bean = new Dispositivo();
				
				bean.setId(rs.getString("id"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(rs.getString("tipo"));
				bean.setCampo(rs.getString("campo"));
				bean.setStato(rs.getString("stato"));

				
				
				
				dispositiviList.add(bean);
				
				
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return dispositiviList;
	}
	
	
	
	/**
	 * Aggiorna lo stato di un dispositivo
	 * @param idDispositivo
	 * @param stato
	 * @return
	 * @throws SQLException
	 */
	public synchronized int updateStatoById(String idDispositivo, String stato) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE "+DispositivoModel.TABLE_NAME +" SET stato='"+stato+"'  WHERE id='"+idDispositivo+"'";
		
		
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
	
	public synchronized void doSave(String nome,String tipo,String campo,String stato,String utente)
	{
     String insertSQL = "INSERT INTO dispositivo  (id,nome,tipo,campo,stato,utente) VALUES (?,?,?,?,?,?)";
     Connection connection = null;
     PreparedStatement preparedStatement = null;
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, generateID());
			preparedStatement.setString(2, nome);
			preparedStatement.setString(3, tipo);
			preparedStatement.setString(4, campo);
			preparedStatement.setString(5, stato);
			preparedStatement.setString(6, utente);
			
			System.out.println(preparedStatement.executeUpdate());

			connection.commit();
			
	}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					try {
						preparedStatement.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}

	}
	public synchronized String generateID() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String id = "";

		String selectSQL = "SELECT * FROM dispositivo";
		
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
	public synchronized int remove(String id) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		
		String insertSQL = "DELETE FROM dispositivo WHERE id = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, id);
		
		
			
			

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
	
	
	
	public synchronized int liberaRobot(String campo) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String stato="disponibile";
		String tipo="robot";
		
		String insertSQL = "UPDATE "+DispositivoModel.TABLE_NAME +" SET stato='"+stato+"'  WHERE campo='"+campo+"' AND tipo='"+tipo+"'";
		
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

