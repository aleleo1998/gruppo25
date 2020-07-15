package Model;

public class Dispositivo {
	



public Dispositivo(String id, String nome, String tipo, String campo, String stato, String utente, String attivita) {
		super();
		this.id = id;
		this.nome = nome;
		this.tipo = tipo;
		this.campo = campo;
		this.stato = stato;
		this.utente = utente;
		this.attivita = attivita;
	}

public Dispositivo() {
	super();
}

public String getAttivita() {
	return attivita;
}

public void setAttivita(String attivita) {
	this.attivita = attivita;
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

public String getTipo() {
	return tipo;
}

public void setTipo(String tipo) {
	this.tipo = tipo;
}

public String getCampo() {
	return campo;
}

public void setCampo(String campo) {
	this.campo = campo;
}

public String getStato() {
	return stato;
}

public void setStato(String stato) {
	this.stato = stato;
}

public String getUtente() {
	return utente;
}

public void setUtente(String utente) {
	this.utente = utente;
}

private String id;
private String nome;
private String tipo;
private String campo;
private String stato;
private String utente;
private String attivita;
}
