package Model;

public class Campo {
	

public Campo(String nome, String posizione, String tipo_terreno, String coltura, String ettari, String temperatura,
			String umidita, String proprietario) {
		this.nome = nome;
		this.posizione = posizione;
		this.tipo_terreno = tipo_terreno;
		this.coltura = coltura;
		this.ettari = ettari;
		this.temperatura = temperatura;
		this.umidita = umidita;
		this.proprietario = proprietario;
	}

public Campo() {

}

public String getNome() {
	return nome;
}

public void setNome(String nome) {
	this.nome = nome;
}

public String getPosizione() {
	return posizione;
}

public void setPosizione(String posizione) {
	this.posizione = posizione;
}

public String getTipo_terreno() {
	return tipo_terreno;
}

public void setTipo_terreno(String tipo_terreno) {
	this.tipo_terreno = tipo_terreno;
}

public String getColtura() {
	return coltura;
}

public void setColtura(String coltura) {
	this.coltura = coltura;
}

public String getEttari() {
	return ettari;
}

public void setEttari(String ettari) {
	this.ettari = ettari;
}

public String getTemperatura() {
	return temperatura;
}

public void setTemperatura(String temperatura) {
	this.temperatura = temperatura;
}

public String getUmidita() {
	return umidita;
}

public void setUmidita(String umidita) {
	this.umidita = umidita;
}

public String getProprietario() {
	return proprietario;
}

public void setProprietario(String proprietario) {
	this.proprietario = proprietario;
}

private String nome;
private String posizione;
private String tipo_terreno;
private String coltura;
private String ettari;
private String temperatura;
private String umidita;
private String proprietario;

}
