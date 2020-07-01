package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import DBConnection.DriverManagerConnectionPool;

public class UtenteModel {
	
	private static final String TABLE_NAME = "utente";
	
	public synchronized String generateID() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String id = "";

		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME;
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				id = rs.getString("id");
				System.out.println("ID: "+id);
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
		
		if(id=="")
			index = 1;
		else {
			index = Integer.parseInt(id.toString());
			index++;
		}
		
		id = Integer.toString(index);
		
		System.out.println("\n\n\n\nid restituito da generateID(): "+id+"\n\n\n");
		return id;
		}
	
	
	public synchronized String generateMatricola() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String matricola = "";

		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME;
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				matricola = rs.getString("matricola");
				System.out.println("Matricola: "+matricola);
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
		
		if(matricola=="")
			index = 11011;
		else {
			index = Integer.parseInt(matricola.toString());
			index++;
		}
		
		matricola = Integer.toString(index);
		
		System.out.println("\n\n\n\nid restituito da generateMatricola(): "+matricola+"\n\n\n");
		return matricola;
	}
	
	
	public synchronized void doSave(String nome, String cognome, String sesso, String email, String telefono, String codiceFiscale, String tipo, String password) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = this.generateID();
		String matricola = this.generateMatricola();
        
		
		String insertSQL = "INSERT INTO " + UtenteModel.TABLE_NAME
				+ " (id, matricola, nome, cognome, sesso, email, telefono, stato, attivita, codice_fiscale,tipo, durata, password) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, id);
			preparedStatement.setString(2, matricola);
			preparedStatement.setString(3, nome);
			preparedStatement.setString(4, cognome);
			preparedStatement.setString(5, sesso);
			preparedStatement.setString(6, email);
			preparedStatement.setString(7, telefono);
			preparedStatement.setString(8, "");
			preparedStatement.setString(9, "");
			preparedStatement.setString(10, codiceFiscale);
			preparedStatement.setString(11, tipo);
			preparedStatement.setString(12, "0");
			preparedStatement.setString(13, password);
			

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
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
			
	}
	
	
	public synchronized Utente doRetrieveById(String id) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Utente utente = new Utente();
		
		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME+" WHERE id = "+id;
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				id = rs.getString("id");
				System.out.println("ID: "+id);
				
				utente.setId(rs.getString("id"));
				utente.setMatricola(rs.getString("matricola"));
				utente.setNome(rs.getString("nome"));
				utente.setCognome(rs.getString("cognome"));
				utente.setSesso(rs.getString("sesso"));
				utente.setEmail(rs.getString("email"));
				utente.setTelefono(rs.getString("telefono"));
				utente.setStato(rs.getString("stato"));
				utente.setAttivita(rs.getString("attivita"));
				utente.setCodice_fiscale(rs.getString("codice_fiscale"));
				utente.setDurata(rs.getString("durata"));
				utente.setTipo(rs.getString("tipo"));
				utente.setPassword(rs.getString("password"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return utente;
		}
	
}
