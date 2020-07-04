package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBConnection.DriverManagerConnectionPool;

public class DispositivoModel {
	
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
