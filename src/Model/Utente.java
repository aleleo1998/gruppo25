package Model;

public class Utente {
	
public Utente() {
		
	}
public Utente(String id, String nome, String cognome, String matricola, String sesso, String email, String telefono,
			String stato, String attività, String codice_fiscale, String durata) {
		
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.matricola = matricola;
		this.sesso = sesso;
		this.email = email;
		this.telefono = telefono;
		this.stato = stato;
		this.attività = attività;
		this.codice_fiscale = codice_fiscale;
		this.durata = durata;
	}
public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getMatricola() {
		return matricola;
	}
	public void setMatricola(String matricola) {
		this.matricola = matricola;
	}
	public String getSesso() {
		return sesso;
	}
	public void setSesso(String sesso) {
		this.sesso = sesso;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getStato() {
		return stato;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}
	public String getAttività() {
		return attività;
	}
	public void setAttività(String attività) {
		this.attività = attività;
	}
	public String getCodice_fiscale() {
		return codice_fiscale;
	}
	public void setCodice_fiscale(String codice_fiscale) {
		this.codice_fiscale = codice_fiscale;
	}
	public String getDurata() {
		return durata;
	}
	public void setDurata(String durata) {
		this.durata = durata;
	}
private String id;
private String nome;
private String cognome;
private String matricola;
private String sesso;
private String email;
private String telefono;
private String stato;
private String attività;
private String codice_fiscale;
private String durata;

}
