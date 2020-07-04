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
	
	/**
	 * Genera ID
	 * @return
	 * @throws SQLException
	 */
	public synchronized String generateID() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String id = "";

		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME;
		
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
	 * Genera Matricola
	 * @return
	 * @throws SQLException
	 */
	public synchronized String generateMatricola() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String matricola = "";

		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME;
		
		ArrayList<Integer> idList = new ArrayList<Integer>();
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				matricola = rs.getString("matricola");
				System.out.println("Matricola: "+matricola);
				idList.add(Integer.parseInt(matricola));
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
		
		String matricolaNew = Integer.toString(max);
		System.out.println("\n\n\n\nid restituito da generateID(): "+matricolaNew+"\n\n\n");
		return matricolaNew;
	}
	
	
	public synchronized void doSaveAgricoltorePrivato(String nome, String cognome, String sesso, String email, String telefono, String codiceFiscale, String tipo, String password) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = this.generateID();
		String matricola = this.generateMatricola();
        
		
		String insertSQL = "INSERT INTO " + UtenteModel.TABLE_NAME
				+ " (id, matricola, nome, cognome, sesso, email, telefono, stato, attivita, codice_fiscale,tipo, durata, password, dirigente) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
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
			preparedStatement.setString(12, "-- : --");
			preparedStatement.setString(13, password);
			preparedStatement.setString(14, "");
			

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
	
	
	public synchronized ArrayList<Utente> doRetrieveCEO() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Utente> utenti = new ArrayList<Utente>();
		String ruolo = "Dirigente aziendale";
		
		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME+" WHERE tipo = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ruolo);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Utente utente = new Utente();
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
				utente.setProprietario(rs.getString("dirigente"));
				System.out.println("\n\n\n\nutente id: "+utente.getId());
				utenti.add(utente);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return utenti;
		}
	
	/**cerca utente con email e password (verifica login) **/
	
	public synchronized Utente searchUser(String email, String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Utente utente = new Utente();
		
		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME+" WHERE email = ? AND password = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
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
		
		System.out.println(utente.toString());
		return utente;
		}
	
	
	/**cerca utente con email e password (verifica login) **/
	
	public synchronized Utente searchUser(String email, String password, String tipo) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Utente utente = new Utente();
		
		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME+" WHERE email = ? AND password = ? AND tipo = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, tipo);
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
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
		
		System.out.println(utente.toString());
		return utente;
		}

	public void doSaveAgricoltoreAziendale(String nome, String cognome, String sesso, String email, String telefono, String codiceFiscale,
			String tipo, String password, String dirigente) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = this.generateID();
		String matricola = this.generateMatricola();
        
		
		String insertSQL = "INSERT INTO " + UtenteModel.TABLE_NAME
				+ " (id, matricola, nome, cognome, sesso, email, telefono, stato, attivita, codice_fiscale,tipo, durata, password, dirigente) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
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
			preparedStatement.setString(12, "-- : --");
			preparedStatement.setString(13, password);
			preparedStatement.setString(14, dirigente);
			

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
	
	
	public void doSaveDirigenteAziendale(String nome, String cognome, String sesso, String email, String telefono, String codiceFiscale,
			String tipo, String password) throws SQLException {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String id = this.generateID();
		String matricola = this.generateMatricola();
        
		
		String insertSQL = "INSERT INTO " + UtenteModel.TABLE_NAME
				+ " (id, matricola, nome, cognome, sesso, email, telefono, stato, attivita, codice_fiscale,tipo, durata, password, dirigente) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
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
			preparedStatement.setString(12, "-- : --");
			preparedStatement.setString(13, password);
			preparedStatement.setString(14, id);
			

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
	
	
	public synchronized ArrayList<Utente> doRetrieveRisorseUmane(String idDirigente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ArrayList<Utente> utenti = new ArrayList<Utente>();
		String ruolo = "Agricoltore aziendale";
		
		String selectSQL = "SELECT * FROM "+UtenteModel.TABLE_NAME+" WHERE tipo = ? AND dirigente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getDbConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, ruolo);
			preparedStatement.setString(2, idDirigente);
			
			System.out.println(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				Utente utente = new Utente();
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
				utente.setProprietario(rs.getString("dirigente"));
				System.out.println("\n\n\n\nutente id: "+utente.getId());
				utenti.add(utente);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return utenti;
		}
	
	/**
	 * Modifica utente cercandolo per ID
	 * @param idUtente
	 * @return
	 * @throws SQLException
	 */
	public synchronized int assegnaLavoro(String id, String campo_selezionato, String attivita_selezionata, String durata_selezionata) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String stato = "Occupato";
		
		System.out.println("Sono in query mod");
		String insertSQL = "UPDATE "+UtenteModel.TABLE_NAME +" SET stato ='"+stato+"' , attivita='"+attivita_selezionata+"' , durata='"+durata_selezionata+"' WHERE id='"+id+"'";
		//System.out.println(""+insertSQL);
				
		//System.out.println("ID ORA = "+idUtente);
		
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
	
	
	/**
	 * Modifica utente cercandolo per ID
	 * @param idUtente
	 * @return
	 * @throws SQLException
	 */
	public synchronized int annullaLavoro(String id) throws SQLException {
		int i = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String stato = "";
		String attivita = "";
		String durata = "-- : --";
		System.out.println("Sono in query mod");
		String insertSQL = "UPDATE "+UtenteModel.TABLE_NAME +" SET stato ='"+stato+"' , attivita='"+attivita+"' , durata='"+durata+"' WHERE id='"+id+"'";
		//System.out.println(""+insertSQL);
				
		//System.out.println("ID ORA = "+idUtente);
		
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
