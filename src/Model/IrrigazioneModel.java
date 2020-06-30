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
				irr.setId(rs.getString("id"));
				irr.setGiorno(rs.getString("giorno"));
				irr.setCampo(rs.getString("Campo"));
				irr.setOra_inizio(rs.getString("ora_inizio"));
				irr.setOra_fine(rs.getString("ore_fine"));
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
}
