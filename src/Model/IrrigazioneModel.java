package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import DBConnection.DriverManagerConnectionPool;

public class IrrigazioneModel 
{
	private static final String TABLE_NAME = "irrigazione";
	public synchronized Collection<Irrigazione> doRetrieveAllByCampo(String campo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Irrigazione> i = new LinkedList<Irrigazione>();

		String selectSQL = "SELECT * FROM irrigazione WHERE campo = ?";

		


		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, campo);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Irrigazione irr=new Irrigazione();
				irr.setId(rs.getInt("id"));
				irr.setGiorno(rs.getString("giorno"));
				irr.setCampo(rs.getString("campo"));
				irr.setOra_inizio(rs.getString("ora_inizio"));
				irr.setOra_fine(rs.getString("ora_fine"));
				i.add(irr);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return i;
	}
	public synchronized int remove(int id) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		
		String insertSQL = "DELETE FROM " + IrrigazioneModel.TABLE_NAME + " WHERE id = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, id);
		    preparedStatement.executeUpdate();

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
	
	public synchronized void doSave(String giorno,String ora_inizio,String ora_fine,String campo)
	{
     String insertSQL = "INSERT INTO " + IrrigazioneModel.TABLE_NAME + " (giorno,ora_inizio,ora_fine,campo) VALUES (?,?,?,?)";
     Connection connection = null;
     PreparedStatement preparedStatement = null;
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, giorno);
			preparedStatement.setString(2, ora_inizio);
			preparedStatement.setString(3, ora_fine);
			preparedStatement.setString(4, campo);
			
			

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
}
