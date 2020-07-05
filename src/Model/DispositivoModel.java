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
}

