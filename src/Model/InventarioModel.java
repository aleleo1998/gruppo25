package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import DBConnection.DriverManagerConnectionPool;

public class InventarioModel {
	
	private static final String TABLE_NAME = "inventario";

	
	/**
	 * crea inventario degli item per un dato utente tramite l'id utente.
	 * @param idUtente
	 * @return
	 * @throws SQLException
	 */
	public synchronized Collection<Inventario> doInventario(String idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Inventario> inventario = new ArrayList<Inventario>();

		String selectSQL = "SELECT inventario.id_utente, item.id, item.nome, item.tipo, item.quantita FROM acagreen_db.item JOIN acagreen_db.inventario WHERE id_utente=? and item.id=inventario.id_item;";
		
	
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idUtente);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Inventario bean = new Inventario();
				
				bean.setIdUtente(rs.getString("id_utente"));
				bean.setIdItem(rs.getString("id"));
				bean.setNome(rs.getString("nome"));
				bean.setTipo(rs.getString("tipo"));
				bean.setQuantita(rs.getString("quantita"));

				
				
				if(bean!=null) {	
					inventario.add(bean);
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
		return inventario;
	}
}
	

