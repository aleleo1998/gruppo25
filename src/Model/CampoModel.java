package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConnection.DriverManagerConnectionPool;

public class CampoModel {
	
	private static final String TABLE_NAME = "campo";
	
	public synchronized ArrayList<Campo> doRetrieveByCEO(String idProprietario) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Campo> campi = new ArrayList<Campo>();
		
		String selectSQL = "SELECT * FROM "+CampoModel.TABLE_NAME+" WHERE proprietario = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idProprietario);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Campo campo = new Campo();
				campo.setNome(rs.getString("nome"));
				campo.setPosizione(rs.getString("posizione"));
				campo.setTipo_terreno(rs.getString("tipo_terreno"));
				campo.setColtura(rs.getString("coltura"));
				campo.setProprietario(idProprietario);
				campo.setEttari(rs.getString("ettari"));
				campo.setTemperatura(rs.getString("temperatura"));
				campo.setUmidita(rs.getString("umidita"));
	
				campi.add(0, campo);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return campi;
	}
	
	public synchronized Campo doRetrieveByNome(String nome_campo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Campo campo = new Campo();
		
		String selectSQL = "SELECT * FROM "+CampoModel.TABLE_NAME+" WHERE nome = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome_campo);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				campo.setNome(rs.getString("nome"));
				campo.setPosizione(rs.getString("posizione"));
				campo.setTipo_terreno(rs.getString("tipo_terreno"));
				campo.setColtura(rs.getString("coltura"));
				campo.setProprietario("proprietario");
				campo.setEttari(rs.getString("ettari"));
				campo.setTemperatura(rs.getString("temperatura"));
				campo.setUmidita(rs.getString("umidita"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return campo;
	}
	
	/**
	 * 
	 * @param nomeCampo
	 * @return
	 * @throws SQLException
	 */
	public synchronized int removeCampoByName(String nomeCampo) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		
		String insertSQL = "DELETE FROM " + CampoModel.TABLE_NAME + " WHERE nome = ? ";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, nomeCampo);
		
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
	 * Aggiorna la coltura del campo in seguito all'operazione di semina
	 * @param idCampo
	 * @param coltura
	 * @return
	 * @throws SQLException
	 */
	public synchronized int updateColturaCampo(String nomeCampo, String coltura) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String insertSQL = "UPDATE "+CampoModel.TABLE_NAME +" SET coltura='"+coltura+"'  WHERE nome='"+nomeCampo+"'";
		
		
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
