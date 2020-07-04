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
	public synchronized Collection<Dispositivo> getSensori() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Dispositivo> dispositivo = new LinkedList<Dispositivo>();

		String selectSQL = "SELECT * FROM dispositivo WHERE tipo = 'sensore'";
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

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
	public synchronized Collection<Dispositivo> getRobot() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Dispositivo> dispositivo = new LinkedList<Dispositivo>();

		String selectSQL = "SELECT * FROM dispositivo WHERE tipo = 'robot'";
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

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
	
}
